#!/usr/bin/env bash
# Open Architect CLI — initialize a workspace, scaffold projects from playbooks,
# inspect playbooks, and list projects.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
WORKSPACE_DIR="$REPO_ROOT/workspace"
PLAYBOOKS_DIR="$REPO_ROOT/.architect/playbooks"
TEMPLATES_DIR="$SCRIPT_DIR/templates"
VERSION_FILE="$REPO_ROOT/.architect/VERSION"

# Read the capability version from .architect/VERSION (single source of truth).
if [[ -f "$VERSION_FILE" ]]; then
  OA_VERSION="$(head -1 "$VERSION_FILE" | tr -d '[:space:]')"
  [[ -z "$OA_VERSION" ]] && OA_VERSION='unknown'
else
  OA_VERSION='unknown'
fi

usage() {
  local for_command="${1:-}"

  case "$for_command" in
    init)
      cat <<'EOF'
Usage: architect init

  Creates the workspace/ folder at the repo root and drops a README inside.
  Safe to re-run — the README is overwritten with the latest template.

Example:
  architect init
EOF
      return
      ;;
    new)
      cat <<'EOF'
Usage: architect new <project-name> [--playbook <playbook-name>]

  Scaffolds workspace/<project-name>/ with:
    - project-config.yaml (from the named playbook, if specified)
    - notes.md (seed file)
    - architect-work/ with five standard files (incl. working-log)
    - docs/ (empty)

  If the workspace folder doesn't exist yet, it's initialized first.
  Never overwrites existing project content — name collisions are rejected.

Examples:
  architect new customer-platform --playbook quick-solution-design
  architect new acme-acquisition -p acquisition-due-diligence
  architect new my-project        (no playbook; copy project-config.yaml later)
EOF
      return
      ;;
    list-playbooks)
      cat <<'EOF'
Usage: architect list-playbooks

  Lists all available playbooks with a one-line description of each.

Example:
  architect list-playbooks
EOF
      return
      ;;
    list-projects)
      cat <<'EOF'
Usage: architect list-projects

  Lists projects currently in workspace/, showing each project's chosen playbook.

Example:
  architect list-projects
EOF
      return
      ;;
    playbook)
      cat <<'EOF'
Usage: architect playbook <playbook-name>

  Prints key sections from a playbook's brief: Engagement Shape,
  When To Use, When Not To Use, and First Working Session.
  Use this as a quick reference before scaffolding.

Example:
  architect playbook quick-solution-design
EOF
      return
      ;;
  esac

  cat <<EOF
Open Architect ${OA_VERSION}

Usage: architect <command> [args]

Commands:
  init                                      Initialize the workspace/ folder.
  new <project-name> [--playbook <name>]    Scaffold a new project under workspace/<project-name>/.
  list-playbooks                            Show available playbooks with one-line descriptions.
  list-projects                             Show projects currently in workspace/ and their playbooks.
  playbook <name>                           Print key sections of a playbook's brief.
  --version                                 Show the Open Architect capability version.
  --help [command]                          Show this help, or help for a specific command.
Ho
Examples:
  architect init
  architect new customer-platform --playbook quick-solution-design
  architect list-playbooks
  architect playbook full-togaf-adm
  architect --help new

The CLI never overwrites existing project content. Use a different name if a project already exists.
EOF
}

get_playbook_description() {
  local playbook_name="$1"
  local playbook_md="$PLAYBOOKS_DIR/$playbook_name/playbook.md"
  if [[ ! -f "$playbook_md" ]]; then echo ""; return; fi
  grep -m1 '^- \*\*Output emphasis:\*\*' "$playbook_md" 2>/dev/null | sed 's/^- \*\*Output emphasis:\*\* //'
}

