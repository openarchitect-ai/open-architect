# Work Modes

This guide defines the default working modes for an architect-led Open
Architect workspace.

## Purpose

Work modes tell the agent what kind of help is wanted before it starts
producing architecture outputs.

This prevents a common failure mode where the user wants extraction or analysis,
but the workspace jumps into artifact creation, workflow progression, or
governance packaging too early.

## Default Principle

The architect is the primary driver.

Agents support the current task. They do not decide the project lifecycle on
their own unless the user explicitly opts into a coordinator-led model.

## Modes

### `inventory`

Use when the user wants source-first extraction.

Expected behavior:

- read source material
- extract facts
- structure inventories, lists, tables, and counts
- keep unknowns explicit
- avoid architecture conclusions unless the user asks for them

By default, do not:

- create architecture artifacts
- create review packets
- create runtime state or handoff artifacts
- introduce owners, stakeholders, or approvals not grounded in source evidence

### `analysis`

Use when the user wants interpretation of extracted facts.

Expected behavior:

- summarize the estate or scope
- group interfaces, applications, or capabilities
- identify clusters, dependencies, and risks
- compare options
- recommend useful next cuts or decisions

By default, do not:

- create architecture artifacts unless explicitly requested
- advance project stages automatically

### `modeling`

Use when the user explicitly wants architecture assets created or updated.

Expected behavior:

- create or update architecture artifacts
- maintain traceability
- keep assumptions explicit
- stop and ask before inventing approvals, owners, or scope commitments

### `review`

Use when the user wants critique.

Expected behavior:

- inspect existing artifacts, scope, or decisions
- identify issues, gaps, and risks
- prioritize findings over process narration

### `decision`

Use when the user wants help choosing among options.

Expected behavior:

- compare alternatives
- state tradeoffs
- recommend one option
- keep unresolved evidence or assumptions visible

## Escalation Rules

Ask before:

- creating or updating architecture artifacts in a project that is still in
  `inventory` or `analysis`
- changing scope assumptions
- changing statuses or approvals
- inventing owners, sponsors, or governance roles
- moving into runtime orchestration

Continue without asking when the task stays inside:

- extraction
- summarization
- clustering
- comparison
- recommendation

## Recommended Default

If the user does not specify a mode, prefer:

1. `inventory`
2. `analysis`
3. `modeling` only after explicit request

This keeps the workspace useful for practicing architects who want support
without losing control of the work.
