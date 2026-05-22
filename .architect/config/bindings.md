# Bindings

## Purpose

This file is the **single source of truth for the behavioral effect of
every convention flag** defined in
[`workspace-defaults.yaml`](./workspace-defaults.yaml). For each flag,
it specifies what the AI must do when the flag is `true` (or set to a
particular value), and what changes when the flag is `false`.

`AGENTS.md` mandates that every AI agent operating in this workspace
reads this file alongside `AGENTS.md` itself, so the bindings below
fire in the AI's execution context on every skill run — not by
happenstance.

## How to read a binding

Each binding has three parts:

1. **Flag** — the YAML key under `conventions:` in `workspace-defaults.yaml`
2. **Behavior when set** — the concrete instruction the AI must follow
3. **Behavior when unset / alternate value** — how the behavior changes

Bindings are organized by category (response shape, mode, conversational
contract, evidence, governance, requirement change). The categories
match the sections in [`convention-enforcement-matrix.md`](../guidance/convention-enforcement-matrix.md).

## Distinction from related files

| File | Role |
|---|---|
| `config/workspace-defaults.yaml` | **Defines** the flags (key + default value) |
| `config/agent.config.md` | **Documents** the flags for human maintainers (purpose, allowed values) |
| `config/bindings.md` (this file) | **Binds** the flags to AI behavior (what the AI must do when the flag is set) |
| `guidance/convention-enforcement-matrix.md` | **Indexes** every flag → binding location + status |
| `guidance/<thematic>.md` (e.g. `evidence-and-quality.md`, `governance-conventions.md`) | **Narrative principles** that frame why the conventions exist (architect-facing) |

The thematic guidance files describe the underlying *principles* — why
evidence matters, why governance gates exist, what work modes mean.
The bindings below are the *mechanical AI behavior* that enforces
those principles. Read the narrative for understanding; read the
bindings for what to do.

---

## 1. Response shape

The response-format conventions are bound in [`AGENTS.md`](../../AGENTS.md)
and [`config/response-display.md`](./response-display.md), not here,
because they govern the response shape itself — the very thing the AI
produces from the start of every reply. Bind-here cross-references
below for the matrix:

- `response_display_style` → [`AGENTS.md`](../../AGENTS.md) §"Default Response Format" + [`response-display.md`](./response-display.md)
- `response_display_enforcement` → [`AGENTS.md`](../../AGENTS.md) §"Allowed Exceptions"
- `response_session_banner` → [`AGENTS.md`](../../AGENTS.md) §"Required Display Contract" step 2
- `response_status_labels` → [`AGENTS.md`](../../AGENTS.md) §"Status Labels"
- `response_task_grouping` → [`AGENTS.md`](../../AGENTS.md) §"Architect Task Grouping"
- `response_bottom_line` → [`AGENTS.md`](../../AGENTS.md) §"Required Display Contract"
- `response_structured_choices` → [`AGENTS.md`](../../AGENTS.md) §"Structured Choices"
- `announce_active_role_and_skill` → [`AGENTS.md`](../../AGENTS.md) §"Required Display Contract" step 3

## 2. Mode and operating context

### `default_work_mode` (default: `inventory`)

Selects the assumed work mode when the architect hasn't named one.
Values: `inventory`, `analysis`, `modeling`, `review`, `decision`. The
chosen mode constrains what the AI does — see
[`work-modes.md`](../guidance/work-modes.md) for the full mode
descriptions.

### `guided_mode_support` (default: `true`)

When `true`, every substantive response includes the eight-element
guided output shape (active role/skill, current picture, working
interpretation, what matters, open points, recommended next move,
architect tasks, bottom line). See
[`work-modes.md`](../guidance/work-modes.md) §"Guided Output Shape"
for the full shape.

When `false`, responses may stay raw — output only, no orientation.
Use this when the architect explicitly asks for concise output and
guided shape would feel noisy.

### `guided_mode_depth` (default: `standard`)

Tunes verbosity within guided mode. Values:

- `concise` — only **active role/skill**, **current picture**, and **recommended next move**. Drop interpretation, open points, and architect tasks unless explicitly asked.
- `standard` — the full eight-element shape.
- `detailed` — extends standard with deeper coaching: explicit decision-support framing, named open points with severity, architect tasks grouped by Ask / Confirm / Request / Decide even when the list is short.

