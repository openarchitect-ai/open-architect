# Post-Acquisition Integration Playbook

## Engagement Shape

- **Stance:** one-shot, time-bounded by TSA exit (Transitional Services Agreement)
- **Default mode:** `inventory` initially, then `analysis`, then `modeling` per integration wave
- **Typical duration:** months to a year, bounded by deal terms
- **Output emphasis:** rationalization decisions, integration architecture, TSA exit plan

## When To Use

Use this playbook when:

- an acquisition has closed (or is about to) and the acquired estate must be integrated, rationalized, or absorbed
- a Transitional Services Agreement (TSA) is in place with a clock running
- two technology estates (often with different vendors, identity systems, data models) must converge
- vendor and license consolidation is part of the synergy case
- regulatory or operational reasons require integrated identity, data, or processes
- the acquiring organization needs to decide what to keep, kill, merge, or swap

## When Not To Use

Do **not** use this playbook when:

- the acquisition is being run as a fully separate subsidiary with no integration (no engagement needed at the platform level)
- the work is general modernization unrelated to an M&A event (use `migration-wave`)
- the engagement is regulatory-driven (use `compliance-driven-modernization`)
- the engagement is one solution design within either estate (use `quick-solution-design`)
- only post-divestiture separation is needed — that is the inverse problem, not this playbook

## What Good Looks Like

- a clear inventory of both estates with overlap, clash, and complement mapped
- explicit rationalization decisions per overlap area (keep both, kill one, merge, swap)
- an integration architecture for identity, data, processes, and shared services
- a wave plan that closes TSA dependencies before the TSA expires
- residual risks (cultural, technical, regulatory) named and owned
- a decommissioning plan for systems that are losing
- a Day 1, Day 90, TSA exit, and steady-state view

## Stages

### Stage 1 — Day 1 Posture (Preserve Operations)

- **Entry signals:** deal has closed or close is imminent; access to the acquired estate begins
- **Key questions:** what is operationally critical right now, what cannot break, what is the immediate TSA scope and exit clock, who in the acquired team holds what knowledge
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`baseline-discovery`](../../skills/baseline-discovery.md)
- **Expected outputs:** Day 1 operational view, named critical systems, TSA scope register, key acquired-team contacts, integration steering owners
- **Exit signals:** operations are stable; no integration choices are being made yet
- **Review gate:** `project-bootstrap`

### Stage 2 — Discovery Of The Acquired Estate

- **Entry signals:** Day 1 is stable; access to source material is in place
- **Key questions:** what is in the acquired estate (applications, interfaces, data, technology, environments, vendors, contracts), what depends on what, where does data live, what is the regulatory posture, what are the silent operational dependencies
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md), [`gap-radar`](../../skills/gap-radar.md)
- **Expected outputs:** baseline architecture for the acquired estate, known unknowns, evidence-request set, contract and vendor inventory
- **Exit signals:** the acquired estate is well enough understood to compare against the acquirer's estate

### Stage 3 — Compatibility And Overlap Analysis

