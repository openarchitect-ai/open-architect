param(
    [string]$ArtifactRoot = '.architect\examples\customer-onboarding-modernization',
    [switch]$FailOnWarning
)

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$templatesRoot = Join-Path $repoRoot '.architect\templates'
$schemasRoot = Join-Path $repoRoot '.architect\schemas'

if ([System.IO.Path]::IsPathRooted($ArtifactRoot)) {
    $resolvedArtifactRoot = Resolve-Path $ArtifactRoot
}
else {
    $resolvedArtifactRoot = Resolve-Path (Join-Path $repoRoot $ArtifactRoot)
}

if (-not (Test-Path $resolvedArtifactRoot -PathType Container)) {
    throw "Artifact root '$ArtifactRoot' does not resolve to a folder."
}

$issues = New-Object System.Collections.Generic.List[object]
$templateFiles = Get-ChildItem $templatesRoot -Recurse -File -Filter *.yaml | Sort-Object FullName
$artifactFiles = Get-ChildItem $resolvedArtifactRoot -Recurse -File -Filter *.yaml | Sort-Object FullName

$requiredSpecKeys = @('id', 'name', 'display_name', 'aliases', 'summary', 'description', 'metadata', 'relationships')
$requiredMetadataKeys = @('source_of_truth', 'last_reviewed', 'review_owner', 'confidence', 'references', 'change_log')
$allowedConfidence = @('low', 'medium', 'high')
$allowedRelationshipStrength = @('primary', 'supporting', 'informational')
$approvalSignalValues = @('approved', 'accepted', 'verified', 'pass', 'conditional-pass', 'compliant', 'published')
$dateFieldNames = @(
    'last_reviewed',
    'effective_date',
    'review_date',
    'target_verification_date',
    'target_resolution_date',
    'start_date',
    'target_end_date',
    'expiry_review_date',
    'due_date',
    'target_date'
)
$datePattern = '^\d{4}-\d{2}-\d{2}$'
$prefixToKind = @{}
$artifactInventory = @{}
$schemaRulesByKind = @{}
$commonSchemaRoot = $null

function Add-Error {
    param(
        [string]$Path,
        [string]$Message
    )

    Add-Issue -Path $Path -Message $Message -Severity 'error'
}

function Add-Warning {
    param(
        [string]$Path,
        [string]$Message
    )

    Add-Issue -Path $Path -Message $Message -Severity 'warning'
}

function Add-Issue {
    param(
        [string]$Path,
        [string]$Message,
        [ValidateSet('error', 'warning')]
        [string]$Severity = 'error'
    )

    $relativePath = $Path.Replace($repoRoot.Path + [System.IO.Path]::DirectorySeparatorChar, '')
    $issues.Add([pscustomobject]@{
        Severity = $Severity
        Path = $relativePath
        Message = $Message
    })
}

function Write-Summary {
    param(
        [string]$Status,
        [int]$Checked,
        [int]$Errors,
        [int]$Warnings
    )

    Write-Host ("VALIDATION_SUMMARY validator=artifacts status={0} checked={1} errors={2} warnings={3}" -f $Status, $Checked, $Errors, $Warnings)
}

function Get-PropertyValue {
    param(
        $Object,
        [string]$Name
    )

    if ($null -eq $Object) {
        return $null
    }

    $property = $Object.PSObject.Properties[$Name]
    if ($null -ne $property) {
        return $property.Value
    }

    return $null
}

function Get-PropertyNames {
    param(
        $Object
    )

    if ($null -eq $Object) {
        return @()
    }

    return @($Object.PSObject.Properties | ForEach-Object { $_.Name })
}

function Resolve-JsonReference {
    param(
        [string]$Reference,
        $SchemaRoot,
        $CommonRoot
    )

    if ([string]::IsNullOrWhiteSpace($Reference)) {
        return $null
    }

    if ($Reference.StartsWith('./common-definitions.schema.json#/')) {
        $target = $CommonRoot
        $path = $Reference.Substring('./common-definitions.schema.json#/'.Length)
    }
    elseif ($Reference.StartsWith('#/')) {
        $target = $SchemaRoot
        $path = $Reference.Substring(2)
    }
    else {
        return $null
    }

    foreach ($segment in ($path -split '/')) {
        if ([string]::IsNullOrWhiteSpace($segment)) {
            continue
        }

        $target = Get-PropertyValue -Object $target -Name $segment
        if ($null -eq $target) {
            return $null
        }
    }

    return $target
}

function Resolve-SchemaNode {
    param(
        $Node,
        $SchemaRoot,
        $CommonRoot
    )

    if ($null -eq $Node) {
        return $null
    }

    $reference = Get-PropertyValue -Object $Node -Name '$ref'
    if ($reference) {
        return Resolve-JsonReference -Reference $reference -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    }

    return $Node
}

