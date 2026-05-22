# Divestiture Separation Playbook

## Engagement Shape

- **Stance:** one-shot, time-bounded by TSA forward (you are the seller providing transitional services to the buyer)
- **Default mode:** `analysis` initially, then `modeling` per separation slice
- **Typical duration:** months — often longer than acquisition because separation cost falls on the seller
- **Output emphasis:** carve-out boundary, TSA forward design, identity and data separation, decommissioning plan for shared services, standalone architecture for the carved-out unit at TSA exit

## When To Use

Use this playbook when:

- you are the seller, divesting a business unit (full divestiture, carve-out, spin-out)
- shared services must be carved out — identity, finance, HR, data, infrastructure, applications, integrations
- a TSA forward (you provide services to the buyer for a limited time) needs designed
- the carved-out unit must operate independently by TSA exit
- the divestiture has regulatory or competitive sensitivities (data segregation, employee transition, customer notice)

## When Not To Use

Do **not** use this playbook when:

- you are being acquired (use `acquisition-due-diligence` pre-close, `post-acquisition-integration` post-close)
- internal reorganization without actual sale (different shape — typically a `migration-wave` or `tech-debt-remediation`)
- selling assets only, not a going-concern business (much simpler engagement, often a `vendor-evaluation-and-selection`-shaped data export)
- pure spin-off into a sister entity under the same parent (intra-group separation; lighter shape)

## What Good Looks Like

- explicit carve-out boundary — what stays with seller, what goes with buyer, what is shared during TSA
- TSA forward design — what services seller provides, for how long, at what cost, with what exit criteria
- identity and data separation plan with explicit cutover points
- decommissioning plan for shared services that lose their consumer at TSA exit
- standalone architecture for the carved-out unit — operable after TSA without seller dependency
- contracts cleanly assigned, novated, or terminated
- key-person allocation explicit (who stays with seller, who goes with buyer)
- TSA exit criteria measurable and time-bound

## Stages

### Stage 1 — Frame The Divestiture

- **Entry signals:** the deal has been announced or is imminent; sponsor exists at executive level on the seller side
- **Key questions:** what is the deal context, what is the carved-out unit's boundary (which products, lines of business, customers, employees), what is the deal timeline, what is the TSA timeline ambition, who is the decision authority on the seller side, who is the counterpart on the buyer side
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** separation charter, sponsor, carved-out unit boundary, deal and TSA timelines, decision authority
- **Exit signals:** the charter is reviewable by the executive sponsor

### Stage 2 — Baseline Shared Services

- **Entry signals:** charter is in hand
- **Key questions:** what shared services cross the boundary today — identity, finance, HR, data, infrastructure, applications, integrations, vendors, contracts; which are critical, which are merely convenient; what is the operational reality (cost, performance, dependencies)
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** shared-service inventory (what crosses the boundary), criticality classification, dependency map
- **Exit signals:** the seller and buyer can both see the same baseline

### Stage 3 — Decide Carve-Out Shape Per Service

- **Entry signals:** baseline is in hand
- **Key questions:** per shared service — separate (clone for the carved-out unit), share-via-TSA (seller provides for a defined period), retain (stays with seller permanently; carved-out unit must source elsewhere), decommission (no longer needed after carve-out); what is the cost of each choice; what is the regulatory constraint
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** carve-out decisions per service with rationale, cost implications, regulatory constraints
- **Exit signals:** the chosen direction per service is decided
- **Review gate:** `decision-approval`

### Stage 4 — Design Identity And Data Separation

