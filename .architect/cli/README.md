# Open Architect CLI

A small, zero-dependency CLI for initializing the workspace and
scaffolding new projects from playbooks.

The CLI is intentionally minimal — just enough to remove copy-paste
friction. Anything richer (listing projects, running `gap-radar`,
verifying state) can be added later when real use surfaces the need.

## Commands

### `architect init`

Creates the `workspace/` folder at the repo root and drops a README
inside that explains the per-project shape.

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

```bash
./architect.sh new customer-platform --playbook quick-solution-design
./architect.ps1 new customer-platform -Playbook quick-solution-design
```

PowerShell also accepts the short alias `-p`:

```powershell
./architect.ps1 new acme-acquisition -p acquisition-due-diligence
```

### `architect list-playbooks`

Lists the available playbooks under `.architect/playbooks/`.

```bash
./architect.sh list-playbooks
```

## Picking a playbook

Available playbooks live under
[`../playbooks/`](../playbooks/README.md). Pick one that matches your
engagement shape from the catalog. The family overview at the top of
that README is the fastest way to narrow down.

If you skip `--playbook`, the project folder is created but without a
`project-config.yaml`. You can copy one in from a playbook later.

## Implementation

Two parallel implementations, no install or runtime dependency:

- `architect.ps1` — PowerShell (Windows native, or anywhere with `pwsh`)
- `architect.sh` — Bash (Linux, macOS, Git Bash on Windows, WSL)

Both invoke the same logic and produce the same output. Pick whichever
fits your shell. Repo-root delegators (`/architect.ps1` and
`/architect.sh`) forward to these so the CLI can be invoked from the
repo root without a path prefix.

## Templates

The CLI emits files from
[`templates/`](./templates/). These are the canonical starter shapes:

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
  folder, so any new playbook becomes immediately usable via `--playbook`.

## When to expand the CLI

Add commands only when real use exposes the friction. Candidates worth
considering later:

- `architect status` — show which projects exist, their playbooks, and
  staleness signals
- `architect gap-radar <project>` — run the gap-radar checks against a
  project
- `architect project-recap <project>` — produce a project-recap report
- `architect validate <project>` — invoke the existing validators
- `architect playbook info <playbook>` — print a playbook's overview
- `architect upgrade-config <project>` — pull in changes from a
  playbook's `project-config.yaml` while preserving local tailoring

Don't add these speculatively — wait for the pattern to assert itself
through real use.
