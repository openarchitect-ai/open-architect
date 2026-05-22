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
    status)
      cat <<'EOF'
Usage: architect status [project-name]

  Show a portfolio status across projects in workspace/, or a deep view
  of a single project. Reads project-config.yaml, working-log.md, and
  the architect-work/ files to surface per project:

    - playbook in use
    - last activity (latest working-log entry: date + title)
    - biggest signal (from the latest log entry's 'Biggest signal:' section)
    - active blockers (any '- 🚫 ...' bullets across architect-work/)
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
  status [project-name]                     Show a richer per-project status (last activity, counts, latest log).
  playbook <name>                           Print key sections of a playbook's brief.
  --version                                 Show the Open Architect capability version.
  --help [command]                          Show this help, or help for a specific command.

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

format_wrap() {
  # word-wrap text at $2 columns, indenting each line with $3
  local text="$1"
  local width="${2:-62}"
  local indent="${3:-    }"
  echo "$text" | awk -v width="$width" -v indent="$indent" '
    BEGIN { line = "" }
    {
      n = split($0, words, /[[:space:]]+/)
      for (i = 1; i <= n; i++) {
        w = words[i]
        if (w == "") continue
        if (line == "") {
          line = indent w
        } else if (length(line) + 1 + length(w) <= width) {
          line = line " " w
        } else {
          print line
          line = indent w
        }
      }
    }
    END { if (line != "") print line }
  '
}

get_latest_log_signal() {
  local log_file="$1"
  if [[ ! -f "$log_file" ]]; then return; fi
  awk '
    BEGIN { entry = 0; capture = 0; out = "" }
    /^##[[:space:]]+[0-9]{4}-[0-9]{2}-[0-9]{2}/ {
      if (entry) exit
      entry = 1
      next
    }
    entry == 0 { next }
    /^##[[:space:]]/ { exit }
    /^Biggest signal[[:space:]]*:/ {
      capture = 1
      rest = $0
      sub(/^Biggest signal[[:space:]]*:[[:space:]]*/, "", rest)
      if (rest != "") out = out " " rest
      next
    }
    capture == 1 {
      if ($0 ~ /^(What I did|What I found|See also)[[:space:]]*:/) exit
      if ($0 ~ /^[[:space:]]*$/) {
        if (out != "") exit
        next
      }
      line = $0
      sub(/^[[:space:]]*-[[:space:]]+/, "", line)
      sub(/[[:space:]]+$/, "", line)
      out = out " " line
    }
    END {
      sub(/^[[:space:]]+/, "", out)
      # strip markdown bold and links for cleaner display
      while (match(out, /\*\*[^*]+\*\*/)) {
        before = substr(out, 1, RSTART - 1)
        match_text = substr(out, RSTART, RLENGTH)
        after = substr(out, RSTART + RLENGTH)
        inner = substr(match_text, 3, RLENGTH - 4)
        out = before inner after
      }
      while (match(out, /\[[^]]+\]\([^)]+\)/)) {
        before = substr(out, 1, RSTART - 1)
        match_text = substr(out, RSTART, RLENGTH)
        after = substr(out, RSTART + RLENGTH)
        close_bracket = index(match_text, "]")
        label = substr(match_text, 2, close_bracket - 2)
        out = before label after
      }
      print out
    }
  ' "$log_file"
}

