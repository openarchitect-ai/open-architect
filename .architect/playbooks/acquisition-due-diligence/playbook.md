# Acquisition Due Diligence Playbook

## Engagement Shape

- **Stance:** one-shot, time-bounded by deal timeline (often compressed)
- **Default mode:** `analysis` (extracting facts under information constraints)
- **Typical duration:** weeks
- **Output emphasis:** technical risk register, integration cost estimate, crown-jewel inventory, deal-impact decisions, evidence for the deal team

## When To Use

Use this playbook when:

- you are on the acquirer side, pre-close
- a target company's tech estate must be assessed for risk, value, and integration cost
- the deal team needs technical input for valuation, negotiation, or go/no-go
- access to the target is constrained (limited data room, limited interviews, limited time)
- the deal could close in weeks, not months, and findings must reach negotiation in time

## When Not To Use

Do **not** use this playbook when:

- the deal has already closed (use `post-acquisition-integration`)
- you are the target being acquired (different engagement: information-request fulfillment shape)
- general portfolio rationalization unrelated to M&A (use `portfolio-rationalization`)
- minor acquisition where diligence is procurement-driven only (no architectural input required)

## What Good Looks Like

- technical risk register with severity, evidence, and integration-cost implications
- integration cost estimate (TSA scope, Day 1, Day 90, full integration)
- crown-jewel inventory of the target — what is most valuable, what is most fragile
- deal-impact decisions on the record (price adjustment, escrow asks, walk-away triggers, contingencies)
- evidence package for the deal team and legal
- handoff plan to `post-acquisition-integration` if the deal closes (or a clean close-out if it does not)
- compliance and security risk flagged early, not at the end

## Stages

### Stage 1 — Frame The Diligence

- **Entry signals:** deal team has engaged you; deal timeline is communicated; access to the data room is starting
- **Key questions:** what is the deal context, who is the decision authority (deal team, legal, executive sponsor), what is the timeline, what is the budget envelope, what are the must-answer questions, what are the walk-away triggers
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** diligence charter, decision authority, timeline, must-answer questions, walk-away trigger list
- **Exit signals:** the charter is reviewable by the deal team

### Stage 2 — Establish Data Room Access

- **Entry signals:** charter is agreed
- **Key questions:** what is in the data room, what is missing (and what to ask for), what interview / Q&A windows are available, who at the target can speak to architecture, what NDAs and confidentiality rules apply
- **Recommended skills:** [`evidence-curator`](../../skills/evidence-curator.md), [`baseline-discovery`](../../skills/baseline-discovery.md)
- **Expected outputs:** data room inventory, evidence-request list for the gaps, interview / Q&A plan
- **Exit signals:** you know what you have, what you don't, and how to get more

### Stage 3 — Inventory The Target Estate

- **Entry signals:** data room access is in hand
- **Key questions:** what applications exist (and what are they actually used for), what data lives where (with what classification), what infrastructure (cloud, on-prem, colo), what vendors and contracts apply, what people are key, what is the operational reality (incidents, debt, vulnerabilities)
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** target estate inventory (applications, data, infrastructure, vendors, contracts, key people), evidence-cited
- **Exit signals:** every in-scope domain has enough evidence to assess risk

### Stage 4 — Identify Technical Risks

