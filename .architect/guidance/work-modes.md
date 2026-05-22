# Work Modes

This guide defines the default working modes for an architect-led Open
Architect workspace.

> **Note on bindings.** This file describes the *narrative principles*
> behind work modes. The *AI behavioral bindings* tied to mode-related
> convention flags (`default_work_mode`, `guided_mode_support`,
> `guided_mode_depth`, `clarify_operating_context_first`,
> `include_architect_tasks_in_all_modes`,
> `artifact_creation_requires_explicit_request`) live in
> [`config/bindings.md`](../config/bindings.md)
> §"Mode and operating context". Architects read this file for
> understanding; AI agents must also read `bindings.md`
> for what to do.

## Purpose

Work modes tell the agent what kind of help is wanted before it starts
producing architecture outputs.

This prevents a common failure mode where the user wants extraction or
analysis, but the workspace jumps into artifact creation, workflow
progression, or governance packaging too early.

## Default Principle

The architect is the primary driver.

Agents support the current task. They do not decide the project
lifecycle on their own unless the user explicitly opts into a
coordinator-led model.

When guided mode is enabled, the agent should also help the architect
make progress inside the current mode instead of only returning raw
output.

## Guided Output Shape

The guided output shape (active in `standard` and `detailed` guided
mode depths) includes:

- **active role and skill** — which role lens and which skill or playbook are active for this task
- **current picture** — what is now known
- **working interpretation** — what the assistant currently thinks the task or context is
- **what matters** — the most important signals, risks, or choices
- **open points** — what is still unclear
- **recommended next move** — the most useful next step inside the current effort
- **architect tasks** — the concrete follow-up actions the architect should now take
- **bottom line** — the short practical takeaway

This guidance should stay mode-appropriate and should not force
artifact creation or workflow progression on its own.

Architect tasks, when present, are grouped as:

- **Ask** — questions the architect should ask other people
- **Confirm** — items that need validation or agreement
- **Request** — evidence, documents, or access the architect should obtain
- **Decide** — choices the architect should prepare or make

The verbosity of this output (concise / standard / detailed) is
controlled by the `guided_mode_depth` flag — see
[`bindings.md`](../config/bindings.md)
§`guided_mode_depth`.

## Modes

### `inventory`

Use when the user wants source-first extraction.

Expected behavior:

- read source material
- extract facts
- structure inventories, lists, tables, and counts
- keep unknowns explicit
- avoid architecture conclusions unless the user asks for them

Guided behavior:

- explain what kind of source material was found
- state the most likely current interpretation of the source set
- call out what looks complete versus partial
- highlight the most useful cuts or filters for the next pass
- recommend whether to stay in inventory or move to analysis
- leave the architect with the next discovery tasks
- batch related discovery tasks where possible

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

Guided behavior:

- explain why the suggested clusters or patterns matter
- make the current interpretation explicit before stronger recommendations
- show which questions are most important to answer next
- recommend the cleanest next analysis or decision step
- keep the user oriented without forcing modeling
- leave the architect with the next scoping or clarification tasks
- batch related scoping and validation tasks where possible

By default, do not:

- create architecture artifacts unless explicitly requested
- advance project stages automatically

### `modeling`

Use when the user explicitly wants architecture assets created or
updated.

Expected behavior:

- create or update architecture artifacts
- maintain traceability
- keep assumptions explicit
- stop and ask before inventing approvals, owners, or scope commitments

Guided behavior:

- explain what was modeled and why
- state which context assumptions the modeling is currently relying on
- show what remains intentionally unresolved
- identify what should be reviewed before more modeling happens
- recommend the next useful artifact or review step
- leave the architect with the next review, validation, or confirmation tasks
- batch related review and validation tasks where possible

### `review`

Use when the user wants critique.

Expected behavior:

- inspect existing artifacts, scope, or decisions
- identify issues, gaps, and risks
- prioritize findings over process narration

Guided behavior:

- explain which issues matter most and why
- state what context assumptions the review is using
- distinguish blockers from weaker concerns
- recommend the cleanest fix order
- suggest whether to return to analysis or modeling next
- leave the architect with the next fix, challenge, or escalation tasks
- batch related fix and escalation tasks where possible

### `decision`

Use when the user wants help choosing among options.

Expected behavior:

- compare alternatives
- state tradeoffs
- recommend one option
- keep unresolved evidence or assumptions visible

Guided behavior:

- explain why one option is stronger than the others
- make explicit which interpretation of the context the recommendation depends on
- surface the main uncertainty behind the recommendation
- make the decision boundary explicit
- recommend the next move after the decision
- leave the architect with the next decision-preparation or follow-through tasks
- batch related preparation and follow-through tasks where possible

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

This keeps the workspace useful for practicing architects who want
support without losing control of the work.
