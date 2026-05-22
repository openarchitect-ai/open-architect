# Platform Engineering Bootstrap Playbook

## Engagement Shape

- **Stance:** quasi-cyclic — bootstrap is one-shot, but the platform evolves with each new use case and team
- **Default mode:** `analysis` (with disciplined moves to `modeling` per platform layer or golden path)
- **Typical duration:** months for bootstrap; ongoing thereafter
- **Output emphasis:** internal developer platform with golden paths, self-service, observability, and platform-as-product operating model

## When To Use

Use this playbook when:

- standing up an internal developer platform (IDP) for many product teams
- delivering golden paths (paved roads) to reduce cognitive load on development teams
- moving from ticket-based ops to self-service for environments, deploys, secrets, observability
- consolidating platform tooling (CI/CD, runtime, observability, secrets, access control)
- a shared platform team will support multiple stream-aligned teams
- developer experience and time-to-production are explicit success measures

## When Not To Use

Do **not** use this playbook when:

- the engagement is one bounded application's design (use `quick-solution-design`)
- the engagement is a data platform (use `data-platform-modernization`)
- the engagement is an AI platform (use `ai-platform-bootstrap`)
- the platform exists and is mature; the work is feature-level evolution (use `quick-solution-design`)
- the engagement is estate-wide modernization unrelated to platform engineering (use `migration-wave`)

## What Good Looks Like

- defined golden paths for the top developer journeys (provision, build, deploy, observe, secure)
- genuine self-service — environments, deploys, secrets, observability without tickets
- platform-as-product mindset (developers are customers, not subjects)
- explicit team topologies (platform, stream-aligned, enabling, complicated-subsystem)
- platform observability operating model — telemetry, SLOs, on-call
- explicit SLOs for platform services
- onboarding path from "new product team" to "shipping" measured in days, not months
- exception path for teams whose needs the paved road doesn't fit

## Stages

### Stage 1 — Frame The Platform

- **Entry signals:** sponsor exists; the strategic driver (cognitive load, time-to-production, consolidation, cost) is clear
- **Key questions:** who is the platform's customer (which teams, which roles), what does success look like, what is in scope, what cognitive load are we reducing
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** customer-team list, objectives, scope, success measures (time-to-production, ticket reduction, onboarding time)
- **Exit signals:** the platform charter is reviewable by the sponsor

### Stage 2 — Baseline The Current Developer Experience

- **Entry signals:** scope is bounded
- **Key questions:** what pain points exist today, what tooling is already in play, where do teams differ, what shadow platforms exist, what is the current onboarding journey
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** developer-experience baseline, tooling inventory, pain-point register, onboarding journey map
- **Exit signals:** the team can name the top 5 pain points and the top 3 tools to consolidate

### Stage 3 — Define Team Topologies And Operating Model

- **Entry signals:** baseline is understood
- **Key questions:** what is the platform team's shape, how do stream-aligned teams interact with it, what enabling teams exist, what is the X-as-a-service stance, where are the exception paths
- **Recommended skills:** [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** team topology map, operating model decisions, interaction patterns
- **Exit signals:** the topology is reviewable and accepted by the impacted teams

### Stage 4 — Decide Platform Shape

- **Entry signals:** operating model is decided
- **Key questions:** build vs buy vs assemble, managed cloud vs self-hosted, single-vendor vs best-of-breed, Kubernetes vs serverless vs hybrid, what is the cost stance
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** platform-shape decisions with rationale, build/buy stance per layer, cost stance
- **Exit signals:** the chosen shape is defensible
- **Review gate:** `decision-approval`

### Stage 5 — Design Golden Paths

- **Entry signals:** platform shape is decided
- **Key questions:** what are the top 3–5 developer journeys, what does the paved road look like per journey, what is the friction we are removing, what is the exception path
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md)
- **Expected outputs:** golden path designs per journey (provision, build, deploy, observe, secure)
- **Exit signals:** the golden paths are reviewable and developer-friendly