- **Entry signals:** estate inventory is in hand
- **Key questions:** what security debt exists (vulnerabilities, posture, audit findings), what compliance exposure (regulator obligations the target doesn't meet, jurisdictional shifts post-deal), what tech debt is material, what IP / open source / licensing risk exists, what vendor lock-in is heavy, what key-person dependency exists, what shadow tech estate exists
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`gap-radar`](../../skills/gap-radar.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** technical risk register (security, compliance, tech debt, IP, vendor lock-in, key-person, shadow estate), severity per item, evidence per item
- **Exit signals:** the risk picture is reviewable and defensible

### Stage 5 — Estimate Integration Cost

- **Entry signals:** risks are mapped
- **Key questions:** what is the TSA scope you will need from the seller, what is the Day 1 cost (preserve operations), what is the Day 90 cost (urgent integration / risk remediation), what is the full integration cost, what is the timeline, what assumptions back the estimate
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`transition-planner`](../../skills/transition-planner.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** integration cost estimate (TSA + Day 1 + Day 90 + full), assumptions, sensitivity ranges, dependency on deal terms
- **Exit signals:** the estimate is reviewable and ties to specific risk items

### Stage 6 — Identify Crown Jewels And Fragilities

- **Entry signals:** inventory and risks are in place
- **Key questions:** what is the most valuable part of the target's tech (proprietary capability, key contracts, key people, key data), what is the most fragile (single-point-of-failure systems, single-key-person dependency, vendor concentration, regulatory cliff), what is genuinely differentiated vs commodity
- **Recommended skills:** [`evidence-curator`](../../skills/evidence-curator.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** crown-jewel inventory with evidence and protection requirements; fragility register with severity and mitigation cost
- **Exit signals:** the deal team understands what they are buying and what could break

### Stage 7 — Generate Deal-Impact Decisions

- **Entry signals:** risks, cost estimate, crown jewels are in place
- **Key questions:** does the technical picture support the price, what price adjustment is justified, what should be in escrow, what are the walk-away triggers, what contingencies should be in the deal documents, what reps and warranties should be sought
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`option-evaluator`](../../skills/option-evaluator.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** deal-impact recommendations (price, escrow, walk-away triggers, contingencies, reps and warranties), evidence-cited
- **Exit signals:** the deal team has actionable technical input for negotiation
- **Review gate:** `decision-approval`

### Stage 8 — Handoff (Deal Closes Or Closes Out)

- **Entry signals:** deal is approaching close (or signaling it won't)
- **Key positions:** if deal closes, what does `post-acquisition-integration` need to start clean; if deal doesn't close, what is the close-out (data destruction per NDA, lessons captured, archive)
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** handoff packet (if deal closes) covering risks, integration cost basis, crown jewels, TSA shape; or close-out package (if deal does not close) including NDA-compliant data destruction
- **Exit signals:** the engagement closes cleanly in either direction

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md) — primary skill, constrained version
4. [`evidence-curator`](../../skills/evidence-curator.md)
5. [`relationship-mapper`](../../skills/relationship-mapper.md)
6. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — primary skill for risk register
7. [`option-evaluator`](../../skills/option-evaluator.md)
8. [`decision-recorder`](../../skills/decision-recorder.md)
9. [`transition-planner`](../../skills/transition-planner.md) — for integration cost shape
10. [`solution-modeler`](../../skills/solution-modeler.md)
11. [`gap-radar`](../../skills/gap-radar.md)
12. [`architecture-review`](../../skills/architecture-review.md)
13. [`architecture-documenter`](../../skills/architecture-documenter.md)
14. [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)

## Review Gates That Apply

- `requirement-baseline` — confirm the must-answer questions and walk-away triggers
- `governance-review` — confirm compliance and risk findings are reviewable by legal
- `decision-approval` — confirm deal-impact recommendations to the deal team

`solution-direction` and `transition-plan` typically not in scope — they belong to `post-acquisition-integration` after close.

## Patterns Likely To Apply

- **Decision and governance:**
  - [decision-evidence-packaging](../../patterns/governance/decision-evidence-packaging.md)
  - [decision-authority-matrix](../../patterns/governance/decision-authority-matrix.md)
  - [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md)
- **Business / portfolio assessment:**
  - [portfolio-rationalization](../../patterns/business/portfolio-rationalization.md)
  - [application-invest-tolerate-migrate-eliminate](../../patterns/business/application-invest-tolerate-migrate-eliminate.md)
  - [business-capability-heatmap](../../patterns/business/business-capability-heatmap.md)
- **Integration cost shape (for estimating):**
  - [strangler-modernization](../../patterns/transition/strangler-modernization.md)
  - [coexistence-data-migration](../../patterns/transition/coexistence-data-migration.md)
  - [parallel-run](../../patterns/transition/parallel-run.md)
- **Security and data (for diligence):**
  - [data-classification-and-handling](../../patterns/data/data-classification-and-handling.md)
  - [data-residency-and-sovereignty](../../patterns/data/data-residency-and-sovereignty.md)
  - [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)
  - [cross-boundary-data-sharing-controls](../../patterns/security/cross-boundary-data-sharing-controls.md)

## Common Anti-Patterns

- **Diligence on slideware** — vendor and target slides taken as truth; the data room reality is different.
- **No access to data room reality** — only executive summaries reviewed; actual logs, tickets, runbooks, code never seen.
- **Cost estimate without integration shape** — assumes lift-and-shift everything, or assumes refactor-everything; both wrong.
- **Treating tech debt as "we'll fix it after close"** — debt drives the integration cost; pretending otherwise sets the deal up to fail post-close.
- **No key-person dependency map** — the deal closes, two engineers leave, the crown-jewel system has no maintainers.
- **Ignoring contracts** — vendor exit costs, customer notice obligations, employment contracts; these dominate integration cost.
- **No "walk-away trigger" list** — no objective basis for advising against the deal.
- **Diligence team not co-located with deal team** — findings don't reach deal decisions in time.
- **One-shot diligence with no follow-up Q&A** — the first question raises three more; without follow-up access, gaps remain.
- **Compliance and security as last-stage check** — deal-team momentum overrides late-arriving "no".
- **Cultural diligence skipped** — the architecture review misses the people / process / culture reality of the target.
- **Integration cost estimate based on internal benchmarks** — your org's costs don't apply to the target's reality (especially for smaller / older / faster targets).
- **Open source / IP risk overlooked** — copyleft licenses, indemnification gaps, key dependencies on individuals' personal repos.
- **No data room destruction plan if deal doesn't close** — NDAs require it; sloppy close-outs create legal exposure.
- **Confusing diligence with negotiation** — the diligence team should produce evidence, not arguments.

## Entry Criteria

- the deal team has engaged you with a clear timeline and decision authority
- access to the data room is starting (or imminent)
- NDA / confidentiality framework is in place
- the must-answer questions and walk-away triggers can be drafted
- there is appetite for honest findings, not just confirmation of the deal

## Exit Criteria

- technical risk register is evidence-cited and severity-marked
- integration cost estimate has TSA + Day 1 + Day 90 + full integration figures with assumptions
- crown-jewel inventory is in place
- fragility register is in place
- deal-impact recommendations are on the record with named authority
- handoff plan to `post-acquisition-integration` is ready (or NDA-compliant close-out is complete)
- the deal team has what they need for negotiation

## Cycling Stance

This playbook is **one-shot per deal**. Each acquisition is its own engagement.

When the deal closes, hand off to `post-acquisition-integration`. When it does not close, close out cleanly per NDA.

## What This Playbook Does Not Do

- It does not execute the integration — that is `post-acquisition-integration`
- It does not run the deal negotiation — that is the deal team / M&A function (this playbook supplies the evidence)
- It does not handle financial diligence — partner with finance
- It does not handle legal diligence — partner with legal
- It does not handle cultural / HR diligence at the people level — partner with HR / culture diligence specialists
- It does not own the divestiture side — use `divestiture-separation` for that

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if any prior diligence context exists.
2. Write a one-paragraph diligence charter into `notes.md` — deal context, decision authority, timeline, must-answer questions, walk-away triggers.
3. Establish data room access expectations — what you have, what you need.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the decision authority, what is the deal timeline, what are the must-answer questions, what are the walk-away triggers, what is the integration ambition (full integration, autonomous subsidiary, holdco), what regulatory shifts apply (jurisdictional, sectoral, AI Act, financial services).
6. List the top 5 categories of risk you expect to investigate (security, compliance, tech debt, IP, vendor lock-in, key-person, shadow estate).
7. Resist deep design work — diligence is fact-finding, not solutioning.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — usually `enterprise-and-solution`; reduce only when diligence is genuinely narrow.
- **Compliance scope** — set jurisdictions and regulations early; the combined entity post-close often triggers obligations neither side had alone.
- **Roles** — keep `chief-architect`, `architecture-governance-lead`, `business-analyst`, `security-architect`, `data-architect`, `integration-architect`, `technology-architect`.
- **Templates** — keep `decision`, `risk`, `compliance-assessment`; keep `application`, `data-object`, `technology-component` for target estate inventory.
- **Default mode** — `analysis` is correct; this engagement is fact-finding.
- **Coordinator** — `coordinator_auto_route: false`; high-stakes, time-pressured, explicit human routing.
- **Time pressure** — most diligence is compressed. Make the must-answer-question list tight; the rest is nice-to-have.
- **Integration ambition** — declare early (full integration, autonomous subsidiary, holdco). Affects integration cost shape.

## Decision Points

- **Integration ambition** — full integration vs autonomous subsidiary vs holdco. Affects all downstream cost.
- **TSA scope ask** — wide (more cost but smoother) vs narrow (less cost, more risk).
- **Walk-away triggers** — explicit, evidence-cited, agreed with deal authority *before* diligence concludes.
- **Risk threshold** — what severity counts as material vs material with mitigation vs walk-away.
- **Diligence depth per area** — even time across all areas vs depth on the highest-value/highest-risk areas.
- **Follow-up access** — one-shot vs iterative Q&A. Iterative is much higher quality but harder to negotiate.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the decision authority for the deal, and at what threshold of finding do they want to be alerted?
- What is the deal timeline (signing → close → first 100 days)?
- What integration ambition is in scope (full integration, autonomous subsidiary, holdco)?
- What are the must-answer questions for go/no-go?
- What are the walk-away triggers?
- What regulatory shifts will the combined entity face?
- What is the TSA scope ask (how much do we need from the seller, for how long)?
- What is the integration cost envelope assumed in the deal model?
- What is the key-person retention plan (if applicable)?
- What is the IP / open source / licensing risk posture?
- What is the cybersecurity posture (audit findings, recent incidents, vulnerability count)?
- What is the data room access shape (one-shot, iterative Q&A, interview windows)?
- What is the NDA destruction plan if the deal doesn't close?

## Recommended Diagrams

- Target estate map (applications × data × infrastructure × vendors × key people)
- Risk heatmap (categories × severity × evidence × integration cost impact)
- Integration cost stack (TSA + Day 1 + Day 90 + full integration, with sensitivity ranges)
- Crown jewel + fragility map (most valuable × most fragile, with concentration risk)
- Dependency map (cross-application, cross-vendor, cross-data; expose hidden coupling)
- Walk-away trigger map (severity × trigger × evidence × deal team alerted)
- Integration ambition impact (full vs autonomous vs holdco; cost / risk / timeline)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`. Set compliance scope based on what the combined entity will face.
4. Run [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) early — risk drives most diligence findings.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Drift Signals* (gap between target's claims and evidence) and *Ownership Truthfulness Risks* (key-person claims).

## Notes For Reviewers

When reviewing acquisition due diligence output:

- check that every risk has evidence cited, not just assertion
- check that the integration cost estimate has assumptions and sensitivity ranges
- check that crown jewels are identified with protection requirements
- check that key-person dependencies are mapped and named
- check that compliance shifts (combined entity vs each alone) are surfaced
- check that walk-away triggers are explicit and evidence-cited
- check that contracts (vendor, customer, employment) are reviewed for integration impact
- check that the close-out path is defined if the deal doesn't close
- check that the diligence team's findings reached the deal team's decision points (not produced too late to matter)
- check that diligence stayed fact-finding — not slipping into negotiation strategy
