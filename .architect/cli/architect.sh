#!/usr/bin/env bash
# Open Architect CLI — initialize a workspace and scaffold projects from playbooks.
#
# Commands:
#   init                                      Create the workspace/ folder and drop a README.
#   new <project-name> [--playbook <name>]    Scaffold workspace/<project-name>/ with project-config.yaml,
#                                              notes.md, architect-work/, and docs/.
#   list-playbooks                            List available playbooks under .architect/playbooks/.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
WORKSPACE_DIR="$REPO_ROOT/workspace"
PLAYBOOKS_DIR="$REPO_ROOT/.architect/playbooks"
TEMPLATES_DIR="$SCRIPT_DIR/templates"

usage() {
  cat <<'EOF'
Usage: architect <command> [args]

Commands:
  init                                      Initialize the workspace/ folder.
  new <project-name> [--playbook <name>]    Scaffold a new project under workspace/<project-name>/.
  list-playbooks                            Show available playbooks.

Examples:
  architect init
  architect new customer-platform --playbook quick-solution-design
  architect new acme-acquisition -p acquisition-due-diligence

The CLI never overwrites existing project content. Use a different name if a project already exists.
EOF
}

cmd_init() {
  mkdir -p "$WORKSPACE_DIR"
  local readme_source="$TEMPLATES_DIR/workspace-README.md"
  if [[ ! -f "$readme_source" ]]; then
    echo "Error: template not found at $readme_source" >&2
    exit 1
  fi
  cp "$readme_source" "$WORKSPACE_DIR/README.md"
  echo "✅ Workspace initialized at $WORKSPACE_DIR"
}

cmd_list_playbooks() {
  if [[ ! -d "$PLAYBOOKS_DIR" ]]; then
    echo "Error: playbooks folder not found at $PLAYBOOKS_DIR" >&2
    exit 1
  fi
  echo "Available playbooks:"
  find "$PLAYBOOKS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort | sed 's/^/  - /'
}

cmd_new() {
  local project_name=""
  local playbook=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --playbook|-p) playbook="${2:-}"; shift 2 ;;
      --) shift; break ;;
      -*) echo "Unknown flag: $1" >&2; usage; exit 1 ;;
      *)
        if [[ -z "$project_name" ]]; then
          project_name="$1"
        fi
        shift
        ;;
    esac
  done

  if [[ -z "$project_name" ]]; then
    echo "Error: project name required." >&2
    usage
    exit 1
  fi

  if [[ ! -d "$WORKSPACE_DIR" ]]; then
    cmd_init
  fi

  local project_dir="$WORKSPACE_DIR/$project_name"
  if [[ -d "$project_dir" ]]; then
    echo "Error: project '$project_name' already exists at $project_dir" >&2
    exit 1
  fi

  mkdir -p "$project_dir/docs" "$project_dir/architect-work"

  if [[ -d "$TEMPLATES_DIR/architect-work" ]]; then
    cp -r "$TEMPLATES_DIR/architect-work/." "$project_dir/architect-work/"
  fi

  if [[ -f "$TEMPLATES_DIR/project-notes.md" ]]; then
    cp "$TEMPLATES_DIR/project-notes.md" "$project_dir/notes.md"
  fi

  if [[ -n "$playbook" ]]; then
    local playbook_config="$PLAYBOOKS_DIR/$playbook/project-config.yaml"
    if [[ -f "$playbook_config" ]]; then
      cp "$playbook_config" "$project_dir/project-config.yaml"
      echo "✅ Project '$project_name' created with playbook '$playbook' at $project_dir"
      echo ""
      echo "Next:"
      echo "  1. Open $project_dir"
      echo "  2. Read .architect/playbooks/$playbook/playbook.md"
      echo "  3. Follow the playbook's First Working Session steps"
    else
      echo "Warning: playbook '$playbook' not found at $playbook_config" >&2
      echo "Available playbooks:" >&2
      find "$PLAYBOOKS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort | sed 's/^/  - /' >&2
      echo "" >&2
      echo "Project '$project_name' was still created at $project_dir but without project-config.yaml." >&2
    fi
  else
    echo "✅ Project '$project_name' created at $project_dir"
    echo ""
    echo "Tip: pick a playbook from .architect/playbooks/ and copy its project-config.yaml,"
    echo "or re-run with --playbook <name>. Run \`architect list-playbooks\` to see the catalog."
  fi
}

case "${1:-}" in
  init)            cmd_init ;;
  new)             shift; cmd_new "$@" ;;
  list-playbooks)  cmd_list_playbooks ;;
  -h|--help|help|"") usage ;;
  *)               echo "Unknown command: $1" >&2; usage; exit 1 ;;
esac
