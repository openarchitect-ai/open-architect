# Business Continuity Readiness Playbook

## Engagement Shape

- **Stance:** quasi-cyclic — bootstrap is one-shot, but resilience posture is continuous
- **Default mode:** `analysis` (with disciplined moves to `modeling` per resilience slice)
- **Typical duration:** months for bootstrap; ongoing thereafter
- **Output emphasis:** RTO/RPO targets per criticality tier, resilience architecture (failover, DR, graceful degradation), recovery rehearsal cadence, evidence chain for audit and board

## When To Use

Use this playbook when:

- the engagement is proactive BCP / DR architecture work (not response to a live incident)
- regulatory requirements force resilience improvement (DORA, NIS2, financial-services resilience rules, healthcare continuity)
- a near-miss or industry incident prompts a strategic resilience review
- business criticality assessment is driving architecture investment
- audit findings expose gaps between RTO/RPO claimed and RTO/RPO achievable

## When Not To Use

Do **not** use this playbook when:

- a specific incident has just happened (use `post-incident-architecture-review`)
- the dominant driver is a non-resilience regulator obligation (use `compliance-driven-modernization`)
- the driver is security threats (use `security-uplift`)
- the work is specific-solution resilience design (use `quick-solution-design` with a resilience emphasis)
- the work is cloud migration where resilience is one workstream (use `cloud-migration`)

## What Good Looks Like

- explicit criticality tier definitions (e.g. mission-critical / business-critical / important / routine) with measurable RTO/RPO targets
- baseline resilience posture per in-scope solution — what is *actual* recovery time vs claimed
- resilience architecture decisions per tier (multi-region, active-active vs active-passive, graceful degradation, third-party fallback)
- recovery rehearsal cadence on the calendar with evidence collection
- residual risk register accepted at the right level
- evidence chain defensible to regulator, auditor, board
- the function survives the architect's holiday

## Stages

### Stage 1 — Frame The Program

- **Entry signals:** sponsor exists (typically COO, CIO, or head of resilience); driver is articulated (regulator, near-miss, audit, strategic)
- **Key questions:** why now, what success looks like, what is in/out of scope, what is the regulatory frame, what is the decision authority, what is the budget envelope
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** program charter, sponsor, regulatory frame, decision authority, success measures (RTO/RPO improvement, rehearsal pass rate, residual risk reduction)
- **Exit signals:** the charter is reviewable by the sponsor

### Stage 2 — Baseline Current Resilience Posture

- **Entry signals:** charter is in place
- **Key questions:** for in-scope solutions — what RTO/RPO is claimed, what is achievable today, when was recovery last rehearsed, what evidence supports the claim, what failed last time, what is the actual-vs-claimed gap
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`gap-radar`](../../skills/gap-radar.md)
- **Expected outputs:** posture per solution (RTO/RPO claimed vs achieved, last rehearsal date, last rehearsal result, gap honest), evidence inventory
- **Exit signals:** the baseline is honest; weak areas are flagged, not hidden

### Stage 3 — Define Criticality Tiers And Targets