### Stage 6 — Design Platform Layers

- **Entry signals:** golden paths are designed
- **Key questions:** what are the layers (CI/CD, runtime, observability, secrets, environments, access, cost), how do they integrate, what are the platform interfaces, what is the tenant-isolation model
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md)
- **Expected outputs:** platform architecture with layer-by-layer shape, interface contracts, tenant isolation
- **Exit signals:** the platform shape is reviewable
- **Review gate:** `solution-direction`

### Stage 7 — Govern (SLOs, Security, Exception Handling)

- **Entry signals:** platform shape is reviewable
- **Key questions:** what are the SLOs on platform services, what is the on-call model, what is the security baseline, what is the exception process for teams that don't fit, what is the cost-allocation model
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** platform SLOs, on-call model, security baseline, exception process, cost allocation
- **Exit signals:** the platform can run as a product, not a project

### Stage 8 — Wave 1 Golden Path Slice

- **Entry signals:** governance is in place
- **Key questions:** what is the smallest useful Wave 1 (often: provision + build + deploy for one team), who is the pilot team, what is the rollback if the platform doesn't earn it
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`transition-planner`](../../skills/transition-planner.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Wave 1 golden path delivered end-to-end to a pilot team
- **Exit signals:** the pilot team is shipping through the platform
- **Review gate:** `transition-plan`

### Stage 9 — Ongoing Operation (Platform-As-Product)

- **Entry signals:** Wave 1 is live
- **Key questions:** how are new teams onboarded, how is feedback captured, what is the release cadence for platform improvements, how is cognitive load measured, how is the next golden path added
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`gap-radar`](../../skills/gap-radar.md), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** onboarding runbook, feedback loop, platform roadmap, cognitive-load telemetry
- **Exit signals:** the platform is operating as a continuous capability with measurable adoption

## Recommended Skill Sequence (Bootstrap)

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`requirement-normalizer`](../../skills/requirement-normalizer.md)
5. [`option-evaluator`](../../skills/option-evaluator.md)
6. [`decision-recorder`](../../skills/decision-recorder.md)
7. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md) — primary skill for this engagement
8. [`solution-modeler`](../../skills/solution-modeler.md)
9. [`application-interface-modeler`](../../skills/application-interface-modeler.md)
10. [`transition-planner`](../../skills/transition-planner.md) — for the Wave 1 golden path slice
11. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
12. [`gap-radar`](../../skills/gap-radar.md)
13. [`architecture-review`](../../skills/architecture-review.md)
14. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm developer-experience baseline and golden path scope
- `solution-direction` — confirm platform shape and layer design
- `decision-approval` — confirm build vs buy, vendor, and platform shape decisions
- `transition-plan` — confirm Wave 1 golden path slice and pilot-team rollout

## Patterns Likely To Apply

- **Platform operating model and tenancy:**
  - [platform-tenancy-isolation](../../patterns/technology/platform-tenancy-isolation.md)
  - [multi-tenancy-data-isolation](../../patterns/technology/multi-tenancy-data-isolation.md)
  - [platform-observability-operating-model](../../patterns/technology/platform-observability-operating-model.md)
  - [shared-service-slo-operating-model](../../patterns/technology/shared-service-slo-operating-model.md)
  - [shared-platform-guardrail-model](../../patterns/technology/shared-platform-guardrail-model.md)
  - [runtime-policy-enforcement](../../patterns/technology/runtime-policy-enforcement.md)
- **Environments and deployment:**
  - [environment-promotion](../../patterns/technology/environment-promotion.md)
  - [blue-green-canary-deployment](../../patterns/technology/blue-green-canary-deployment.md)
  - [ephemeral-environment-strategy](../../patterns/technology/ephemeral-environment-strategy.md)
  - [environment-drift-detection](../../patterns/technology/environment-drift-detection.md)
- **Reliability and observability:**
  - [observability-by-design](../../patterns/technology/observability-by-design.md)
  - [graceful-degradation](../../patterns/technology/graceful-degradation.md)
  - [capacity-and-scaling-guardrails](../../patterns/technology/capacity-and-scaling-guardrails.md)
