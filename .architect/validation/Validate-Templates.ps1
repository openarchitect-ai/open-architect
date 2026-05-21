param(
    [switch]$FailOnWarning
)

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$templatesRoot = Join-Path $repoRoot '.architect\templates'
$templateGuidancePath = Join-Path $templatesRoot 'agents.md'

$issues = New-Object System.Collections.Generic.List[object]
$templateFiles = Get-ChildItem $templatesRoot -Recurse -File -Filter *.yaml | Sort-Object FullName
$validTemplateKinds = $templateFiles | ForEach-Object { [System.IO.Path]::GetFileNameWithoutExtension($_.Name) }

$requiredTemplateKeys = @('kind', 'version', 'schema_version', 'description')
$requiredSpecKeys = @('id', 'name', 'display_name', 'aliases', 'summary', 'description', 'metadata', 'relationships')
$requiredMetadataKeys = @('source_of_truth', 'last_reviewed', 'review_owner', 'confidence', 'references', 'change_log')
$allowedConfidence = @('low', 'medium', 'high')
$allowedRelationshipStrength = @('primary', 'supporting', 'informational')
$templateSpecificEnumRules = @{}
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

function Write-Summary {
    param(
        [string]$Status,
        [int]$Checked,
        [int]$Errors,
        [int]$Warnings
    )

    Write-Host ("VALIDATION_SUMMARY validator=templates status={0} checked={1} errors={2} warnings={3}" -f $Status, $Checked, $Errors, $Warnings)
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

if (Test-Path $templateGuidancePath) {
    $guidanceLines = Get-Content $templateGuidancePath
    foreach ($line in $guidanceLines) {
        if ($line -match '^- `(?<kind>[a-z0-9-]+)\.(?<path>[^`]+)`: (?<values>.+)$') {
            $kind = $matches['kind']
            $path = $matches['path']
            $valuesText = $matches['values']
            $fieldKey = ($path -split '\.')[-1]
            $allowedValues = [regex]::Matches($valuesText, '`([^`]+)`') | ForEach-Object { $_.Groups[1].Value }

            if (-not $templateSpecificEnumRules.ContainsKey($kind)) {
                $templateSpecificEnumRules[$kind] = @()
            }

            $templateSpecificEnumRules[$kind] += [pscustomobject]@{
                Path = $path
                Key = $fieldKey
                AllowedValues = $allowedValues
            }
        }
    }
}

foreach ($file in $templateFiles) {
    $lines = Get-Content $file.FullName
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)

    if (-not ($lines | Where-Object { $_ -match '^template:\s*$' } | Select-Object -First 1)) {
        Add-Error $file.FullName 'missing top-level template section'
        continue
    }

    if (-not ($lines | Where-Object { $_ -match '^spec:\s*$' } | Select-Object -First 1)) {
        Add-Error $file.FullName 'missing top-level spec section'
        continue
    }

    $templateLines = Get-SectionLines -Lines $lines -SectionName 'template'
    $specLines = Get-SectionLines -Lines $lines -SectionName 'spec'
    $metadataLines = Get-SectionLines -Lines $specLines -SectionName 'metadata'
    $relationshipsLines = Get-SectionLines -Lines $specLines -SectionName 'relationships'

    foreach ($key in $requiredTemplateKeys) {
        if (-not (Test-KeyPresent -Lines $templateLines -KeyName $key)) {
            Add-Error $file.FullName ("missing template.{0}" -f $key)
        }
    }

    foreach ($key in $requiredSpecKeys) {
        if (-not (Test-KeyPresent -Lines $specLines -KeyName $key)) {
            Add-Error $file.FullName ("missing spec.{0}" -f $key)
        }
    }

    foreach ($key in $requiredMetadataKeys) {
        if (-not (Test-NestedKeyPresent -Lines $metadataLines -KeyName $key)) {
            Add-Error $file.FullName ("missing spec.metadata.{0}" -f $key)
        }
    }

    $kindLine = $templateLines | Where-Object { $_ -match '^\s{2}kind:\s*(.+?)\s*$' } | Select-Object -First 1
    if ($kindLine) {
        $kind = ($kindLine -replace '^\s{2}kind:\s*', '').Trim()
        if ($kind -ne $stem) {
            Add-Error $file.FullName ("template.kind '{0}' does not match file stem '{1}'" -f $kind, $stem)
        }
        if ($kind -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
            Add-Error $file.FullName ("template.kind '{0}' is not lowercase kebab-case" -f $kind)
        }
    }

    $confidenceLines = $metadataLines | Where-Object { $_ -match '^\s{4}confidence:\s*(.+?)\s*(#.*)?$' }
    foreach ($line in $confidenceLines) {
        $value = (($line -replace '^\s{4}confidence:\s*', '') -replace '\s+#.*$', '').Trim()
        if ($allowedConfidence -notcontains $value) {
            Add-Error $file.FullName ("spec.metadata.confidence '{0}' is invalid; expected one of: {1}" -f $value, ($allowedConfidence -join ', '))
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

    if ($relationshipEntries.Count -eq 0) {
        Add-Error $file.FullName 'spec.relationships does not contain any relationship entries'
    }

    foreach ($entry in $relationshipEntries) {
        $normalizedEntry = $entry | ForEach-Object { $_ -replace '^\s{4}-\s*', '    ' }

        foreach ($requiredKey in @('type', 'target_kind', 'target_id', 'strength', 'confidence')) {
            $pattern = '^\s+' + [regex]::Escape($requiredKey) + ':\s*'
            if (-not ($normalizedEntry | Where-Object { $_ -match $pattern } | Select-Object -First 1)) {
                Add-Error $file.FullName ("a relationship entry is missing '{0}'" -f $requiredKey)
            }
        }

        $targetKindLine = $normalizedEntry | Where-Object { $_ -match '^\s+target_kind:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
        if ($targetKindLine) {
            $value = Get-ScalarValue -Line $targetKindLine -KeyName 'target_kind'
            if ($validTemplateKinds -notcontains $value) {
                Add-Error $file.FullName ("relationship target_kind '{0}' is invalid; expected a known template kind" -f $value)
            }
        }

        $strengthLine = $normalizedEntry | Where-Object { $_ -match '^\s+strength:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
        if ($strengthLine) {
            $value = (($strengthLine -replace '^\s+strength:\s*', '') -replace '\s+#.*$', '').Trim()
            if ($allowedRelationshipStrength -notcontains $value) {
                Add-Error $file.FullName ("relationship strength '{0}' is invalid; expected one of: {1}" -f $value, ($allowedRelationshipStrength -join ', '))
            }
        }

        $relationshipConfidenceLine = $normalizedEntry | Where-Object { $_ -match '^\s+confidence:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
        if ($relationshipConfidenceLine) {
            $value = (($relationshipConfidenceLine -replace '^\s+confidence:\s*', '') -replace '\s+#.*$', '').Trim()
            if ($allowedConfidence -notcontains $value) {
                Add-Error $file.FullName ("relationship confidence '{0}' is invalid; expected one of: {1}" -f $value, ($allowedConfidence -join ', '))
            }
        }
    }

    if ($templateSpecificEnumRules.ContainsKey($kind)) {
        foreach ($rule in $templateSpecificEnumRules[$kind]) {
            $matchingLine = $lines | Where-Object { $_ -match ('^\s+' + [regex]::Escape($rule.Key) + ':\s*(.+?)\s*(#.*)?$') } | Select-Object -First 1
            if ($matchingLine) {
                $value = Get-ScalarValue -Line $matchingLine -KeyName $rule.Key
                if ($rule.AllowedValues.Count -gt 0 -and $rule.AllowedValues -notcontains $value) {
                    Add-Error $file.FullName ("{0}.{1} uses invalid value '{2}'; expected one of: {3}" -f $kind, $rule.Path, $value, ($rule.AllowedValues -join ', '))
                }
            }
        }
    }

    foreach ($dateField in $dateFieldNames) {
        $pattern = '^\s*' + [regex]::Escape($dateField) + ':\s*([0-9]{4}-[0-9]{2}-[0-9]{2}|.+?)\s*(#.*)?$'
        $dateLines = $lines | Where-Object { $_ -match $pattern }
        foreach ($line in $dateLines) {
            $value = (($line -replace '^\s*' + [regex]::Escape($dateField) + ':\s*', '') -replace '\s+#.*$', '').Trim()
            if ($value -and $value -notmatch $datePattern) {
                Add-Error $file.FullName ("field '{0}' uses non-ISO date value '{1}'" -f $dateField, $value)
            }
        }
    }

    $changeLogDateLines = $lines | Where-Object { $_ -match '^\s{6}date:\s*(.+?)\s*(#.*)?$' }
    foreach ($line in $changeLogDateLines) {
        $value = (($line -replace '^\s{6}date:\s*', '') -replace '\s+#.*$', '').Trim()
        if ($value -and $value -notmatch $datePattern) {
            Add-Error $file.FullName ("change_log date uses non-ISO value '{0}'" -f $value)
        }
    }
}

$warnings = @($issues | Where-Object { $_.Severity -eq 'warning' })
$errors = @($issues | Where-Object { $_.Severity -eq 'error' })

if ($warnings.Count -gt 0) {
    Write-Host 'Template validation warnings:' -ForegroundColor Yellow
    foreach ($warningLine in $warnings) {
        Write-Host ("- {0}: {1}" -f $warningLine.Path, $warningLine.Message) -ForegroundColor Yellow
    }
}

if ($errors.Count -gt 0) {
    Write-Host 'Template validation failed:' -ForegroundColor Red
    foreach ($errorLine in $errors) {
        Write-Host ("- {0}: {1}" -f $errorLine.Path, $errorLine.Message) -ForegroundColor Red
    }
    Write-Summary -Status 'failed' -Checked $templateFiles.Count -Errors $errors.Count -Warnings $warnings.Count
    exit 1
}

if ($FailOnWarning -and $warnings.Count -gt 0) {
    Write-Host ("Template validation produced {0} warnings and was configured to fail on warning." -f $warnings.Count) -ForegroundColor Red
    Write-Summary -Status 'failed-on-warning' -Checked $templateFiles.Count -Errors $errors.Count -Warnings $warnings.Count
    exit 1
}

if ($warnings.Count -gt 0) {
    Write-Host ("Template validation passed for {0} template files with {1} warnings." -f $templateFiles.Count, $warnings.Count) -ForegroundColor Yellow
    Write-Summary -Status 'passed-with-warnings' -Checked $templateFiles.Count -Errors $errors.Count -Warnings $warnings.Count
}
else {
    Write-Host ("Template validation passed for {0} template files." -f $templateFiles.Count) -ForegroundColor Green
    Write-Summary -Status 'passed' -Checked $templateFiles.Count -Errors $errors.Count -Warnings $warnings.Count
}
