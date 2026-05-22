# Convention Enforcement Matrix

## Purpose

A convention is only real if **something acts on it**. Open Architect
defines convention flags in [`config/workspace-defaults.yaml`](../config/workspace-defaults.yaml)
and documents them in [`config/agent.config.md`](../config/agent.config.md),
but those two files only declare *that* a behavior should exist — they
don't bind the AI to actually perform it.

This matrix lists every flag and records **where the behavior is
bound**. After the 2026-05-22 consolidation, the canonical binding
location for nearly every flag is
[`config/bindings.md`](../config/bindings.md) —
the single AI-facing binding spec that `AGENTS.md` mandates the AI
read on every session.

This file is the audit target for `capability-radar`'s
*Unbound-flag-binding* check (see
[`capability-radar-checklists.md`](./capability-radar-checklists.md)
§7).

## How to read a row

- **Flag** — the YAML key under `conventions:` in `workspace-defaults.yaml`
- **Default** — the workspace-default value
- **Governs** — one-line summary of the behavior the flag should drive
- **Bound in** — the file(s) that contain the *behavioral instruction* the AI must follow when the flag is set. For most flags this is `config/bindings.md` (the central binding spec); response-shape flags bind in `AGENTS.md` directly; the requirement-freeze flag binds in its dedicated procedure files
- **Status** —
  - ✅ `bound` — concrete AI instruction tied to the flag's behavior, in a file the AI reads during skill execution
  - 🟡 `partial` — described in guidance only, no behavioral binding in the AI-reads-this-file set
  - 🚫 `unbound` — defined and documented only; no behavioral binding anywhere

## The matrix

### Response-shape conventions

These flags bind in `AGENTS.md` (the always-read trunk) and
`config/response-display.md` (the display-contract details), since
they govern the response shape itself — the very thing the AI
produces from the start of every reply.

| Flag | Default | Governs | Bound in | Status |
|---|---|---|---|---|
| `response_display_style` | `architect-friendly` | Overall response format (session banner + section order + status labels) | `AGENTS.md` §"Default Response Format", `config/response-display.md` | ✅ |
| `response_display_enforcement` | `strict` | Whether the display contract is mandatory or preferred | `AGENTS.md` §"Allowed Exceptions", `config/response-display.md` | ✅ |
| `response_session_banner` | `table` | Banner format (two-column table vs compact line) | `AGENTS.md` §"Required Display Contract" step 2 | ✅ |
| `response_status_labels` | `true` | Use status-label glyphs (✅, 🟡, 🚫, etc.) | `AGENTS.md` §"Status Labels" | ✅ |
| `response_task_grouping` | `ask-confirm-request-decide` | Architect-task grouping shape | `AGENTS.md` §"Architect Task Grouping" | ✅ |
| `response_bottom_line` | `true` | End substantial responses with a Bottom Line | `AGENTS.md` §"Required Display Contract" | ✅ |
| `response_structured_choices` | `true` | Use host structured-choice UI for 2-4 mutually-exclusive options | `AGENTS.md` §"Structured Choices" | ✅ |
| `announce_active_role_and_skill` | `true` | Announce role + skill near the start of substantial responses | `AGENTS.md` §"Required Display Contract" step 3 | ✅ |

### Mode and operating-context conventions

| Flag | Default | Governs | Bound in | Status |
|---|---|---|---|---|
| `default_work_mode` | `inventory` | inventory / analysis / modeling / review / decision | `config/bindings.md` §2 | ✅ |
| `guided_mode_support` | `true` | Whether guided-mode prompting is enabled | `config/bindings.md` §2 | ✅ |
| `guided_mode_depth` | `standard` | Verbosity profile: concise / standard / detailed | `config/bindings.md` §2 | ✅ |
| `clarify_operating_context_first` | `true` | At session start, clarify scope / mode / role before deep work | `config/bindings.md` §2 | ✅ |
| `include_architect_tasks_in_all_modes` | `true` | Include architect-task list in every response shape | `config/bindings.md` §2 | ✅ |
| `artifact_creation_requires_explicit_request` | `true` | Architecture artifacts (SOL-*, DEC-*, etc.) created only when the architect explicitly asks; reads architect intent (exploratory / directive / non-creative) | `config/bindings.md` §2 | ✅ |

### Conversational-contract conventions

| Flag | Default | Governs | Bound in | Status |
|---|---|---|---|---|
| `user_is_primary_driver` | `true` | Architect drives; AI proposes (the OA conversational pattern) | `config/bindings.md` §3 | ✅ |
| `next_step_recommendations_only` | `true` | AI may recommend next steps; never auto-execute them | `config/bindings.md` §3 | ✅ |
| `auto_progression` | `false` | Whether the AI advances through phases without explicit approval | `config/bindings.md` §3 | ✅ |
| `architect_work_auto_capture` | `true` | AI identifies follow-up material for architect-work files when a skill runs | `config/bindings.md` §3 | ✅ |
| `architect_work_auto_update_mode` | `approval-before-write` | suggest-only / approval-before-write / auto-update | `config/bindings.md` §3 | ✅ |
| `architect_work_auto_update_scope` | `architect-work-only` | Whether auto-capture applies only to architect-work/ or wider | `config/bindings.md` §3 | ✅ |
| `allow_agent_auto_approval` | `false` | Whether the AI may approve its own writes | `config/bindings.md` §3 | ✅ |

