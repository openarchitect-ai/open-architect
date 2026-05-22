# Data Platform Modernization Playbook

## Engagement Shape

- **Stance:** quasi-cyclic — bootstrap is one-shot, but data products and ongoing data governance cycle continuously
- **Default mode:** `analysis` (with disciplined moves to `modeling` per domain or data product)
- **Typical duration:** months to a year for bootstrap; ongoing thereafter
- **Output emphasis:** data domain ownership, data contracts, canonical objects, lineage, governance posture

## When To Use

Use this playbook when:

- the organization is building or rationalizing a data platform (lake / lakehouse / data mesh / hybrid)
- moving from a centralized data team toward domain-owned data products
- data contracts are becoming a first-class concern (versioning, SLAs, schemas)
- analytics, ML, and AI all need consistent data foundations
- regulatory drivers (GDPR, EU Data Act, residency) shape data architecture choices
- data quality, lineage, and observability are operational concerns, not aspirations

## When Not To Use

Do **not** use this playbook when:

- the engagement is one bounded application's data design (use `quick-solution-design`)
- AI is the dominant concern and the data work is in service of that (use `ai-platform-bootstrap`)
- the engagement is estate-wide modernization where data is one piece (use `migration-wave`)
- the engagement is an enterprise architecture cycle (use `full-togaf-adm`)

## What Good Looks Like

- explicit data domain ownership across business domains
- data contracts between producers and consumers (versioning, SLAs, change process)
- canonical data objects with classification, residency, and lineage
- data quality rules with measurable signal
- governance posture covering access, audit, residency, retention, and AI-use eligibility
- a Wave 1 data product delivering value end-to-end through the platform
- operational telemetry on data freshness, quality, and consumption

## Stages

### Stage 1 — Frame The Modernization

- **Entry signals:** sponsor exists; the strategic driver (cost, agility, compliance, AI readiness) is clear
- **Key questions:** why are we modernizing now, what success looks like, what is in/out of scope, who is affected
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** stakeholders, objectives, scope of the data estate in/out, success measures
- **Exit signals:** the modernization charter is reviewable by the sponsor

### Stage 2 — Baseline The Data Estate

