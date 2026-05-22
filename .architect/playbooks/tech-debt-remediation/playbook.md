# Tech Debt Remediation Playbook

## Engagement Shape

- **Stance:** one-shot or recurring (some orgs run an annual cycle)
- **Default mode:** `analysis` (with disciplined moves to `modeling` per remediation slice)
- **Typical duration:** months for the program; ongoing if recurring
- **Output emphasis:** prioritized debt inventory, remediation roadmap with cost-benefit per item, prevention practice to bound new debt

## When To Use

Use this playbook when:

- the estate is functioning but accumulating tech debt
- the goal is to improve quality, supportability, and developer velocity — not to reshape the architecture
- specific debt categories drive the work (security debt, observability debt, dependency debt, dead code, deprecated tech, schema debt)
- budget and capacity exist for incremental remediation
- prevention of *new* debt is part of the deliverable

## When Not To Use

Do **not** use this playbook when:

- the estate needs major reshape or modernization (use `migration-wave`)
- a regulator is driving the work (use `compliance-driven-modernization`)
- a specific incident triggered the urgency (use `post-incident-architecture-review`)
- portfolio-level decisions about invest / tolerate / migrate / eliminate (use `portfolio-rationalization`)
- new solution design (use `quick-solution-design`)

## What Good Looks Like

- a prioritized inventory of debt items per application / domain, classified by category and severity
- explicit cost-benefit per item (effort vs risk / value / quality improvement)
- a remediation roadmap with named owners and timelines
- residual debt accepted explicitly, time-bounded
- prevention practice in place so new debt accumulates more slowly than it is paid down
- measurable quality improvement targets (deploy frequency, MTTR, vulnerability counts, dead-code ratio — not vibes)

## Stages

### Stage 1 — Frame The Remediation

- **Entry signals:** sponsor exists; the strategic driver (velocity, supportability, vulnerability exposure, vendor pressure, audit fatigue) is clear
- **Key questions:** why now, what success looks like, what debt categories are in scope, what improvement targets matter
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** remediation charter, debt taxonomy in scope, improvement targets, sponsor commitment
- **Exit signals:** the charter is reviewable by the sponsor

### Stage 2 — Baseline The Debt Inventory

- **Entry signals:** scope is bounded
- **Key questions:** what debt exists in scope, where it lives, what it costs (carry cost in maintenance, risk, velocity), what is the source of evidence per item
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** debt inventory by category (security, observability, dependency, dead code, deprecated tech, schema, ownership, documentation), carry-cost evidence per item
- **Exit signals:** the inventory is evidence-backed; severity is honest

### Stage 3 — Score And Prioritize

- **Entry signals:** inventory is in hand
- **Key questions:** per item — what is the carry cost, what is the remediation cost, what is the risk if left, what is the velocity uplift if paid, what is the dependency on other remediation
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`relationship-mapper`](../../skills/relationship-mapper.md)
- **Expected outputs:** scored items across cost × risk × value × effort, prioritized list, dependency graph
- **Exit signals:** prioritization is defensible and explainable to the sponsor

### Stage 4 — Decide Direction Per Category

- **Entry signals:** prioritization is in place
- **Key questions:** which items will be remediated, which tolerated (with explicit expiry), which accepted permanently as design choices, what is the rollback approach if a remediation introduces new risk
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** decisions per category with rationale and time-bound dispositions for tolerated items
- **Exit signals:** the chosen direction is decided
- **Review gate:** `decision-approval`

### Stage 5 — Plan Remediation Waves

- **Entry signals:** direction is decided
- **Key questions:** what ships in Wave 1 (often quick wins + foundational items), what depends on what, what is the rollback, what is the success measure per wave
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** wave plan with per-wave success measures, dependencies, rollback approach
- **Exit signals:** the wave plan is reviewable
- **Review gate:** `transition-plan`

### Stage 6 — Establish Prevention Practice

- **Entry signals:** wave plan is in place
- **Key questions:** how is new debt bounded (definition-of-done updates, principles, gate criteria, automated checks), how is debt visible (debt register, dashboards), how is the practice reviewed
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`artifact-maintainer`](../../skills/artifact-maintainer.md)
- **Expected outputs:** prevention practice (definition-of-done updates, debt register cadence, dashboards), updated principles or standards
- **Exit signals:** new debt is now bounded by visible practice

### Stage 7 — Wave 1 Execution

- **Entry signals:** plan and prevention practice are in place
- **Key questions:** what ships first, what is the operational impact, what proves the wave succeeded
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Wave 1 remediation delivered, improvement signals captured, lessons fed back to wave plan
- **Exit signals:** Wave 1 has shipped and produced measurable improvement

### Stage 8 — Ongoing (Annual Or Continuous)

