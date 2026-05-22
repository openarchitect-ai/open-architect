#!/usr/bin/env pwsh
<#
.SYNOPSIS
  Open Architect CLI — initialize a workspace and scaffold projects from playbooks.

.DESCRIPTION
  Commands:
    init                                       Create the workspace/ folder and drop a README.
    new <project-name> [-Playbook <name>]      Scaffold workspace/<project-name>/ with project-config.yaml,
                                                notes.md, architect-work/, and docs/.
    list-playbooks                             List available playbooks under .architect/playbooks/.

.EXAMPLE
  architect init
  architect new customer-platform -Playbook quick-solution-design
  architect list-playbooks
#>
param(
    [Parameter(Position = 0)]
    [string]$Command,

    [Parameter(Position = 1)]
    [string]$Name,

    [Parameter()]
    [Alias('p')]
    [string]$Playbook
)

$ErrorActionPreference = 'Stop'

$ScriptDir    = $PSScriptRoot
$RepoRoot     = (Get-Item $ScriptDir).Parent.Parent.FullName
$WorkspaceDir = Join-Path $RepoRoot 'workspace'
$PlaybooksDir = Join-Path $RepoRoot '.architect\playbooks'
$TemplatesDir = Join-Path $ScriptDir 'templates'

function Show-Usage {
    @"
Usage: architect <command> [args]

Commands:
  init                                       Initialize the workspace/ folder.
  new <project-name> [-Playbook <name>]      Scaffold a new project under workspace/<project-name>/.
  list-playbooks                             Show available playbooks.

Examples:
  architect init
  architect new customer-platform -Playbook quick-solution-design
  architect new acme-acquisition -p acquisition-due-diligence

The CLI never overwrites existing project content. Use a different name if a project already exists.
"@ | Write-Host
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
    Write-Host "✅ Workspace initialized at $WorkspaceDir"
}

function Invoke-ListPlaybooks {
    if (-not (Test-Path $PlaybooksDir)) {
        Write-Error "Playbooks folder not found: $PlaybooksDir"
        exit 1
    }
    Write-Host "Available playbooks:"
    Get-ChildItem -Path $PlaybooksDir -Directory | Sort-Object Name | ForEach-Object {
        Write-Host "  - $($_.Name)"
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
            Write-Host "✅ Project '$Name' created with playbook '$Playbook' at $projectDir"
            Write-Host ""
            Write-Host "Next:"
            Write-Host "  1. Open $projectDir"
            Write-Host "  2. Read .architect/playbooks/$Playbook/playbook.md"
            Write-Host "  3. Follow the playbook's First Working Session steps"
        } else {
            Write-Warning "Playbook '$Playbook' not found at $playbookConfig"
            Write-Host "Available playbooks:"
            Get-ChildItem -Path $PlaybooksDir -Directory | Sort-Object Name | ForEach-Object {
                Write-Host "  - $($_.Name)"
            }
            Write-Host ""
            Write-Host "Project '$Name' was still created at $projectDir but without project-config.yaml."
        }
    } else {
        Write-Host "✅ Project '$Name' created at $projectDir"
        Write-Host ""
        Write-Host "Tip: pick a playbook from .architect/playbooks/ and copy its project-config.yaml,"
        Write-Host "or re-run with -Playbook <name>. Run ``architect list-playbooks`` to see the catalog."
    }
}

switch ($Command) {
    'init'           { Invoke-Init }
    'new'            { Invoke-New }
    'list-playbooks' { Invoke-ListPlaybooks }
    'help'           { Show-Usage }
    '--help'         { Show-Usage }
    '-h'             { Show-Usage }
    default          { Show-Usage }
}