- **Security and secrets:**
  - [secrets-and-configuration-management](../../patterns/technology/secrets-and-configuration-management.md)
  - [secrets-rotation](../../patterns/technology/secrets-rotation.md)
  - [service-to-service-identity](../../patterns/security/service-to-service-identity.md)
  - [zero-trust-network-segmentation](../../patterns/security/zero-trust-network-segmentation.md)
- **Service mesh and integration:**
  - [service-mesh-adoption](../../patterns/technology/service-mesh-adoption.md)
- **Cost and FinOps:**
  - [cost-allocation-and-showback](../../patterns/technology/cost-allocation-and-showback.md)
  - [cost-optimized-environment-tiering](../../patterns/technology/cost-optimized-environment-tiering.md)
- **Business / operating model:**
  - [product-operating-model-alignment](../../patterns/business/product-operating-model-alignment.md)
  - [product-vs-platform-boundary](../../patterns/business/product-vs-platform-boundary.md)
- **Governance:**
  - [governance-review-gate](../../patterns/governance/governance-review-gate.md)
  - [standards-exception-management](../../patterns/governance/standards-exception-management.md)

## Common Anti-Patterns

- **Platform as project, not product** — built once, declared done, no roadmap, no customers.
- **Build everything; ignore SaaS** — every layer in-house. Massive cost, no comparative advantage.
- **Golden paths nobody follows** — designed for the platform team's tastes, not the developers'.
- **Self-service in name only** — still need to file tickets, still need approvals nobody can grant.
- **Platform team owns delivery** — bottleneck. Stream teams should ship; platform team should enable.
- **No SLOs on platform services** — when the platform breaks, nobody knows whose problem it is.
- **Cost ignored until the cloud bill arrives** — surprise five-figure overruns from one team's experiment.
- **Onboarding doc is the platform UI** — if reading a README is the path to production, the platform hasn't shipped.
- **Treating all teams the same** — stream-aligned vs complicated-subsystem vs enabling have different needs.
- **Adopting Kubernetes / service mesh / fancy tech before earning it** — complexity tax with no payoff for small estates.
- **No exception path** — paved road plus a wall. Some teams legitimately don't fit; they need a way through.
- **Vanity metrics** — measuring deploys per day without measuring meaningful failure rates or developer satisfaction.

## Entry Criteria

- a sponsor exists for the platform outcome
- the strategic driver is clear (cognitive load, time-to-production, consolidation, cost)
- at least one pilot team is willing to onboard early
- baseline developer experience can be observed or interviewed

## Exit Criteria (Bootstrap)

- platform shape is decided with rationale and trade-offs explicit
- 3–5 golden paths are designed
- platform layers are architected and have explicit interfaces
- platform SLOs and on-call model are in place
- Wave 1 golden path has shipped to a pilot team
- onboarding runbook exists for the next team
- exception process is defined for teams that don't fit the paved road

## Cycling Stance

This playbook is **quasi-cyclic**. Bootstrap is one-shot, but the platform itself is a continuous capability:

- **per new golden path:** Stages 5 + 8 cycle
- **per new onboarding team:** Stage 8 lite (onboarding only)
- **per quarter (recommended):** platform-product review, [`gap-radar`](../../skills/gap-radar.md) sweep, cognitive-load telemetry review

## What This Playbook Does Not Do