function Get-StringArray {
    param(
        $Value
    )

    if ($null -eq $Value) {
        return @()
    }

    return @($Value | ForEach-Object { [string]$_ })
}

function Get-SchemaEnumValues {
    param(
        $Node,
        $SchemaRoot,
        $CommonRoot
    )

    $resolvedNode = Resolve-SchemaNode -Node $Node -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    return Get-StringArray -Value (Get-PropertyValue -Object $resolvedNode -Name 'enum')
}

function Get-TriggerGroups {
    param(
        $Node,
        $SchemaRoot,
        $CommonRoot
    )

    $resolvedNode = Resolve-SchemaNode -Node $Node -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    $anyOfEntries = @(Get-PropertyValue -Object $resolvedNode -Name 'anyOf')
    if ($anyOfEntries.Count -gt 0) {
        $groups = New-Object System.Collections.Generic.List[object]
        foreach ($entry in $anyOfEntries) {
            $conditions = Get-LeafConditions -Node $entry -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
            if ($conditions.Count -gt 0) {
                $groups.Add($conditions)
            }
        }
        return $groups
    }

    $singleGroup = Get-LeafConditions -Node $resolvedNode -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    $groupList = New-Object System.Collections.Generic.List[object]
    if ($singleGroup.Count -gt 0) {
        $groupList.Add($singleGroup)
    }
    return $groupList
}

function Get-LeafConditions {
    param(
        $Node,
        $SchemaRoot,
        $CommonRoot,
        [string]$PathPrefix = ''
    )

    $resolvedNode = Resolve-SchemaNode -Node $Node -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    $conditions = New-Object System.Collections.Generic.List[object]

    $constValue = Get-PropertyValue -Object $resolvedNode -Name 'const'
    if ($null -ne $constValue -and $PathPrefix) {
        $conditions.Add([pscustomobject]@{
            Path = $PathPrefix
            Operator = 'equals'
            Values = @([string]$constValue)
        })
        return $conditions
    }

    $enumValues = Get-StringArray -Value (Get-PropertyValue -Object $resolvedNode -Name 'enum')
    if ($enumValues.Count -gt 0 -and $PathPrefix) {
        $conditions.Add([pscustomobject]@{
            Path = $PathPrefix
            Operator = 'in'
            Values = $enumValues
        })
        return $conditions
    }

    $properties = Get-PropertyValue -Object $resolvedNode -Name 'properties'
    foreach ($propertyName in (Get-PropertyNames -Object $properties)) {
        $childNode = Get-PropertyValue -Object $properties -Name $propertyName
        $childPath = if ($PathPrefix) { '{0}.{1}' -f $PathPrefix, $propertyName } else { $propertyName }
        foreach ($condition in (Get-LeafConditions -Node $childNode -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot -PathPrefix $childPath)) {
            $conditions.Add($condition)
        }
    }

    return $conditions
}

function Get-ThenActions {
    param(
        $Node,
        $SchemaRoot,
        $CommonRoot,
        [string]$PathPrefix = ''
    )

    $resolvedNode = Resolve-SchemaNode -Node $Node -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    $actions = New-Object System.Collections.Generic.List[object]

    $requiredKeys = Get-StringArray -Value (Get-PropertyValue -Object $resolvedNode -Name 'required')
    if ($requiredKeys.Count -gt 0 -and $PathPrefix) {
        $actions.Add([pscustomobject]@{
            Path = $PathPrefix
            Kind = 'required'
            Values = $requiredKeys
        })
    }

    $minItems = Get-PropertyValue -Object $resolvedNode -Name 'minItems'
    if ($null -ne $minItems -and $PathPrefix) {
        $actions.Add([pscustomobject]@{
            Path = $PathPrefix
            Kind = 'minItems'
            Values = @([string]$minItems)
        })
    }

    $enumValues = Get-StringArray -Value (Get-PropertyValue -Object $resolvedNode -Name 'enum')
    if ($enumValues.Count -gt 0 -and $PathPrefix) {
        $actions.Add([pscustomobject]@{
            Path = $PathPrefix
            Kind = 'enum'
            Values = $enumValues
        })
    }

    $properties = Get-PropertyValue -Object $resolvedNode -Name 'properties'
    foreach ($propertyName in (Get-PropertyNames -Object $properties)) {
        $childNode = Get-PropertyValue -Object $properties -Name $propertyName
        $childPath = if ($PathPrefix) { '{0}.{1}' -f $PathPrefix, $propertyName } else { $propertyName }
        foreach ($action in (Get-ThenActions -Node $childNode -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot -PathPrefix $childPath)) {
            $actions.Add($action)
        }
    }

    return $actions
}

