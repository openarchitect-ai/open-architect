# Decommissioning Program Playbook

## Engagement Shape

- **Stance:** one-shot, retirement-focused
- **Default mode:** `analysis` (with disciplined moves to `modeling` per retirement slice)
- **Typical duration:** months
- **Output emphasis:** retirement schedule, dependency closure plan, data archival per regulatory and legal needs, customer/partner notice, contract termination, talent transition, rollback approach

## When To Use

Use this playbook when:

- a focused program is retiring legacy systems, redundant systems, or unused systems
- cost-driven sunset of duplicate or obsolete tech is the deliverable
- post-merger consolidation requires retiring redundant systems (handoff from `post-acquisition-integration`)
- vendor end-of-life or end-of-support forces retirement
- regulatory or strategic shift makes systems no longer needed
- the engagement is *only* about retirement — not modernization, not reshape

## When Not To Use

Do **not** use this playbook when:

- the engagement is modernization or reshape (use `migration-wave`)
- a single application is being sunset (use `quick-solution-design` with a retirement focus, or fold into `migration-wave`)
- M&A integration that includes retirement (use `post-acquisition-integration`)
- cloud migration that includes retirement (use `cloud-migration`)
- divestiture where shared services are being decommissioned (use `divestiture-separation`)
- the work is general portfolio rationalization to *decide* what to retire (use `portfolio-rationalization` first)

## What Good Looks Like

- explicit retirement schedule with named owners and dates
- dependency closure plan per system (who calls it, who feeds it, what data lives on it)
- data archival per regulatory retention, legal hold, and customer access needs
- customer and partner notice executed where systems are externally visible
- contracts terminated cleanly (vendor, license, support)
- talent transition handled (people whose work was that system have a clear next role)
- post-decommissioning support model (if anything remains accessible)
- rollback approach proven before any cutover
- audit trail of what was retired, when, with what authority, with what evidence

## Stages

### Stage 1 — Frame The Program

- **Entry signals:** sponsor exists; the driver is clear (cost, vendor EOL, M&A consolidation, strategic shift); rationalization decisions exist (from `portfolio-rationalization` or earlier work)
- **Key questions:** why now, what success looks like (cost savings, risk reduction, vendor exit), what is in scope, what is the timeline, what is the decision authority, what is the budget envelope
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** program charter, sponsor, success measures (cost saved, vendors exited, risk reduced), decision authority
- **Exit signals:** the charter is reviewable by the sponsor

### Stage 2 — Baseline Retirement Candidates

- **Entry signals:** charter is in hand
- **Key questions:** which systems are in scope for retirement, why each one, what is each system's actual usage (not just nominal), what is each system's cost (TCO), what evidence supports the retirement decision per system
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md), [`relationship-mapper`](../../skills/relationship-mapper.md)
- **Expected outputs:** retirement candidate register (per system: why, evidence, current usage, TCO)
- **Exit signals:** each candidate has evidence for retirement; "nobody uses it" is verified, not assumed
- **Review gate:** `requirement-baseline`

### Stage 3 — Map Dependencies

- **Entry signals:** candidates are in place
- **Key questions:** per system — who calls it (upstream consumers), who feeds it (downstream), what data lives on it (and is it the source of truth), what contracts depend on its existence, what reports / regulatory submissions depend on it, what people are tied to it, what other systems depend on its outputs even if indirectly
- **Recommended skills:** [`relationship-mapper`](../../skills/relationship-mapper.md), [`baseline-discovery`](../../skills/baseline-discovery.md), [`data-modeler`](../../skills/data-modeler.md)
- **Expected outputs:** dependency map per system (upstream, downstream, data, contracts, people, regulatory), criticality of each dependency
- **Exit signals:** "what breaks if we turn it off" is answered for each system

### Stage 4 — Decide Retirement Order

- **Entry signals:** dependencies are mapped
- **Key questions:** which systems retire first (often: those with fewest dependencies and most cost), what is the dependency-driven order, what contract end dates constrain timing, what regulatory or audit cycles constrain timing, what is the rollback approach if a retirement breaks something downstream
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`transition-planner`](../../skills/transition-planner.md)
- **Expected outputs:** retirement order with rationale, contract-end-date alignment, regulatory-cycle alignment, dependencies between retirements
- **Exit signals:** the order is reviewable and defensible
- **Review gate:** `decision-approval`

### Stage 5 — Plan Data Archival