- **Entry signals:** carve-out shape decisions are in place
- **Key questions:** how does the carved-out unit get its own identity provider, how does identity hand off from seller to buyer (employees, contractors, partners, service accounts, workloads), how is data segregated (extraction, cleansing of seller-only context, residency), what is the consent / notification model for customer data
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`data-modeler`](../../skills/data-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** identity separation design with cutover points, data separation design with classification / residency / consent, integration cutovers (what stops, what stays via TSA)
- **Exit signals:** identity and data separation are reviewable
- **Review gate:** `solution-direction`

### Stage 5 — Plan TSA Forward

- **Entry signals:** carve-out and identity / data designs are in place
- **Key questions:** what services does the seller provide post-close, for how long, at what cost, with what SLA, with what exit criteria per service, who owns operational interfaces during TSA, what is the protection of seller's other operations from buyer activity
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** TSA forward design — service catalog, duration, cost, SLA, exit criteria per service, operational interface owners, protective measures
- **Exit signals:** TSA forward is reviewable and ties to the deal documents

### Stage 6 — Plan Standalone Architecture For The Carved-Out Unit

- **Entry signals:** TSA forward is designed
- **Key questions:** what does the carved-out unit's architecture look like at TSA exit, what does it need to procure / build / migrate to before TSA exit, what is the rollback approach if it can't stand alone in time
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`transition-planner`](../../skills/transition-planner.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** post-TSA standalone architecture, procurement / build / migration plan, rollback approach
- **Exit signals:** the carved-out unit has a credible standalone shape

### Stage 7 — Plan Decommissioning Of Shared Services

- **Entry signals:** standalone architecture is in place
- **Key positions:** which shared services lose their consumer at TSA exit, what is the decommissioning order, what is the cost recovery profile (seller saves cost as services retire), what is the post-decommissioning support model
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** decommissioning plan for shared services, cost recovery profile, support model
- **Exit signals:** the seller has a clean path forward post-TSA

### Stage 8 — Execute Carve-Out Waves

- **Entry signals:** plans are in place; deal close approaches or has occurred
- **Key positions:** what ships in Wave 1, what is the cutover-rehearsal, what is the rollback at each wave, what is the buyer's reality vs the plan
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** carve-out waves executed; identity, data, integrations separated wave by wave; hypercare per wave
- **Exit signals:** the carved-out unit is operating with its own identity and data
- **Review gate:** `transition-plan`

### Stage 9 — TSA Exit

- **Entry signals:** TSA forward is approaching its end
- **Key positions:** are all TSA exit criteria met, what services can be terminated cleanly, what services have legitimate extension needs, what is the final separation event
- **Recommended skills:** [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** TSA exit readiness report per service, formal close-out, residual obligations register
- **Exit signals:** the carved-out unit is standalone; the seller has retired shared services

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`relationship-mapper`](../../skills/relationship-mapper.md)
5. [`option-evaluator`](../../skills/option-evaluator.md)
6. [`decision-recorder`](../../skills/decision-recorder.md)
7. [`solution-modeler`](../../skills/solution-modeler.md)
8. [`data-modeler`](../../skills/data-modeler.md)
9. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
10. [`transition-planner`](../../skills/transition-planner.md) — primary skill for this engagement (separation is the inverse of integration)
11. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
12. [`gap-radar`](../../skills/gap-radar.md)
13. [`architecture-review`](../../skills/architecture-review.md)
14. [`architecture-documenter`](../../skills/architecture-documenter.md)
15. [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)

## Review Gates That Apply

- `requirement-baseline` — confirm carve-out boundary and shared-service baseline
- `solution-direction` — confirm identity / data separation design
- `decision-approval` — confirm carve-out shape decisions per service
- `governance-review` — confirm regulatory and compliance posture for the seller and the carved-out unit
- `transition-plan` — confirm wave plan and TSA exit readiness

## Patterns Likely To Apply

- **Identity and security:**
  - [identity-federation](../../patterns/security/identity-federation.md)
  - [identity-proofing-and-joiner-mover-leaver](../../patterns/security/identity-proofing-and-joiner-mover-leaver.md)
  - [workload-identity-federation](../../patterns/security/workload-identity-federation.md)
  - [privileged-access-segregation](../../patterns/security/privileged-access-segregation.md)
  - [security-zones-and-trust-boundaries](../../patterns/security/security-zones-and-trust-boundaries.md)
- **Data:**
  - [canonical-data-ownership](../../patterns/data/canonical-data-ownership.md)
  - [data-domain-ownership](../../patterns/data/data-domain-ownership.md)
  - [data-classification-and-handling](../../patterns/data/data-classification-and-handling.md)
  - [data-residency-and-sovereignty](../../patterns/data/data-residency-and-sovereignty.md)
  - [data-sharing-agreement-governance](../../patterns/data/data-sharing-agreement-governance.md)
  - [regulated-data-retention-and-legal-hold](../../patterns/data/regulated-data-retention-and-legal-hold.md)
- **Transition (separation is the inverse of integration):**
  - [strangler-modernization](../../patterns/transition/strangler-modernization.md)
  - [coexistence-data-migration](../../patterns/transition/coexistence-data-migration.md)
  - [parallel-run](../../patterns/transition/parallel-run.md)
  - [phased-decommissioning](../../patterns/transition/phased-decommissioning.md)
  - [parallel-operations-closure](../../patterns/transition/parallel-operations-closure.md)
  - [legacy-interface-sunset](../../patterns/transition/legacy-interface-sunset.md)
  - [legacy-batch-sunset](../../patterns/transition/legacy-batch-sunset.md)
  - [dual-write-containment](../../patterns/transition/dual-write-containment.md)
  - [cutover-rehearsal](../../patterns/transition/cutover-rehearsal.md)
  - [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
  - [transition-hypercare-exit-criteria](../../patterns/transition/transition-hypercare-exit-criteria.md)
- **Business:**
  - [portfolio-rationalization](../../patterns/business/portfolio-rationalization.md)
  - [application-invest-tolerate-migrate-eliminate](../../patterns/business/application-invest-tolerate-migrate-eliminate.md)

## Common Anti-Patterns

- **TSA scope creep** — buyer keeps asking for "one more service" beyond the agreed catalog; seller subsidizes buyer.
- **TSA forward with no exit criteria** — services drift on indefinitely; seller can't retire shared services.
- **Shared services retained "because it's complicated"** — never separated; seller carries the cost forever.
- **Identity separation deferred until last** — it's the longest-lead item; deferring breaks every other workstream.
- **Data ownership unclear at separation** — both sides claim it (or neither); compliance failure inbound.
- **No carve-out compliance baseline** — the carved-out unit has its own regulatory obligations that weren't covered when it was part of the seller; surprise audit.
- **Contracts left in the seller's name forever** — vendor pricing, customer notice, employment all entangled.
- **Key people retained without clear allocation** — both sides assume someone stays with them; the person walks away.
- **Post-TSA standalone architecture not designed before TSA close** — buyer cannot stand alone; TSA gets extended at premium pricing.
- **TSA priced incorrectly** — seller subsidizes buyer's run cost or overcharges and creates buyer resentment; both bad.
- **No protection of seller's other operations** — TSA activity bleeds into seller's other lines (data, identity, capacity); blast radius escapes the carve-out.
- **Data retention obligations missed at separation** — seller still holds regulated data on behalf of carved-out unit but no legal basis; carve-out doesn't take its data; retention violations on both sides.
- **Cutover rehearsal skipped** — first time tested is the real separation; outage at scale.
- **No residual obligations register** — post-TSA obligations (warranties, IP, ongoing licenses) forgotten until they surface as disputes.
- **Cultural / employee experience ignored** — the carved-out unit's people don't know which systems are theirs vs the seller's; mistakes follow.

## Entry Criteria

- the deal has been announced or is imminent
- an executive sponsor exists on the seller side
- the carved-out unit's boundary can be described (which products, customers, employees, lines of business)
- access to seller's shared services is unconstrained on the architecture side
- there is appetite to design the seller's post-TSA shape, not just unblock the buyer

## Exit Criteria

- carved-out unit operates with its own identity and data
- TSA forward has reached its agreed exit
- shared services that lost their consumer have been decommissioned (or have an explicit retention plan)
- residual obligations register is in place
- contracts have been assigned, novated, or terminated cleanly
- compliance posture is current for both seller (post-divestiture estate) and carved-out unit (new entity obligations)
- the engagement closes with a defensible post-divestiture state on both sides

## Cycling Stance

This playbook is **one-shot per divestiture**. Once the carved-out unit is standalone and TSA forward has exited, the engagement closes.

If the seller pursues further divestitures, run a fresh engagement per deal.

## What This Playbook Does Not Do

- It does not run the deal negotiation — that is the M&A function (this playbook supplies the technical input)
- It does not handle financial / legal separation — partner with finance and legal
- It does not handle HR separation at the people level — partner with HR (this playbook surfaces architectural implications)
- It does not own the buyer's side — the buyer runs their own integration playbook (`post-acquisition-integration`)
- It does not handle internal reorganization without actual sale — different shape (use `migration-wave` or `tech-debt-remediation`)

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior divestiture preparation exists.
2. Write a one-paragraph separation charter into `notes.md` — what is being divested, when, with what TSA ambition.
3. Read the deal documents — even briefly. The carve-out boundary, TSA exit date, and protective clauses are central constraints.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the carved-out unit boundary owner, what is the TSA forward duration ambition, who in the carved-out unit holds critical knowledge, who is the buyer's counterpart, what regulatory shifts apply to the post-divestiture seller and the new carved-out entity.
6. List shared services across major categories (identity, finance, HR, data, infrastructure, applications, integrations, vendors) — at least at the category level.
7. Resist designing separations until the carve-out boundary is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — `enterprise-and-solution`; rarely smaller for divestiture.
- **Compliance scope** — set carefully — the post-divestiture seller and the carved-out unit will each have their own obligations. GDPR, financial-services, sector regs typically all in play.
- **Roles** — keep `chief-architect`, `architecture-governance-lead`, `business-analyst`, `solution-architect`, `data-architect`, `integration-architect`, `security-architect`, `technology-architect`; engage `architecture-governance-lead` from Day 1.
- **Templates** — keep `transition-architecture`, `work-package`, `gap`, `decision`, `risk`, `compliance-assessment`, `organization`; `application` and `data-object` for the shared-service inventory.
- **Default mode** — `inventory` initially, then `analysis`, then `modeling` per separation slice.
- **Coordinator** — `coordinator_auto_route: false`; divestiture decisions are high-stakes and need explicit routing.
- **TSA forward ambition** — declare early. Short (6 months, more risk for the carved-out unit) vs long (24 months, more seller carrying cost). Most land at 12 months.
- **Compliance re-baseline trigger** — set explicit checkpoints during separation when compliance is reviewed for both sides.

## Decision Points

- **TSA forward duration** — short (≤12 months, harder for buyer) vs long (≥18 months, seller carrying cost longer). Pick based on buyer maturity and shared-service complexity.
- **Carve-out shape per service** — separate / share-via-TSA / retain / decommission. The default per service should be explicit, not implicit.
- **Identity separation timing** — early in the wave plan (longest-lead item) vs phased per workstream. Early is safer.
- **Data ownership stance** — clean separation (cleaner, more effort) vs shared-with-rights-and-restrictions (more flexibility, more legal risk).
- **Decommissioning aggressiveness** — decommission as soon as functionally orphaned vs batch-decommission at TSA exit. Batch is often cheaper but requires longer shadow operations.
- **TSA pricing model** — at-cost (transparent, no margin) vs cost-plus (margin to cover seller carrying cost) vs fixed-fee (predictable for buyer, risk for seller). Each affects relationship dynamics.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- What is the carved-out unit's exact boundary (products, customers, employees, lines of business)?
- What is the deal close date, and what is the TSA forward duration ambition?
- Which shared services are most critical to the carved-out unit?
- Which shared services lose their consumer entirely at TSA exit?
- What is the identity separation strategy (full clone, federation during TSA, etc.)?
- What is the data separation strategy (full clone, shared with rights, partial)?
- What are the regulatory shifts for the post-divestiture seller and the new carved-out entity?
- What are the contractual entanglements (vendor, customer, employment) that need to be cleaned up?
- What is the TSA pricing model?
- What are the TSA exit criteria per service?
- Who is the buyer's counterpart for the separation work?
- What is the rollback approach if a wave fails close to TSA exit?
- What is the residual-obligations register stance?

## Recommended Diagrams

- Carve-out boundary diagram (seller side / buyer side / shared during TSA)
- Shared-service map (identity / finance / HR / data / infrastructure / applications / integrations / vendors)
- TSA forward service catalog (service × duration × cost × SLA × exit criteria × owner)
- Identity separation flow (single IdP → seller IdP + buyer IdP, with cutover points)
- Data separation flow (shared data store → seller data + buyer data, with classification and residency)
- Wave plan timeline (waves × services separated × cutover rehearsal × hypercare exit)
- Decommissioning roadmap (shared services × consumer departure × decommissioning date × cost recovery)
- Residual obligations map (post-TSA obligations × type × duration × owner)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, compliance scope, and role enablement.
4. Read the deal documents. Record TSA exit date as a starting `roadmap` artifact.
5. Run [`baseline-discovery`](../../skills/baseline-discovery.md) on shared services first.
6. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Drift Signals* (TSA dates), *Ownership Truthfulness Risks* (carved-out unit knowledge), and *Cross-Artifact Consistency Checks* (shared-service ownership).

## Notes For Reviewers

When reviewing divestiture separation output:

- check that TSA exit criteria are explicit per service, with timeline
- check that identity and data separation are designed for the long lead, not deferred
- check that the post-TSA standalone architecture is designed *before* TSA close
- check that contracts have an assignment / novation / termination plan
- check that key-person allocation is named (no ambiguity)
- check that the post-divestiture compliance posture is re-baselined for both sides
- check that the decommissioning plan has owners and dates, not just intent
- check that no "interim bridge" is being designed without an explicit retirement date
- check that TSA pricing won't surprise either party
- check that the seller's other operations are protected from TSA bleed