function New-SchemaRuleSet {
    param(
        [string]$Kind,
        $SchemaRoot,
        $CommonRoot
    )

    $ruleSet = [pscustomobject]@{
        Kind = $Kind
        RequiredSpecKeys = New-Object System.Collections.Generic.List[string]
        RequiredSectionRules = New-Object System.Collections.Generic.List[object]
        EnumRules = New-Object System.Collections.Generic.List[object]
        ConditionalRules = New-Object System.Collections.Generic.List[object]
        IdPattern = $null
        ReferenceUrlPattern = $null
    }

    $allOfEntries = @((Get-PropertyValue -Object $SchemaRoot -Name 'allOf'))
    $schemaBody = $null
    if ($allOfEntries.Count -gt 0) {
        $schemaBody = $allOfEntries[-1]
    }
    else {
        $schemaBody = $SchemaRoot
    }

    $resolvedBody = Resolve-SchemaNode -Node $schemaBody -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    $bodyProperties = Get-PropertyValue -Object $resolvedBody -Name 'properties'
    $specNode = Resolve-SchemaNode -Node (Get-PropertyValue -Object $bodyProperties -Name 'spec') -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    if ($null -eq $specNode) {
        return $ruleSet
    }

    foreach ($requiredSpecKey in (Get-StringArray -Value (Get-PropertyValue -Object $specNode -Name 'required'))) {
        if (-not $ruleSet.RequiredSpecKeys.Contains($requiredSpecKey)) {
            $ruleSet.RequiredSpecKeys.Add($requiredSpecKey)
        }
    }

    $specProperties = Get-PropertyValue -Object $specNode -Name 'properties'
    $idNode = Resolve-SchemaNode -Node (Get-PropertyValue -Object $specProperties -Name 'id') -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    $ruleSet.IdPattern = [string](Get-PropertyValue -Object $idNode -Name 'pattern')
    $referenceNode = Resolve-SchemaNode -Node (Get-PropertyValue -Object (Get-PropertyValue -Object (Resolve-SchemaNode -Node (Get-PropertyValue -Object $CommonRoot.'$defs' -Name 'reference') -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot) -Name 'properties') -Name 'url') -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
    $ruleSet.ReferenceUrlPattern = [string](Get-PropertyValue -Object $referenceNode -Name 'pattern')

    foreach ($sectionName in $ruleSet.RequiredSpecKeys) {
        $sectionNode = Resolve-SchemaNode -Node (Get-PropertyValue -Object $specProperties -Name $sectionName) -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
        if ($null -eq $sectionNode) {
            continue
        }

        $sectionType = [string](Get-PropertyValue -Object $sectionNode -Name 'type')
        $sectionRequiredKeys = @()
        $enumSourceProperties = $null
        $isArrayItems = $false

        if ($sectionType -eq 'array') {
            $itemsNode = Resolve-SchemaNode -Node (Get-PropertyValue -Object $sectionNode -Name 'items') -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
            $sectionRequiredKeys = Get-StringArray -Value (Get-PropertyValue -Object $itemsNode -Name 'required')
            $enumSourceProperties = Get-PropertyValue -Object $itemsNode -Name 'properties'
            $isArrayItems = $true
        }
        else {
            $sectionRequiredKeys = Get-StringArray -Value (Get-PropertyValue -Object $sectionNode -Name 'required')
            $enumSourceProperties = Get-PropertyValue -Object $sectionNode -Name 'properties'
        }

        if ($sectionRequiredKeys.Count -gt 0) {
            $ruleSet.RequiredSectionRules.Add([pscustomobject]@{
                Section = $sectionName
                Keys = $sectionRequiredKeys
                IsArrayItems = $isArrayItems
            })
        }

        foreach ($propertyName in (Get-PropertyNames -Object $enumSourceProperties)) {
            $propertyNode = Get-PropertyValue -Object $enumSourceProperties -Name $propertyName
            $enumValues = Get-SchemaEnumValues -Node $propertyNode -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
            if ($enumValues.Count -gt 0) {
                        $ruleSet.EnumRules.Add([pscustomobject]@{
                            Section = $sectionName
                            Key = $propertyName
                            AllowedValues = $enumValues
                            IsArrayItems = $isArrayItems
                            Path = if ($isArrayItems) { ("spec.{0}[*].{1}" -f $sectionName, $propertyName) } else { ("spec.{0}.{1}" -f $sectionName, $propertyName) }
                        })
                continue
            }

            $propertyResolved = Resolve-SchemaNode -Node $propertyNode -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
            if ([string](Get-PropertyValue -Object $propertyResolved -Name 'type') -eq 'array') {
                $itemNode = Resolve-SchemaNode -Node (Get-PropertyValue -Object $propertyResolved -Name 'items') -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
                foreach ($itemPropertyName in (Get-PropertyNames -Object (Get-PropertyValue -Object $itemNode -Name 'properties'))) {
                    $itemPropertyNode = Get-PropertyValue -Object (Get-PropertyValue -Object $itemNode -Name 'properties') -Name $itemPropertyName
                    $itemEnumValues = Get-SchemaEnumValues -Node $itemPropertyNode -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
                    if ($itemEnumValues.Count -gt 0) {
                        $ruleSet.EnumRules.Add([pscustomobject]@{
                            Section = $sectionName
                            Key = $itemPropertyName
                            AllowedValues = $itemEnumValues
                            IsArrayItems = $true
                            Path = ("spec.{0}[*].{1}" -f $sectionName, $itemPropertyName)
                        })
                    }
                }
            }
        }
    }

    foreach ($entry in $allOfEntries) {
        $ifNode = Get-PropertyValue -Object $entry -Name 'if'
        $thenNode = Get-PropertyValue -Object $entry -Name 'then'
        if ($null -eq $ifNode -or $null -eq $thenNode) {
            continue
        }

        $triggerGroups = Get-TriggerGroups -Node $ifNode -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
        $actions = Get-ThenActions -Node $thenNode -SchemaRoot $SchemaRoot -CommonRoot $CommonRoot
        foreach ($group in $triggerGroups) {
            if ($group.Count -gt 0 -and $actions.Count -gt 0) {
                $ruleSet.ConditionalRules.Add([pscustomobject]@{
                    Triggers = $group
                    Actions = $actions
                })
            }
        }
    }

    return $ruleSet
}