- **Entry signals:** acquired estate is baselined
- **Key questions:** where do the two estates overlap (duplicate capability), clash (incompatible approaches), complement (additive value), and conflict on standards / vendors / data models, what is the integration architecture seam
- **Recommended skills:** [`relationship-mapper`](../../skills/relationship-mapper.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** overlap-and-clash map, integration seam candidates, vendor consolidation candidates, data-model harmonization needs
- **Exit signals:** the architect can name the 5–10 highest-leverage rationalization decisions

### Stage 4 — Rationalization Decisions

- **Entry signals:** overlap and clash are mapped
- **Key questions:** per overlap area — keep acquirer's, keep acquired's, merge them, or swap to a third option, what is the synergy case, what is the operational risk of each choice, who owns each decision
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** rationalization decisions per overlap area with options-considered, synergy rationale, residual-risk acceptance
- **Exit signals:** the highest-impact decisions are on the record
- **Review gate:** `decision-approval`

### Stage 5 — Integration Architecture

- **Entry signals:** rationalization direction is decided
- **Key questions:** what is the integrated identity model (federation, single IdP, dual-IdP-with-bridge), what is the integrated data model (harmonized, federated, replicated, mastered), what shared services exist (logging, observability, billing, support), what interfaces bridge the estates during coexistence
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`data-modeler`](../../skills/data-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** integrated identity architecture, data harmonization plan, shared-services architecture, bridge interfaces for coexistence
- **Exit signals:** the integration shape is reviewable
- **Review gate:** `solution-direction`

### Stage 6 — Wave Plan (TSA Exit-Driven)

- **Entry signals:** integration shape is reviewable
- **Key questions:** which TSA dependencies must exit first, what is the smallest useful Wave 1 (often identity or billing), what is the sequencing for vendor consolidation, what is the decommissioning order, what is the rollback approach per cutover
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** wave plan aligned to TSA exit clock, vendor-consolidation roadmap, decommissioning order, per-wave rollback approach
- **Exit signals:** the wave plan is reviewable and TSA-exit-aligned
- **Review gate:** `transition-plan`

### Stage 7 — Govern Risk, Compliance, And Culture

- **Entry signals:** wave plan is in place
- **Key questions:** what compliance posture applies post-integration (often broader than either estate had alone), what regulatory notifications are required by the deal, what data flows now cross new boundaries, what cultural / operational risks affect delivery
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`architecture-review`](../../skills/architecture-review.md)
- **Expected outputs:** post-integration compliance posture, regulatory notification record, integration risk register, cultural-risk register
- **Exit signals:** governance posture is current and accepted
- **Review gate:** `governance-review`

### Stage 8 — TSA Exit And Handover

- **Entry signals:** waves are executing; TSA exit is approaching
- **Key questions:** what TSA services still depend on the seller, what is the exit-readiness for each, what residual operational handover is needed, what decommissioning is now safe to execute
- **Recommended skills:** [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** TSA-exit readiness report, decommissioning execution, post-integration operational handover packet
- **Exit signals:** TSA dependencies are exited; the integrated estate is operating as one

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md) — orient if any prior diligence work exists
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md) — first for the acquired estate, then re-confirm the acquirer's
4. [`evidence-curator`](../../skills/evidence-curator.md)
5. [`relationship-mapper`](../../skills/relationship-mapper.md)
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`solution-modeler`](../../skills/solution-modeler.md)
9. [`transition-planner`](../../skills/transition-planner.md)
10. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
11. [`gap-radar`](../../skills/gap-radar.md) — sweep before each gate
12. [`architecture-review`](../../skills/architecture-review.md)
13. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `project-bootstrap` — confirm Day 1 posture and TSA scope
- `solution-direction` — confirm integration shape (identity, data, shared services)
- `decision-approval` — confirm rationalization decisions
- `governance-review` — confirm post-integration compliance and regulatory posture
- `transition-plan` — confirm wave plan and TSA exit alignment

## Patterns Likely To Apply

- **Identity / security:**
  - [identity-federation](../../patterns/security/identity-federation.md)
  - [service-to-service-identity](../../patterns/security/service-to-service-identity.md)
  - [zero-trust-network-segmentation](../../patterns/security/zero-trust-network-segmentation.md)
  - [privileged-access-segregation](../../patterns/security/privileged-access-segregation.md)
- **Data:**
  - [canonical-data-ownership](../../patterns/data/canonical-data-ownership.md)
  - [master-data-stewardship](../../patterns/data/master-data-stewardship.md)
  - [data-reconciliation](../../patterns/data/data-reconciliation.md)
  - [data-replication-and-cache-invalidation](../../patterns/data/data-replication-and-cache-invalidation.md)
  - [reference-data-management](../../patterns/data/reference-data-management.md)
