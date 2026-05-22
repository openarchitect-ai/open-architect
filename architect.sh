#!/usr/bin/env bash
# Repo-root delegator — forwards to the real CLI at .architect/cli/architect.sh
exec "$(dirname "$0")/.architect/cli/architect.sh" "$@"