suggest_playbook() {
  local typed="${1:-}"
  if [[ -z "$typed" ]]; then return; fi
  local needle="$(echo "$typed" | tr '[:upper:]' '[:lower:]')"
  local matches=()
  while IFS= read -r name; do
    local hay="$(echo "$name" | tr '[:upper:]' '[:lower:]')"
    if [[ "$hay" == *"$needle"* ]] || [[ "$needle" == *"${hay%%-*}"* ]]; then
      matches+=("$name")
    fi
  done < <(find "$PLAYBOOKS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)
  printf '%s\n' "${matches[@]}"
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
  echo ""

  local max_len=0
  while IFS= read -r name; do
    if (( ${#name} > max_len )); then max_len=${#name}; fi
  done < <(find "$PLAYBOOKS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n')
  local pad=$((max_len + 2))

  while IFS= read -r name; do
    local desc
    desc="$(get_playbook_description "$name")"
    if [[ -n "$desc" ]]; then
      printf "  %-${pad}s → %s\n" "$name" "$desc"
    else
      printf "  %s\n" "$name"
    fi
  done < <(find "$PLAYBOOKS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)

  echo ""
  echo "Run \`architect playbook <name>\` to see a playbook's full brief."
}

cmd_list_projects() {
  if [[ ! -d "$WORKSPACE_DIR" ]]; then
    echo "No workspace yet. Run \`architect init\` to create it."
    return
  fi
  local projects=()
  while IFS= read -r dir; do
    projects+=("$dir")
  done < <(find "$WORKSPACE_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)

  if [[ ${#projects[@]} -eq 0 ]]; then
    echo "No projects in workspace/ yet."
    echo "Create one with: architect new <project-name> --playbook <playbook-name>"
    return
  fi

  echo "Projects in workspace/:"
  echo ""
  local max_len=0
  for p in "${projects[@]}"; do
    if (( ${#p} > max_len )); then max_len=${#p}; fi
  done
  local pad=$((max_len + 2))

  for p in "${projects[@]}"; do
    local config="$WORKSPACE_DIR/$p/project-config.yaml"
    local playbook_name='(no playbook set)'
    if [[ -f "$config" ]]; then
      local line
      line="$(grep -E '^\s*playbook:\s*\S' "$config" 2>/dev/null | head -1 || true)"
      if [[ -n "$line" ]]; then
        playbook_name="$(echo "$line" | sed -E 's/^\s*playbook:\s*//' | awk '{print $1}')"
        if [[ -z "$playbook_name" ]]; then playbook_name='(no playbook set)'; fi
      fi
    else
      playbook_name='(no project-config.yaml)'
    fi
    printf "  %-${pad}s [%s]\n" "$p" "$playbook_name"
  done
  echo ""
  echo "Total: ${#projects[@]}"
}

cmd_playbook() {
  local pb="${1:-}"
  if [[ -z "$pb" ]]; then
    echo "Error: playbook name required. Usage: architect playbook <playbook-name>" >&2
    exit 1
  fi
  local playbook_md="$PLAYBOOKS_DIR/$pb/playbook.md"
  if [[ ! -f "$playbook_md" ]]; then
    echo "Warning: playbook '$pb' not found." >&2
    local suggestions
    suggestions="$(suggest_playbook "$pb")"
    if [[ -n "$suggestions" ]]; then
      echo "Did you mean:" >&2
      while IFS= read -r s; do echo "  - $s" >&2; done <<< "$suggestions"
    else
      echo "Run \`architect list-playbooks\` to see available playbooks." >&2
    fi
    exit 1
  fi

  awk '
    /^# [^#]/ { print; print ""; next }
    /^## (Engagement Shape|When To Use|When Not To Use|First Working Session)$/ { in_section=1; print; next }
    /^## / { in_section=0 }
    in_section { print }
  ' "$playbook_md"
}

cmd_new() {
  local project_name=""
  local playbook=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --playbook|-p) playbook="${2:-}"; shift 2 ;;
      --) shift; break ;;
      -*) echo "Unknown flag: $1" >&2; usage new; exit 1 ;;
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
    usage new
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
      local suggestions
      suggestions="$(suggest_playbook "$playbook")"
      if [[ -n "$suggestions" ]]; then
        echo "Did you mean:" >&2
        while IFS= read -r s; do echo "  - $s" >&2; done <<< "$suggestions"
        echo "" >&2
      else
        echo "Available playbooks:" >&2
        find "$PLAYBOOKS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort | sed 's/^/  - /' >&2
        echo "" >&2
      fi
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
  list-projects)   cmd_list_projects ;;
  playbook)        shift; cmd_playbook "${1:-}" ;;
  version|--version|-v) echo "Open Architect ${OA_VERSION}" ;;
  help|--help|-h)  shift || true; usage "${1:-}" ;;
  "")              usage ;;
  *)               echo "Unknown command: $1" >&2; usage; exit 1 ;;
esac