- It does not design product features built on the platform — that is the stream team's work
- It does not own ongoing SRE / platform operations work — partner with the platform engineering team
- It does not specify the data platform — use `data-platform-modernization`
- It does not specify the AI platform — use `ai-platform-bootstrap`
- It does not produce the broader enterprise architecture — use `full-togaf-adm`

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior platform work exists.
2. Write a one-paragraph platform charter into `notes.md` — who the customer is, what cognitive load you are reducing, by when.
3. Take an initial position on platform shape (managed cloud / self-hosted / hybrid; Kubernetes / serverless / hybrid). Provisional is fine.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the pilot team, what tools are in play today, what cognitive load is the biggest pain, what is the build/buy stance, what is the on-call model.
6. Identify the 3–5 most painful developer journeys.
7. Resist designing platform layers until customer pain is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Compliance scope** — usually lighter than data or AI engagements; set jurisdictions and regulations only if the platform serves regulated workloads.
- **Roles** — keep `technology-architect`, `solution-architect`, `security-architect`; drop `data-architect` only if the platform genuinely has no data concerns.
- **Templates** — keep `principle` and `technology-standard` (golden paths are standards); keep `environment` (multi-environment platform); keep `application-service` (platform services are first-class).
- **Default mode** — `analysis` is correct; switch to `modeling` only per layer or golden path.
- **Coordinator** — `coordinator_auto_route: false`; platform decisions affect many teams and need explicit human routing.
- **Build/buy stance** — declare early. "Assemble managed services" is the default for most orgs; "build everything" rarely earns its cost.
- **Team topology stance** — Team Topologies vocabulary is the most common reference. Pick early if the org will use it.
- **Cost discipline** — set FinOps signals (cost allocation, showback) from Day 1, not Day 90.

## Decision Points

- **Build vs buy vs assemble** — per platform layer. Most platforms assemble managed services with thin internal glue.
- **Kubernetes vs serverless vs hybrid** — depends on scale, ops maturity, cost shape. Avoid Kubernetes-by-default for small estates.
- **Single-cloud vs multi-cloud** — multi-cloud adds material cost; only justified by specific risk or regulatory drivers.
- **Centralized observability vs federated** — central is cleaner; federated respects team autonomy. Pick based on org maturity.
- **Service mesh vs library-based identity** — mesh is heavyweight; library-based works at smaller scale.
- **Cost allocation model** — showback (visibility only) vs chargeback (real cost transfer). Decide before cost overruns force the conversation.
- **Exception path stance** — formal waiver process vs lightweight conversation. Either works if explicit.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the platform's customer (which teams, which roles)?
- What is the success measure (time-to-production, ticket reduction, onboarding time, deploy frequency)?
- What are the top 3–5 developer journeys we should pave?
- What tools are already in play? Which can be consolidated?
- What is the build/buy/assemble stance per platform layer?
- What is the team topology (platform team, stream-aligned, enabling, complicated-subsystem)?
- What SLOs apply to platform services?
- What is the on-call model for platform incidents?
- What is the cost-allocation model (showback vs chargeback)?
- What is the exception path for teams that don't fit the paved road?
- What is the security baseline (zero-trust posture, identity model, secret rotation cadence)?
- What is the multi-tenancy isolation model?
- How is cognitive load measured?

## Recommended Diagrams

- Team topology diagram (platform team, stream-aligned teams, enabling teams, interaction patterns)
- Platform layer diagram (CI/CD → runtime → observability → secrets → environments → access → cost)
- Golden path sequence diagram per top developer journey (provision → build → deploy → observe)
- Tenant isolation view (per-tenant boundaries on environments, secrets, observability, cost)
- Cost allocation flow (resource consumption → tagging → showback report → team)
- Exception flow diagram (request → review → waiver → expiry)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, role enablement, and compliance scope if the platform serves regulated workloads.
4. Identify a pilot team before designing the platform.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Present-Day Standards Gaps* (observability ownership, secret rotation cadence, rate limiting, BCP/DR).

## Notes For Reviewers

When reviewing platform engineering bootstrap output:

- check that customer teams are named, not abstracted
- check that golden paths solve real developer pain, not platform-team preferences
- check that SLOs and on-call are explicit (not aspirational)
- check that exception process exists and is operable
- check that cost allocation is designed in, not bolted on
- check that the platform is not over-engineered for the org's current scale
- check that the Wave 1 slice is small enough to ship and large enough to teach
- check that the platform-as-product cadence is realistic (release cadence, feedback loop, roadmap)