- **Entry signals:** retirement order is decided
- **Key questions:** per system — what data lives there, what is the regulatory retention requirement (per data class, per jurisdiction), what is the legal hold status, what is the customer-access expectation (e.g. account history retention), where does the archive live, what is the retrieval test plan
- **Recommended skills:** [`data-modeler`](../../skills/data-modeler.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** archival plan per system (data, retention period, location, retrieval procedure, legal hold), regulatory compliance per archive
- **Exit signals:** archives are defensible against regulator / auditor
- **Review gate:** `governance-review`

### Stage 6 — Plan Customer And Partner Notice

- **Entry signals:** archival is planned
- **Key questions:** which systems are externally visible (customer-facing portals, partner APIs, EDI flows, batch interfaces), what notice period is required (contractual or regulatory), what alternative is being offered, how is the notice communicated (channel, timing, repetition)
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`communication-packager`](../../skills/communication-packager.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** notice plan per externally-visible system (audience, period, channel, alternative offered, escalation if no migration)
- **Exit signals:** customers and partners have what they need to migrate or accept retirement

### Stage 7 — Plan Contract Termination

- **Entry signals:** notice is planned
- **Key questions:** per system — what contracts apply (vendor, license, support, hosting, third-party integrations), what are the termination clauses, what is the termination cost, what is the talent transition for vendor staff associated with the system
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** contract termination plan per system (contract, termination date, cost, hand-off to procurement / legal)
- **Exit signals:** procurement / legal has actionable input

### Stage 8 — Plan Talent Transition

- **Entry signals:** contracts are planned
- **Key questions:** per system — who works on it today, what is their next role, what institutional knowledge must be transferred, how is morale handled (especially if retirements come with redundancies)
- **Recommended skills:** [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`communication-packager`](../../skills/communication-packager.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** talent transition plan per system (people, next-role intent, knowledge-transfer plan, partner with HR / line manager)
- **Exit signals:** the people whose work disappears know what comes next

### Stage 9 — Execute Retirement Waves

- **Entry signals:** plans are in place
- **Key questions:** what is Wave 1, what proves the wave succeeded, what is the rollback if retirement breaks something downstream, what is the cutover-rehearsal expectation, what is the hypercare model
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Waves executed; systems decommissioned; archives in place; contracts terminated; people transitioned
- **Exit signals:** retired systems are off; archives are accessible; contracts are clear
- **Review gate:** `transition-plan`

### Stage 10 — Close-Out

- **Entry signals:** all waves are complete
- **Key positions:** final archive inventory, contract sign-off evidence, support extinguishment confirmation, lessons captured, audit trail closed
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md), [`evidence-curator`](../../skills/evidence-curator.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** close-out report (what was retired, when, with what evidence), final audit trail, lessons captured
- **Exit signals:** the program closes cleanly with a defensible record

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`relationship-mapper`](../../skills/relationship-mapper.md) — primary skill for this engagement (dependency mapping is everything)
5. [`evidence-curator`](../../skills/evidence-curator.md)
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`transition-planner`](../../skills/transition-planner.md) — primary skill for retirement waves
9. [`data-modeler`](../../skills/data-modeler.md) — for archival planning
10. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — for retention, legal hold, regulatory exposure
11. [`communication-packager`](../../skills/communication-packager.md)
12. [`gap-radar`](../../skills/gap-radar.md)
13. [`architecture-review`](../../skills/architecture-review.md)
14. [`architecture-documenter`](../../skills/architecture-documenter.md)
15. [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)

## Review Gates That Apply

- `requirement-baseline` — confirm retirement candidate register
- `decision-approval` — confirm retirement order and approach
- `governance-review` — confirm archival, retention, legal hold, regulatory compliance
- `transition-plan` — confirm wave plan and Wave 1 readiness

`solution-direction` typically not in scope — there is no new solution being designed.

## Patterns Likely To Apply

