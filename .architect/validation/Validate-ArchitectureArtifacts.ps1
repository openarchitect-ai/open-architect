param(
    [string]$ArtifactRoot = '.architect\examples\customer-onboarding-modernization',
    [switch]$FailOnWarning
)

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$templatesRoot = Join-Path $repoRoot '.architect\templates'

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

    $confidenceLine = $metadataLines | Where-Object { $_ -match '^\s{4}confidence:\s*(.+?)\s*(#.*)?$' } | Select-Object -First 1
    if ($confidenceLine) {
        $value = Get-ScalarValue -Line $confidenceLine -KeyName 'confidence'
        if ($allowedConfidence -notcontains $value) {
            Add-Error $artifact.Path ("spec.metadata.confidence '{0}' is invalid; expected one of: {1}" -f $value, ($allowedConfidence -join ', '))
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
        if ($url -like '.architect/*') {
            $relativeUrl = $url -replace '/', '\'
            $targetPath = Join-Path $repoRoot $relativeUrl
            if (-not (Test-Path $targetPath)) {
                Add-Error $artifact.Path ("reference url '{0}' does not resolve to a local file" -f $url)
            }
        }
    }

    if ($confidenceLine) {
        $confidenceValue = Get-ScalarValue -Line $confidenceLine -KeyName 'confidence'
        if ($confidenceValue -eq 'high' -and $referenceEntryCount -lt 1) {
            Add-Warning $artifact.Path 'metadata.confidence is high but metadata.references does not contain any entries'
        }
    }

    $hasApprovalSignal = $false
    foreach ($line in $lines) {
        if ($line -match '^\s+[a-z_]+:\s*(.+?)\s*(#.*)?$') {
            $value = (($line -replace '^\s+[a-z_]+:\s*', '') -replace '\s+#.*$', '').Trim()
            if ($approvalSignalValues -contains $value) {
                $hasApprovalSignal = $true
                break
            }
        }
    }

    if ($hasApprovalSignal -and $referenceEntryCount -lt 1) {
        Add-Warning $artifact.Path 'artifact contains approval or verification signals but metadata.references has no entries'
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
