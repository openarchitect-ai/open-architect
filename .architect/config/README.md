# Config

This folder contains configuration guidance for the Open Architect workspace.

Use it for content that explains how agent-facing or workspace-facing
configuration should be structured and maintained.

## Purpose

Use this folder when you want to decide how heavy or light a project setup
should be before any modeling starts.

The default direction is now:

- architect-led
- source-first
- inventory before modeling
- no runtime state unless explicitly enabled
- no required YAML artifacts up front

## Recommended Files

- `agent.config.md`
- `cheat-sheet.md`
- `starter-project.md`
- `prompt-recipes.md`
- `worked-examples.md`
- `presets/`

## Recommended Starting Point

For most new projects:

1. create a small project folder under `.architect/architecture/`
2. add a `docs/` folder for uploaded source material
3. optionally add a short `notes.md` with business context
4. stay in `inventory` or `analysis` mode first
5. create architecture artifacts only when you explicitly want them

## Runtime Guidance

Do not use `.architect/runtime/` by default.

Use runtime state only when the project explicitly wants:

- coordinator-led routing
- queue state
- handoffs
- review gates

If the project is just using the workspace as an architect assistant, the
runtime files should stay in their neutral template state.

## Where To Go Next

- [agent.config.md](./agent.config.md)
  Main guidance for project config, operating style, runtime mode, and approval thresholds.
- [cheat-sheet.md](./cheat-sheet.md)
  Fast reference for modes, defaults, and prompt habits.
- [starter-project.md](./starter-project.md)
  Lightweight project setup for architect-led work.
- [prompt-recipes.md](./prompt-recipes.md)
  Practical prompts for inventory, analysis, review, and modeling tasks.
- [worked-examples.md](./worked-examples.md)
  Example ways to use the workspace for common architecture tasks.
- `presets/`
  Example `project-config.yaml` variants for lighter-weight project types.
