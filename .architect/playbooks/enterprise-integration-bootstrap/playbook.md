# Enterprise Integration Bootstrap Playbook

## Engagement Shape

- **Stance:** quasi-cyclic — bootstrap is one-shot, but the platform evolves with each new integration and partner
- **Default mode:** `analysis` (with disciplined moves to `modeling` per layer or integration slice)
- **Typical duration:** months for bootstrap; ongoing thereafter
- **Output emphasis:** integration platform — patterns library, API governance, event catalog, B2B onboarding, observability — with platform-as-product operating model

## When To Use

Use this playbook when:

- standing up an enterprise integration platform (iPaaS, event mesh, API gateway, service registry, B2B integration)
- consolidating point-to-point integrations onto a managed platform
- shifting from custom ESB to managed iPaaS or event-driven backbone
- B2B integration becomes a first-class concern (EDI, API economy, partner onboarding, file-based partner flows)
- API governance is part of the engagement (lifecycle, versioning, deprecation, design review)
- multiple solutions need consistent integration patterns

## When Not To Use

Do **not** use this playbook when:

- a single integration is in scope (use `quick-solution-design`)
- developer platform broader than integration (use `platform-engineering-bootstrap`)
- AI platform is the dominant concern (use `ai-platform-bootstrap`)
- data platform work (use `data-platform-modernization`)
- migrating an integration legacy estate to cloud (use `cloud-migration`, with integration as one workstream)

## What Good Looks Like

- defined integration pattern library (request-response, event-driven, batch, file, B2B)
- pattern-per-use-case guidance (when each pattern applies)
- API governance — lifecycle, versioning, deprecation, design review
- event catalog / service registry with discovery
- partner onboarding model (B2B), with explicit SLAs and certification
- observability for integration flows (end-to-end traces, dead-letter queues, replay)
- platform-as-product mindset for the integration team
- Wave 1 integration delivered end-to-end through the platform

## Stages

### Stage 1 — Frame The Platform

- **Entry signals:** sponsor exists; the strategic driver (consolidation, point-to-point exhaustion, B2B growth, modernization) is clear
- **Key questions:** who is the platform's customer (internal teams, partners, both), what does success look like, what is in scope (sync, async, batch, B2B), what is the consolidation ambition
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** customer-team / partner list, objectives, scope (which integration styles), success measures (point-to-point reduction, partner onboarding time, integration delivery velocity)
- **Exit signals:** the platform charter is reviewable by the sponsor

### Stage 2 — Baseline The Integration Landscape

- **Entry signals:** scope is bounded
- **Key questions:** what integrations exist today (point-to-point inventory), what styles are in play (sync, async, batch, file, EDI), where is the shadow estate, what tooling is already in use (ESB, iPaaS, gateway, custom), which integrations are critical
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** integration inventory (point-to-point baseline), tooling landscape, critical-integration register, shadow-estate signals
- **Exit signals:** the integration landscape is reviewable; critical paths are mapped

### Stage 3 — Define The Pattern Library

- **Entry signals:** baseline is in hand
- **Key questions:** which integration patterns will the platform support, which is the default for which scenario (request-response vs event-driven vs batch vs file vs B2B), what guidance per pattern, what are the anti-patterns to discourage
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md)
- **Expected outputs:** integration pattern library (which patterns, when, with what guidance), anti-patterns to discourage, default-pattern decision tree
- **Exit signals:** the pattern library is reviewable and developer-friendly

### Stage 4 — Decide Platform Shape

- **Entry signals:** pattern library is decided
- **Key questions:** managed iPaaS vs self-hosted, single vendor vs best-of-breed, API gateway choice, event backbone choice (Kafka, managed message bus, event mesh), B2B platform choice, service registry / catalog choice
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** platform-shape decisions per layer (gateway, mesh, iPaaS, B2B, registry), rationale, consequences
- **Exit signals:** the chosen shape is decided and defensible
- **Review gate:** `decision-approval`

### Stage 5 — Design Platform Architecture

