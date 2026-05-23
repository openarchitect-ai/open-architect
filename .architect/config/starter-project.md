# Starter Project

This guide describes the lightest useful way to start a new architecture
project in Open Architect.

## Goal

Make it easy to begin with source material and architectural thinking, without
forcing runtime orchestration or early artifact creation.

## Minimal Folder Shape

```text
workspace/<project-name>/
  docs/
  architect-work/  # optional but recommended
  notes.md          # optional
```

That is enough to begin, and `architect-work/` is the best place to capture the
answers and evidence that come back as discovery progresses.

## What To Put In `docs/`

Use `docs/` for uploaded or copied source material such as:

- application inventories
- interface exports
- spreadsheets
- process notes
- workshop notes
- diagrams
- vendor or platform documents

Treat those files as evidence, not as approved architecture facts.

## Optional `notes.md`

If you already know the context, keep it short.

Good contents:

- business goal
- current problem
- likely in-scope systems
- known stakeholders
- known constraints
- questions you want the agent to help answer

## Recommended `architect-work/` Folder

Use `architect-work/` as the architect-owned working area inside the project.

Recommended contents:

- `open-questions.md`
  Questions that still need answers from stakeholders, delivery teams, or vendors.
- `answers-and-confirmations.md`
  Confirmed answers, clarifications, and decisions you have received.
- `evidence-requests.md`
  Missing inputs you need such as API specs, file samples, mappings, or ownership details.
- `architect-task-list.md`
  Your practical follow-up tasks from each working session.
- `working-log.md`
  Chronological, plain-language record of what happened on the project — what skills ran, what scope or playbook changes landed, what was confirmed. Newest entry on top.
- `change-register.md`
  Sponsor-readable log of requirement and scope changes — what was added, modified, removed, or superseded, with impact and decision-threshold notes. Newest entry on top.

You do not have to fill them all immediately, but creating the files early
usually makes the project feel more tangible and easier to maintain.

Use this folder when you want one place to capture:

- what still needs to be asked
- what has now been confirmed
- what evidence is still missing
- what the architect needs to do next

This keeps follow-up work local to the project without forcing early YAML
artifacts or runtime state.

## What You Do Not Need Up Front

You do not need, on day one:

- runtime state
- agent queue entries
- review gates
- YAML artifacts
- decisions
- stakeholder files
- compliance assessments

Those should come later only if they are useful.

## Recommended Starting Mode

Start in:

1. `inventory`
2. `analysis`
3. `modeling` only when explicitly requested

## Recommended First Tasks

Useful first asks:

- extract the applications in these source files
- list the interfaces touching system X
- group these interfaces into migration clusters
- identify the top dependencies and unknowns
- recommend 3 candidate Wave 1 scope cuts

## When To Create Artifacts

Create architecture artifacts only when:

- the source facts are good enough
- the scope is bounded enough
- you explicitly want durable project assets

Good trigger phrases:

- `create the minimum architecture artifacts for this scope`
- `turn this into project assets`
- `create a draft transition-architecture set`

## Runtime Rule

Leave `.architect/runtime/` alone unless you explicitly want:

- coordinator-led execution
- queued tasks
- handoffs
- review-gate tracking

For normal architect-assist work, runtime state should stay neutral.