- **Entry signals:** baseline is in hand
- **Key questions:** what tiers apply (mission-critical / business-critical / important / routine, or org-specific), what is the target RTO/RPO per tier, what is the business impact appetite per tier, what is the cost stance for each tier
- **Recommended skills:** [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** criticality tier definitions, target RTO/RPO per tier, business-impact tolerance per tier, cost envelope per tier
- **Exit signals:** the tier model is agreed and defensible
- **Review gate:** `requirement-baseline`

### Stage 4 — Identify Resilience Gaps Per Critical Solution

- **Entry signals:** tiers and targets are in place
- **Key questions:** per critical solution — what is the gap between current and target, what architectural change closes it, what is the operational change required, what is the rehearsal change required
- **Recommended skills:** [`gap-radar`](../../skills/gap-radar.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** gap register per solution (architecture, operations, rehearsal), severity per gap, dependency map
- **Exit signals:** the gap picture is reviewable and traceable to tier targets

### Stage 5 — Decide Resilience Direction

- **Entry signals:** gaps are mapped
- **Key questions:** per gap — what is the architectural choice (multi-region active-active, multi-region active-passive, single-region with graceful degradation, multi-cloud, third-party fallback), what is the cost vs risk trade-off, what dependencies between choices exist
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** resilience architecture decisions with rationale, dependencies between decisions, residual risk per choice
- **Exit signals:** chosen direction is decided
- **Review gate:** `decision-approval`

### Stage 6 — Plan Resilience Uplift Waves

- **Entry signals:** direction is decided
- **Key questions:** which solutions ship first (often most-critical), what is the wave shape, what is the rollback approach, what is the cutover-rehearsal expectation, what is the operational impact
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** uplift wave plan, success criteria per wave, rollback approach, dependencies, operational impact assessment
- **Exit signals:** the wave plan is reviewable
- **Review gate:** `transition-plan`

### Stage 7 — Establish Recovery Rehearsal Cadence

- **Entry signals:** wave plan is in place
- **Key questions:** how often is recovery rehearsed per tier, what scope is rehearsed (full DR, partial, table-top, surprise), who participates, what evidence is collected, how are findings routed to architectural changes
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md), [`architecture-coordinator`](../../skills/architecture-coordinator.md)
- **Expected outputs:** rehearsal cadence per tier, rehearsal scope mix, participation expectations, evidence collection plan, findings routing
- **Exit signals:** rehearsals are on the calendar with named owners

### Stage 8 — Wave 1 Uplift Slice

- **Entry signals:** rehearsal cadence is established
- **Key questions:** what is Wave 1, who is the pilot, what proves the wave succeeded (typically: a successful rehearsal post-uplift), what is the rollback if uplift introduces new failure mode
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md), [`transition-planner`](../../skills/transition-planner.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Wave 1 resilience uplift delivered, successful rehearsal evidence, residual-risk update
- **Exit signals:** Wave 1 has shipped and the rehearsal proved improvement

### Stage 9 — Ongoing Operation

- **Entry signals:** Wave 1 is live
- **Key questions:** how is the rehearsal cadence maintained, how are drift signals caught, how are new solutions onboarded to the tier model, how are RTO/RPO claims re-baselined
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`gap-radar`](../../skills/gap-radar.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** ongoing rehearsal evidence, drift register, new-solution onboarding to tiers, posture refresh cadence
- **Exit signals:** the program operates as a continuous capability

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — primary skill for this engagement
5. [`evidence-curator`](../../skills/evidence-curator.md)
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`solution-modeler`](../../skills/solution-modeler.md)
9. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
10. [`transition-planner`](../../skills/transition-planner.md)
11. [`gap-radar`](../../skills/gap-radar.md)
12. [`architecture-review`](../../skills/architecture-review.md)
13. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm tier definitions and targets
- `solution-direction` — confirm resilience architecture shape
- `decision-approval` — confirm direction per gap
- `governance-review` — confirm rehearsal cadence and evidence chain
- `transition-plan` — confirm Wave 1 readiness

## Patterns Likely To Apply

- **Resilience and recovery:**
  - [multi-region-failover](../../patterns/technology/multi-region-failover.md)
  - [active-active-vs-active-passive](../../patterns/technology/active-active-vs-active-passive.md)
  - [graceful-degradation](../../patterns/technology/graceful-degradation.md)
  - [blue-green-canary-deployment](../../patterns/technology/blue-green-canary-deployment.md)
