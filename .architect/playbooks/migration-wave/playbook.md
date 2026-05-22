# Migration Wave Playbook

## Engagement Shape

- **Stance:** one-shot for the planned modernization, with per-wave iteration during execution
- **Default mode:** `analysis` (with disciplined moves to `modeling` per wave)
- **Typical duration:** months
- **Output emphasis:** sequenced transition states and work packages

## When To Use

Use this playbook when:

- the engagement is to modernize, migrate, or decommission systems over time
- baseline and target are at least directionally known
- delivery is wave-based, not big-bang
- rollback and cutover risk are real, not theoretical
- multiple teams will execute against the architect's sequencing

## When Not To Use

Do **not** use this playbook when:

- the engagement is enterprise-wide architecture direction (use `full-togaf-adm`)
- the engagement is a single bounded new solution (use `quick-solution-design`)
- you do not yet know what is in the estate (use `inventory-only` first)

## What Good Looks Like

- a clear baseline and target picture for the systems in scope
- gap analysis with each gap closed by a named work package
- transition states with explicit dependencies, success criteria, and rollback approach
- a roadmap that sequences the waves and surfaces risk
- compliance and risk implications considered for each transition

## Stages

### Stage 1 — Frame The Modernization

- **Entry signals:** sponsor exists; target shape is at least directionally agreed
- **Key questions:** what are we modernizing and why, what is the success measure, what is the constraint (cost, deadline, compliance), who is affected
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** stakeholders, objectives, scope of estate in/out, success measures
- **Exit signals:** the modernization charter is reviewable by the sponsor

### Stage 2 — Baseline The Estate

- **Entry signals:** scope is bounded enough to inventory
- **Key questions:** what is in the estate today, what depends on what, where does data live, what are the operational realities and silent dependencies
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** baseline applications, interfaces, data objects, environments, manual handoffs
- **Exit signals:** the baseline is good enough to identify gaps without further discovery

### Stage 3 — Identify Gaps And Direction

- **Entry signals:** baseline is stable
- **Key questions:** what is the target shape, where are the gaps, what choices are real (lift-and-shift vs replatform vs refactor vs replace vs retire), what are the candidate sequencing shapes
- **Recommended skills:** [`requirement-normalizer`](../../skills/requirement-normalizer.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** gap set, candidate transition shapes with tradeoffs
- **Exit signals:** the chosen direction is defensible
- **Review gate:** `solution-direction`

### Stage 4 — Decide Direction

- **Entry signals:** direction is chosen
- **Key questions:** what major decisions need to be on the record, what are the options-considered, what are the consequences and dependencies
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** decisions with rationale, options, and consequences
- **Exit signals:** the chosen direction has decision artifacts
- **Review gate:** `decision-approval`

### Stage 5 — Plan The Waves

- **Entry signals:** direction is decided
- **Key questions:** what is the smallest useful wave (Wave 1), how do later waves depend on it, what coexistence patterns apply, what is the rollback approach, what are the success criteria per wave
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md)
- **Expected outputs:** transition states, work packages, roadmap, per-wave success criteria, per-wave rollback approach
- **Exit signals:** the wave plan is reviewable and traceable

### Stage 6 — Govern Risk And Compliance

- **Entry signals:** wave plan is reviewable
- **Key questions:** what compliance and risk implications apply per wave, what evidence will be needed, what controls must accompany each cutover
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** risk register per wave, compliance assessment per wave, control posture
- **Exit signals:** governance posture is current and evidence-backed
- **Review gate:** `governance-review`

### Stage 7 — Confirm And Hand Over

- **Entry signals:** governance is current
- **Key questions:** what does each delivery team need to start its wave, what is the cutover-rehearsal plan, what is the post-cutover hypercare plan
- **Recommended skills:** [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** review packet, delivery handover packet per wave, rehearsal and hypercare plan
- **Exit signals:** Wave 1 starts on solid ground
- **Review gate:** `transition-plan`

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`baseline-discovery`](../../skills/baseline-discovery.md)
3. [`requirement-normalizer`](../../skills/requirement-normalizer.md)
4. [`option-evaluator`](../../skills/option-evaluator.md)
5. [`decision-recorder`](../../skills/decision-recorder.md)
6. [`transition-planner`](../../skills/transition-planner.md)
7. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
8. [`gap-radar`](../../skills/gap-radar.md) — sweep before each governance review
9. [`architecture-review`](../../skills/architecture-review.md)
10. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `solution-direction`
- `decision-approval`
- `governance-review`
- `transition-plan`

## Patterns Likely To Apply