- **Entry signals:** scope is bounded enough to inventory
- **Key questions:** what data exists today, where, who owns it, what quality is it in, what flows touch it, what consumes it
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`data-modeler`](../../skills/data-modeler.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** baseline data objects with classification, flows, ownership signals, quality signals
- **Exit signals:** the baseline is good enough to design domain decomposition

### Stage 3 — Define Domain Decomposition

- **Entry signals:** baseline is stable
- **Key questions:** which business domains exist, which own which data, where are the boundaries fuzzy, what are the master-data anchors, how should data products map to domains
- **Recommended skills:** [`data-modeler`](../../skills/data-modeler.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** domain decomposition, master-data anchor decisions, data product candidates per domain
- **Exit signals:** domain boundaries are reviewable; master-data ownership is named

### Stage 4 — Decide Platform Shape

- **Entry signals:** domain decomposition is in place
- **Key questions:** centralized lake vs lakehouse vs federated mesh vs hybrid, build vs buy, single vs multi-region, what is the analytics vs operational vs ML separation
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** platform-shape decisions with options, rationale, consequences
- **Exit signals:** the chosen shape is decided and defensible
- **Review gate:** `decision-approval`

### Stage 5 — Define Data Contracts And Products

- **Entry signals:** platform shape is decided
- **Key questions:** what does a data product look like in this org, what is the contract shape (schema, SLAs, versioning, change policy), how do consumers discover products, what is the contract governance process
- **Recommended skills:** [`data-modeler`](../../skills/data-modeler.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** data product template, data contract template, discovery and governance process
- **Exit signals:** producers and consumers can use the contract model without ambiguity

### Stage 6 — Design Platform Architecture

- **Entry signals:** contracts and product shape are decided
- **Key questions:** what are the platform layers (ingest, storage, processing, catalog, lineage, observability, access), how do they integrate, what are interfaces between layers, what is multi-tenancy isolation
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** platform architecture, layer-by-layer interfaces, observability stance, isolation model
- **Exit signals:** the platform shape is reviewable
- **Review gate:** `solution-direction`

### Stage 7 — Govern (Access, Quality, Residency, Retention)

- **Entry signals:** platform shape is reviewable
- **Key questions:** what is the access-approval model, what are the data-quality SLAs, what residency rules apply, what retention and legal-hold rules apply, what AI-use eligibility applies
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** access model, quality SLA framework, residency posture, retention/legal-hold model, AI-use stance
- **Exit signals:** governance posture is current and evidence-backed
- **Review gate:** `governance-review`

### Stage 8 — Wave 1 Data Product Slice

- **Entry signals:** platform and governance are reviewable
- **Key questions:** what is the smallest data product that proves the platform, who is the producer and consumer, what does the SLA look like, what is the rollback for breaking changes
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`transition-planner`](../../skills/transition-planner.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Wave 1 data product end-to-end, contract published, consumers onboarded, rollback approach
- **Exit signals:** Wave 1 is live and the platform has proven its shape
- **Review gate:** `transition-plan`

### Stage 9 — Ongoing Operation

- **Entry signals:** Wave 1 is live
- **Key questions:** how are new data products onboarded, how are contract changes governed, how is quality monitored, how is access reviewed, how is the next domain pulled in
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`gap-radar`](../../skills/gap-radar.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** onboarding runbook, contract change governance, quality dashboards, access review cadence
- **Exit signals:** the platform is operating as a continuous capability

## Recommended Skill Sequence (Bootstrap)

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`data-modeler`](../../skills/data-modeler.md) — primary skill for this engagement
5. [`relationship-mapper`](../../skills/relationship-mapper.md)
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`solution-modeler`](../../skills/solution-modeler.md)
9. [`application-interface-modeler`](../../skills/application-interface-modeler.md)
10. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
11. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
12. [`gap-radar`](../../skills/gap-radar.md)
13. [`architecture-review`](../../skills/architecture-review.md)
14. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm domain decomposition and product shape
- `solution-direction` — confirm platform shape and layer design
- `decision-approval` — confirm platform-shape and contract decisions
- `governance-review` — confirm access, quality, residency, retention posture
- `transition-plan` — confirm Wave 1 product slice and onboarding plan

## Patterns Likely To Apply

- **Data architecture and ownership:**
  - [canonical-data-ownership](../../patterns/data/canonical-data-ownership.md)
  - [data-domain-ownership](../../patterns/data/data-domain-ownership.md)
  - [master-data-stewardship](../../patterns/data/master-data-stewardship.md)
  - [reference-data-management](../../patterns/data/reference-data-management.md)
- **Data contracts and governance:**
  - [data-contract-governance](../../patterns/data/data-contract-governance.md)
  - [data-sharing-agreement-governance](../../patterns/data/data-sharing-agreement-governance.md)
  - [data-quality-rule-governance](../../patterns/data/data-quality-rule-governance.md)
  - [data-lineage-and-provenance](../../patterns/data/data-lineage-and-provenance.md)
- **Classification and compliance:**
  - [data-classification-and-handling](../../patterns/data/data-classification-and-handling.md)
  - [data-residency-and-sovereignty](../../patterns/data/data-residency-and-sovereignty.md)
  - [regulated-data-retention-and-legal-hold](../../patterns/data/regulated-data-retention-and-legal-hold.md)
  - [regulated-data-access-approval](../../patterns/data/regulated-data-access-approval.md)
  - [archival-and-retention](../../patterns/data/archival-and-retention.md)
- **Operations and replication:**
  - [data-replication-and-cache-invalidation](../../patterns/data/data-replication-and-cache-invalidation.md)
  - [data-reconciliation](../../patterns/data/data-reconciliation.md)
- **Integration:**
  - [event-driven-integration](../../patterns/integration/event-driven-integration.md)
  - [anti-corruption-layer](../../patterns/integration/anti-corruption-layer.md)
  - [outbox-pattern](../../patterns/integration/outbox-pattern.md)
- **Security:**
  - [cross-boundary-data-sharing-controls](../../patterns/security/cross-boundary-data-sharing-controls.md)
  - [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)

## Common Anti-Patterns

- **Central data team owns everything** — bottleneck. Domain ownership is the unlock.
- **No data contracts** — silent breakage when producers change schema, consumers discover it at runtime.
- **Lake without curation** — becomes a swamp; nobody can find or trust the data.
- **Mesh without contracts** — chaos masquerading as autonomy.
- **Single-product thinking** — one team builds one product, nobody else can reuse the data.
- **No lineage** — cannot audit, cannot debug, cannot prove compliance.
- **Ignoring residency** — compliance failure for any cross-border or regulated data.
- **Conflating analytics and operational data** — wrong patterns applied to each.
- **No data quality SLAs** — trust erodes faster than you can recover it.
- **Owning data but not owning consumption** — contracts get ignored when there is no enforcement.
- **Big-bang migration to mesh** — most successful mesh adoptions are incremental.
- **Treating AI as another consumer rather than as a constraint** — AI use changes data classification, residency, and consent posture.

## Entry Criteria

- a sponsor exists for the data modernization outcome
- the strategic driver is clear (cost, agility, compliance, AI readiness)
- baseline visibility into at least the major data sources exists or can be gathered
- there is appetite for explicit data domain ownership

## Exit Criteria (Bootstrap)

- domain decomposition is explicit and approved
- platform shape is decided with rationale
- data contract model is in place
- governance posture (access, quality, residency, retention) is current
- Wave 1 data product has shipped end-to-end
- onboarding runbook for the next data product exists

## Cycling Stance

This playbook is **quasi-cyclic**. Bootstrap is one-shot — once the platform exists, Stages 1–8 do not repeat in the same form. But Stage 9 is permanent:

- **per new data product:** Stages 5 + 8 cycle
- **per domain onboarding:** Stages 3 + 5 cycle
- **per quarter (recommended):** [`gap-radar`](../../skills/gap-radar.md) sweep over the data estate, [`project-recap`](../../skills/project-recap.md) for the platform owner

## What This Playbook Does Not Do

- It does not design AI capability on top of the data — use `ai-platform-bootstrap` for that
- It does not own ongoing data engineering work — partner with the data platform team
- It does not produce the broader enterprise architecture — use `full-togaf-adm`
- It does not specify the analytics or BI tooling — those are consumers, not the platform

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior data work exists in the project folder.
2. Write a one-paragraph modernization charter into `notes.md` — what, why, by when, the strategic driver.
3. Take an initial position on platform shape ambition (lake / lakehouse / mesh / hybrid). Provisional is fine; this shapes the rest of the engagement.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who owns the data domains today, where master data lives, what regulatory residency applies, what is the AI-use eligibility stance, what platform tooling is in play.
6. List 5–8 data domains and their candidate owners.
7. Resist designing the platform shape until baseline is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Compliance scope** — GDPR is the most common starting point; add EU Data Act, sectoral residency rules, and AI Act if AI use is in scope.
- **Roles** — keep `data-architect` and `security-architect`; add `business-architect` if domain decomposition crosses functions; add `integration-architect` for heavy ingest / event work.
- **Templates** — keep `data-object`, `principle`, `decision`, `compliance-assessment`; keep `transition-architecture` and `work-package` for the Wave 1 slice.
- **Default mode** — `analysis` is correct; switch to `modeling` only per slice.
- **Coordinator** — `coordinator_auto_route: false`; data work benefits from explicit human decision points on domain boundaries.
- **Platform shape stance** — declare lake / lakehouse / mesh / hybrid early as the working hypothesis; it sets the constraint frame for the rest.
- **Data product granularity** — small focused products are safer than monolithic ones; tune to the org's maturity.

## Decision Points

- **Centralized vs federated** — central team owns everything vs domain teams own their products. Pick stance per domain maturity.
- **Lake vs lakehouse vs mesh** — depends on analytics maturity, transactional scale, regulatory needs.
- **Single-region vs multi-region** — driven by residency, latency, cost. Decide before Wave 1.
- **Build vs buy vs assemble** — for catalog, lineage, observability, access control. Many orgs assemble managed services.
- **Streaming vs batch as the default** — affects platform layer choices, contracts, and operational maturity.
- **Master-data ownership model** — central registry, federated stewardship, or per-domain mastery. Pick early.
- **AI-use posture** — what data can be used for training, fine-tune, RAG, prompts. Decide before the AI team asks.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who owns each data domain today? Who *should* own it?
- Where does master data live for the top 3–5 critical objects?
- What residency obligations apply per data class, per jurisdiction?
- What is the AI-use eligibility stance per data class?
- What is the platform shape stance (lake / lakehouse / mesh / hybrid)?
- What is the data contract template and change process?
- What is the data quality SLA framework?
- What is the access-approval model for sensitive data?
- What lineage and provenance capture is needed (and where)?
- What is the retention and legal-hold model?
- What is the rollback approach for a breaking contract change?
- What tooling already exists (catalog, lineage, quality, observability)?

## Recommended Diagrams

- Domain decomposition map (business domains × owned data × master-data anchors)
- Platform layer diagram (ingest → storage → processing → catalog → lineage → observability → access)
- Data flow diagram per Wave 1 product (producer → contract → consumer, annotated with classification and residency)
- Data contract lifecycle diagram (draft → review → publish → version → deprecate)
- Governance posture map (access × audit × residency × retention × AI-use)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, `compliance.applicable_regulations` (most data engagements include GDPR), and the `data_residency_requirements` list.
4. Run [`baseline-discovery`](../../skills/baseline-discovery.md) on the data estate before designing anything.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Present-Day Standards Gaps* and *Ownership Truthfulness Risks*.

## Notes For Reviewers

When reviewing data platform modernization output:

- check that domain ownership is named, not aspirational
- check that data contracts exist (or have an explicit creation plan)
- check that classification and residency are explicit per data object
- check that lineage and provenance are designed in, not bolted on
- check that data quality has measurable SLAs, not just intentions
- check that access-approval and audit are operationally testable
- check that the platform is not over-engineered for the org's current maturity
- check that the Wave 1 product is small enough to ship and large enough to teach
