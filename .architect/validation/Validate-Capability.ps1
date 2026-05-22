#!/usr/bin/env pwsh
<#
.SYNOPSIS
  Validate-Capability: mechanical drift checker for the .architect/ library.

.DESCRIPTION
  Walks every markdown file under .architect/ (and AGENTS.md + root README.md)
  and verifies that each relative markdown link resolves to a file that exists.
  Implements the mechanical subset of the capability-radar checks documented in
  .architect/skills/capability-radar.md and the matching checklists at
  .architect/guidance/capability-radar-checklists.md.

  v1 covers internal markdown links only. Future versions will add:
    - skill "Read First" reference validation
    - playbook "Recommended Skill Sequence" validation
    - cross-document count consistency (playbook count, family list, etc.)
    - known-rename tracking (old path -> new path)

  Exit code: 0 if no broken links found, 1 otherwise. Suitable for use
  in pre-commit hooks or CI gates.

.EXAMPLE
  pwsh .architect/validation/Validate-Capability.ps1

.EXAMPLE
  ./architect.ps1 ...  # the CLI doesn't run this yet; invoke directly.
#>
param(
    [string]$Path = ''
)

$ErrorActionPreference = 'Stop'

# Force UTF-8 output so Unicode renders correctly on Windows consoles.
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch { }

$ScriptDir = $PSScriptRoot
$ArchitectRoot = (Get-Item $ScriptDir).Parent.FullName
$RepoRoot = (Get-Item $ArchitectRoot).Parent.FullName
if (-not $Path) { $Path = $ArchitectRoot }

# Include cross-cutting root files
$rootExtras = @(
    Join-Path $RepoRoot 'AGENTS.md'
    Join-Path $RepoRoot 'README.md'
) | Where-Object { Test-Path $_ }

$markdownFiles = @()
$markdownFiles += Get-ChildItem -Path $Path -Recurse -Filter '*.md' -File |
    Where-Object {
        # Skip CLI template files — their relative links resolve against
        # the emitted location (workspace/<project>/), not their storage
        # location under .architect/cli/templates/.
        $_.FullName -notmatch '[\\/]cli[\\/]templates[\\/]'
    }
$markdownFiles += $rootExtras | ForEach-Object { Get-Item $_ }

Write-Host "Validate-Capability: scanning $($markdownFiles.Count) markdown files under"
Write-Host "  $Path (+ AGENTS.md, root README.md)"
Write-Host ''

$issues = @()

# Capture [text](path) markdown links, excluding image syntax ![text](path).
$linkPattern = '(?<!!)\[([^\]]+)\]\(([^)]+)\)'

foreach ($file in $markdownFiles) {
    $content = Get-Content $file.FullName -Encoding UTF8
    $lineNumber = 0
    foreach ($line in $content) {
        $lineNumber++
        # Strip inline code spans `like-this` so example links inside
        # documentation about markdown don't get parsed as real links.
        $scanLine = $line -replace '`[^`]+`', ''
        foreach ($m in [regex]::Matches($scanLine, $linkPattern)) {
            $target = $m.Groups[2].Value.Trim()

            # Skip external URLs and special schemes
            if ($target -match '^(https?|mailto|ftp|tel):') { continue }
            # Skip pure anchors (same-file)
            if ($target -match '^#') { continue }

            # Strip trailing anchor fragment
            $pathPart = $target -replace '#.*$', ''
            if (-not $pathPart) { continue }

            # Decode URL-escaped chars (notably %20 for spaces in filenames)
            try {
                $pathPart = [Uri]::UnescapeDataString($pathPart)
            } catch {
                # leave as-is if decode fails
            }

            $resolved = $null
            try {
                $candidate = Join-Path $file.Directory.FullName $pathPart
                $resolved = [System.IO.Path]::GetFullPath($candidate)
            } catch {
                $issues += [PSCustomObject]@{
                    File   = $file.FullName.Substring($RepoRoot.Length + 1)
                    Line   = $lineNumber
                    Target = $target
                    Reason = 'invalid path'
                }
                continue
            }

            if (-not (Test-Path $resolved)) {
                $issues += [PSCustomObject]@{
                    File   = $file.FullName.Substring($RepoRoot.Length + 1)
                    Line   = $lineNumber
                    Target = $target
                    Reason = 'target does not exist'
                }
            }
        }
    }
}

if ($issues.Count -eq 0) {
    Write-Host "[OK] No broken links found across $($markdownFiles.Count) markdown files."
    exit 0
}

Write-Host "Found $($issues.Count) broken link(s):"
Write-Host ''

$grouped = $issues | Group-Object -Property File | Sort-Object Name
foreach ($g in $grouped) {
    Write-Host "  $($g.Name)"
    foreach ($i in $g.Group | Sort-Object Line) {
        Write-Host ("    line {0,4}  -> {1}  ({2})" -f $i.Line, $i.Target, $i.Reason)
    }
    Write-Host ''
}

Write-Host "Run capability-radar (skill) for the broader concept-level drift checks."
exit 1