- **Entry signals:** Wave 1 is live; the program continues
- **Key questions:** how often is the debt inventory refreshed, how is the prevention practice reviewed, how is residual debt re-baselined, when does the next remediation cycle start
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`gap-radar`](../../skills/gap-radar.md), [`project-recap`](../../skills/project-recap.md), [`artifact-maintainer`](../../skills/artifact-maintainer.md)
- **Expected outputs:** debt inventory refresh cadence, prevention practice review, residual debt re-baseline
- **Exit signals:** debt is paid down at a rate equal to or greater than accumulation

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`relationship-mapper`](../../skills/relationship-mapper.md)
5. [`evidence-curator`](../../skills/evidence-curator.md)
6. [`option-evaluator`](../../skills/option-evaluator.md) — primary skill for prioritization
7. [`decision-recorder`](../../skills/decision-recorder.md) — primary skill for category decisions
8. [`solution-modeler`](../../skills/solution-modeler.md)
9. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
10. [`transition-planner`](../../skills/transition-planner.md)
11. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
12. [`artifact-maintainer`](../../skills/artifact-maintainer.md) — for ongoing prevention
13. [`gap-radar`](../../skills/gap-radar.md)
14. [`architecture-review`](../../skills/architecture-review.md)
15. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm debt taxonomy and improvement targets
- `solution-direction` — confirm remediation approach and prevention practice
- `decision-approval` — confirm category-level decisions
- `transition-plan` — confirm wave plan and Wave 1 readiness

`governance-review` typically applies only when the remediation has compliance dimensions; otherwise it is not in scope.

## Patterns Likely To Apply

