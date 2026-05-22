# Workspace

This folder is where the architect's actual project work lives. Each
project is its own subfolder, owned by the architect, separate from the
capability library at [`../.architect/`](../.architect/README.md).

The workspace itself is created and populated by the `architect` CLI
(see [`../.architect/cli/`](../.architect/cli/README.md)). Project content
is gitignored by default — the contents of this folder are yours.

## Project Folder Shape

Each project subfolder typically contains (paths shown from the repo root):

```text
workspace/<project-name>/
  project-config.yaml         ← chosen playbook + tailoring (clone from .architect/playbooks/<name>/)
  notes.md                    ← short project context and assignment framing
  architect-work/             ← architect-owned working notes
    open-questions.md
    answers-and-confirmations.md
    evidence-requests.md
    architect-task-list.md
  docs/                       ← source material and evidence
  business/                   ← business architecture artifacts
  application/                ← application architecture artifacts
  data/                       ← data architecture artifacts
  technology/                 ← technology architecture artifacts
  governance/                 ← governance artifacts (decisions, principles, compliance, risk)
  change/                     ← change artifacts (transitions, work packages, roadmap, gaps)
  views/                      ← diagrams and visual views
```

Light starts can omit the artifact folders and use just `docs/`,
`architect-work/`, `notes.md`, and the `project-config.yaml` — the
playbook's first-working-session guidance picks the right order.

## Starting A Project

The fastest path is the `architect` CLI — **run from the repo root**
(one level above this README):

```bash
# PowerShell
./architect.ps1 new <project-name> -Playbook <playbook-name>

# Bash
./architect.sh new <project-name> --playbook <playbook-name>
```

That scaffolds the project folder with `project-config.yaml`, `notes.md`,
`architect-work/`, and `docs/` already populated.

Manual path (if you prefer):

1. Pick a playbook from [`../.architect/playbooks/`](../.architect/playbooks/README.md).
2. Create a folder here: `workspace/<your-project-name>/`.
3. Copy the playbook's `project-config.yaml` from `../.architect/playbooks/<playbook-name>/project-config.yaml` into the new project folder.
4. Add `notes.md` with one-paragraph framing.
5. Create `architect-work/` with the recommended files.
6. Add `docs/` and drop in source material.
7. Follow the playbook's *First Working Session* steps.

Detail: [`../.architect/config/starter-project.md`](../.architect/config/starter-project.md).

## Worked Examples

Reference projects shipped with the tool live at
[`../.architect/examples/`](../.architect/examples/). They use the same
project shape and demonstrate how playbooks unfold in real situations.

## Why Workspace Lives Here

`.architect/` is the **capability library** — templates, playbooks,
patterns, skills, guidance, method, compliance. `workspace/` is **where
the work happens**. Keeping them as siblings means the work doesn't get
buried inside the tool, and multiple projects sit naturally side by side.

This mirrors the convention used by tools like `.git/` and `.vscode/` —
the dotfolder is the capability, not the workspace itself.