function Get-ScalarValue {
    param(
        [string]$Line,
        [string]$KeyName
    )

    return (($Line -replace ('^\s*' + [regex]::Escape($KeyName) + ':\s*'), '') -replace '\s+#.*$', '').Trim()
}

function Get-SectionLines {
    param(
        [string[]]$Lines,
        [string]$SectionName
    )

    $headerPattern = '^(?<indent>\s*)' + [regex]::Escape($SectionName) + ':\s*$'
    $startIndex = -1
    $sectionIndent = 0

    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i] -match $headerPattern) {
            $startIndex = $i
            $sectionIndent = $matches['indent'].Length
            break
        }
    }

    if ($startIndex -lt 0) {
        return @()
    }

    $collected = New-Object System.Collections.Generic.List[string]
    for ($i = $startIndex + 1; $i -lt $Lines.Count; $i++) {
        $line = $Lines[$i]

        if ($line.Trim().Length -eq 0) {
            $collected.Add($line)
            continue
        }

        $indent = ($line -replace '^(\s*).*$', '$1').Length
        if ($indent -le $sectionIndent) {
            break
        }

        $collected.Add($line)
    }

    return $collected.ToArray()
}

function Test-KeyPresent {
    param(
        [string[]]$Lines,
        [string]$KeyName
    )

    $pattern = '^\s{2,}' + [regex]::Escape($KeyName) + ':\s*'
    return [bool]($Lines | Where-Object { $_ -match $pattern } | Select-Object -First 1)
}

function Test-NestedKeyPresent {
    param(
        [string[]]$Lines,
        [string]$KeyName
    )

    $pattern = '^\s{4,}' + [regex]::Escape($KeyName) + ':\s*'
    return [bool]($Lines | Where-Object { $_ -match $pattern } | Select-Object -First 1)
}

function Get-ArrayItemValues {
    param(
        [string[]]$Lines,
        [string]$SectionName
    )

    $sectionLines = Get-SectionLines -Lines $Lines -SectionName $SectionName
    if ($sectionLines.Count -eq 0) {
        return @()
    }

    return @(
        $sectionLines |
            Where-Object { $_ -match '^\s{4,}-\s*(.+?)\s*$' } |
            ForEach-Object { ($_ -replace '^\s{4,}-\s*', '').Trim() } |
            Where-Object { $_ }
    )
}

function Get-SectionLinesByPath {
    param(
        [string[]]$Lines,
        [string[]]$Segments
    )

    $currentLines = $Lines
    foreach ($segment in $Segments) {
        $currentLines = Get-SectionLines -Lines $currentLines -SectionName $segment
        if ($currentLines.Count -eq 0) {
            return @()
        }
    }

    return $currentLines
}

function Get-PathScalarValues {
    param(
        [string[]]$Lines,
        [string]$Path
    )

    $segments = $Path -split '\.'
    if ($segments.Count -lt 1) {
        return @()
    }

    if ($segments.Count -eq 1) {
        $parentLines = $Lines
        $keyName = $segments[0]
    }
    else {
        $parentLines = Get-SectionLinesByPath -Lines $Lines -Segments $segments[0..($segments.Count - 2)]
        $keyName = $segments[-1]
    }

    if ($parentLines.Count -eq 0) {
        return @()
    }

    return @(
        $parentLines |
            Where-Object { $_ -match ('^\s+' + [regex]::Escape($keyName) + ':\s*(.+?)\s*(#.*)?$') } |
            ForEach-Object { Get-ScalarValue -Line $_ -KeyName $keyName } |
            Where-Object { $_ -ne $null -and $_ -ne '' }
    )
}