- **Transition / decommissioning:**
  - [phased-decommissioning](../../patterns/transition/phased-decommissioning.md)
  - [parallel-operations-closure](../../patterns/transition/parallel-operations-closure.md)
  - [legacy-interface-sunset](../../patterns/transition/legacy-interface-sunset.md)
  - [legacy-batch-sunset](../../patterns/transition/legacy-batch-sunset.md)
  - [dual-write-containment](../../patterns/transition/dual-write-containment.md)
  - [strangler-modernization](../../patterns/transition/strangler-modernization.md)
  - [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
  - [cutover-rehearsal](../../patterns/transition/cutover-rehearsal.md)
  - [post-cutover-hypercare](../../patterns/transition/post-cutover-hypercare.md)
- **Data archival:**
  - [archival-and-retention](../../patterns/data/archival-and-retention.md)
  - [regulated-data-retention-and-legal-hold](../../patterns/data/regulated-data-retention-and-legal-hold.md)
  - [historical-replay-and-rebuild](../../patterns/data/historical-replay-and-rebuild.md)
- **Business:**
  - [portfolio-rationalization](../../patterns/business/portfolio-rationalization.md)
  - [application-invest-tolerate-migrate-eliminate](../../patterns/business/application-invest-tolerate-migrate-eliminate.md)

## Common Anti-Patterns

- **Retirement without dependency analysis** — callers break in production; the "unused" system turns out to feed reports nobody mentioned.
- **"Just turn it off" thinking** — works for low-stakes systems; disastrous for systems with hidden dependencies.
- **Data not archived** — lost evidence; regulator finds out at audit; customer asks for their history.
- **Customer / partner not notified** — surprise downtime; trust damage; contract breach.
- **Contracts left in place** — paying for systems that no longer run; software-license carry costs continue.
- **Talent transition skipped** — institutional knowledge lost; the people who could explain the system have moved on or left.
- **No rollback if retirement breaks something** — once the system is off, restoring is hard or impossible.
- **Retirement as cost-saving only** — ignores risk dimensions (audit, customer trust, regulatory exposure).
- **"Decommissioned" but service still running** — the system was supposedly retired; logs show it serving traffic.
- **Sunset announcements ignored** — consumers don't migrate; the retirement date arrives and they're surprised.
- **Hot data archived without retrieval test** — archive exists; nobody verified the data is retrievable until they need it.
- **No support model for archive access** — six months later someone needs archived data; nobody knows how to get it.
- **Audit trail incomplete** — what was retired, when, by whose authority, with what evidence — not all captured.
- **Legal hold ignored** — systems retired while data was under hold; legal exposure inbound.
- **Vendor staff cut before knowledge transfer** — vendor people removed in cost-cutting; institutional knowledge with them.

## Entry Criteria

- a sponsor exists for the retirement outcome
- the strategic driver is clear (cost, vendor EOL, M&A consolidation, strategic shift)
- retirement candidates exist (often from a prior `portfolio-rationalization` engagement)
- there is appetite to act, not just to produce a retirement list
- legal / procurement / HR are available as partners

## Exit Criteria

- retirement schedule is executed with named owners
- archives exist, are accessible, and have been retrieval-tested
- customers and partners have been notified per contract / regulatory requirement
- contracts have been terminated cleanly
- people whose work was on retired systems have transitioned
- audit trail is complete
- residual obligations (e.g. archive access support) are documented and assigned

## Cycling Stance

This playbook is **one-shot per retirement program**. Each program is a discrete engagement.

When new retirement candidates emerge (after the next `portfolio-rationalization` cycle or a vendor EOL announcement), run a fresh engagement.

## What This Playbook Does Not Do

- It does not decide *what* to retire — that is `portfolio-rationalization`
- It does not reshape or modernize — use `migration-wave`
- It does not handle a single bounded application — fold into `quick-solution-design` or `migration-wave`
- It does not own the financial close — partner with finance
- It does not handle redundancies at the HR level — partner with HR (this playbook flags the architectural implications)
- It does not handle data platform work — partner with `data-platform-modernization` if archive flows into a data platform

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) — most decommissioning programs follow a `portfolio-rationalization` engagement.
2. Write a one-paragraph program charter into `notes.md` — driver, success measures, timeline.
3. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
4. Pre-load `open-questions.md` with: who is the sponsor, what is the source of retirement decisions, what is the regulatory retention frame, what is the legal-hold status across in-scope systems, who in legal / procurement / HR are partners, what is the rollback appetite, what externally-visible systems exist (contract / regulatory notice obligations).
5. List the top 5–8 candidate retirements and their candidate retirement quarters (provisional).
6. Resist starting retirement waves until dependencies are honest.
7. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — usually `enterprise`; reduce to `solution` only when retiring a single bounded estate.
- **Compliance scope** — set jurisdictions, regulations, retention frame — these drive Stage 5 archival decisions. GDPR, sectoral retention, financial-services records, healthcare records all common.
- **Roles** — keep `chief-architect`, `architecture-governance-lead`, `business-analyst`, `solution-architect`, `data-architect`, `integration-architect`; add `security-architect` for systems with sensitive data; add `technology-architect` for infrastructure-heavy retirements.
- **Templates** — keep `application`, `data-object`, `interface`, `decision`, `risk`, `compliance-assessment`, `transition-architecture`, `work-package`, `gap`, `roadmap`.
- **Default mode** — `analysis` is correct; switch to `modeling` only per retirement slice.
- **Coordinator** — `coordinator_auto_route: false`; retirements are high-impact and need explicit routing.
- **Archive freshness expectation** — declare early. Hot archive (retrievable in minutes) vs cold archive (retrievable in days/weeks). Costs and SLAs differ.
- **Rollback window** — declare per system. Some retirements are reversible for 30 days; some are irreversible. Be explicit.
- **Audit trail rigor** — internal-only vs auditor-defensible vs regulator-defensible. Higher rigor = more work in Stage 10.

