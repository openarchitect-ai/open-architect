#!/usr/bin/env pwsh
# Repo-root delegator — forwards to the real CLI at .architect/cli/architect.ps1
& "$PSScriptRoot\.architect\cli\architect.ps1" @args
exit $LASTEXITCODE
