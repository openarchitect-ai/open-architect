# Cloud Migration Playbook

## Engagement Shape

- **Stance:** one-shot, transition-focused (with per-wave iteration during execution)
- **Default mode:** `analysis` (with disciplined moves to `modeling` per wave)
- **Typical duration:** months to a year for bootstrap; ongoing optimization thereafter
- **Output emphasis:** landing zone, 6Rs decisions per app, identity federation, FinOps signals from Day 1, exit posture

## When To Use

Use this playbook when:

- migrating to cloud (or rationalizing multi-cloud) is the strategic driver
- a landing zone needs designed (accounts, regions, networking, security baseline, governance)
- migration shape per application must be decided (the 6Rs: rehost / replatform / refactor / repurchase / retire / retain)
- identity federation to cloud needs designed
- FinOps and exit posture are first-class concerns from Day 1
- regulatory / residency / sovereignty constraints shape the cloud target

## When Not To Use

Do **not** use this playbook when:

- the estate is already on cloud and the work is optimization (use `tech-debt-remediation` or run a cloud-FinOps-focused engagement)
- general modernization where cloud is one element among many (use `migration-wave`)
- M&A integration that includes cloud (use `post-acquisition-integration`)
- AI platform on cloud (use `ai-platform-bootstrap`)
- data platform on cloud (use `data-platform-modernization`)
- developer platform on cloud (use `platform-engineering-bootstrap`)

## What Good Looks Like

- landing zone designed and operational (accounts, regions, network, security baseline, governance)
- 6Rs decision per application with rationale (cost, risk, time, strategic fit)
- identity federation from on-premises identity to cloud-native identity, operational
- FinOps signals from Day 1 — tagging, cost allocation, budget alerts, showback / chargeback
- security posture cloud-appropriate (zero-trust principles, IAM, key management, secrets, observability)
- exit posture documented (multi-cloud portability where applicable, data export, contract terms)
- Wave 1 application migrated end-to-end through the platform
- post-migration hypercare operable

## Stages

### Stage 1 — Frame The Migration

- **Entry signals:** sponsor exists (typically CIO, CTO, or CFO with cost-focus); strategic driver is clear (agility, vendor consolidation, datacenter exit, scale, AI readiness)
- **Key questions:** why cloud, why now, what is in scope, what is the timeline, what is the cost stance, what regulatory constraints apply, what is the target cloud (single, multi, hybrid)
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** migration charter, sponsor, scope, timeline, target cloud stance, regulatory frame
- **Exit signals:** the charter is reviewable by the sponsor

### Stage 2 — Baseline The Estate