get_blockers() {
  local proj_dir="$1"
  local aw_dir="$proj_dir/architect-work"
  if [[ ! -d "$aw_dir" ]]; then return; fi
  local files=("open-questions.md" "architect-task-list.md" "answers-and-confirmations.md" "evidence-requests.md")
  # The blocker glyph is the prohibited sign U+1F6AB (UTF-8 bytes E2 9B 94? no, E2 9D...).
  # Use the literal in a bash script — bash source is UTF-8 and grep handles it.
  local glyph
  glyph=$'\xf0\x9f\x9a\xab'   # UTF-8 bytes for U+1F6AB (🚫)
  for f in "${files[@]}"; do
    local path="$aw_dir/$f"
    [[ ! -f "$path" ]] && continue
    while IFS= read -r line; do
      # Extract content after "- 🚫 "
      content="${line#*$glyph }"
      # Strip markdown bold/links
      content="$(echo "$content" | sed -E 's/\*\*([^*]+)\*\*/\1/g; s/\[([^]]+)\]\([^)]+\)/\1/g')"
      # Trim
      content="$(echo "$content" | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//')"
      # Truncate at word boundary near 110 chars
      if (( ${#content} > 110 )); then
        cut="${content:0:107}"
        # back off to last space
        cut="${cut% *}"
        content="$cut..."
      fi
      printf '%s\n' "$content"
    done < <(grep -E "^[[:space:]]*-[[:space:]]+${glyph}[[:space:]]+" "$path" 2>/dev/null || true)
  done
}

get_next_immediate_tasks() {
  local task_file="$1"
  local count="${2:-3}"
  if [[ ! -f "$task_file" ]]; then return; fi
  awk -v limit="$count" '
    BEGIN { in_imm = 0; sub_sec = ""; emitted = 0 }
    /^## / {
      sect = $0
      sub(/^##[[:space:]]+/, "", sect)
      sub(/[[:space:]]+$/, "", sect)
      in_imm = (sect == "Immediate" ? 1 : 0)
      sub_sec = ""
      next
    }
    in_imm == 0 { next }
    /^### / {
      sub_sec = $0
      sub(/^###[[:space:]]+/, "", sub_sec)
      sub(/[[:space:]]*\([^)]+\)[[:space:]]*$/, "", sub_sec)
      sub(/[[:space:]]+$/, "", sub_sec)
      next
    }
    /^[[:space:]]*-[[:space:]]+/ {
      content = $0
      sub(/^[[:space:]]*-[[:space:]]+/, "", content)
      # strip leading non-ASCII emoji + whitespace
      while (substr(content, 1, 1) != "" && substr(content, 1, 1) ~ /[^\x20-\x7e]/) {
        content = substr(content, 2)
      }
      sub(/^[[:space:]]+/, "", content)
      if (content == "" || content == "...") next
      # Strip markdown bold and links
      while (match(content, /\*\*[^*]+\*\*/)) {
        before = substr(content, 1, RSTART - 1)
        m = substr(content, RSTART, RLENGTH)
        after = substr(content, RSTART + RLENGTH)
        content = before substr(m, 3, RLENGTH - 4) after
      }
      while (match(content, /\[[^]]+\]\([^)]+\)/)) {
        before = substr(content, 1, RSTART - 1)
        m = substr(content, RSTART, RLENGTH)
        after = substr(content, RSTART + RLENGTH)
        close_bracket = index(m, "]")
        content = before substr(m, 2, close_bracket - 2) after
      }
      # Truncate at word boundary near 100 chars
      if (length(content) > 100) {
        cut = substr(content, 1, 97)
        space_pos = 0
        for (i = length(cut); i > 50; i--) {
          if (substr(cut, i, 1) == " ") { space_pos = i; break }
        }
        if (space_pos > 0) cut = substr(cut, 1, space_pos - 1)
        content = cut "..."
      }
      printf "%s\t%s\n", sub_sec, content
      emitted++
      if (emitted >= limit) exit
    }
  ' "$task_file"
}

count_non_placeholder_bullets() {
  local file="$1"
  local include="${2:-}"
  local exclude="${3:-Update Log}"
  if [[ ! -f "$file" ]]; then echo 0; return; fi
  awk -v inc="$include" -v exc="$exclude" '
    BEGIN { active = (inc == "" ? 1 : 0) }
    /^## / {
      sect = $0
      sub(/^##[[:space:]]+/, "", sect)
      sub(/[[:space:]]+$/, "", sect)
      if (inc != "") active = (sect == inc ? 1 : 0)
      if (exc != "" && sect == exc) active = 0
      next
    }
    active && /^[[:space:]]*[-*][[:space:]]+/ {
      content = $0
      sub(/^[[:space:]]*[-*][[:space:]]+/, "", content)
      sub(/[[:space:]]+$/, "", content)
      if (content != "..." && content != "") count++
    }
    END { print count + 0 }
  ' "$file"
}

get_project_playbook() {
  local config="$1"
  if [[ ! -f "$config" ]]; then echo "(no project-config.yaml)"; return; fi
  local line
  line="$(grep -E '^[[:space:]]*playbook:[[:space:]]*[^[:space:]]' "$config" 2>/dev/null | head -1 || true)"
  if [[ -z "$line" ]]; then echo "(no playbook set)"; return; fi
  local val
  val="$(echo "$line" | sed -E 's/^[[:space:]]*playbook:[[:space:]]*//' | awk '{print $1}')"
  [[ -z "$val" ]] && val='(no playbook set)'
  echo "$val"
}

get_project_last_touched() {
  local dir="$1"
  if [[ ! -d "$dir" ]]; then echo ""; return; fi
  local newest
  newest="$(find "$dir" -type f -printf '%T@\n' 2>/dev/null | sort -nr | head -1 || true)"
  if [[ -z "$newest" ]]; then echo ""; return; fi
  date -d "@${newest%.*}" +%Y-%m-%d 2>/dev/null || echo ""
}

