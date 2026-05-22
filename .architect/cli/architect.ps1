#!/usr/bin/env pwsh
<#
.SYNOPSIS
  Open Architect CLI -- initialize a workspace, scaffold projects from playbooks,
  inspect playbooks, and list projects.
#>
param(
    [Parameter(Position = 0)]
    [string]$Command,

    [Parameter(Position = 1)]
    [string]$Name,

    [Parameter()]
    [Alias('p')]
    [string]$Playbook,

    [Parameter()]
    [switch]$Version,

    [Parameter()]
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Force UTF-8 output so emoji and Unicode render correctly on Windows consoles.
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch { }
try { $OutputEncoding = [System.Text.Encoding]::UTF8 } catch { }

$ScriptDir    = $PSScriptRoot
$RepoRoot     = (Get-Item $ScriptDir).Parent.Parent.FullName
$WorkspaceDir = Join-Path $RepoRoot 'workspace'
$PlaybooksDir = Join-Path $RepoRoot '.architect\playbooks'
$TemplatesDir = Join-Path $ScriptDir 'templates'
$VersionFile  = Join-Path $RepoRoot '.architect\VERSION'

# Read the capability version from .architect/VERSION (single source of truth).
if (Test-Path $VersionFile) {
    try {
        $OaVersion = (Get-Content $VersionFile -Encoding UTF8 -TotalCount 1).Trim()
        if (-not $OaVersion) { $OaVersion = 'unknown' }
    } catch {
        $OaVersion = 'unknown'
    }
} else {
    $OaVersion = 'unknown'
}

function Show-Usage {
    param([string]$ForCommand = '')

    if ($ForCommand) {
        switch ($ForCommand) {
            'init' {
                @"
Usage: architect init

  Creates the workspace/ folder at the repo root and drops a README inside.
  Safe to re-run -- the README is overwritten with the latest template.

Example:
  architect init
"@ | Write-Host
                return
            }
            'new' {
                @"
Usage: architect new <project-name> [-Playbook <playbook-name>]

  Scaffolds workspace/<project-name>/ with:
    - project-config.yaml (from the named playbook, if specified)
    - notes.md (seed file)
    - architect-work/ with five standard files (incl. working-log)
    - docs/ (empty)

  If the workspace folder doesn't exist yet, it's initialized first.
  Never overwrites existing project content -- name collisions are rejected.

Examples:
  architect new customer-platform -Playbook quick-solution-design
  architect new acme-acquisition -p acquisition-due-diligence
  architect new my-project        (no playbook; copy project-config.yaml later)
"@ | Write-Host
                return
            }
            'list-playbooks' {
                @"
Usage: architect list-playbooks

  Lists all available playbooks with a one-line description of each.

Example:
  architect list-playbooks
"@ | Write-Host
                return
            }
            'list-projects' {
                @"
Usage: architect list-projects

  Lists projects currently in workspace/, showing each project's chosen playbook.

Example:
  architect list-projects
"@ | Write-Host
                return
            }
            'playbook' {
                @"
Usage: architect playbook <playbook-name>

  Prints key sections from a playbook's brief: Engagement Shape,
  When To Use, When Not To Use, and First Working Session.
  Use this as a quick reference before scaffolding.

Example:
  architect playbook quick-solution-design
"@ | Write-Host
                return
            }
            'status' {
                $blockerGlyph = [char]::ConvertFromUtf32(0x1F6AB)
                @"
Usage: architect status [project-name]

  Show a portfolio status across projects in workspace/, or a deep view
  of a single project. Reads project-config.yaml, working-log.md, and
  the architect-work/ files to surface per project:

    - playbook in use
    - last activity (latest working-log entry: date + title)
    - biggest signal (from the latest log entry's 'Biggest signal:' section)
    - active blockers (any '- $blockerGlyph ...' bullets across architect-work/)
    - next 3 immediate tasks (from architect-task-list.md 'Immediate' section)
    - totals: open questions / immediate tasks / evidence still missing

  Empty / sparse projects show only the last-touched date and totals.

  With no argument: shows a block per project (portfolio view).
  With a project name: shows just that one project's block.

  list-projects stays minimal (one line per project, name + playbook).
  Use status when you want the richer per-project state summary.

Examples:
  architect status
  architect status smoke-test-2026-05-22
"@ | Write-Host
                return
            }
        }
    }

    @"
Open Architect $OaVersion

Usage: architect <command> [args]

Commands:
  init                                       Initialize the workspace/ folder.
  new <project-name> [-Playbook <name>]      Scaffold a new project under workspace/<project-name>/.
  list-playbooks                             Show available playbooks with one-line descriptions.
  list-projects                              Show projects currently in workspace/ and their playbooks.
  status [project-name]                      Show a richer per-project status (last activity, counts, latest log).
  playbook <name>                            Print key sections of a playbook's brief.
  -Version                                   Show the Open Architect capability version.
  -Help [command]                            Show this help, or help for a specific command.

Examples:
  architect init
  architect new customer-platform -Playbook quick-solution-design
  architect list-playbooks
  architect playbook full-togaf-adm
  architect -Help new

The CLI never overwrites existing project content. Use a different name if a project already exists.
"@ | Write-Host
}

function Get-PlaybookDescription {
    param([string]$PlaybookName)
    $playbookMd = Join-Path $PlaybooksDir "$PlaybookName\playbook.md"
    if (-not (Test-Path $playbookMd)) { return '' }
    $line = Select-String -Path $playbookMd -Pattern '^- \*\*Output emphasis:\*\* (.+)$' | Select-Object -First 1
    if ($line) {
        return $line.Matches[0].Groups[1].Value
    }
    return ''
}

function Suggest-Playbook {
    param([string]$Typed)
    if (-not $Typed) { return @() }
    $all = Get-ChildItem -Path $PlaybooksDir -Directory | Select-Object -ExpandProperty Name
    $needle = $Typed.ToLower()
    $matches = @()
    foreach ($name in $all) {
        $haystack = $name.ToLower()
        if ($haystack.Contains($needle) -or $needle.Contains($haystack.Split('-')[0])) {
            $matches += $name
        }
    }
    if ($matches.Count -eq 0 -and $needle.Length -ge 4) {
        foreach ($name in $all) {
            $shared = ($name.ToCharArray() | Where-Object { $needle.Contains($_) }).Count
            if ($shared -ge ($needle.Length * 0.6)) { $matches += $name }
        }
    }
    return ($matches | Select-Object -Unique)
}

function Invoke-Init {
    if (-not (Test-Path $WorkspaceDir)) {
        New-Item -ItemType Directory -Path $WorkspaceDir -Force | Out-Null
    }
    $readmeSource = Join-Path $TemplatesDir 'workspace-README.md'
    $readmeTarget = Join-Path $WorkspaceDir 'README.md'
    if (-not (Test-Path $readmeSource)) {
        Write-Error "Template not found: $readmeSource"
        exit 1
    }
    Copy-Item $readmeSource $readmeTarget -Force
    Write-Host "[OK] Workspace initialized at $WorkspaceDir"
}

function Invoke-ListPlaybooks {
    if (-not (Test-Path $PlaybooksDir)) {
        Write-Error "Playbooks folder not found: $PlaybooksDir"
        exit 1
    }
    Write-Host "Available playbooks:"
    Write-Host ""
    $playbooks = Get-ChildItem -Path $PlaybooksDir -Directory | Sort-Object Name
    $maxLen = ($playbooks | Measure-Object -Property Name -Maximum).Maximum.Length
    if (-not $maxLen) { $maxLen = 30 }
    foreach ($pb in $playbooks) {
        $desc = Get-PlaybookDescription $pb.Name
        $name = $pb.Name.PadRight($maxLen + 2)
        if ($desc) {
            Write-Host "  $name -> $desc"
        } else {
            Write-Host "  $name"
        }
    }
    Write-Host ""
    Write-Host "Run ``architect playbook <name>`` to see a playbook's full brief."
}

function Invoke-ListProjects {
    if (-not (Test-Path $WorkspaceDir)) {
        Write-Host "No workspace yet. Run ``architect init`` to create it."
        return
    }
    $projects = Get-ChildItem -Path $WorkspaceDir -Directory | Sort-Object Name
    if ($projects.Count -eq 0) {
        Write-Host "No projects in workspace/ yet."
        Write-Host "Create one with: architect new <project-name> -Playbook <playbook-name>"
        return
    }

    Write-Host "Projects in workspace/:"
    Write-Host ""
    $maxLen = ($projects | Measure-Object -Property Name -Maximum).Maximum.Length
    if (-not $maxLen) { $maxLen = 30 }
    foreach ($proj in $projects) {
        $configPath = Join-Path $proj.FullName 'project-config.yaml'
        $playbookName = '(no playbook set)'
        if (Test-Path $configPath) {
            $playbookLine = Select-String -Path $configPath -Pattern '^\s*playbook:\s*(\S+)' | Select-Object -First 1
            if ($playbookLine) {
                $val = $playbookLine.Matches[0].Groups[1].Value.Trim()
                if ($val) { $playbookName = $val }
            }
        } else {
            $playbookName = '(no project-config.yaml)'
        }
        $name = $proj.Name.PadRight($maxLen + 2)
        Write-Host "  $name [$playbookName]"
    }
    Write-Host ""
    Write-Host "Total: $($projects.Count)"
}

function Format-WrappedLines {
    param([string]$Text, [int]$Width = 62, [string]$Indent = '    ')
    if (-not $Text) { return @() }
    $paragraphs = $Text -split "(?:`r`n|`n)"
    $output = @()
    foreach ($para in $paragraphs) {
        if ($para -match '^\s*$') { continue }
        $words = $para -split '\s+' | Where-Object { $_ }
        $current = ''
        foreach ($word in $words) {
            if (-not $current) {
                $current = $Indent + $word
            } elseif (($current.Length + 1 + $word.Length) -le $Width) {
                $current += ' ' + $word
            } else {
                $output += $current
                $current = $Indent + $word
            }
        }
        if ($current) { $output += $current }
    }
    return $output
}

function Get-LatestLogSignal {
    param([string]$Path)
    if (-not (Test-Path $Path)) { return $null }
    $lines = Get-Content $Path -Encoding UTF8
    $entryFound = $false
    $captureMode = $false
    $captured = @()
    foreach ($line in $lines) {
        if ($line -match '^##\s+\d{4}-\d{2}-\d{2}\b') {
            if ($entryFound) { break }
            $entryFound = $true
            continue
        }
        if (-not $entryFound) { continue }
        if ($line -match '^##\s') { break }
        if ($line -match '^Biggest signal\s*:\s*(.*)$') {
            $captureMode = $true
            $rest = $matches[1].Trim()
            if ($rest) { $captured += $rest }
            continue
        }
        if ($captureMode) {
            if ($line -match '^(What I did|What I found|See also)\s*:') { break }
            if ($line -match '^[A-Z][A-Za-z ]+\s*:\s*$') { break }
            $trimmed = $line.TrimEnd()
            if ($trimmed -match '^\s*$') {
                if ($captured.Count -gt 0) { break }
                continue
            }
            # Strip leading bullet "- " for cleaner display
            $trimmed = $trimmed -replace '^\s*-\s+', ''
            $captured += $trimmed
        }
    }
    if ($captured.Count -eq 0) { return $null }
    $signal = ($captured -join ' ').Trim()
    $signal = $signal -replace '\*\*([^*]+)\*\*', '$1'
    $signal = $signal -replace '\[([^\]]+)\]\([^)]+\)', '$1'
    return $signal
}

# Glyphs built from code points so PS 5.x (which reads BOM-less scripts as
# Windows-1252) doesn't choke on non-ASCII literals in the source.
$Script:EmojiProhibited = [char]::ConvertFromUtf32(0x1F6AB)  # blocker (U+1F6AB)
$Script:BulletGlyph     = [char]0x2022                        # bullet point
$Script:DotSep          = [char]0x00B7                        # middle dot

function Get-Blockers {
    param([string]$ProjectDir)
    $awDir = Join-Path $ProjectDir 'architect-work'
    if (-not (Test-Path $awDir)) { return @() }
    $files = @('open-questions.md', 'architect-task-list.md', 'answers-and-confirmations.md', 'evidence-requests.md')
    $blockers = @()
    $pattern = "^\s*-\s+$([regex]::Escape($Script:EmojiProhibited))\s+(.+)$"
    foreach ($f in $files) {
        $path = Join-Path $awDir $f
        if (-not (Test-Path $path)) { continue }
        foreach ($line in (Get-Content $path -Encoding UTF8)) {
            if ($line -match $pattern) {
                $content = $matches[1].Trim()
                $content = $content -replace '\*\*([^*]+)\*\*', '$1'
                $content = $content -replace '\[([^\]]+)\]\([^)]+\)', '$1'
                if ($content.Length -gt 110) {
                    $cut = $content.Substring(0, 107)
                    $lastSpace = $cut.LastIndexOf(' ')
                    if ($lastSpace -gt 50) { $cut = $cut.Substring(0, $lastSpace) }
                    $content = $cut + '...'
                }
                $blockers += $content
            }
        }
    }
    return $blockers
}

function Get-NextImmediateTasks {
    param([string]$Path, [int]$Count = 3)
    if (-not (Test-Path $Path)) { return @() }
    $lines = Get-Content $Path -Encoding UTF8
    $inImmediate = $false
    $currentSub = ''
    $tasks = @()
    foreach ($line in $lines) {
        if ($line -match '^##\s+(.+?)\s*$') {
            $inImmediate = ($matches[1].Trim() -eq 'Immediate')
            $currentSub = ''
            continue
        }
        if (-not $inImmediate) { continue }
        if ($line -match '^###\s+(.+?)\s*$') {
            $sub = $matches[1].Trim() -replace '\s*\([^)]+\)\s*$', ''
            $currentSub = $sub
            continue
        }
        if ($line -match '^\s*-\s+(.+)$') {
            $content = $matches[1].Trim()
            if (-not $content -or $content -eq '...') { continue }
            # Strip any leading non-printable-ASCII run (emoji + optional variation selectors) + whitespace.
            $content = $content -replace '^[^\x20-\x7E]+\s*', ''
            $content = $content -replace '\*\*([^*]+)\*\*', '$1'
            $content = $content -replace '\[([^\]]+)\]\([^)]+\)', '$1'
            if ($content.Length -gt 100) {
                $cut = $content.Substring(0, 97)
                $lastSpace = $cut.LastIndexOf(' ')
                if ($lastSpace -gt 50) { $cut = $cut.Substring(0, $lastSpace) }
                $content = $cut + '...'
            }
            $tasks += [PSCustomObject]@{ Section = $currentSub; Text = $content }
            if ($tasks.Count -ge $Count) { return ,$tasks }
        }
    }
    return ,$tasks
}

function Count-NonPlaceholderBullets {
    param(
        [string]$Path,
        [string[]]$IncludeSections = @(),
        [string[]]$ExcludeSections = @('Update Log')
    )
    if (-not (Test-Path $Path)) { return 0 }
    $count = 0
    $active = ($IncludeSections.Count -eq 0)
    foreach ($line in (Get-Content $Path -Encoding UTF8)) {
        if ($line -match '^##\s+(.+?)\s*$') {
            $sect = $matches[1].Trim()
            if ($IncludeSections.Count -gt 0) {
                $active = $IncludeSections -contains $sect
            }
            if ($ExcludeSections -contains $sect) {
                $active = $false
            }
            continue
        }
        if ($active -and $line -match '^\s*[-*]\s+(.+)$') {
            $content = $matches[1].Trim()
            if ($content -and $content -ne '...') {
                $count++
            }
        }
    }
    return $count
}

function Get-ProjectStatus {
    param([System.IO.DirectoryInfo]$Project)

    $configPath = Join-Path $Project.FullName 'project-config.yaml'
    $playbookName = '(no playbook set)'
    if (Test-Path $configPath) {
        $playbookLine = Select-String -Path $configPath -Pattern '^\s*playbook:\s*(\S+)' | Select-Object -First 1
        if ($playbookLine) {
            $val = $playbookLine.Matches[0].Groups[1].Value.Trim()
            if ($val) { $playbookName = $val }
        }
    } else {
        $playbookName = '(no project-config.yaml)'
    }

    $lastTouched = $null
    $files = Get-ChildItem -Path $Project.FullName -Recurse -File -ErrorAction SilentlyContinue
    if ($files) {
        $lastTouched = ($files | Sort-Object LastWriteTime -Descending | Select-Object -First 1).LastWriteTime
    }

    $logDate = ''
    $logTitle = ''
    $workingLogPath = Join-Path $Project.FullName 'architect-work\working-log.md'
    if (Test-Path $workingLogPath) {
        $logLines = Get-Content $workingLogPath -Encoding UTF8
        foreach ($line in $logLines) {
            if ($line -match '^##\s+(\d{4}-\d{2}-\d{2})\b\s*\S?\s*(.*?)\s*$') {
                $logDate = $matches[1]
                $logTitle = $matches[2].Trim()
                if ($logTitle -match '^[\-–—]\s+(.+)$') {
                    $logTitle = $matches[1].Trim()
                }
                break
            }
        }
    }

    $oqPath = Join-Path $Project.FullName 'architect-work\open-questions.md'
    $taskPath = Join-Path $Project.FullName 'architect-work\architect-task-list.md'
    $evidencePath = Join-Path $Project.FullName 'architect-work\evidence-requests.md'

    $openQCount = Count-NonPlaceholderBullets -Path $oqPath -ExcludeSections @('Update Log')
    $immediateCount = Count-NonPlaceholderBullets -Path $taskPath -IncludeSections @('Immediate') -ExcludeSections @()
    $missingCount = Count-NonPlaceholderBullets -Path $evidencePath -IncludeSections @('Still Missing') -ExcludeSections @()

    $logSignal = Get-LatestLogSignal -Path $workingLogPath
    $blockers = Get-Blockers -ProjectDir $Project.FullName
    $nextTasks = Get-NextImmediateTasks -Path $taskPath -Count 3

    return [PSCustomObject]@{
        Name = $Project.Name
        Playbook = $playbookName
        LastTouched = $lastTouched
        LogDate = $logDate
        LogTitle = $logTitle
        LogSignal = $logSignal
        Blockers = $blockers
        NextTasks = $nextTasks
        OpenQuestions = $openQCount
        ImmediateTasks = $immediateCount
        MissingEvidence = $missingCount
    }
}

function Show-ProjectStatusBlock {
    param($Status)
    $rule = '-' * 70
    Write-Host $rule
    Write-Host "$($Status.Name)  [$($Status.Playbook)]"
    Write-Host ''

    if ($Status.LogDate) {
        Write-Host "  Last activity: $($Status.LogDate) -- $($Status.LogTitle)"
    } else {
        if ($Status.LastTouched) {
            $dateStr = $Status.LastTouched.ToString('yyyy-MM-dd')
            Write-Host "  Last touched:  $dateStr  (no working-log entries yet)"
        } else {
            Write-Host "  Last touched:  (no files yet)"
        }
    }

    if ($Status.LogSignal) {
        Write-Host ''
        Write-Host "  Biggest signal:"
        foreach ($line in (Format-WrappedLines -Text $Status.LogSignal -Width 64 -Indent '    ')) {
            Write-Host $line
        }
    }

    if ($Status.Blockers -and $Status.Blockers.Count -gt 0) {
        Write-Host ''
        Write-Host "  $($Script:EmojiProhibited) Blockers ($($Status.Blockers.Count)):"
        foreach ($b in $Status.Blockers) {
            $wrapped = @(Format-WrappedLines -Text $b -Width 62 -Indent '      ')
            for ($j = 0; $j -lt $wrapped.Count; $j++) {
                if ($j -eq 0) {
                    Write-Host ($wrapped[0] -replace '^      ', "    $($Script:BulletGlyph) ")
                } else {
                    Write-Host $wrapped[$j]
                }
            }
        }
    }

    if ($Status.NextTasks -and $Status.NextTasks.Count -gt 0) {
        Write-Host ''
        Write-Host "  Next $($Status.NextTasks.Count) immediate tasks:"
        $i = 1
        foreach ($t in $Status.NextTasks) {
            $prefix = if ($t.Section) { "$($t.Section): " } else { '' }
            $combined = "$prefix$($t.Text)"
            $wrapped = @(Format-WrappedLines -Text $combined -Width 62 -Indent '       ')
            for ($j = 0; $j -lt $wrapped.Count; $j++) {
                if ($j -eq 0) {
                    Write-Host ($wrapped[0] -replace '^       ', "    $i. ")
                } else {
                    Write-Host $wrapped[$j]
                }
            }
            $i++
        }
    }

    Write-Host ''
    $sep = " $($Script:DotSep) "
    $totals = "$($Status.OpenQuestions) open questions$sep$($Status.ImmediateTasks) immediate$sep$($Status.MissingEvidence) evidence requests"
    Write-Host "  Totals: $totals"
}

function Invoke-Status {
    if (-not (Test-Path $WorkspaceDir)) {
        Write-Host "No workspace yet. Run ``architect init`` to create it."
        return
    }

    if ($Name) {
        $projectDir = Join-Path $WorkspaceDir $Name
        if (-not (Test-Path $projectDir)) {
            Write-Warning "Project '$Name' not found in workspace/."
            Write-Host "Run ``architect list-projects`` to see available projects."
            return
        }
        $proj = Get-Item $projectDir
        $status = Get-ProjectStatus -Project $proj
        Show-ProjectStatusBlock $status
        Write-Host ('-' * 70)
        return
    }

    $projects = Get-ChildItem -Path $WorkspaceDir -Directory | Sort-Object Name
    if ($projects.Count -eq 0) {
        Write-Host "No projects in workspace/ yet."
        Write-Host "Create one with: architect new <project-name> -Playbook <playbook-name>"
        return
    }
    Write-Host "Open Architect $OaVersion -- portfolio status"
    Write-Host ''
    foreach ($proj in $projects) {
        $status = Get-ProjectStatus -Project $proj
        Show-ProjectStatusBlock $status
        Write-Host ''
    }
    Write-Host ('-' * 70)
    Write-Host "Total: $($projects.Count) project(s)"
}

function Invoke-Playbook {
    if (-not $Name) {
        Write-Error "Playbook name required. Usage: architect playbook <playbook-name>"
        exit 1
    }
    $playbookMd = Join-Path $PlaybooksDir "$Name\playbook.md"
    if (-not (Test-Path $playbookMd)) {
        Write-Warning "Playbook '$Name' not found."
        $suggestions = Suggest-Playbook -Typed $Name
        if ($suggestions.Count -gt 0) {
            Write-Host "Did you mean:"
            foreach ($s in $suggestions) { Write-Host "  - $s" }
        } else {
            Write-Host "Run ``architect list-playbooks`` to see available playbooks."
        }
        exit 1
    }

    $wantedHeadings = @('## Engagement Shape', '## When To Use', '## When Not To Use', '## First Working Session')
    $inSection = $false
    $lines = Get-Content $playbookMd
    foreach ($line in $lines) {
        if ($line -match '^# [^#]') {
            Write-Host $line
            Write-Host ''
            continue
        }
        if ($line -match '^## ') {
            $inSection = $wantedHeadings -contains $line.TrimEnd()
        }
        if ($inSection) {
            Write-Host $line
        }
    }
}

function Invoke-New {
    if (-not $Name) {
        Write-Error "Project name required. Usage: architect new <project-name> [-Playbook <name>]"
        exit 1
    }
    if (-not (Test-Path $WorkspaceDir)) {
        Invoke-Init
    }
    $projectDir = Join-Path $WorkspaceDir $Name
    if (Test-Path $projectDir) {
        Write-Error "Project '$Name' already exists at $projectDir"
        exit 1
    }

    New-Item -ItemType Directory -Path $projectDir -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $projectDir 'docs') -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $projectDir 'architect-work') -Force | Out-Null

    $awTemplates = Join-Path $TemplatesDir 'architect-work'
    if (Test-Path $awTemplates) {
        Copy-Item (Join-Path $awTemplates '*') (Join-Path $projectDir 'architect-work') -Recurse -Force
    }

    $notesSource = Join-Path $TemplatesDir 'project-notes.md'
    if (Test-Path $notesSource) {
        Copy-Item $notesSource (Join-Path $projectDir 'notes.md')
    }

    if ($Playbook) {
        $playbookConfig = Join-Path $PlaybooksDir "$Playbook\project-config.yaml"
        if (Test-Path $playbookConfig) {
            Copy-Item $playbookConfig (Join-Path $projectDir 'project-config.yaml')
            Write-Host "[OK] Project '$Name' created with playbook '$Playbook' at $projectDir"
            Write-Host ''
            Write-Host 'Next:'
            Write-Host "  1. Open $projectDir"
            Write-Host "  2. Read .architect/playbooks/$Playbook/playbook.md"
            Write-Host "  3. Follow the playbook's First Working Session steps"
        } else {
            Write-Warning "Playbook '$Playbook' not found at $playbookConfig"
            $suggestions = Suggest-Playbook -Typed $Playbook
            if ($suggestions.Count -gt 0) {
                Write-Host "Did you mean:"
                foreach ($s in $suggestions) { Write-Host "  - $s" }
                Write-Host ''
            } else {
                Write-Host "Available playbooks:"
                Get-ChildItem -Path $PlaybooksDir -Directory | Sort-Object Name | ForEach-Object {
                    Write-Host "  - $($_.Name)"
                }
                Write-Host ''
            }
            Write-Host "Project '$Name' was still created at $projectDir but without project-config.yaml."
        }
    } else {
        Write-Host "[OK] Project '$Name' created at $projectDir"
        Write-Host ''
        Write-Host 'Tip: pick a playbook from .architect/playbooks/ and copy its project-config.yaml,'
        Write-Host "or re-run with -Playbook <name>. Run ``architect list-playbooks`` to see the catalog."
    }
}

# Top-level flag handling.
if ($Version) {
    Write-Host "Open Architect $OaVersion"
    exit 0
}
if ($Help) {
    Show-Usage -ForCommand $Command
    exit 0
}

switch ($Command) {
    'init'           { Invoke-Init }
    'new'            { Invoke-New }
    'list-playbooks' { Invoke-ListPlaybooks }
    'list-projects'  { Invoke-ListProjects }
    'status'         { Invoke-Status }
    'playbook'       { Invoke-Playbook }
    'version'        { Write-Host "Open Architect $OaVersion" }
    '--version'      { Write-Host "Open Architect $OaVersion" }
    'help'           { Show-Usage -ForCommand $Name }
    '--help'         { Show-Usage -ForCommand $Name }
    '-h'             { Show-Usage -ForCommand $Name }
    ''               { Show-Usage }
    default          { Show-Usage }
}