- **Entry signals:** platform shape is decided
- **Key questions:** what are the layers (ingress, gateway, mesh, processing, persistence, observability, governance), how do they integrate, what is the multi-tenancy model, what is the failure mode handling (idempotency, replay, DLQ, retry policy)
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** platform architecture with layer-by-layer shape, interface contracts, multi-tenancy isolation, failure-mode handling
- **Exit signals:** the platform shape is reviewable
- **Review gate:** `solution-direction`

### Stage 6 — Define API Governance

- **Entry signals:** platform shape is reviewable
- **Key questions:** what is the API lifecycle (proposed → published → deprecated → retired), what is the versioning strategy, what is the design review process, what is the deprecation policy and timeline, what is the consumer notification model
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md)
- **Expected outputs:** API lifecycle policy, versioning strategy, design review process, deprecation policy with timeline
- **Exit signals:** API governance is operable

### Stage 7 — Define B2B Onboarding (If Applicable)

- **Entry signals:** the platform serves external partners
- **Key questions:** how are partners onboarded (self-service, white-glove, hybrid), what certifications apply, what SLAs per partner tier, what is the credential / identity model, how are partner-specific contracts versioned
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** partner onboarding model, certification matrix, SLA tiers, identity and credential strategy
- **Exit signals:** partner onboarding is operable

### Stage 8 — Wave 1 Integration Slice

- **Entry signals:** governance and onboarding are in place
- **Key questions:** what is the smallest useful Wave 1 (often one consumer-producer pair through each pattern lane), who is the pilot team, what proves the wave succeeded, what is the rollback if the platform doesn't earn it
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`transition-planner`](../../skills/transition-planner.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Wave 1 integrations live through the platform, end-to-end observability working, rollback approach proven
- **Exit signals:** the pilot integrations are running through the platform
- **Review gate:** `transition-plan`

### Stage 9 — Ongoing Operation (Platform-As-Product)

- **Entry signals:** Wave 1 is live
- **Key questions:** how are new integrations onboarded, how is the event catalog kept current, how is API lifecycle enforced, how are partner SLAs measured, how is the platform's own SLO operated
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`gap-radar`](../../skills/gap-radar.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** onboarding runbook, catalog cadence, API lifecycle enforcement, partner SLO measurement, platform telemetry
- **Exit signals:** the platform is operating as a continuous capability

## Recommended Skill Sequence (Bootstrap)

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`relationship-mapper`](../../skills/relationship-mapper.md)
5. [`application-interface-modeler`](../../skills/application-interface-modeler.md) — primary skill for this engagement
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`solution-modeler`](../../skills/solution-modeler.md)
9. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
10. [`transition-planner`](../../skills/transition-planner.md)
11. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
12. [`gap-radar`](../../skills/gap-radar.md)
13. [`architecture-review`](../../skills/architecture-review.md)
14. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm pattern library scope and integration baseline
- `solution-direction` — confirm platform shape and layer design
- `decision-approval` — confirm tooling, vendor, and pattern-per-use-case decisions
- `governance-review` — confirm API governance and B2B partner policy
- `transition-plan` — confirm Wave 1 integration slice and rollout

## Patterns Likely To Apply

- **Integration patterns:**
  - [request-response-integration](../../patterns/integration/request-response-integration.md)
  - [event-driven-integration](../../patterns/integration/event-driven-integration.md)
  - [batch-integration](../../patterns/integration/batch-integration.md)
  - [anti-corruption-layer](../../patterns/integration/anti-corruption-layer.md)
  - [outbox-pattern](../../patterns/integration/outbox-pattern.md)
- **Application / API facade:**
  - [api-facade](../../patterns/application/api-facade.md)
  - [backend-for-frontend](../../patterns/application/backend-for-frontend.md)
- **Data and contracts:**
  - [event-carried-state-transfer](../../patterns/data/event-carried-state-transfer.md)
  - [event-schema-evolution](../../patterns/data/event-schema-evolution.md)
  - [data-contract-governance](../../patterns/data/data-contract-governance.md)
  - [data-classification-and-handling](../../patterns/data/data-classification-and-handling.md)
- **Security:**
  - [service-to-service-identity](../../patterns/security/service-to-service-identity.md)
  - [workload-identity-federation](../../patterns/security/workload-identity-federation.md)
  - [cross-boundary-data-sharing-controls](../../patterns/security/cross-boundary-data-sharing-controls.md)
  - [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)