- **Entry signals:** scope is bounded
- **Key questions:** what applications exist in scope, what are their dependencies, where does their data live (and with what classification), what compliance constraints apply, what is the current cost (TCO), what is the operational state
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`evidence-curator`](../../skills/evidence-curator.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** application inventory, dependency map, data classification, compliance constraints per app, current-TCO baseline
- **Exit signals:** every in-scope application has enough evidence to decide its migration shape

### Stage 3 — Design The Landing Zone

- **Entry signals:** baseline is in hand
- **Key questions:** how are accounts / subscriptions structured (per environment, per business unit, per workload class), which regions are used and why, what is the network topology (hub-spoke, mesh, segmented), what is the security baseline (IAM, key management, logging, network controls), what is the governance baseline (tagging, policy as code, drift detection)
- **Recommended skills:** [`technology-environment-modeler`](../../skills/technology-environment-modeler.md), [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** landing zone design (account structure, regions, network, security baseline, governance baseline), rationale, consequences
- **Exit signals:** the landing zone is reviewable and operable
- **Review gate:** `solution-direction`

### Stage 4 — Decide Migration Shape Per Application (6Rs)

- **Entry signals:** landing zone is decided
- **Key questions:** per application — rehost (lift-and-shift), replatform (lift-and-tinker), refactor (architectural change), repurchase (SaaS replacement), retire (decommission), retain (stay on-prem); what are the cost / risk / time trade-offs per choice
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** 6Rs decision per application with cost / risk / time rationale, dependencies between decisions
- **Exit signals:** the migration shape decisions are reviewable
- **Review gate:** `decision-approval`

### Stage 5 — Design Identity Federation

- **Entry signals:** landing zone is in place
- **Key questions:** what is the on-premises identity source of truth, how does it federate to cloud-native IAM, what is the workload identity model (machine-to-machine, cross-cloud, hybrid), what is the joiner-mover-leaver flow into cloud, what is the break-glass model
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** identity federation architecture, workload identity model, JML cloud flow, break-glass design
- **Exit signals:** identity is reviewable and operational

### Stage 6 — Plan Migration Waves

- **Entry signals:** landing zone, 6Rs decisions, and identity are in place
- **Key questions:** what ships in Wave 1 (often: landing zone validation + one low-risk app), what dependencies sequence the waves, what is the cutover-rehearsal approach per wave, what is the rollback approach
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** wave plan with success criteria, cutover rehearsal, rollback approach, hypercare scope
- **Exit signals:** the wave plan is reviewable
- **Review gate:** `transition-plan`

### Stage 7 — Establish FinOps + Governance

- **Entry signals:** wave plan is in place
- **Key questions:** what is the tagging policy (and enforcement), what is the cost allocation / showback / chargeback model, what are budget alerts and anomaly detection, what is the policy-as-code approach for guardrails, what is the drift detection model
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** FinOps approach (tagging, allocation, budgets, alerts), policy-as-code guardrails, drift detection
- **Exit signals:** governance and FinOps are operable from Day 1, not Year 2
- **Review gate:** `governance-review`

### Stage 8 — Wave 1 Migration Slice

- **Entry signals:** FinOps and governance are in place
- **Key questions:** which application is Wave 1, what is the success measure, what is the rollback if it fails, what is the hypercare ownership and duration, what does success teach us about subsequent waves
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`transition-planner`](../../skills/transition-planner.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Wave 1 application live in cloud through the platform, success measure achieved, hypercare runbook executed, lessons captured for Wave 2+
- **Exit signals:** the pilot has shipped and demonstrated the migration approach
- **Review gate:** `transition-plan` per wave

### Stage 9 — Ongoing (Continuous Optimization, Hypercare, Exit Posture)

- **Entry signals:** Wave 1 is live; remaining waves execute
- **Key questions:** how is cost optimized continuously (rightsizing, reserved capacity, spot, savings plans), how is hypercare staffed per wave, how is exit posture maintained (data export readiness, contract term reviews), how is multi-cloud portability tested if applicable
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`gap-radar`](../../skills/gap-radar.md) (modernity emphasis), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** ongoing optimization, hypercare delivery, exit posture maintained, multi-cloud portability tested (if applicable)
- **Exit signals:** the cloud estate is healthy and sustainable

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`relationship-mapper`](../../skills/relationship-mapper.md)
5. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
6. [`option-evaluator`](../../skills/option-evaluator.md) — primary skill for 6Rs decisions
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md) — primary skill for landing zone
9. [`solution-modeler`](../../skills/solution-modeler.md)
10. [`application-interface-modeler`](../../skills/application-interface-modeler.md)
11. [`transition-planner`](../../skills/transition-planner.md)
12. [`gap-radar`](../../skills/gap-radar.md)
13. [`architecture-review`](../../skills/architecture-review.md)
14. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm estate baseline and constraints
- `solution-direction` — confirm landing zone design
- `decision-approval` — confirm 6Rs decisions per application
- `governance-review` — confirm FinOps and governance baseline
- `transition-plan` — confirm wave plan and per-wave readiness

## Patterns Likely To Apply