### Evidence-and-traceability conventions

| Flag | Default | Governs | Bound in | Status |
|---|---|---|---|---|
| `evidence_required_for_approval` | `true` | Artifacts moving to `approved` status must have evidence references | `config/bindings.md` §4 | ✅ |
| `traceability_required` | `true` | Cross-artifact traceability (artifact-A references the source it derives from) is mandatory | `config/bindings.md` §4 | ✅ |
| `default_agent_output_status` | `draft` | Default status for AI-generated artifacts | `config/bindings.md` §4 | ✅ |

### Governance-gate conventions

| Flag | Default | Governs | Bound in | Status |
|---|---|---|---|---|
| `architecture_reviews_required` | `true` | Architecture review is mandatory before approval | `config/bindings.md` §5 | ✅ |
| `compliance_reviews_required` | `true` | Compliance review is mandatory before approval | `config/bindings.md` §5 | ✅ |
| `stop_on_governance_status_changes` | `true` | Pause execution when a governance artifact's status changes | `config/bindings.md` §5 | ✅ |
| `ask_before_owner_creation` | `true` | Ask architect before assigning a person/role to an ownership field | `config/bindings.md` §5 | ✅ |

### Requirement-change-handling conventions

| Flag | Default | Governs | Bound in | Status |
|---|---|---|---|---|
| `requirement_freeze_enforcement` | `advisory` | off / advisory / strict — how strictly post-baseline requirement changes are gated | `config/bindings.md` §6 (with full procedure in `guidance/requirement-change-handling.md` + `patterns/governance/requirement-change-protocol.md` + `skills/change-coordinator.md`) | ✅ |

## Summary

| Status | Count |
|---|---|
| ✅ bound | 29 |
| 🟡 partial | 0 |
| 🚫 unbound | 0 |

**Headline:** convention surface went from **37 flags** (with 6
confirmed unbound at smoke-test, then audited to 16 unbound + 1
partial) → **29 flags, all bound, with binding text consolidated into
a single AI-facing file**.

### Binding architecture

After the 2026-05-22 consolidation, the binding stack is:

| Layer | Role |
|---|---|
| [`AGENTS.md`](../../AGENTS.md) | Always-read trunk. Binds response-shape flags directly. Mandates that the AI also read `bindings.md` and `response-display.md`. |
| [`config/response-display.md`](../config/response-display.md) | Display-contract details (banner, section order, status labels, picker usage). |
| [`config/bindings.md`](../config/bindings.md) | **The central binding spec.** Single source of truth for every other flag's behavioral effect. AGENTS.md mandates reading it. |
| `guidance/<thematic>.md` (work-modes, evidence-and-quality, governance-conventions) | Narrative principles only — the *why* behind the bindings. Each file links to `bindings.md` for the *what*. |
| `guidance/requirement-change-handling.md` + `patterns/governance/requirement-change-protocol.md` + `skills/change-coordinator.md` | Procedure-interwoven binding for `requirement_freeze_enforcement` (kept distributed because the binding *is* the procedure). |

The 8 retired flags are listed in [`config/agent.config.md`](../config/agent.config.md)
§"Retired conventions" with the canonical flag each was redundant
with.

## How to bind a new flag

See [`capability-maintenance.md`](./capability-maintenance.md) §"Adding a new convention / workspace flag".

In short:

| Flag governs… | Bind in… |
|---|---|
| Response shape, format, glyphs, picker usage | `AGENTS.md` directly (or `config/response-display.md` for display-contract details) |
| Anything else (mode, conversational, evidence, governance, requirement-change) | `config/bindings.md` under the appropriate section |

Reference the flag by exact name in the binding so the §7
`capability-radar` check can grep for it. Do not re-state behavior
locally in skill files — the AGENTS.md mandate guarantees the AI
reads `bindings.md` every session, so per-skill reinforcement is
redundant and creates the distributed-binding anti-pattern.

## Anti-pattern

A flag added to `workspace-defaults.yaml` and `agent.config.md` only,
with no binding in `bindings.md` or `AGENTS.md`, is **not a
convention** — it is an abandoned config knob. Any new flag must land
with a binding in the same change.

`agent.config.md` is the docs file. Embedding `If conventions.X is
true: …` behavioral blocks there is also an anti-pattern, because
`agent.config.md` is not part of the skill-execution context the AI
reads on every turn. Behavioral specs belong in `bindings.md`
or `AGENTS.md`.

## See also

- [`config/bindings.md`](../config/bindings.md) — the central binding spec
- [`AGENTS.md`](../../AGENTS.md) — always-read trunk
- [`config/workspace-defaults.yaml`](../config/workspace-defaults.yaml) — flag definitions
- [`config/agent.config.md`](../config/agent.config.md) — flag descriptions and retired-conventions table
- [`capability-maintenance.md`](./capability-maintenance.md) — when adding a new convention/workspace flag, follow the ripple-effect checklist
- [`capability-radar-checklists.md`](./capability-radar-checklists.md) §7 — mechanical unbound-flag check