- **Integration:**
  - [anti-corruption-layer](../../patterns/integration/anti-corruption-layer.md)
  - [request-response-integration](../../patterns/integration/request-response-integration.md)
  - [event-driven-integration](../../patterns/integration/event-driven-integration.md)
  - [outbox-pattern](../../patterns/integration/outbox-pattern.md)
- **Transition:**
  - [strangler-modernization](../../patterns/transition/strangler-modernization.md)
  - [coexistence-data-migration](../../patterns/transition/coexistence-data-migration.md)
  - [parallel-run](../../patterns/transition/parallel-run.md)
  - [phased-decommissioning](../../patterns/transition/phased-decommissioning.md)
  - [pilot-then-scale](../../patterns/transition/pilot-then-scale.md)
  - [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
- **Business:**
  - [portfolio-rationalization](../../patterns/business/portfolio-rationalization.md)

## Common Anti-Patterns

- **Assuming the acquirer's estate "wins" by default** — sometimes the acquired estate is better. Decide based on the synergy case, not org-chart politics.
- **Ignoring the TSA clock** — TSA exit dates are immovable; if the wave plan doesn't align, the seller starts charging premium rates or terminates services.
- **Deferring identity** — identity convergence is the longest-lead item in most integrations. Defer it and every other workstream stalls.
- **Integrating before deciding** — bridging two estates without first deciding rationalization creates permanent dual-stack debt.
- **Double licensing forever** — the synergy case usually depends on shutting down the losing vendor. Plan the contract end dates.
- **Vendor exit underestimated** — extracting data, configurations, or contracts from the losing vendor often takes longer than expected. Start early.
- **Compliance posture missed** — combined entity is often subject to broader compliance than either alone (DORA, SEC disclosure, sector limits). Re-baseline early.
- **Cultural displacement** — the acquired team often holds knowledge that exists nowhere else. Losing them mid-integration loses the integration.
- **Big-bang cutover** — most successful integrations are wave-based, not big-bang.
- **Skipping decommissioning** — leaving the losing systems running "just in case" creates a permanent shadow estate.
- **One-way data harmonization** — choosing one estate's data model and forcing migration without considering the operational impact on the other team.
- **Premature efficiency push** — pushing for layoff-driven cost synergies before the integration architecture is stable; loses both the synergies and the people.

## Entry Criteria

- the deal has closed or close is imminent
- TSA scope and exit dates are known (or being negotiated)
- a sponsor exists for the integration outcome at executive level
- access to the acquired estate's documentation, people, and systems is being arranged

## Exit Criteria

- TSA dependencies have exited cleanly within the agreed clock
- rationalization decisions have been executed (or explicitly deferred with named owner)
- integrated identity, data, and shared services are operational
- losing systems are decommissioned or on a named decommissioning path
- post-integration compliance posture is current and accepted
- the integrated estate is operating as one, with a steady-state operating model

## Cycling Stance

This playbook is **one-shot**. Once TSA exit is complete and the
integrated estate is operating, the work transitions to normal operations
(or to `migration-wave` if further modernization is planned, or to
`compliance-driven-modernization` if regulatory drivers continue).

Do not let this playbook run indefinitely — the TSA exit is the natural
close.

## What This Playbook Does Not Do

- It does not run the legal or HR side of integration (out of scope)
- It does not own commercial vendor negotiations (partner with procurement)
- It does not run divestiture or spin-out (the inverse problem)
- It does not produce the broader enterprise architecture (use `full-togaf-adm` after the integration stabilizes)

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) — most post-acquisition engagements begin with diligence material from before close.
2. Write a one-paragraph framing of the integration mandate into `notes.md` — what was acquired, why, the synergy case, the deadline.
3. Read the TSA — even briefly. The TSA scope and exit clock are the central constraints.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: what is operationally critical right now, what cannot break, what is the TSA exit clock per service, who in the acquired team holds what knowledge, who owns the integration outcome, what is the synergy case being measured against.
6. List both estates at the application level (acquirer + acquired). Even sparse is useful at this stage.
7. Resist any integration design. Stay in `inventory` until both estates are visible.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — `enterprise-and-solution`; rarely smaller for M&A integration.
- **Compliance scope** — set jurisdictions and regulations early; the combined entity often triggers obligations neither side had alone (DORA, SEC disclosure rules, sector concentration limits).
- **Roles** — keep `chief-architect`, `integration-architect`, `data-architect`, `security-architect`; add `domain-architect` for DDD-aligned estates; add `business-analyst` for vendor/contract inventory; engage `architecture-governance-lead` from day one.
- **Templates** — keep `transition-architecture`, `work-package`, `gap`, `decision`, `risk`, `compliance-assessment`; add `organization` for the combined operating model.
- **Default mode** — `inventory` is the right starting mode; do not switch to `modeling` until rationalization decisions are made.
- **Coordinator** — `coordinator_auto_route: false` for the duration; M&A integration needs explicit human decision points.
- **TSA milestones** — record TSA exit dates explicitly in `roadmap`; they are the immovable constraints.