When the architect requests `concise` mid-conversation ("keep it
brief"), drop to `concise` for the remainder of the session unless
re-elevated.

### `clarify_operating_context_first` (default: `true`)

When `true`, the AI must:

- state its current interpretation of the assignment or slice
- separate source-backed facts from inferred framing
- highlight the smallest context gaps that would materially change the work
- avoid behaving as if scope, state, or target intent are already settled

When `false`, the AI may proceed on the implicit context the
architect provides without explicit clarification.

### `include_architect_tasks_in_all_modes` (default: `true`)

When `true`, every substantive response ends with a concrete set of
follow-up tasks for the architect — questions to ask, evidence to
request, decisions to prepare, reviews to perform. Tasks should be
mode-appropriate (no forced modeling output in inventory mode).

When `false`, architect tasks appear only when the AI judges them
useful.

### `artifact_creation_requires_explicit_request` (default: `true`)

When `true`, architecture artifacts (SOL-*, DEC-*, STK-*, APP-*,
REQ-*, etc.) are created **only** when the architect explicitly asks
for them in the current request. Applies to every artifact-creating
skill (`solution-modeler`, `decision-recorder`,
`stakeholder-objective-framer`, `application-interface-modeler`,
`data-modeler`, `technology-environment-modeler`,
`requirement-normalizer`, `transition-planner`).

**Read architect intent before deciding what to do:**

- **Exploratory request** ("look at X", "what's in this", "review Y",
  "compare options") — produce analytical output. **Do not** create
  artifact files. End the response with a `Decide` architect task
  proposing concrete artifact creation as the next move. Name the
  specific artifact kind(s) and what they *would* capture — e.g.
  *"Decide: produce `solution` artifact SOL-1001 from the integration
  boundary above?"* or *"Decide: convert this requirement cluster
  into normalized `requirement` artifacts (~6 entries)?"*
- **Directive request** ("create SOL-1001", "produce a decision for
  X", "model the data objects") — the architect has already named
  the next move. Do the work. Do not second-guess by re-proposing the
  same step.
- **Specific but non-creative request** ("explain Z", "give me a
  count", "draft a message to the sponsor") — produce the requested
  output. Don't surface artifact creation; it isn't implied.

Heuristic: *show me / look at / what is / review / compare* → propose
what comes next. *create / produce / model / write / record* → just
do it.

If the architect skips a proposed `Decide` task and continues with
further analysis, do not re-surface the same proposal every turn —
resurface only when the analysis materially advances (new boundary,
new decision, new scope clarity).

When `false`, the AI may create artifacts proactively when the
architect's intent reasonably implies modeling.

## 3. Conversational contract

### `user_is_primary_driver` (default: `true`)

When `true`, the architect drives the engagement. The AI proposes,
recommends, and supports — but doesn't decide direction, doesn't
choose what to investigate, and doesn't move the project lifecycle
forward on its own.

When `false`, the workspace is in coordinator-led mode and the AI
(via a coordinator role) may route work between specialist roles
without per-step architect approval.

### `next_step_recommendations_only` (default: `true`)

When `true`, the AI may *recommend* next steps but must never
*auto-execute* them. Recommendations appear in the response; the
architect chooses whether to accept and instructs the AI to proceed.

When `false`, the AI may chain recommended steps automatically — only
appropriate for coordinator-led or external-orchestrated execution.

### `auto_progression` (default: `false`)

When `false` (the workspace default), the AI does not advance through
playbook phases or engagement gates on its own. Phase transitions
happen when the architect explicitly approves them.

When `true`, the AI may advance phases when entry criteria are met —
appropriate only in coordinator-led mode with strong gate checks.

### `architect_work_auto_capture` (default: `true`)

When `true`, the AI identifies follow-up material that belongs in
`architect-work/` files as part of normal work, and proposes the
updates as part of the response. Classify candidate updates into:

- `open-questions.md` — unresolved questions
- `answers-and-confirmations.md` — confirmed facts and current working interpretation
- `evidence-requests.md` — what's been received, what's still missing
- `architect-task-list.md` — Ask / Confirm / Request / Decide tasks
- `working-log.md` — chronological project narrative (newest on top)
- `change-register.md` — chronological requirement/scope change log

When a skill runs, it should propose a `working-log.md` entry
summarizing the run in plain language so the project's story remains
readable to someone joining cold.

When `false`, the AI captures architect-work content only when
explicitly asked.

### `architect_work_auto_update_mode` (default: `approval-before-write`)

Values: `suggest-only`, `approval-before-write`, `auto-update`.

- `suggest-only` — the AI surfaces proposed updates in prose but
  doesn't structure them as ready-to-write blocks
- `approval-before-write` (workspace default) — the AI may *prepare*
  updates with the specific file paths, line edits, and content, but
  must **not** write them until the architect explicitly confirms.
  Confirmation may be explicit in the current exchange or via a clear
  instruction to update the files.
- `auto-update` — the AI writes the architect-work updates without
  per-write approval, with a summary in the response

### `architect_work_auto_update_scope` (default: `architect-work-only`)

When `architect-work-only`, the auto-update behavior applies only to
the project-local `architect-work/` folder — never to architecture
artifacts (solutions, decisions, etc.) or other workspace state.

When `broader`, auto-update may extend to other project state
(playbook configs, etc.) — use cautiously.

### `allow_agent_auto_approval` (default: `false`)

When `false` (the workspace default), the AI cannot approve its own
writes. Every status transition to `approved`, `accepted`, or
`verified` requires explicit architect confirmation. The AI may
*propose* the transition; the architect *approves* it.

When `true`, the AI may approve its own draft → approved transitions
— almost always wrong; reserve for narrow automation contexts.

## 4. Evidence and traceability

### `evidence_required_for_approval` (default: `true`)

When `true`, before proposing a status transition from `draft` or
`proposed` to `approved` (or `accepted`, `verified`) on any
architecture artifact, the AI must verify that the artifact has at
least one populated reference in its `metadata.references` (or
equivalent evidence field).

- If the field is empty or contains placeholder text, treat the
  approval as **🚫 BLOCKER** — propose populating the evidence field
  first, do not propose the status transition.
- An artifact with `metadata.confidence: low` and no evidence field
  populated must not be proposed for approval under this flag.
- The `architecture-review` skill must report evidence-missing on an
  approval candidate as a blocking finding.

When `false`, the above checks become advisory rather than blocking;
evidence-poor approvals should still be flagged in the response so
the architect can override consciously.

### `traceability_required` (default: `true`)

When `true`, before proposing approval of any architecture artifact,
the AI must verify that its `traces-to` (or equivalent source-trace
field) is populated with references to the upstream artifacts it
derives from. E.g. a solution traces to objectives + requirements; a
decision traces to the artifact(s) it governs.

- If `traces-to` is empty for an artifact whose template kind expects
  it, treat the approval as **🚫 BLOCKER**.
- The `architecture-review` skill must report missing `traces-to` as
  a blocking finding.

When `false`, the trace check becomes advisory.

### `default_agent_output_status` (default: `draft`)

When an AI-created artifact is written, its `status:` field is set to
the value of this flag (workspace default `draft`). The AI must never
default the status to `in-review`, `approved`, `accepted`, or
`verified` — those statuses require an architect-driven transition
per `allow_agent_auto_approval: false`.

If the architect explicitly asks for a different default status
(e.g. "produce this in `proposed` status"), honor the request — the
flag governs the default, not a hard cap.

## 5. Governance gates

### `architecture_reviews_required` (default: `true`)

When `true`, before proposing approval of any architecture artifact,
the AI must verify that an `architecture-review` skill run has been
performed on the artifact set the artifact belongs to, and that the
findings have been addressed or explicitly accepted by the architect.

- If no review run exists, propose running `architecture-review` first.
- If a run exists but blocking findings remain unaddressed, treat the
  approval as **🚫 BLOCKER** until they are resolved or explicitly
  waived.
- The `review-pack-builder` skill must include architecture-review
  findings in any publication package produced under this flag.

When `false`, architecture review becomes recommended rather than
required; approvals may proceed without it but should note the
absence in governance summaries.

### `compliance_reviews_required` (default: `true`)

When `true`, before proposing approval of any architecture artifact
that touches the project's `compliance.applicable_regulations`, the
AI must verify that a compliance review has been performed (via
`risk-compliance-assessor` or an equivalent compliance-bearing skill
run) and that compliance findings have been addressed.

- For artifacts with no compliance touchpoint (per the artifact kind
  and the project's regulatory scope), this flag does not gate
  approval.
- The `review-pack-builder` skill must include compliance-review
  findings in any publication package produced under this flag.
- Regulated playbooks (`compliance-driven-modernization`,
  `post-incident-architecture-review`,
  `business-continuity-readiness`,
  `post-acquisition-integration`) treat this flag as a hard gate.

When `false`, compliance review becomes recommended rather than
required. For projects with no applicable regulations, this flag is
moot.

### `stop_on_governance_status_changes` (default: `true`)

When `true` and a skill is mid-run, if the AI detects that a
governance artifact's status has changed during the current session
(e.g. a DEC-* artifact moved from `proposed` to `superseded`, or a
REQ-* artifact's approval was revoked), it must:

1. **Pause the current skill**
2. Surface the change to the architect before continuing
3. Propose: continue with the new state / roll back the status change
   / abort the skill

This protects against the AI continuing as if a governance fact still
held when it just changed underneath the work.

When `false`, status changes are noted but do not pause execution.

### `ask_before_owner_creation` (default: `true`)

When `true`, the AI must not invent named people, role placeholders,
or stakeholder entries to make an artifact look complete. Before
populating an ownership field (`owner`, `accountable`, `stakeholder`,
`approver`), do one of:

- use a value already present in the project's source material or
  prior architect-work entries
- ask the architect for the value via an `Ask` task
- mark the field as `tbd` or `unknown` if neither applies

Use the ownership convention: `confirmed:<owner>` when ownership is
verified, `role-placeholder:<role>` when only the responsibility
shape is known, `tbd` or `unknown` otherwise.

When `false`, the AI may infer plausible owners from context — almost
always wrong; reserve for very narrow inference contexts.

## 6. Requirement-change handling

### `requirement_freeze_enforcement` (default: `advisory`)

Values: `off`, `advisory`, `strict`.

- `off` — post-`requirement-baseline` requirement changes apply
  normally with no freeze-gate ceremony.
- `advisory` (workspace default) — changes apply but the
  [`change-register.md`](../guidance/requirement-change-handling.md)
  entry flags any post-baseline landing; the next review gate
  explicitly acknowledges them.
- `strict` — post-baseline changes pause until the sponsor or
  coordinator formally re-opens the requirement set; the
  `change-coordinator` skill produces a re-opening request instead of
  applying the change.

Strict mode pairs with regulated engagements (DORA, NIS2, HIPAA)
where requirements drift must be defensible against audit. Advisory
mode is the right default for most engagements.

Full procedure: see
[`guidance/requirement-change-handling.md`](../guidance/requirement-change-handling.md)
and
[`patterns/governance/requirement-change-protocol.md`](../patterns/governance/requirement-change-protocol.md).

---

## Maintainer notes

- Adding a new flag: bind it in this file under the appropriate
  category section, then add a row in
  [`convention-enforcement-matrix.md`](../guidance/convention-enforcement-matrix.md).
  See [`capability-maintenance.md`](../guidance/capability-maintenance.md)
  §"Adding a new convention / workspace flag".
- Retiring a flag: remove the binding here, retire the flag in
  `workspace-defaults.yaml`, add it to `agent.config.md`'s "Retired
  conventions" table, and remove the matrix row. See
  [`capability-maintenance.md`](../guidance/capability-maintenance.md)
  §"Retiring a convention / workspace flag".
- The §7 `capability-radar` Unbound-flag-binding check uses this file
  as the audit target — any flag in `workspace-defaults.yaml` whose
  name doesn't appear in this file (or in AGENTS.md / response-display.md
  for the response-shape category) is a drift finding.

## See also

- [`AGENTS.md`](../../AGENTS.md) — the always-read behavioral contract; mandates reading this file
- [`config/workspace-defaults.yaml`](./workspace-defaults.yaml) — flag definitions and defaults
- [`config/agent.config.md`](./agent.config.md) — flag documentation and retired-conventions table
- [`guidance/convention-enforcement-matrix.md`](../guidance/convention-enforcement-matrix.md) — index of every flag and where its binding lives
- [`guidance/capability-radar-checklists.md`](../guidance/capability-radar-checklists.md) §7 — mechanical drift checks for conventions
- Narrative principles behind these bindings:
  [`guidance/work-modes.md`](../guidance/work-modes.md),
  [`guidance/evidence-and-quality.md`](../guidance/evidence-and-quality.md),
  [`guidance/governance-conventions.md`](../guidance/governance-conventions.md),
  [`guidance/working-with-open-architect.md`](../guidance/working-with-open-architect.md)