function Test-ConditionGroup {
    param(
        [string[]]$Lines,
        $ConditionGroup
    )

    foreach ($condition in $ConditionGroup) {
        $values = Get-PathScalarValues -Lines $Lines -Path $condition.Path
        if ($values.Count -eq 0) {
            return $false
        }

        $matched = $false
        foreach ($value in $values) {
            if ($condition.Operator -eq 'equals' -and $value -eq $condition.Values[0]) {
                $matched = $true
                break
            }
            if ($condition.Operator -eq 'in' -and $condition.Values -contains $value) {
                $matched = $true
                break
            }
        }

        if (-not $matched) {
            return $false
        }
    }

    return $true
}

function Invoke-ConditionalAction {
    param(
        $Artifact,
        [string[]]$Lines,
        $Action
    )

    switch ($Action.Kind) {
        'enum' {
            $values = Get-PathScalarValues -Lines $Lines -Path $Action.Path
            foreach ($value in $values) {
                if ($Action.Values -notcontains $value) {
                    Add-Error $Artifact.Path ("{0} uses invalid value '{1}' under a schema conditional rule; expected one of: {2}" -f $Action.Path, $value, ($Action.Values -join ', '))
                }
            }
        }
        'minItems' {
            $items = Get-ArrayItemValues -Lines $Lines -SectionName (($Action.Path -split '\.')[-1])
            if (($Action.Path -split '\.').Count -gt 1) {
                $parentSegments = ($Action.Path -split '\.')[0..(($Action.Path -split '\.').Count - 2)]
                $parentLines = Get-SectionLinesByPath -Lines $Lines -Segments $parentSegments
                if ($parentLines.Count -gt 0) {
                    $items = Get-ArrayItemValues -Lines $parentLines -SectionName (($Action.Path -split '\.')[-1])
                }
            }

            $requiredCount = [int]$Action.Values[0]
            if ($items.Count -lt $requiredCount) {
                Add-Error $Artifact.Path ("{0} must contain at least {1} item(s) under a schema conditional rule" -f $Action.Path, $requiredCount)
            }
        }
        'required' {
            $sectionSegments = $Action.Path -split '\.'
            $sectionLines = Get-SectionLinesByPath -Lines $Lines -Segments $sectionSegments
            foreach ($requiredKey in $Action.Values) {
                if (-not (Test-NestedKeyPresent -Lines $sectionLines -KeyName $requiredKey)) {
                    Add-Error $Artifact.Path ("missing {0}.{1} under a schema conditional rule" -f $Action.Path, $requiredKey)
                }
            }
        }
    }
}

if (Test-Path $schemasRoot) {
    $commonSchemaPath = Join-Path $schemasRoot 'common-definitions.schema.json'
    if (Test-Path $commonSchemaPath) {
        $commonSchemaRoot = Get-Content $commonSchemaPath -Raw | ConvertFrom-Json
    }

    $artifactSchemaFiles = Get-ChildItem $schemasRoot -File -Filter *.schema.json | Where-Object { $_.Name -ne 'common-definitions.schema.json' }
    foreach ($schemaFile in $artifactSchemaFiles) {
        $schemaRoot = Get-Content $schemaFile.FullName -Raw | ConvertFrom-Json
        $kind = ([System.IO.Path]::GetFileNameWithoutExtension($schemaFile.Name) -replace '\.schema$', '')
        $schemaRulesByKind[$kind] = New-SchemaRuleSet -Kind $kind -SchemaRoot $schemaRoot -CommonRoot $commonSchemaRoot
    }
}

foreach ($templateFile in $templateFiles) {
    $templateLines = Get-Content $templateFile.FullName
    $kind = [System.IO.Path]::GetFileNameWithoutExtension($templateFile.Name)
    $idLine = $templateLines | Where-Object { $_ -match '^\s{2}id:\s*([A-Z]+-\d+)\s*$' } | Select-Object -First 1
    if ($idLine) {
        $idValue = Get-ScalarValue -Line $idLine -KeyName 'id'
        $prefix = ($idValue -split '-')[0]
        if (-not $prefixToKind.ContainsKey($prefix)) {
            $prefixToKind[$prefix] = $kind
        }
    }
}

if ($artifactFiles.Count -eq 0) {
    throw "Artifact root '$resolvedArtifactRoot' does not contain any YAML artifact files."
}

