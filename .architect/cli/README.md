# Open Architect CLI

A small, zero-dependency CLI for initializing the workspace, scaffolding
new projects from playbooks, and inspecting the playbook catalog.

The CLI is intentionally minimal — just enough to remove copy-paste
friction. Anything richer (status reporting, gap-radar invocation, config
upgrade) can be added later when real use surfaces the need.

## Version

The CLI does not maintain its own version. `architect --version` reports
the **Open Architect capability version** read from
[`../VERSION`](../VERSION) — the single source of truth. The changelog
lives at [`../CHANGELOG.md`](../CHANGELOG.md).

## Commands

### `architect init`

Creates the `workspace/` folder at the repo root and drops a README
inside that explains the per-project shape. Safe to re-run — the README
is overwritten with the latest template.

```bash
./architect.sh init       # Bash
./architect.ps1 init      # PowerShell
```

### `architect new <project-name> [--playbook <playbook-name>]`

Scaffolds a new project at `workspace/<project-name>/` with:

- `project-config.yaml` (from the named playbook, if specified)
- `notes.md` (seed file with framing prompts)
- `architect-work/` (with the four standard files: open-questions, answers-and-confirmations, evidence-requests, architect-task-list)
- `docs/` (empty — drop your source material here)

If the workspace folder doesn't exist yet, the CLI initializes it first.
If the playbook name is misspelled, the CLI suggests a closest-match
based on substring similarity.

```bash
./architect.sh new customer-platform --playbook quick-solution-design
./architect.ps1 new customer-platform -Playbook quick-solution-design
```

PowerShell also accepts the short alias `-p`:

```powershell
./architect.ps1 new acme-acquisition -p acquisition-due-diligence
```

### `architect list-playbooks`

Lists the available playbooks under `.architect/playbooks/` with a
one-line description per playbook (parsed from each playbook's
*Output emphasis* line).

```bash
./architect.sh list-playbooks
```

### `architect list-projects`

Lists projects currently in `workspace/`, showing each project's chosen
playbook (read from `project-config.yaml`). Minimal — one line per
project.

```bash
./architect.sh list-projects
```

### `architect status [project-name]`

Richer per-project status summary. Reads `project-config.yaml`,
`architect-work/working-log.md`, and the topical `architect-work/`
files. Per project, an actively-worked block shows:

- playbook in use
- **last activity** — date + title of the latest `working-log.md` entry
- **biggest signal** — captured from the latest log entry's
  `Biggest signal:` section
- **active blockers** — any `- 🚫 ...` bullets found across the four
  topical architect-work files
- **next 3 immediate tasks** — top bullets from the
  `## Immediate` section of `architect-task-list.md`, prefixed with
  their sub-section (`Ask:` / `Confirm:` / `Request:` / `Decide:`)
- **totals** — open-question / immediate-task / evidence-still-missing
  counts

Empty / sparse projects skip the enrichment and show only last-touched
date and totals — keeping output compact.

With no argument: portfolio view (block per project). With a project
name: deep view of one project. Use this when `list-projects` is too
thin.

```bash
./architect.sh status
./architect.sh status my-project
```

### `architect playbook <playbook-name>`

Prints key sections from a playbook's brief — *Engagement Shape*,
*When To Use*, *When Not To Use*, and *First Working Session* — as a
quick reference before scaffolding.

If the playbook name is misspelled, suggests a closest-match.

```bash
./architect.sh playbook quick-solution-design
./architect.ps1 playbook quick-solution-design
```

### `architect --version` (PowerShell: `-Version`)

Prints the Open Architect capability version (read from
`.architect/VERSION`). Output shape: `Open Architect 0.1.0`.

### `architect --help [command]` (PowerShell: `-Help [command]`)

Shows top-level usage, or detailed help for a specific command.

```bash
./architect.sh --help new
./architect.ps1 -Help new
```

## Picking a playbook

Available playbooks live under
[`../playbooks/`](../playbooks/README.md). Pick one that matches your
engagement shape from the catalog. The family overview at the top of
that README is the fastest way to narrow down.

Quick path: run `architect list-playbooks` to see one-liners. Then run
`architect playbook <name>` to see When-to-Use / When-not-to-Use /
First-Working-Session before scaffolding.

## Implementation

Two parallel implementations, no install or runtime dependency:

- `architect.ps1` — PowerShell (Windows native, or anywhere with `pwsh`)
- `architect.sh` — Bash (Linux, macOS, Git Bash on Windows, WSL)

Both invoke the same logic and produce the same output. Pick whichever
fits your shell. Repo-root delegators (`/architect.ps1` and
`/architect.sh`) forward to these so the CLI can be invoked from the
repo root without a path prefix.

### Encoding note

The PowerShell version uses ASCII characters (`->`, `[OK]`) in its own
output for cross-PowerShell-version reliability. PowerShell 5.x without
a BOM-marked script file reads non-ASCII script literals as
Windows-1252, which garbles emoji. The Bash version uses the original
Unicode characters (`→`, `✅`) since Bash and most terminals handle
UTF-8 source files correctly.

Markdown files (playbook briefs, descriptions) are read as UTF-8 in both
versions, so their content always renders with original characters.

## Templates

The CLI emits files from [`templates/`](./templates/). These are the
canonical starter shapes:

- `workspace-README.md` — emitted on `architect init`
- `project-notes.md` — emitted on `architect new`
- `architect-work/` — four starter files emitted on `architect new`

Edit the templates here to change what gets scaffolded. Existing project
folders are never overwritten — name collisions are rejected.

## Design notes

- **Zero install, zero runtime dependency.** Cross-platform shell
  scripts only.
- **Never overwrites existing project content.** Name collisions are
  rejected. The architect's work is sacred.
- **`workspace/` is gitignored.** Project content is yours, not part of
  the OA capability library. The CLI creates the folder when needed; it
  is not shipped in the repo.
- **Playbook-aware.** The CLI references the live `.architect/playbooks/`
  folder, so any new playbook becomes immediately usable via `--playbook`
  / `playbook <name>` / `list-playbooks`.
- **Typo-tolerant.** Misspelled playbook names trigger suggestions
  based on substring matching.
- **Help is per-command.** `--help <command>` gives focused detail
  instead of a single long usage block.

## When to expand the CLI

Add commands only when real use exposes the friction. Candidates worth
considering later:

- `architect status [project]` — staleness signals, open-question count,
  config drift from the playbook
- `architect gap-radar <project>` — emit the prompt to invoke the
  gap-radar skill against a project
- `architect project-recap <project>` — same for project-recap
- `architect upgrade-config <project>` — pull updates from a playbook's
  `project-config.yaml` while preserving local tailoring
- `architect delete <project>` — safe delete with confirmation
- `architect doctor` — sanity-check the workspace and capability library
- `--dry-run` flag on `new`

Don't add these speculatively — wait for the pattern to assert itself
through real use.
