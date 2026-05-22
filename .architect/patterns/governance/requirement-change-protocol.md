# Pattern: Requirement Change Protocol

## Purpose

A reusable architectural approach for handling requirement changes on
an engagement, so scope drift is captured honestly and impact is
assessed deliberately rather than ignored or hand-waved.

## When To Use

- on any engagement where requirements may evolve mid-flight (in practice: most engagements)
- when an engagement crosses a `requirement-baseline` review gate and post-baseline changes are likely
- when multiple downstream artifacts (solutions, decisions, interfaces, transitions) depend on requirement stability
- when the sponsor or delivery team needs a defensible audit trail of scope changes

## When Not To Use

- one-shot inventory engagements with no target-state modeling (no requirements to change)
- exploratory engagements that haven't yet baselined requirements (use [`requirements-follow-up`](../../skills/requirements-follow-up.md) until baseline is reached)

## Assumptions And Prerequisites

- the project has a populated `requirement` artifact set (i.e. discovery has happened)
- the project has a `change-register.md` file under `architect-work/` (created by the CLI scaffold from v0.1.0 onward)
- the project's `project-config.yaml` declares a `requirement_freeze_enforcement` mode (default: `advisory`)

## Key Components And Interactions

The protocol orchestrates five OA components:

1. **The `requirement` template's `metadata.change_log`** — per-requirement history of changes (granular)
2. **`architect-work/change-register.md`** — aggregated, sponsor-readable view of all scope changes on this engagement
3. **`decision` artifacts (via `decision-recorder`)** — promoted from changes that cross the decision threshold
4. **The `change-coordinator` skill** — runs the procedure
5. **`gap-radar`'s requirement-drift check** — surfaces requirement changes that haven't been propagated to downstream artifacts

The four change types (`new` / `modified` / `removed` / `superseded`)
are the protocol's primary classification. *Conflict* is a trigger
that produces one of the four — not a fifth type.

## Decision Threshold

Promote a change to a `decision` artifact when **any** of:

- touches more than one `solution`
- alters regulatory or compliance posture
- materially affects timeline or cost
- crosses a review gate (post-baseline)
- sponsor explicitly requests it on record

Else: a `metadata.change_log` line on the requirement plus a
`change-register.md` row is sufficient. This is an OR rule, not AND
— any one signal is enough.

## Freeze Gates

The protocol respects three enforcement modes (set in `project-config.yaml`
under `conventions.requirement_freeze_enforcement`):

- **`off`** — changes apply directly; no freeze-gate semantics
- **`advisory`** (recommended default) — changes apply but the register flags post-baseline landings; the next review gate acknowledges them
- **`strict`** — post-baseline changes must be formally re-opened by sponsor or coordinator before applying; useful for regulated engagements

The `requirement-baseline` review checkpoint (declared in
`project-config.governance.review_checkpoints`) is the freeze line.
Changes before that point land freely; changes after are governed by
the enforcement mode.

## Benefits

- **Honest audit trail** — every scope change is traceable to a source and impact
- **Sponsor-readable view** — the register is the single page sponsors can read for "what's changed"
- **Defensible decision boundary** — the threshold rule makes decision-promotion an objective choice
- **Tooling integration** — `gap-radar`'s requirement-drift check surfaces stale downstream artifacts mechanically

## Tradeoffs

- **Procedural overhead** — every change costs a register entry plus impact assessment. For very dynamic engagements, this can feel heavy.
- **Threshold judgment calls** — "materially affects timeline or cost" is subjective. Different architects may classify the same change differently.
- **Two-place writes** — both `metadata.change_log` and the register need updating; missing one creates drift.

## Common Risks

- **Register goes stale** — architects skip the register entry when busy. Mitigation: `gap-radar` requirement-drift check surfaces changes-without-register-entries.
- **Decision threshold gamed** — architects under-apply the threshold to avoid the ADR cost. Mitigation: review-gate audit confirms each change's threshold evaluation.
- **Freeze-gate friction** — `strict` enforcement can paralyze regulated engagements where requirements legitimately need to flex. Mitigation: `strict` should be paired with a documented re-opening procedure (named sponsor approver).

## Related Templates

- [`requirement`](../../templates/business/requirement.yaml)
- [`decision`](../../templates/governance/decision.yaml)
- [`compliance-assessment`](../../templates/governance/compliance-assessment.yaml)

## Related Decisions

The protocol is itself a candidate for being captured as a `decision`
artifact on engagements that explicitly customize it (e.g., changing
threshold criteria, lifting freeze-gate mode).

## Related Patterns

- [`architecture-decision-lifecycle`](./architecture-decision-lifecycle.md) — the lifecycle of decisions, which this protocol feeds when changes cross the threshold
- [`architecture-principle-lifecycle`](./architecture-principle-lifecycle.md) — analogous protocol for principles
- [`reference-architecture-variance-management`](./reference-architecture-variance-management.md) — analogous protocol for reference architecture deviations

## Related Examples

- The [`smoke-test-2026-05-22`](../../../workspace/smoke-test-2026-05-22/) project (when populated) will use this protocol after its first `requirement-baseline` review gate