## Decision Points

- **Keep acquirer's vs keep acquired's vs merge vs swap to third** — per overlap area, with synergy rationale.
- **Single-IdP vs dual-IdP-with-federation** — single is cleaner long-term, federation is faster short-term. Decide based on TSA clock and risk appetite.
- **Harmonize data model vs federate via ACL** — harmonization is cleaner but slower; federation via anti-corruption layer is faster but defers the data debt.
- **Vendor consolidation aggressive vs measured** — aggressive maximizes synergies but increases delivery risk; measured is safer but slower realization.
- **Decommissioning timing** — decommission as soon as functionally replaced, or batch-decommission at TSA exit. Batch is often cheaper but requires longer shadow operations.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- What is the TSA scope per service, and what are the exit dates?
- What is the synergy case the integration is being measured against?
- What is the steady-state target operating model?
- Where do the two estates overlap, clash, complement, conflict?
- Which vendor contracts have renewal or termination opportunities, and when?
- Which acquired-team members hold critical undocumented knowledge?
- What is the integrated identity strategy (single IdP, federated, dual-with-bridge)?
- What is the integrated data strategy (harmonize, federate, replicate, master)?
- What regulatory obligations apply to the combined entity that did not apply to either alone?
- What is the data-residency stance post-integration?
- What is the licensing impact and overlap (especially cloud, identity, security tools)?
- What is the decommissioning order, and what shadow operations are needed during coexistence?
- What is the cultural / talent retention plan for acquired-team members through TSA exit?
- What is the rollback approach if a Wave 1 cutover fails near the TSA clock?

## Recommended Diagrams

- Estate overlap map (acquirer × acquired matrix, by domain)
- Integration seam diagram (identity, data, processes, observability, billing)
- TSA exit timeline (services × exit dates × owners × dependencies)
- Wave plan (waves × estates × cutover points × rollback approaches)
- Vendor consolidation roadmap (current contracts × renewal/termination opportunities × consolidation targets)
- Post-integration operating model (combined teams, accountabilities, ownership)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, compliance scope, and role enablement.
4. Read the TSA. Record exit dates as a starting `roadmap` artifact.
5. Run [`baseline-discovery`](../../skills/baseline-discovery.md) on the acquired estate first.
6. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, paying particular attention to *Ownership Truthfulness Risks* (acquired-team handover) and *Drift Signals* (TSA-driven dates).

## Notes For Reviewers

When reviewing post-acquisition integration output:

- check that TSA exit dates are explicit and the wave plan honors them
- check that rationalization decisions have synergy rationale, not just preference
- check that identity strategy is decided before integration interfaces are designed
- check that the combined entity's compliance posture has been re-baselined
- check that decommissioning has an explicit order and timing
- check that critical acquired-team knowledge has been captured in `architect-work/evidence-requests.md` or beyond
- check that cultural and operational risks are named, not glossed over
- check that no "interim bridge" is being designed without an explicit removal date