- **Transition / rehearsal:**
  - [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
  - [parallel-run](../../patterns/transition/parallel-run.md)
  - [cutover-rehearsal](../../patterns/transition/cutover-rehearsal.md)
  - [cutover-command-center](../../patterns/transition/cutover-command-center.md)
  - [post-cutover-hypercare](../../patterns/transition/post-cutover-hypercare.md)
  - [rollback-decision-thresholds](../../patterns/transition/rollback-decision-thresholds.md)
- **Observability:**
  - [observability-by-design](../../patterns/technology/observability-by-design.md)
- **Data resilience:**
  - [data-replication-and-cache-invalidation](../../patterns/data/data-replication-and-cache-invalidation.md)
  - [archival-and-retention](../../patterns/data/archival-and-retention.md)
  - [historical-replay-and-rebuild](../../patterns/data/historical-replay-and-rebuild.md)
- **Governance / evidence:**
  - [architecture-assurance-evidence-trail](../../patterns/governance/architecture-assurance-evidence-trail.md)
  - [governance-review-gate](../../patterns/governance/governance-review-gate.md)

## Common Anti-Patterns

- **Backup-as-DR** — backups are not DR; restore tests are necessary; restore time matters.
- **Untested recovery** — RTO/RPO declared in policy, never measured against reality.
- **DR site never failed over to** — the secondary works on paper, never under load.
- **Single-region "resilience"** — multiple availability zones are not multi-region; regional outage takes everything down.
- **Recovery rehearsal as compliance theatre** — rehearsals scheduled, results never used to drive change.
- **BCP doc that nobody owns** — written, signed, filed, never refreshed.
- **Resilience as feature, not architectural concern** — added late, expensive, often incomplete.
- **RTO/RPO same across all solutions** — no criticality tiering means over-investing in routine and under-investing in critical.
- **Multi-region but stateful single-master** — failover requires data convergence the architecture doesn't support.
- **Surprise-rehearsal-only** — never run controlled rehearsals; first real test is the real incident.
- **Recovery procedures in PDFs nobody reads under pressure** — runbooks must be operable cold.
- **Third-party dependencies ignored** — the bank is resilient; the payment processor it depends on isn't.
- **Hot path data not part of resilience design** — recovery completes but transactional data is lost.
- **Failover automation that requires human approval** — automation that pauses at the wrong moment is worse than manual.

## Entry Criteria

- a sponsor exists with resilience accountability (COO, CIO, head of resilience)
- the strategic driver is clear (regulator, near-miss, audit, strategic)
- baseline visibility into in-scope solutions exists or can be gathered
- there is appetite for rehearsal-based evidence, not policy-only resilience

## Exit Criteria (Bootstrap)

- criticality tiers and targets are agreed and defensible
- resilience architecture decisions are recorded per gap
- Wave 1 uplift has shipped with successful rehearsal evidence
- rehearsal cadence is on the calendar with named owners
- residual risk is documented and accepted at the right level
- evidence chain is defensible to regulator, auditor, board

## Cycling Stance

This playbook is **quasi-cyclic**. Bootstrap is one-shot, but resilience posture is continuous:

- **per quarter (recommended):** rehearsal cycle for at least one critical solution
- **per major change:** resilience review when a critical solution changes shape
- **per new solution onboarded:** tier assignment + posture design
- **per rehearsal:** findings route into next-cycle uplift wave

## What This Playbook Does Not Do

- It does not handle a live incident — use `post-incident-architecture-review`
- It does not own the security threat model — use `security-uplift` for that (though resilience and security overlap)
- It does not run BCP exercises beyond architecture concerns — partner with the BCP / crisis-management function
- It does not own ongoing operations during incidents — that is SOC / SRE / on-call

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if any prior resilience work exists.
2. Write a one-paragraph program charter into `notes.md` — driver, sponsor, regulatory frame, success measures.
3. Take an initial position on criticality tier shape (number of tiers, target RTO/RPO ranges). Provisional is fine.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the sponsor, what regulatory frame applies, what is the most recent rehearsal evidence, what is the current RTO/RPO claimed vs achieved gap, what are the top 5 mission-critical solutions, what is the third-party dependency posture, what is the budget envelope.
6. List the top 5–10 critical solutions in scope and a candidate criticality tier for each (provisional).
7. Resist designing solutions before tier targets are agreed.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Compliance scope** — set jurisdictions and regulations; DORA, NIS2, sectoral resilience rules are common drivers.
- **Roles** — keep `chief-architect`, `architecture-governance-lead`, `security-architect`, `technology-architect`; add `business-analyst` for criticality scoring; add `data-architect` for data resilience.
- **Templates** — keep `solution`, `application`, `technology-component`, `environment`, `risk`, `compliance-assessment`, `decision`; keep `transition-architecture` and `work-package` for uplift waves.
- **Default mode** — `analysis` is correct; switch to `modeling` only per uplift slice.
- **Coordinator** — `coordinator_auto_route: false`; resilience decisions are board-visible and need explicit routing.
- **Tier model** — pick 3–4 tiers, not 7. Each tier needs clear definitions and target RTO/RPO.
- **Rehearsal mix** — table-top + partial + full DR. Don't rely on table-top alone.
- **Third-party dependency posture** — declare early. Vendors can take you down even if your architecture is solid.

## Decision Points

- **Number of criticality tiers** — 3 (simpler) vs 4 (more granular) vs 5+ (overhead). Most orgs land on 4.
- **Active-active vs active-passive** — per tier or per solution. Active-active is more expensive; active-passive has cutover risk.
- **Multi-region vs multi-cloud** — multi-region within a cloud (cheaper, less independent) vs multi-cloud (expensive, more independent).
- **Graceful degradation vs full failover** — for some solutions, degraded service beats full failover. Declare per tier.
- **Rehearsal frequency** — quarterly (recommended for critical) vs semi-annually vs annually.
- **Rehearsal scope mix** — table-top + partial + full DR. Pick a recurring rotation.
- **Failover automation level** — fully automated (faster, harder to validate) vs human-confirmed (slower, easier to validate).
- **Third-party fallback stance** — accept (cheaper) vs multi-vendor (expensive) vs vendor-with-strong-SLA (middle ground).

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the sponsor with resilience accountability?
- What regulatory frame applies (DORA, NIS2, sectoral, internal policy only)?
- What is the criticality tier model, and what are target RTO/RPO per tier?
- For mission-critical solutions: what is the achieved RTO/RPO vs claimed?
- When was the last rehearsal per critical solution? What was the result?
- What is the third-party dependency posture (which vendors are single points of failure)?
- What is the multi-region vs multi-cloud stance?
- What is the active-active vs active-passive stance per tier?
- What is the graceful-degradation appetite per solution?
- What is the rehearsal cadence and scope mix?
- What is the failover automation level (manual / human-confirmed / fully automated)?
- What is the residual-risk acceptance authority?
- What is the evidence-chain expectation (regulator, auditor, board)?

## Recommended Diagrams

- Criticality tier model (tiers × RTO/RPO × business impact tolerance × cost envelope)
- Current vs target posture per solution (claimed RTO/RPO × achieved × target × gap)
- Resilience architecture per critical solution (active-active / active-passive / graceful-degradation / multi-region / multi-cloud)
- Failover sequence per critical solution (detection → decision → execution → recovery → hypercare exit)
- Third-party dependency map (your solutions × upstream vendors × vendor resilience posture)
- Rehearsal cadence calendar (solutions × tier × cadence × scope mix × evidence collection)
- Evidence chain (rehearsal → result → finding → uplift action → re-rehearsal)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name` and compliance scope (DORA / NIS2 / sectoral resilience rules are common).
4. Run [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) early — the criticality tier and posture model drives everything else.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Present-Day Standards Gaps* (BCP/DR per criticality, observability ownership, failure-mode handling) and *Drift Signals* (claimed RTO/RPO vs reality).

## Notes For Reviewers

When reviewing business continuity readiness output:

- check that RTO/RPO claims are evidence-backed, not policy-only
- check that rehearsal evidence is current and was used to drive change
- check that criticality tiers are honest, not aspirational
- check that third-party dependencies are mapped, not assumed away
- check that graceful degradation is designed where full failover is impractical
- check that data resilience matches solution resilience (hot path data preserved)
- check that runbooks are operable cold (not just legible to the author)
- check that failover automation choices match operational maturity
- check that the evidence chain is defensible to regulator / auditor / board
- check that resilience is treated as architectural concern, not as a feature added late
