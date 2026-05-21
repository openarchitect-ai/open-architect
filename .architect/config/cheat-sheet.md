# Cheat Sheet

This is the fastest way to remember how to use Open Architect in the
`architect-assist` model.

## Default Rules

- you are the primary driver
- start with source material
- prefer `inventory` before `analysis`
- prefer `analysis` before `modeling`
- do not create artifacts unless you explicitly want them
- ignore `runtime/` unless you want orchestration

## Modes

- `inventory`
  - extract facts
  - build lists, counts, tables, and baselines
- `analysis`
  - group, compare, cluster, and recommend
- `review`
  - critique an existing scope, design, or decision
- `decision`
  - compare options and recommend one
- `modeling`
  - create or update project artifacts

## Good Prompt Starters

- `Inventory mode: ...`
- `Analysis mode: ...`
- `Review mode: ...`
- `Decision mode: ...`
- `Modeling mode: ...`

## Good Output Hints

Add one of these when you want a specific answer shape:

- `Give me a table.`
- `Give me a top-10 list.`
- `Give me 3 options.`
- `Only show findings.`
- `Do not create files.`
- `Create files.`
- `Use the architect-friendly display style.`
- `Group my tasks as ask / confirm / request / decide.`

## Safe Defaults

If you do not want the workspace to overreach, say:

```text
Inventory mode.
Read the source files.
Do not create architecture artifacts.
Keep unknowns explicit.
```

## When To Use Runtime

Use `runtime/` only when you explicitly want:

- coordinator-led routing
- queued tasks
- handoffs
- review gates

Otherwise, leave it alone.
