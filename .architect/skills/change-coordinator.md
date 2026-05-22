# Change Coordinator

## Purpose

Run the requirement-change protocol on a live engagement: classify
the change, assess downstream impact, decide whether to promote it
to a `decision` artifact, apply it to affected artifacts, and keep
the change register honest.

Requirement-change is the dominant flavor of architecture change on
most engagements. This skill specializes on that case. Decision
reversals and principle deprecations are handled by their own
lifecycle skills.

## Use When

- a new requirement has been raised that wasn't in the original scope
- an existing requirement's content, acceptance criteria, or owner has materially changed
- an existing requirement has been removed, deferred, or superseded
- a conflict between requirements has been detected and resolution will produce one or more `new` / `modified` / `removed` / `superseded` outcomes
- the engagement has crossed `requirement-baseline` and a post-baseline change has landed

## Read First

- [`.architect/guidance/requirement-change-handling.md`](../guidance/requirement-change-handling.md) — the architect's procedure (8 steps, the four types, decision threshold, freeze-gate semantics)
- [`.architect/patterns/governance/requirement-change-protocol.md`](../patterns/governance/requirement-change-protocol.md) — the architectural shape
- the project's `workspace/<project-name>/architect-work/change-register.md` — running log of changes on this engagement
- the project's `workspace/<project-name>/project-config.yaml` for `conventions.requirement_freeze_enforcement` (`off` / `advisory` / `strict`)
- [`.architect/guidance/traceability-rules.md`](./traceability-rules.md) — the relationship rules that determine downstream impact

## Inputs

- the change (new requirement, modified requirement, removed requirement, or superseded set)
- the source of the change (sponsor request, regulatory discovery, technical constraint, customer feedback, other)
- the relevant project artifacts that may be impacted

## Steps

1. **Recognize and classify** the change as `new` / `modified` / `removed` / `superseded`. Conflict is a trigger; resolve to one of these four.
2. **Capture the source.** Sponsor request / regulator / technical / customer / other. Record this in the change-register entry — it builds a pattern over time.
3. **Run impact assessment.** For each downstream artifact category, identify what's touched: `solution`, `decision`, `interface`, `transition-architecture`, `risk`, `compliance-assessment`, plus rough timeline / cost magnitude. Fill the impact-assessment fields in the change-register entry even when "none" — explicit nones are better than blanks.
4. **Evaluate the decision threshold.** Promote to a `decision` artifact if **any**: touches > 1 solution, alters regulatory or compliance posture, materially affects timeline / cost, crosses a review gate, sponsor explicitly requests. Otherwise the `metadata.change_log` line plus register entry is sufficient.
5. **Check freeze-gate status** against `project-config.conventions.requirement_freeze_enforcement`:
   - `off` — proceed
   - `advisory` (default) — proceed but flag post-baseline landing
   - `strict` — pause; route to sponsor / coordinator for explicit re-opening before applying
6. **Apply the change to artifacts.** Update the `requirement` YAML and its `metadata.change_log`. If the threshold was met, draft the `decision` via [`decision-recorder`](./decision-recorder.md). Update affected downstream artifacts. Mark their `metadata.last_reviewed` so `gap-radar` surfaces them as needing re-review.
7. **Add the change-register entry.** One row in `architect-work/change-register.md`, newest on top, populated with type, source, requirements touched, impact assessment, threshold evaluation, freeze-gate status, reversibility, and confirmation state.
8. **Add a working-log entry.** Plain-language narrative cross-referencing the register entry.

## Outputs

- updated `requirement` artifact(s) including `metadata.change_log` line(s)
- a `decision` artifact (if threshold was met), via [`decision-recorder`](./decision-recorder.md)
- updated downstream artifacts where impacted (with `last_reviewed` flagged)
- new entry in `architect-work/change-register.md`
- new entry in `architect-work/working-log.md`
- if freeze-gate mode is `strict` and the change landed post-baseline: a routed request for sponsor re-opening (not the change itself)

## Output Checklist

- [ ] the change is classified into exactly one of `new` / `modified` / `removed` / `superseded`
- [ ] the source is captured
- [ ] impact assessment is filled (explicit "none" beats blank)
- [ ] decision threshold is explicitly evaluated against all five signals
- [ ] freeze-gate mode is checked
- [ ] if threshold met, a `decision` artifact is drafted (not just promised)
- [ ] downstream artifacts have `metadata.last_reviewed` updated
- [ ] change-register entry is added (newest on top)
- [ ] working-log entry is added
- [ ] no requirement is silently changed without a register entry

## Boundaries

This skill does **not**:

- handle decision reversals (use `decision-recorder` and the decision's own `change_log`)
- handle principle deprecations (use the architecture-principle-lifecycle pattern flow)
- decide whether a sponsor request *should* be accepted — only how to process it once accepted
- enforce freeze-gate mode by itself — that's the project-config setting; the skill respects it

This skill **may**:

- recommend running `decision-recorder` when a threshold signal fires
- recommend running `gap-radar` after a high-impact change to surface stale downstream artifacts
- recommend running `requirements-follow-up` if the change opens new questions

## Typical Collaboration

- triggered by `chief-architect` or `architecture-governance-lead` when a change is raised
- output feeds `decision-recorder`, `gap-radar`, `architecture-review`, and the sponsor / steering audience
- pairs with `requirements-follow-up` when changes spawn new open questions
- pairs with `risk-compliance-assessor` when the change alters regulatory posture
- pairs with `communication-packager` when sponsor briefing is needed

## Quality Checks

- A change with no register entry is invisible to the next review gate — treat missing-register-entry as a finding, not a habit.
- A change that's classified as `modified` but actually replaces the intent should be `superseded` — be deliberate.
- A change marked "no impact" everywhere is suspicious — almost every real change touches at least one downstream artifact.
- The threshold rule is OR, not AND — under-application erodes the decision record's integrity.
- A `metadata.change_log` line that doesn't appear in the register is a drift signal — `gap-radar`'s requirement-drift check should catch it.

## Variations

- **Sponsor-driven change** — the most common case; the source is sponsor request and a sponsor-confirmation row in the register is mandatory.
- **Regulatory-driven change** — source is regulator / compliance discovery; threshold is essentially always met (regulatory posture changed); decision-recorder produces a compliance-anchored decision.
- **Conflict resolution** — start by naming the two conflicting requirements; the resolution produces one or more typed changes; the conflict itself is captured as the source of each resulting entry.
- **Post-baseline batch** — when multiple changes arrive after `requirement-baseline`, process them individually but produce a single summary entry in the working-log noting the batch.
- **Freeze-gate paused** — `strict` mode and a post-baseline change: produce only a re-opening request; do not apply the change to artifacts until sponsor approval.