## Decision Points

- **Retirement order** — dependency-driven (safest) vs cost-driven (fastest savings) vs contract-end-driven (lowest cost). Most engagements blend.
- **Archive freshness model per system** — hot vs warm vs cold. Pick per data class.
- **Customer notice channel** — email / portal / mail / phone / a combination. Pick per regulatory requirement and customer relationship.
- **Contract termination strategy** — full termination at retirement vs phased step-down vs let-it-expire. Each has cost shape implications.
- **Talent transition model** — re-deploy (best for morale, slowest cost saving) vs redundancy (fastest cost saving, hardest on people, requires HR partnership) vs hybrid.
- **Rollback window per system** — none (irreversible cutover, more rehearsal needed) vs short (30 days, costlier) vs long (months, costliest).
- **Hypercare model** — embedded vs separate vs none. Match to retirement impact.
- **Audit trail rigor** — internal / auditor / regulator. Higher = more discipline through the program.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the sponsor with retirement authority and budget?
- What is the source of retirement decisions (portfolio-rationalization, vendor EOL, M&A, strategic shift)?
- What regulatory retention frame applies per data class, per jurisdiction?
- What legal-hold status applies across in-scope systems?
- Who in legal / procurement / HR are partners?
- Which systems are externally visible (contract / regulatory notice obligations)?
- What is the rollback window appetite per system?
- What is the archive freshness expectation per data class (hot, warm, cold)?
- What is the contract termination strategy per vendor?
- What is the talent transition model (re-deploy, redundancy, hybrid)?
- What is the audit trail rigor (internal, auditor, regulator)?
- What is the hypercare model post-retirement?

## Recommended Diagrams

- Retirement candidate register (systems × why × evidence × usage × TCO × candidate quarter)
- Dependency map per system (upstream consumers × downstream feeds × data sources × contracts × people × regulatory dependencies)
- Retirement order (Gantt-style: systems × quarters × dependencies × contract end dates)
- Archival plan per system (data × classification × retention period × location × retrieval procedure × legal hold)
- Customer / partner notice timeline (system × audience × channel × notice date × retirement date × alternative offered)
- Contract termination timeline (vendor × contract × termination date × cost × hand-off)
- Talent transition map (people × current system × next-role intent × knowledge-transfer plan)
- Audit trail summary (system × retirement date × authority × evidence references)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, compliance scope (GDPR / sectoral retention / financial-services records / healthcare records as applicable).
4. Run [`relationship-mapper`](../../skills/relationship-mapper.md) heavily — dependency mapping is everything in decommissioning.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Cross-Artifact Consistency Checks* (broken references after retirement) and *Governance Hygiene* (legal hold, retention compliance).

## Notes For Reviewers

When reviewing decommissioning program output:

- check that every retirement has evidence supporting why, not just assertion
- check that dependencies have been mapped (upstream, downstream, data, contracts, people, regulatory)
- check that archives are tested for retrieval, not just declared
- check that legal hold status is current at retirement date
- check that customer / partner notice was actually sent and acknowledged
- check that contracts were terminated cleanly (not just left to expire if termination was the plan)
- check that talent transition has named outcomes per person
- check that rollback approach was rehearsed where the rollback window is short
- check that hypercare ownership is named
- check that the audit trail is complete and defensible at the chosen rigor level
- check that "decommissioned" systems aren't still running quietly somewhere