- **Transition / remediation approach:**
  - [strangler-modernization](../../patterns/transition/strangler-modernization.md)
  - [branch-by-abstraction](../../patterns/transition/branch-by-abstraction.md)
  - [feature-toggle-rollout](../../patterns/transition/feature-toggle-rollout.md)
  - [parallel-run](../../patterns/transition/parallel-run.md)
  - [phased-decommissioning](../../patterns/transition/phased-decommissioning.md)
  - [incremental-contract-migration](../../patterns/transition/incremental-contract-migration.md)
  - [legacy-interface-sunset](../../patterns/transition/legacy-interface-sunset.md)
  - [legacy-batch-sunset](../../patterns/transition/legacy-batch-sunset.md)
  - [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
- **Governance and prevention:**
  - [standards-exception-management](../../patterns/governance/standards-exception-management.md)
  - [waiver-expiry-and-remediation](../../patterns/governance/waiver-expiry-and-remediation.md)
  - [architecture-principle-lifecycle](../../patterns/governance/architecture-principle-lifecycle.md)
  - [standard-lifecycle-management](../../patterns/governance/standard-lifecycle-management.md)
  - [reference-architecture-conformance-review](../../patterns/governance/reference-architecture-conformance-review.md)
- **Tech / operational:**
  - [environment-drift-detection](../../patterns/technology/environment-drift-detection.md)
  - [observability-by-design](../../patterns/technology/observability-by-design.md)
- **Business decision support:**
  - [application-invest-tolerate-migrate-eliminate](../../patterns/business/application-invest-tolerate-migrate-eliminate.md)

## Common Anti-Patterns

- **Refactor-everything** — no business case, no scope; debt grows in another corner faster than you can pay it.
- **Tech debt jar** — items recorded, never paid. The list is theatre.
- **Big-bang remediation** — a single quarterly sprint that touches everything; nothing demonstrably improves.
- **Refactor for taste, not value** — paying down personal-preference debt while real risk sits.
- **No prevention practice** — pay debt down at one rate, new debt accumulates at twice the rate.
- **Tech debt sprint once a quarter** — nominal commitment, no real velocity reclaim.
- **Conflating tech debt with feature delay** — the engineering case is "we are slower"; that is true but unspecific.
- **No measurable improvement targets** — "we paid down some debt" with no signal that anything got better.
- **Debt items without owners** — recorded against a team that has no capacity or accountability.
- **"We'll fix it during the next migration"** — and the next migration arrives, the debt items don't.
- **Tooling churn labeled as remediation** — swapping CI tools, package managers, frameworks; the underlying debt is untouched.
- **Recording debt without severity** — flat lists with no prioritization signal.
- **Tolerate without expiry** — the same debt items appear in the next cycle, and the next.
- **Ignoring dependency debt until a CVE arrives** — reactive, expensive, embarrassing.

## Entry Criteria

- a sponsor exists for the remediation outcome
- the strategic driver is clear (velocity, supportability, vulnerability exposure, audit fatigue)
- baseline visibility into the debt categories in scope exists or can be gathered
- budget and capacity for incremental remediation are in place
- there is appetite for prevention, not only remediation

## Exit Criteria

- debt inventory is evidence-backed and prioritized
- category-level decisions are recorded with rationale
- remediation wave plan is reviewable and has named owners
- Wave 1 has shipped with measurable improvement
- prevention practice is operational
- residual debt is explicit and time-bounded (tolerate items have expiry)
- the next cycle (if recurring) has clear entry signals

## Cycling Stance

This playbook can run as **one-shot** (single remediation program) or as **recurring** (annual cycle, e.g. "Q1 tech debt program every year"). Pick early.

If recurring:

- Stage 8 is permanent — debt is re-baselined annually
- Stages 1–7 cycle each iteration
- The prevention practice from one cycle constrains the next cycle's accumulation

If one-shot:

- the cycle closes at Stage 7 with prevention practice in place
- the next debt program is a fresh engagement when business case emerges

## What This Playbook Does Not Do

- It does not reshape the architecture — use `migration-wave` for that
- It does not deliver new features — remediation is the deliverable
- It does not own ongoing engineering practice — partner with the platform / engineering function
- It does not handle a specific incident — use `post-incident-architecture-review`
- It does not score across the portfolio for invest / eliminate — use `portfolio-rationalization`

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior debt work exists in the project folder.
2. Write a one-paragraph remediation charter into `notes.md` — why, by when, what success looks like, what is in scope.
3. Pick a debt taxonomy (security debt, observability debt, dependency debt, dead code, deprecated tech, schema debt, ownership debt, documentation debt). Provisional is fine.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: what is the sponsor's improvement target, what debt categories matter most, what is the source of evidence per category, what is the prevention practice ambition, what is the cadence (one-shot or annual).
6. Identify the top 10–15 debt items per category for the most visible application or domain.
7. Resist proposing fixes until inventory is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — usually `enterprise-and-solution`; reduce to `solution` for a single-application remediation.
- **Compliance scope** — usually light; only set if the debt has compliance dimensions (security debt that creates regulatory exposure).
- **Roles** — keep `chief-architect`, `solution-architect`, `technology-architect`; add `security-architect` if security debt is in scope; add `architecture-governance-lead` for prevention practice work.
- **Templates** — keep `decision`, `risk`, `transition-architecture`, `work-package`, `gap`; keep `principle` and `technology-standard` for prevention practice updates.
- **Default mode** — `analysis` is correct; switch to `modeling` only per remediation slice.
- **Coordinator** — `coordinator_auto_route: false`; remediation decisions affect many teams and need explicit routing.
- **Debt taxonomy** — declare which categories are in scope. Avoid an unbounded list.
- **Improvement targets** — define measurable targets in Stage 1. Without targets, "paid down some debt" cannot be evaluated.
- **Cadence** — declare one-shot or recurring. Affects Stage 8 ambition.

## Decision Points

- **Debt taxonomy scope** — which categories are in scope, which are explicitly out. Avoid scope creep.
- **Prioritization framework** — cost × risk × value × effort, or carry-cost-only, or risk-weighted, or velocity-weighted. Pick early.
- **Remediation approach per category** — strangler / branch-by-abstraction / feature-toggle / parallel-run / phased decommissioning. Each category may suit a different approach.
- **Tolerate vs accept-permanently** — tolerate is time-bound (with expiry); accept-permanently is a design choice that needs principle-level support.
- **Prevention bar** — strict (no new debt in this category accepted) vs measured (new debt allowed with explicit waiver).
- **Cadence** — one-shot vs annual vs continuous. Affects budget and operating model.
- **Quick wins vs foundational items in Wave 1** — quick wins build momentum; foundational items unblock more remediation.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- What is the sponsor's measurable improvement target?
- Which debt categories are in scope (security / observability / dependency / dead code / deprecated tech / schema / ownership / documentation)?
- What is the source of evidence per debt category?
- What is the carry-cost evidence (maintenance time, vulnerability counts, deploy friction, MTTR)?
- What is the prioritization framework (cost × risk × value × effort, or other)?
- What is the prevention practice ambition (definition-of-done updates, gates, automated checks)?
- What is the cadence (one-shot or annual or continuous)?
- What residual debt is explicitly accepted, and with what expiry?
- What is the rollback approach for a remediation that introduces new risk?
- What dependency graph exists between items?
- What is the dashboard for debt visibility?
- Who owns prevention?

## Recommended Diagrams

- Debt heatmap (applications × debt categories × severity)
- Carry-cost vs remediation-cost scatter (per item)
- Dependency graph (debt items × prerequisites)
- Wave plan timeline (waves × items × dependencies × success measures)
- Prevention practice diagram (definition-of-done × gate criteria × automated checks × debt register cadence)
- Improvement trend over time (per metric — deploy frequency, MTTR, vulnerability count, dead-code ratio)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`. Declare the debt taxonomy in `notes.md`.
4. Run [`baseline-discovery`](../../skills/baseline-discovery.md) per debt category before scoring anything.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Governance Hygiene* (waiver expiry, stale items) and *Ownership Truthfulness Risks* (debt items without honest owners).

## Notes For Reviewers

When reviewing tech debt remediation output:

- check that every item has evidence supporting its severity, not just an assertion
- check that decisions name an approver and (for tolerate items) an expiry
- check that the prevention practice is operationally enforced, not aspirational
- check that improvement targets are measurable, not "we feel better"
- check that quick wins and foundational items are both represented in Wave 1
- check that residual debt is explicit, not hidden in a backlog nobody reviews
- check that the cadence (one-shot vs annual vs continuous) is honest
- check that tooling churn is not being claimed as remediation
- check that dependency debt is being addressed proactively, not waiting for a CVE