- [strangler-modernization](../../patterns/transition/strangler-modernization.md)
- [coexistence-data-migration](../../patterns/transition/coexistence-data-migration.md)
- [parallel-run](../../patterns/transition/parallel-run.md)
- [phased-decommissioning](../../patterns/transition/phased-decommissioning.md)
- [cutover-rehearsal](../../patterns/transition/cutover-rehearsal.md)
- [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
- [feature-toggle-rollout](../../patterns/transition/feature-toggle-rollout.md)
- [pilot-then-scale](../../patterns/transition/pilot-then-scale.md)
- [data-reconciliation](../../patterns/data/data-reconciliation.md)
- [data-replication-and-cache-invalidation](../../patterns/data/data-replication-and-cache-invalidation.md)

## Common Anti-Patterns

- **Big-bang cutover with no rehearsal** — most expensive failures originate here.
- **Transitions without rollback** — flagged as `BLOCKER` by `gap-radar`; address before the gate.
- **Optimistic sequencing** — Wave 1 carrying too much; Wave 1 should be small enough to prove the approach.
- **Gap without a closing work package** — a gap with no plan is a wish.
- **Mixing baseline and target language** — silent drift; reviewers cannot tell what is real.
- **Compliance-as-finale** — leaving compliance posture to the last wave; surfaces blockers too late.
- **Vendor-driven sequencing** — letting a vendor's product roadmap dictate the wave plan rather than the modernization strategy.
- **No data-reconciliation plan during coexistence** — silent divergence between old and new during parallel run.

## Entry Criteria

- the systems in scope are at least roughly named
- a sponsor or steering owner exists for the transition
- baseline evidence exists or can be gathered quickly
- target direction is at least directionally agreed

## Exit Criteria

- the transition plan is reviewable and traceable end-to-end
- each transition state declares rollback, success criteria, and dependencies
- each gap has a closing work package with an owner
- compliance and risk posture is explicit per wave
- handover to delivery teams is complete

## Cycling Stance

This playbook is **one-shot for the planned modernization**, but expect
*per-wave* iteration during execution. Each wave passes through its own
review gates and may re-baseline as evidence comes in. Run
[`project-recap`](../../skills/project-recap.md) at the start of every wave
and [`gap-radar`](../../skills/gap-radar.md) before every gate.

## What This Playbook Does Not Do

- It does not design new business capabilities (use `full-togaf-adm`)
- It does not stand in for a green-field solution design (use `quick-solution-design`)
- It does not own ongoing run-state operations after final cutover

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) — most migrations begin where another engagement left off.
2. Write a one-paragraph modernization charter into `notes.md` (what, why, by when, constraints).
3. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
4. List the systems in scope. For each, capture: "what we know" / "what we assume" / "what we need to find out".
5. Identify the 3–5 most relevant source documents and queue them for `baseline-discovery`.
6. Reject the urge to draw a target diagram. Stay in `analysis` until baseline is stable.
7. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Scope** — `enterprise-and-solution` by default; reduce to `solution` if the modernization is one product line.
- **Compliance scope** — set jurisdictions and regulations early; modernization in regulated estates needs governance-review from day one.
- **Roles** — add `domain-architect` for DDD-style estates; drop `security-architect` only when truly out of scope (rare).
- **Templates** — keep `gap` and `work-package`; drop `compliance-assessment` only for unregulated estates.
- **Default mode** — leave as `analysis`; switch to `modeling` only per-wave.
- **Coordinator** — `coordinator_auto_route: false` is the safer default; reconsider only if the program is long and the architect is deeply trusted.
- **Patterns** — pre-select 4–6 transition patterns most relevant to the chosen direction; do not bring the whole transition pattern library into every wave.

## Decision Points

- **Lift-and-shift vs replatform vs refactor vs replace vs retire** — make this explicit per system before sequencing.
- **Coexistence model** — strangler vs parallel-run vs feature-toggle — pick per slice based on data-ownership and rollback needs.
- **Wave shape** — pilot-then-scale vs phased-decommissioning vs hybrid — pick based on risk appetite and operational readiness.
- **Hypercare model** — embedded in delivery team vs separate architecture support — decide before cutover, not after.

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, `compliance`, `data_residency_requirements` if relevant.
4. Run [`baseline-discovery`](../../skills/baseline-discovery.md) before touching any transition artifact.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate. Pay particular attention to *Drift Signals* and *Present-Day Standards Gaps*.

## Notes For Reviewers

When reviewing migration-wave output:

- check that every transition declares rollback explicitly
- check that no gap exists without a closing work package
- check that cutover rehearsal is planned for non-trivial cutovers
- check that compliance and risk are addressed per wave, not just at the end
- check that baseline and target language are not silently mixed
- check that Wave 1 is small enough to prove the approach without being too small to teach anything