- **Technology / observability:**
  - [observability-by-design](../../patterns/technology/observability-by-design.md)
  - [secrets-and-configuration-management](../../patterns/technology/secrets-and-configuration-management.md)
  - [secrets-rotation](../../patterns/technology/secrets-rotation.md)
  - [graceful-degradation](../../patterns/technology/graceful-degradation.md)
  - [platform-tenancy-isolation](../../patterns/technology/platform-tenancy-isolation.md)
- **Governance:**
  - [standards-exception-management](../../patterns/governance/standards-exception-management.md)
  - [reference-architecture-adoption](../../patterns/governance/reference-architecture-adoption.md)

## Common Anti-Patterns

- **ESB nostalgia** — central pipe that becomes the bottleneck again, just rebranded as iPaaS.
- **Event mesh without governance** — chaos masquerading as autonomy; events nobody can find, schemas nobody owns.
- **API governance as gate** — slows delivery without improving design; teams route around the gate.
- **No service registry / event catalog** — integrations exist nowhere visible; the platform owns no source of truth.
- **B2B as one-off** — every partner integration is custom; onboarding takes months.
- **Tight coupling reintroduced via "shared model"** — same problems, different tools.
- **No idempotency, no replay, no DLQ** — failure is treated as exceptional, not as a first-class operating mode.
- **Observability missing for events** — async flows are debugged by reading logs from multiple systems and guessing.
- **API versioning ignored until breaking change** — consumers break in production.
- **Deprecation policy without enforcement** — deprecated APIs run forever.
- **Default pattern is "REST"** — even when async would be more appropriate; complexity tax in the wrong place.
- **Partner SLAs not measured** — tier model exists, nobody knows whether SLAs are met.
- **Platform team as gatekeeper** — every new integration needs a ticket; throughput drops.
- **Schema registry without enforcement** — exists in the platform but producers ignore it.

## Entry Criteria

- a sponsor exists for the integration platform outcome
- the strategic driver is clear (consolidation, P2P exhaustion, B2B growth, modernization)
- baseline visibility into existing integrations exists or can be gathered
- at least one pilot integration is willing to onboard early

## Exit Criteria (Bootstrap)

- pattern library is documented and developer-friendly
- platform shape is decided with rationale
- API governance is operable
- B2B onboarding model is operable (if applicable)
- Wave 1 integrations are running through the platform
- onboarding runbook exists for the next integration
- platform SLOs and on-call are in place

## Cycling Stance

This playbook is **quasi-cyclic**. Bootstrap is one-shot, but the platform itself is continuous:

- **per new integration:** pattern selection + onboarding cycle (Stages 5 + 8 lite)
- **per new partner (B2B):** Stage 7 cycle
- **per API lifecycle event:** governance cycle (publish, deprecate, retire)
- **per quarter:** platform-as-product review, [`gap-radar`](../../skills/gap-radar.md) sweep over integration estate

## What This Playbook Does Not Do

- It does not design product features that use the platform — that is the stream team's work
- It does not own ongoing integration operations (SRE for the platform) — partner with the integration platform team
- It does not specify the data platform — use `data-platform-modernization`
- It does not specify the AI platform — use `ai-platform-bootstrap`
- It does not handle the broader developer platform (CI/CD, runtime, observability) — use `platform-engineering-bootstrap`

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior integration work exists.
2. Write a one-paragraph integration platform charter into `notes.md` — who the customer is, what consolidation ambition exists, by when.
3. Take an initial position on tooling stance (managed iPaaS / self-hosted / hybrid; centralized vs federated event backbone; API gateway). Provisional is fine.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the pilot integration / partner, what tooling is already in play, what point-to-point integrations exist, what is the API governance maturity today, what is the B2B partner stance.
6. Identify the top 5–10 critical integrations and which integration styles they use.
7. Resist designing the platform shape until baseline is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Compliance scope** — typically light; set if B2B partner flows include regulated data (GDPR, sectoral residency) or financial-services flows (PCI DSS).
- **Roles** — keep `integration-architect` (primary), `security-architect`, `solution-architect`; add `data-architect` for event schema work; add `architecture-governance-lead` for API governance.
- **Templates** — keep `application-service`, `interface`, `data-object`, `technology-component`, `decision`, `principle`; keep `transition-architecture` and `work-package` for the Wave 1 slice.
- **Default mode** — `analysis` is correct; switch to `modeling` only per layer or integration.
- **Coordinator** — `coordinator_auto_route: false`; integration platform decisions affect many teams and need explicit routing.
- **Pattern library scope** — declare which patterns will be supported. Avoid "all patterns supported" — opinionated is faster.
- **API governance strictness** — strict lifecycle (every API has lifecycle stage) vs lighter (registry + design review).
- **B2B inclusion** — declare whether B2B is in scope; B2B adds substantial Stage 7 work.
- **Event backbone choice** — Kafka, managed message bus, event mesh, hybrid. Affects operational model.