foreach ($file in $artifactFiles) {
    $lines = Get-Content $file.FullName
    if (-not ($lines | Where-Object { $_ -match '^spec:\s*$' } | Select-Object -First 1)) {
        Add-Error $file.FullName 'missing top-level spec section'
        continue
    }

    $specLines = Get-SectionLines -Lines $lines -SectionName 'spec'
    $idLine = $specLines | Where-Object { $_ -match '^\s{2}id:\s*([A-Z]+-\d+)\s*$' } | Select-Object -First 1
    if (-not $idLine) {
        Add-Error $file.FullName 'missing or invalid spec.id'
        continue
    }

    $idValue = Get-ScalarValue -Line $idLine -KeyName 'id'
    $prefix = ($idValue -split '-')[0]
    if (-not $prefixToKind.ContainsKey($prefix)) {
        Add-Error $file.FullName ("spec.id prefix '{0}' is not recognized from the template library" -f $prefix)
        continue
    }

    if ($artifactInventory.ContainsKey($idValue)) {
        Add-Error $file.FullName ("duplicate artifact id '{0}' also found in {1}" -f $idValue, $artifactInventory[$idValue].RelativePath)
        continue
    }

    $artifactInventory[$idValue] = [pscustomobject]@{
        Id = $idValue
        Kind = $prefixToKind[$prefix]
        Path = $file.FullName
        RelativePath = $file.FullName.Replace($repoRoot.Path + [System.IO.Path]::DirectorySeparatorChar, '')
        Lines = $lines
    }
}