get_latest_log_entry() {
  local log_file="$1"
  if [[ ! -f "$log_file" ]]; then return; fi
  awk '
    /^##[[:space:]]+[0-9]{4}-[0-9]{2}-[0-9]{2}/ {
      line = $0
      date_token = ""
      title = ""
      if (match(line, /[0-9]{4}-[0-9]{2}-[0-9]{2}/)) {
        date_token = substr(line, RSTART, RLENGTH)
        title = substr(line, RSTART + RLENGTH)
      }
      # Strip leading separator(s): whitespace, hyphen, en-dash, em-dash, etc.
      # Multi-byte separators (em-dash is 3 bytes in UTF-8) are stripped by
      # consuming all leading non-alphanumeric, non-backtick bytes.
      sub(/^[^A-Za-z0-9`]+/, "", title)
      sub(/[[:space:]]+$/, "", title)
      print date_token "|" title
      exit
    }
  ' "$log_file"
}

show_project_status_block() {
  local proj_name="$1"
  local proj_dir="$WORKSPACE_DIR/$proj_name"
  local playbook
  playbook="$(get_project_playbook "$proj_dir/project-config.yaml")"
  local last_touched
  last_touched="$(get_project_last_touched "$proj_dir")"

  local log_entry
  log_entry="$(get_latest_log_entry "$proj_dir/architect-work/working-log.md")"

  local rule="----------------------------------------------------------------------"
  local blocker_glyph=$'\xf0\x9f\x9a\xab'   # 🚫 (U+1F6AB) — UTF-8 bytes
  local bullet=$'\xe2\x80\xa2'              # • (U+2022)
  local dot_sep=$'\xc2\xb7'                 # · (U+00B7)

  echo "$rule"
  echo "$proj_name  [$playbook]"
  echo ""

  if [[ -n "$log_entry" ]]; then
    local log_date="${log_entry%%|*}"
    local log_title="${log_entry#*|}"
    echo "  Last activity: $log_date — $log_title"
  else
    if [[ -n "$last_touched" ]]; then
      echo "  Last touched:  $last_touched  (no working-log entries yet)"
    else
      echo "  Last touched:  (no files yet)"
    fi
  fi

  # Biggest signal from latest log entry
  local signal
  signal="$(get_latest_log_signal "$proj_dir/architect-work/working-log.md")"
  if [[ -n "$signal" ]]; then
    echo ""
    echo "  Biggest signal:"
    format_wrap "$signal" 64 "    "
  fi

  # Blockers
  local blockers
  blockers="$(get_blockers "$proj_dir")"
  if [[ -n "$blockers" ]]; then
    local blocker_count
    blocker_count="$(echo "$blockers" | wc -l)"
    echo ""
    echo "  ${blocker_glyph} Blockers (${blocker_count}):"
    local first_line
    while IFS= read -r b; do
      first_line=1
      while IFS= read -r wrapped; do
        if [[ -n "$first_line" ]]; then
          # Replace leading spaces with bullet prefix
          printf '    %s %s\n' "$bullet" "${wrapped#      }"
          first_line=''
        else
          echo "$wrapped"
        fi
      done < <(format_wrap "$b" 62 "      ")
    done <<< "$blockers"
  fi

  # Next 3 immediate tasks
  local tasks
  tasks="$(get_next_immediate_tasks "$proj_dir/architect-work/architect-task-list.md" 3)"
  if [[ -n "$tasks" ]]; then
    local task_count
    task_count="$(echo "$tasks" | wc -l)"
    echo ""
    echo "  Next $task_count immediate tasks:"
    local idx=1
    local first_line
    while IFS=$'\t' read -r sub_sec content; do
      local combined
      if [[ -n "$sub_sec" ]]; then
        combined="${sub_sec}: ${content}"
      else
        combined="$content"
      fi
      first_line=1
      while IFS= read -r wrapped; do
        if [[ -n "$first_line" ]]; then
          printf '    %d. %s\n' "$idx" "${wrapped#       }"
          first_line=''
        else
          echo "$wrapped"
        fi
      done < <(format_wrap "$combined" 62 "       ")
      ((idx++))
    done <<< "$tasks"
  fi

  local oq im ev
  oq="$(count_non_placeholder_bullets "$proj_dir/architect-work/open-questions.md" "")"
  im="$(count_non_placeholder_bullets "$proj_dir/architect-work/architect-task-list.md" "Immediate" "")"
  ev="$(count_non_placeholder_bullets "$proj_dir/architect-work/evidence-requests.md" "Still Missing" "")"
  echo ""
  echo "  Totals: ${oq} open questions ${dot_sep} ${im} immediate ${dot_sep} ${ev} evidence requests"
}

cmd_status() {
  if [[ ! -d "$WORKSPACE_DIR" ]]; then
    echo "No workspace yet. Run \`architect init\` to create it."
    return
  fi
  local name="${1:-}"
  if [[ -n "$name" ]]; then
    local proj_dir="$WORKSPACE_DIR/$name"
    if [[ ! -d "$proj_dir" ]]; then
      echo "Warning: project '$name' not found in workspace/." >&2
      echo "Run \`architect list-projects\` to see available projects." >&2
      return
    fi
    show_project_status_block "$name"
    echo "----------------------------------------------------------------------"
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

  echo "Open Architect ${OA_VERSION} — portfolio status"
  echo ""
  for p in "${projects[@]}"; do
    show_project_status_block "$p"
    echo ""
  done
  echo "----------------------------------------------------------------------"
  echo "Total: ${#projects[@]} project(s)"
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
  status)          shift; cmd_status "${1:-}" ;;
  playbook)        shift; cmd_playbook "${1:-}" ;;
  version|--version|-v) echo "Open Architect ${OA_VERSION}" ;;
  help|--help|-h)  shift || true; usage "${1:-}" ;;
  "")              usage ;;
  *)               echo "Unknown command: $1" >&2; usage; exit 1 ;;
esac
