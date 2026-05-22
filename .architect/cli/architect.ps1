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
    'playbook'       { Invoke-Playbook }
    'version'        { Write-Host "Open Architect $OaVersion" }
    '--version'      { Write-Host "Open Architect $OaVersion" }
    'help'           { Show-Usage -ForCommand $Name }
    '--help'         { Show-Usage -ForCommand $Name }
    '-h'             { Show-Usage -ForCommand $Name }
    ''               { Show-Usage }
    default          { Show-Usage }
}