foreach ($artifact in $artifactInventory.Values) {
    $lines = $artifact.Lines
    $specLines = Get-SectionLines -Lines $lines -SectionName 'spec'
    $metadataLines = Get-SectionLines -Lines $specLines -SectionName 'metadata'
    $relationshipsLines = Get-SectionLines -Lines $specLines -SectionName 'relationships'

    foreach ($key in $requiredSpecKeys) {
        if (-not (Test-KeyPresent -Lines $specLines -KeyName $key)) {
            Add-Error $artifact.Path ("missing spec.{0}" -f $key)
        }
    }

    foreach ($key in $requiredMetadataKeys) {
        if (-not (Test-NestedKeyPresent -Lines $metadataLines -KeyName $key)) {
            Add-Error $artifact.Path ("missing spec.metadata.{0}" -f $key)
        }
    }

    if ($schemaRulesByKind.ContainsKey($artifact.Kind)) {
        $schemaRules = $schemaRulesByKind[$artifact.Kind]

        if ($schemaRules.IdPattern -and $artifact.Id -notmatch $schemaRules.IdPattern) {
            Add-Error $artifact.Path ("spec.id '{0}' does not match required schema pattern '{1}'" -f $artifact.Id, $schemaRules.IdPattern)
        }

        foreach ($key in $schemaRules.RequiredSpecKeys) {
            if (-not (Test-KeyPresent -Lines $specLines -KeyName $key)) {
                Add-Error $artifact.Path ("missing spec.{0}" -f $key)
            }
        }

        foreach ($sectionRule in $schemaRules.RequiredSectionRules) {
            $sectionLines = Get-SectionLines -Lines $specLines -SectionName $sectionRule.Section
            if ($sectionLines.Count -eq 0) {
                continue
            }

            foreach ($requiredKey in $sectionRule.Keys) {
                if ($sectionRule.IsArrayItems) {
                    $pattern = '^\s{6,}' + [regex]::Escape($requiredKey) + ':\s*'
                    if (-not ($sectionLines | Where-Object { $_ -match $pattern } | Select-Object -First 1)) {
                        Add-Error $artifact.Path ("missing spec.{0}[*].{1}" -f $sectionRule.Section, $requiredKey)
                    }
                }
                elseif (-not (Test-NestedKeyPresent -Lines $sectionLines -KeyName $requiredKey)) {
                    Add-Error $artifact.Path ("missing spec.{0}.{1}" -f $sectionRule.Section, $requiredKey)
                }
            }
        }

        foreach ($enumRule in $schemaRules.EnumRules) {
            $sectionLines = Get-SectionLines -Lines $specLines -SectionName $enumRule.Section
            if ($sectionLines.Count -eq 0) {
                continue
            }

            if ($enumRule.IsArrayItems) {
                $matchingLines = $sectionLines | Where-Object { $_ -match ('^\s{6,}' + [regex]::Escape($enumRule.Key) + ':\s*(.+?)\s*(#.*)?$') }
            }
            else {
                $matchingLines = $sectionLines | Where-Object { $_ -match ('^\s{4,}' + [regex]::Escape($enumRule.Key) + ':\s*(.+?)\s*(#.*)?$') }
            }

            foreach ($line in $matchingLines) {
                $value = Get-ScalarValue -Line $line -KeyName $enumRule.Key
                if ($enumRule.AllowedValues -notcontains $value) {
                    Add-Error $artifact.Path ("{0} uses invalid value '{1}'; expected one of: {2}" -f $enumRule.Path, $value, ($enumRule.AllowedValues -join ', '))
                }
            }
        }

        foreach ($conditionalRule in $schemaRules.ConditionalRules) {
            if (Test-ConditionGroup -Lines $lines -ConditionGroup $conditionalRule.Triggers) {
                foreach ($action in $conditionalRule.Actions) {
                    Invoke-ConditionalAction -Artifact $artifact -Lines $lines -Action $action
                }
            }
        }
    }

    foreach ($arrayName in @('aliases', 'tags')) {
        $arrayValues = Get-ArrayItemValues -Lines $specLines -SectionName $arrayName
        if ($arrayValues.Count -gt 0) {
            $duplicates = $arrayValues | Group-Object | Where-Object { $_.Count -gt 1 } | Select-Object -ExpandProperty Name
            foreach ($duplicateValue in $duplicates) {
                Add-Error $artifact.Path ("spec.{0} contains duplicate value '{1}'" -f $arrayName, $duplicateValue)
            }
        }
    }

    $confidenceLine = $metadataLines | Where-Object { $_ -match '^\s{4}confidence:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
    $confidenceValue = $null
    if ($confidenceLine) {
        $confidenceValue = Get-ScalarValue -Line $confidenceLine -KeyName 'confidence'
        if ($allowedConfidence -notcontains $confidenceValue) {
            Add-Error $artifact.Path ("spec.metadata.confidence '{0}' is invalid; expected one of: {1}" -f $confidenceValue, ($allowedConfidence -join ', '))
        }
    }

    $relationshipEntries = @()
    $currentEntry = New-Object System.Collections.Generic.List[string]
    foreach ($line in $relationshipsLines) {
        if ($line -match '^\s{4}-\s+') {
            if ($currentEntry.Count -gt 0) {
                $relationshipEntries += ,($currentEntry.ToArray())
                $currentEntry = New-Object System.Collections.Generic.List[string]
            }
        }

        if ($currentEntry.Count -gt 0 -or $line -match '^\s{4}-\s+') {
            $currentEntry.Add($line)
        }
    }
    if ($currentEntry.Count -gt 0) {
        $relationshipEntries += ,($currentEntry.ToArray())
    }

    foreach ($entry in $relationshipEntries) {
        $normalizedEntry = $entry | ForEach-Object { $_ -replace '^\s{4}-\s*', '    ' }

        foreach ($requiredKey in @('type', 'target_kind', 'target_id', 'strength', 'confidence')) {
            $pattern = '^\s+' + [regex]::Escape($requiredKey) + ':\s*'
            if (-not ($normalizedEntry | Where-Object { $_ -match $pattern } | Select-Object -First 1)) {
                Add-Error $artifact.Path ("a relationship entry is missing '{0}'" -f $requiredKey)
            }
        }

        $targetKindLine = $normalizedEntry | Where-Object { $_ -match '^\s+target_kind:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
        $targetIdLine = $normalizedEntry | Where-Object { $_ -match '^\s+target_id:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
        if ($targetKindLine -and $targetIdLine) {
            $targetKind = Get-ScalarValue -Line $targetKindLine -KeyName 'target_kind'
            $targetId = Get-ScalarValue -Line $targetIdLine -KeyName 'target_id'

            if ($prefixToKind.Values -notcontains $targetKind) {
                Add-Error $artifact.Path ("relationship target_kind '{0}' is invalid; expected a known template kind" -f $targetKind)
            }

            if (-not $artifactInventory.ContainsKey($targetId)) {
                Add-Error $artifact.Path ("relationship target_id '{0}' does not resolve within the validated artifact folder" -f $targetId)
            }
            elseif ($artifactInventory[$targetId].Kind -ne $targetKind) {
                Add-Error $artifact.Path ("relationship target_id '{0}' resolves to kind '{1}', not '{2}'" -f $targetId, $artifactInventory[$targetId].Kind, $targetKind)
            }
        }

        $strengthLine = $normalizedEntry | Where-Object { $_ -match '^\s+strength:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
        if ($strengthLine) {
            $value = Get-ScalarValue -Line $strengthLine -KeyName 'strength'
            if ($allowedRelationshipStrength -notcontains $value) {
                Add-Error $artifact.Path ("relationship strength '{0}' is invalid; expected one of: {1}" -f $value, ($allowedRelationshipStrength -join ', '))
            }
        }

        $relationshipConfidenceLine = $normalizedEntry | Where-Object { $_ -match '^\s+confidence:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
        if ($relationshipConfidenceLine) {
            $value = Get-ScalarValue -Line $relationshipConfidenceLine -KeyName 'confidence'
            if ($allowedConfidence -notcontains $value) {
                Add-Error $artifact.Path ("relationship confidence '{0}' is invalid; expected one of: {1}" -f $value, ($allowedConfidence -join ', '))
            }
        }
    }

    foreach ($dateField in $dateFieldNames) {
        $pattern = '^\s*' + [regex]::Escape($dateField) + ':\s*([0-9]{4}-[0-9]{2}-[0-9]{2}|.+?)\s*(#.*)?$'
        $dateLines = $lines | Where-Object { $_ -match $pattern }
        foreach ($line in $dateLines) {
            $value = Get-ScalarValue -Line $line -KeyName $dateField
            if ($value -and $value -notmatch $datePattern) {
                Add-Error $artifact.Path ("field '{0}' uses non-ISO date value '{1}'" -f $dateField, $value)
            }
        }
    }

    $changeLogDateLines = $lines | Where-Object { $_ -match '^\s{6}date:\s*(.+?)\s*(#.*)?$' }
    foreach ($line in $changeLogDateLines) {
        $value = Get-ScalarValue -Line $line -KeyName 'date'
        if ($value -and $value -notmatch $datePattern) {
            Add-Error $artifact.Path ("change_log date uses non-ISO value '{0}'" -f $value)
        }
    }

    $referenceUrls = $metadataLines | Where-Object { $_ -match '^\s{6}url:\s*(.+?)\s*$' } | ForEach-Object { Get-ScalarValue -Line $_ -KeyName 'url' }
    $referenceCount = ($metadataLines | Where-Object { $_ -match '^\s{4}references:\s*$' }).Count
    $referenceEntryCount = ($metadataLines | Where-Object { $_ -match '^\s{4,}-\s*type:\s*' }).Count

    foreach ($url in $referenceUrls) {
        if ($schemaRulesByKind.ContainsKey($artifact.Kind)) {
            $schemaRules = $schemaRulesByKind[$artifact.Kind]
            if ($schemaRules.ReferenceUrlPattern -and $url -notmatch $schemaRules.ReferenceUrlPattern) {
                Add-Error $artifact.Path ("reference url '{0}' does not match required schema pattern '{1}'" -f $url, $schemaRules.ReferenceUrlPattern)
            }
        }

        if ($url -like '.architect/*') {
            $relativeUrl = $url -replace '/', '\'
            $targetPath = Join-Path $repoRoot $relativeUrl
            if (-not (Test-Path $targetPath)) {
                Add-Error $artifact.Path ("reference url '{0}' does not resolve to a local file" -f $url)
            }
        }
    }

    if ($confidenceValue -eq 'high' -and $referenceEntryCount -lt 1) {
        Add-Error $artifact.Path 'metadata.confidence is high but metadata.references does not contain any entries'
    }
}

$warnings = @($issues | Where-Object { $_.Severity -eq 'warning' })
$errors = @($issues | Where-Object { $_.Severity -eq 'error' })

if ($warnings.Count -gt 0) {
    Write-Host ("Artifact validation warnings for {0}:" -f $resolvedArtifactRoot) -ForegroundColor Yellow
    foreach ($warningLine in $warnings) {
        Write-Host ("- {0}: {1}" -f $warningLine.Path, $warningLine.Message) -ForegroundColor Yellow
    }
}

if ($errors.Count -gt 0) {
    Write-Host ("Artifact validation failed for {0}:" -f $resolvedArtifactRoot) -ForegroundColor Red
    foreach ($errorLine in $errors) {
        Write-Host ("- {0}: {1}" -f $errorLine.Path, $errorLine.Message) -ForegroundColor Red
    }
    Write-Summary -Status 'failed' -Checked $artifactInventory.Count -Errors $errors.Count -Warnings $warnings.Count
    exit 1
}

if ($FailOnWarning -and $warnings.Count -gt 0) {
    Write-Host ("Artifact validation produced {0} warnings and was configured to fail on warning." -f $warnings.Count) -ForegroundColor Red
    Write-Summary -Status 'failed-on-warning' -Checked $artifactInventory.Count -Errors $errors.Count -Warnings $warnings.Count
    exit 1
}

if ($warnings.Count -gt 0) {
    Write-Host ("Artifact validation passed for {0} YAML artifacts under {1} with {2} warnings." -f $artifactInventory.Count, $resolvedArtifactRoot, $warnings.Count) -ForegroundColor Yellow
    Write-Summary -Status 'passed-with-warnings' -Checked $artifactInventory.Count -Errors $errors.Count -Warnings $warnings.Count
}
else {
    Write-Host ("Artifact validation passed for {0} YAML artifacts under {1}." -f $artifactInventory.Count, $resolvedArtifactRoot) -ForegroundColor Green
    Write-Summary -Status 'passed' -Checked $artifactInventory.Count -Errors $errors.Count -Warnings $warnings.Count
}