- **Transition / migration:**
  - [strangler-modernization](../../patterns/transition/strangler-modernization.md)
  - [coexistence-data-migration](../../patterns/transition/coexistence-data-migration.md)
  - [parallel-run](../../patterns/transition/parallel-run.md)
  - [phased-decommissioning](../../patterns/transition/phased-decommissioning.md)
  - [pilot-then-scale](../../patterns/transition/pilot-then-scale.md)
  - [cutover-rehearsal](../../patterns/transition/cutover-rehearsal.md)
  - [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
  - [cutover-command-center](../../patterns/transition/cutover-command-center.md)
  - [post-cutover-hypercare](../../patterns/transition/post-cutover-hypercare.md)
- **Technology / runtime:**
  - [multi-region-failover](../../patterns/technology/multi-region-failover.md)
  - [active-active-vs-active-passive](../../patterns/technology/active-active-vs-active-passive.md)
  - [blue-green-canary-deployment](../../patterns/technology/blue-green-canary-deployment.md)
  - [environment-promotion](../../patterns/technology/environment-promotion.md)
  - [graceful-degradation](../../patterns/technology/graceful-degradation.md)
  - [observability-by-design](../../patterns/technology/observability-by-design.md)
- **Cost and tenancy:**
  - [cost-allocation-and-showback](../../patterns/technology/cost-allocation-and-showback.md)
  - [cost-optimized-environment-tiering](../../patterns/technology/cost-optimized-environment-tiering.md)
  - [platform-tenancy-isolation](../../patterns/technology/platform-tenancy-isolation.md)
- **Security:**
  - [identity-federation](../../patterns/security/identity-federation.md)
  - [workload-identity-federation](../../patterns/security/workload-identity-federation.md)
  - [zero-trust-network-segmentation](../../patterns/security/zero-trust-network-segmentation.md)
  - [service-to-service-identity](../../patterns/security/service-to-service-identity.md)
  - [cross-boundary-data-sharing-controls](../../patterns/security/cross-boundary-data-sharing-controls.md)
  - [secrets-and-configuration-management](../../patterns/technology/secrets-and-configuration-management.md)
  - [secrets-rotation](../../patterns/technology/secrets-rotation.md)
- **Data:**
  - [data-residency-and-sovereignty](../../patterns/data/data-residency-and-sovereignty.md)
  - [data-classification-and-handling](../../patterns/data/data-classification-and-handling.md)

## Common Anti-Patterns

- **Lift-and-shift everything** — cloud bill arrives, savings vanish; applications that should refactor get rehosted.
- **No landing zone** — every team rolls its own accounts, security, network; no consistency, no governance.
- **FinOps as Year 2 problem** — Year 1 surprise overruns; remediation is harder than prevention would have been.
- **Identity not federated** — silos persist; users authenticate twice, breakage at every interface.
- **Vendor lock-in pretended away** — "we're cloud-agnostic" with vendor-specific services in production.
- **Exit posture untested** — claimed portability that nobody has verified works.
- **Compliance as afterthought** — residency / sovereignty / sector rules surface mid-migration, forcing rework.
- **Migration without rollback rehearsal** — first time tested is the cutover itself; outage at scale.
- **6Rs decisions made without dependency analysis** — application A retired, but application B still calls it.
- **Replatform without architectural review** — moves problems intact instead of fixing them.
- **Single-cloud commitment without explicit decision** — multi-cloud cost paid without multi-cloud benefit, or vice versa.
- **Tagging policy without enforcement** — cost allocation impossible because tags are missing.
- **Policy as code as PowerPoint** — guardrails declared, not enforced; drift accumulates.
- **No hypercare** — Wave 1 migrates, team disbands, incidents land on operators with no context.
- **Cost optimization deferred** — running cloud like a datacenter, no rightsizing, no commitment plans.
- **Data sovereignty assumed, not verified** — vendor region claims taken at face value, audit later finds gaps.

## Entry Criteria

- a sponsor exists for the migration outcome (typically CIO, CTO, CFO)
- the strategic driver is clear (agility, vendor consolidation, datacenter exit, scale, AI readiness)
- baseline visibility into the estate exists or can be gathered
- a target cloud direction is at least directionally chosen (single, multi, hybrid)
- there is appetite for FinOps and governance from Day 1, not Year 2

## Exit Criteria (Bootstrap)

- landing zone is operational
- 6Rs decisions are recorded per application with rationale
- identity federation is operable
- FinOps signals are live (tagging, allocation, budgets, alerts)
- Wave 1 application has migrated through the platform end-to-end
- hypercare runbook is operable
- exit posture is documented
- onboarding runbook exists for Wave 2+

## Cycling Stance

This playbook is **one-shot for the planned migration**, but per-wave iteration is the norm during execution. Each wave passes through its own review gates and may re-baseline as evidence comes in.

After the planned migration is complete, ongoing optimization continues (FinOps, hypercare, exit posture maintenance). Future cloud work (new applications, multi-cloud expansion) is typically handled as fresh engagements.

## What This Playbook Does Not Do

- It does not modernize the applications beyond the chosen 6Rs shape — refactor work that goes beyond architectural change belongs to a `quick-solution-design` per app
- It does not stand up the developer platform — use `platform-engineering-bootstrap`
- It does not stand up the data platform — use `data-platform-modernization`
- It does not handle AI workloads specifically — use `ai-platform-bootstrap`
- It does not handle a specific incident — use `post-incident-architecture-review`

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior cloud work exists.
2. Write a one-paragraph migration charter into `notes.md` — why cloud, why now, target cloud(s), timeline, cost stance.
3. Take an initial position on single-cloud vs multi-cloud vs hybrid. Provisional is fine.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the sponsor, what is the target cloud, what is the datacenter exit timeline, what regulatory residency applies, what is the current TCO, what is the cloud cost stance, what is the identity source of truth.
6. List the top 10 applications in scope and a candidate 6R for each (provisional).
7. Resist designing the landing zone until baseline is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — usually `enterprise-and-solution`; rarely smaller for cloud migration.
- **Compliance scope** — set jurisdictions, regulations, residency early; cloud migration in regulated estates needs `governance-review` from Day 1. GDPR, sectoral residency, financial-services regs all common.
- **Target cloud stance** — declare early: single (AWS / Azure / GCP / OCI), multi, hybrid. Affects the rest.
- **Roles** — keep `chief-architect`, `technology-architect`, `security-architect`, `solution-architect`; add `data-architect` for data-heavy migrations; add `architecture-governance-lead` for FinOps governance.
- **Templates** — keep `application`, `environment`, `technology-component`, `technology-standard`, `decision`, `transition-architecture`, `work-package`, `risk`, `compliance-assessment`; principle for landing zone guardrails.
- **Default mode** — `analysis` is correct; switch to `modeling` only per wave.
- **Coordinator** — `coordinator_auto_route: false`; cloud migration is decision-heavy and needs explicit human routing.
- **FinOps maturity ambition** — declare early: visibility (tagging + showback), allocation (chargeback), optimization (rightsizing, RIs, savings plans). More mature = more Stage 7 work.
- **Exit posture strictness** — none (accept lock-in), API-parity portability, full data export portability. Each level costs more upfront.

## Decision Points

- **Single-cloud vs multi-cloud vs hybrid** — depends on risk appetite, regulatory drivers, vendor leverage.
- **Region strategy** — single-region (cheapest, simplest), multi-region active-passive (failover), multi-region active-active (most complex, highest availability).
- **Account / subscription structure** — flat (simpler), per-environment, per-business-unit, per-workload-class. Most orgs land on a 2-axis structure (env × BU).
- **Network topology** — hub-spoke (centralized control), mesh (autonomy), zoned (security-driven). Hub-spoke is most common.
- **Identity strategy** — federation (on-prem IdP federates to cloud) vs cloud-native (cloud IdP is the source of truth) vs hybrid.
- **6Rs default leaning** — rehost-first (fast, less savings) vs replatform-first (more effort, more savings) vs refactor-first (most effort, most strategic).
- **FinOps maturity ambition** — visibility, allocation, optimization. Pick by realistic operating-model maturity.
- **Exit posture bar** — accept lock-in vs API parity vs full data portability.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the sponsor with funding authority for the migration?
- What is the target cloud (single / multi / hybrid), and why?
- What is the datacenter exit timeline (if applicable)?
- What regulatory residency / sovereignty applies (per data class, per jurisdiction)?
- What is the current TCO baseline, and what is the cloud cost stance?
- What is the identity source of truth, and how does it federate to cloud?
- What is the network topology preference (hub-spoke, mesh, zoned)?
- What is the FinOps maturity ambition (visibility, allocation, optimization)?
- What is the exit posture bar (accept lock-in, API parity, full data portability)?
- Which applications are in scope, and what is the candidate 6R for each?
- What is the cutover-rehearsal expectation per wave?
- What is the hypercare model (ownership, duration)?
- What is the rollback approach for a wave that fails?

## Recommended Diagrams

- Landing zone diagram (accounts × regions × network × security baseline × governance)
- 6Rs decision matrix (applications × cost × risk × time × strategic fit × chosen R)
- Identity federation flow (on-prem IdP → federation → cloud IdP → workload identity → resources)
- Wave timeline (waves × applications × dependencies × success criteria × hypercare exit)
- FinOps signal flow (tagging → allocation → budgets → alerts → optimization actions)
- Network topology view (hub-spoke / mesh / zoned, with trust boundaries)
- Exit posture map (vendor-specific surfaces × portable surfaces × export paths)
- Cutover sequence per Wave 1 (rehearsal → cutover → rollback decision points → hypercare → exit criteria)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, compliance scope (most cloud migrations need GDPR / residency in scope at minimum), and target cloud stance.
4. Run [`baseline-discovery`](../../skills/baseline-discovery.md) on the estate before designing the landing zone.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Present-Day Standards Gaps* (FinOps, observability ownership, secret rotation, BCP/DR posture) and *Drift Signals* (residency claims vs reality).

## Notes For Reviewers

When reviewing cloud migration output:

- check that the landing zone is operational, not just designed
- check that 6Rs decisions have evidence (cost, risk, time), not just preference
- check that identity federation is operable end-to-end
- check that FinOps signals are live from Day 1
- check that exit posture is documented and (at the chosen bar) tested
- check that cutover-rehearsal has been done before each wave
- check that hypercare ownership is named and duration is bounded
- check that residency / sovereignty claims have been verified, not assumed
- check that compliance has been reviewed at landing-zone design time, not after
- check that the planning did not silently assume lift-and-shift for everything
- check that tagging policy is enforced, not just declared