## Decision Points

- **Managed iPaaS vs self-hosted** — depends on org's ops maturity, regulatory constraints, cost shape.
- **Single vendor vs best-of-breed** — single is cleaner; best-of-breed lets each layer choose strongest tooling.
- **Event backbone** — Kafka (heavy, flexible), managed message bus (lighter, vendor-aligned), event mesh (federated, complex). Pick based on scale and ops maturity.
- **API gateway position** — single edge gateway vs per-domain gateways. Single is simpler; per-domain respects autonomy.
- **Service registry / event catalog** — separate tools or unified. Unified is rare; separate is more common.
- **B2B platform stance** — included or out of scope. Adds substantial Stage 7 complexity.
- **Default integration pattern** — REST default vs async default vs context-dependent. Default-async tends to scale better long-term but has higher initial cost.
- **Schema governance** — strict (every event has registered schema, versioned) vs lighter (consumer-driven contracts). Strict scales.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the platform's customer (internal teams, partners, both)?
- What is the consolidation ambition (point-to-point → platform)?
- What integration styles are in scope (sync, async, batch, file, B2B)?
- What tooling is already in play, and what can be consolidated?
- What is the API governance maturity today?
- What is the event backbone choice (and why)?
- What is the API gateway position (single edge vs per-domain)?
- What is the service registry / event catalog tooling?
- Is B2B in scope, and what are the partner tiers?
- What is the multi-tenancy isolation model on the platform?
- What is the default integration pattern (REST vs async vs context-dependent)?
- What is the schema governance approach?
- What are platform SLOs?
- What is the on-call model for platform incidents?
- What is the deprecation policy and notification timeline?

## Recommended Diagrams

- Platform layer diagram (ingress → gateway → mesh → processing → persistence → observability → governance)
- Pattern decision tree (request-response vs event-driven vs batch vs file vs B2B by scenario)
- Integration topology before vs after (point-to-point estate → platform-mediated)
- API lifecycle diagram (proposed → published → deprecated → retired, with timelines and notifications)
- Event flow diagram (producer → contract → broker → consumer, annotated with classification, residency, replay)
- B2B onboarding flow (partner request → certification → SLA tier → identity → production)
- Multi-tenancy isolation view (per-tenant boundaries on namespaces, schemas, observability, logs)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, role enablement, and compliance scope (B2B with regulated data needs GDPR / sectoral residency in scope).
4. Identify a pilot integration before designing the platform.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Present-Day Standards Gaps* (observability for events, rate limiting, secret rotation, BCP/DR posture).

## Notes For Reviewers

When reviewing enterprise integration bootstrap output:

- check that the pattern library is opinionated, not exhaustive
- check that pattern-per-use-case guidance exists (when each pattern applies)
- check that idempotency, replay, DLQ are first-class, not afterthoughts
- check that observability covers async flows end-to-end
- check that API lifecycle has enforcement (not just policy)
- check that schema registry has enforcement (not just existence)
- check that B2B SLAs are measurable, not aspirational (if B2B in scope)
- check that the platform team is positioned as a product team, not a gatekeeper
- check that the Wave 1 slice exercises each pattern lane (or the chosen subset)
- check that the platform's own observability is operable
