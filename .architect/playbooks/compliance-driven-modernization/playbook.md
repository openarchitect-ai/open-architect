# Compliance-Driven Modernization Playbook

## Engagement Shape

- **Stance:** one-shot for the remediation program, with cyclic re-attestation thereafter
- **Default mode:** `analysis` (with disciplined moves to `modeling` per remediation slice)
- **Typical duration:** months for the program; ongoing for attestation
- **Output emphasis:** obligation-to-control traceability, evidence freshness, defensible remediation plan

## When To Use

Use this playbook when:

- a regulation (DORA, NIS2, AI Act, EU Data Act, Cyber Resilience Act, SEC cyber disclosure, PCI DSS, HIPAA Security Rule, FedRAMP, CMMC, FTC Safeguards, GDPR, sectoral rules) is the dominant driver of architecture change
- a known compliance gap or audit finding must be remediated by a deadline
- the engagement must produce evidence chains, not just artifacts
- residual-risk acceptance and attestation are part of the outcome
- ongoing posture maintenance is expected after delivery

## When Not To Use

Do **not** use this playbook when:

- the engagement is general modernization that *happens* to touch compliance (use `migration-wave` and enable compliance reviews)
- the engagement is enterprise-wide architecture across many obligations (use `full-togaf-adm`)
- the engagement is one bounded solution with compliance constraints (use `quick-solution-design`)
- the engagement is standing up AI capability (use `ai-platform-bootstrap` even if AI Act is the driver — the platform shape dominates)

## What Good Looks Like

- every applicable obligation is named, classified, and traced to a control
- every control is traced to evidence (artifact, log, attestation, test result)
- baseline posture is honest — gaps are explicit, not hidden
- remediation plan has named owners, due dates, and acceptance criteria
- residual risk is named and accepted at the right level
- attestation cadence is operational, not theoretical
- a defensible package exists for the regulator, auditor, or board

## Stages

### Stage 1 — Scope The Obligations

- **Entry signals:** regulator-driven mandate exists; sponsor and accountability are clear
- **Key questions:** which regulations apply (and to which use cases), what is the classification per regulation, what are the explicit obligations, what is the deadline, what is the attestation cadence
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** obligation register, classification per obligation, control framework mapping, attestation cadence
- **Exit signals:** the obligation set is the constraint set; sponsor accepts the scoping

### Stage 2 — Baseline The Posture

- **Entry signals:** obligations are scoped
- **Key questions:** which controls already exist (formally or informally), where is evidence stored, how fresh is it, which controls are missing or weak, where do silent gaps exist
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md), [`gap-radar`](../../skills/gap-radar.md)
- **Expected outputs:** control posture register, evidence inventory with freshness, named control gaps
- **Exit signals:** the posture is reviewable; weak items are flagged, not hidden

### Stage 3 — Identify Control Gaps And Remediation Direction

- **Entry signals:** posture is baselined
- **Key questions:** for each gap — is the right remediation control change, process change, technology change, or architecture change, what are the alternatives, what is the cost-evidence-time tradeoff
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** gap-to-remediation map, candidate options per gap, residual-risk stance per option
- **Exit signals:** remediation direction is defensible
- **Review gate:** `governance-review`

### Stage 4 — Decide Remediation Direction

- **Entry signals:** direction is chosen
- **Key questions:** which remediation is accepted, what waivers will be requested (and from whom), what is the residual-risk acceptance level, what compensating controls apply
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** decisions with rationale, options considered, residual-risk acceptance, waivers requested
- **Exit signals:** the chosen direction has decision artifacts and named approvers
- **Review gate:** `decision-approval`

### Stage 5 — Plan The Remediation Waves

- **Entry signals:** direction is decided
- **Key questions:** what is the smallest useful Wave 1, how do later waves depend on it, what is the evidence-capture approach per wave, what is the rollback approach if a remediation breaks operations, what is the attestation point per wave
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md)
- **Expected outputs:** transition states per wave, work packages, evidence-capture plan, attestation milestones
- **Exit signals:** the wave plan is reviewable and traceable to obligations
- **Review gate:** `transition-plan`

### Stage 6 — Continuous Governance And Evidence Capture

- **Entry signals:** delivery is underway
- **Key questions:** is evidence being captured at delivery time (not retro-fitted later), are controls being tested, are residual risks tracked, are waivers expiring, is attestation evidence current
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`evidence-curator`](../../skills/evidence-curator.md), [`gap-radar`](../../skills/gap-radar.md) (governance-hygiene emphasis), [`architecture-review`](../../skills/architecture-review.md)
- **Expected outputs:** evidence register kept current, control test results, residual-risk register, waiver expiry tracking
- **Exit signals:** the governance posture survives an unannounced audit
- **Review gate:** `governance-review` (cyclic)

### Stage 7 — Attestation

- **Entry signals:** the remediation program has reached an attestation milestone
- **Key questions:** can the obligation set be attested, what is the residual-risk acceptance, what is the next-cycle attestation date, who signs
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md), [`evidence-curator`](../../skills/evidence-curator.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** attestation package, residual-risk acceptance record, next-cycle attestation calendar
- **Exit signals:** the attestation is signed and dated; the next cycle has a calendar entry

### Stage 8 — Re-Attestation Cadence (Ongoing)

- **Entry signals:** an attestation cycle has closed
- **Key questions:** is anything stale, what has drifted in evidence or posture, what regulatory updates apply, what controls need re-testing, what waivers are expiring
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`gap-radar`](../../skills/gap-radar.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** posture refresh, drift register, regulatory update register, refreshed waiver set
- **Exit signals:** the next attestation cycle is ready to be entered cleanly

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — primary skill for this engagement
4. [`baseline-discovery`](../../skills/baseline-discovery.md)
5. [`evidence-curator`](../../skills/evidence-curator.md) — second primary skill
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`transition-planner`](../../skills/transition-planner.md)
9. [`gap-radar`](../../skills/gap-radar.md) — sweep before each governance review with governance-hygiene emphasis
10. [`architecture-review`](../../skills/architecture-review.md)
11. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm obligations and use-case classification
- `solution-direction` — confirm remediation direction per gap
- `decision-approval` — confirm decisions, waivers, residual-risk acceptance
- `governance-review` — cyclic, not finale
- `transition-plan` — confirm remediation wave plan

## Patterns Likely To Apply

- **Governance:**
  - [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md)
  - [standards-exception-management](../../patterns/governance/standards-exception-management.md)
  - [governance-review-gate](../../patterns/governance/governance-review-gate.md)
  - [waiver-expiry-and-remediation](../../patterns/governance/waiver-expiry-and-remediation.md)
  - [reference-architecture-adoption](../../patterns/governance/reference-architecture-adoption.md)
- **Security / control:**
  - [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)
  - [privileged-access-segregation](../../patterns/security/privileged-access-segregation.md)
  - [break-glass-access](../../patterns/security/break-glass-access.md)
  - [identity-federation](../../patterns/security/identity-federation.md)
  - [zero-trust-network-segmentation](../../patterns/security/zero-trust-network-segmentation.md)
- **Data:**
  - [data-classification-and-handling](../../patterns/data/data-classification-and-handling.md)
  - [archival-and-retention](../../patterns/data/archival-and-retention.md)
  - [regulated-data-access-approval](../../patterns/data/regulated-data-access-approval.md)
- **Compliance controls (jurisdiction-specific):**
  - relevant entries under [`../../compliance/controls/`](../../compliance/controls/)

## Common Anti-Patterns

- **Compliance-as-checkbox** — producing artifacts that look complete to an auditor but do not reflect real posture. Auditors notice.
- **Evidence-as-afterthought** — capturing evidence retroactively at attestation time. Evidence captured at delivery time is defensible; evidence reconstructed at attestation is not.
- **Governance-as-finale** — running compliance review only at the end. By then, remediation choices have already locked in posture.
- **Single-regulation tunnel vision** — treating one obligation in isolation when several apply. Most remediations satisfy multiple obligations; missing this wastes effort.
- **Waiver as permanent solution** — waivers that never expire become accidental policy. Every waiver needs an expiry and a remediation plan.
- **Parallel-compliance-tracks** — compliance lives in its own artifact world separate from architecture. Then nothing matches at audit.
- **Vendor-shifts-without-impact-check** — replacing a vendor and not re-validating compliance posture. Especially true for cloud, identity, and AI vendors.
- **Hand-waving residency** — using "global" or "multi-region" without naming countries, transfer mechanisms, or specific obligations.
- **Treating attestation as one-shot** — re-attestation cadence is the lifecycle, not a finale. Many regulations expect annual or per-incident refresh.
- **Compensating control without measurable signal** — claiming a control is compensating without explaining how it will be tested or monitored.
- **AI Act bolt-on** — adding AI Act obligations as a thin layer on top of an existing architecture, instead of treating them as constraints on the platform.

## Entry Criteria

- a sponsor exists and is accountable for the remediation outcome
- the applicable regulations are at least named
- a deadline or audit window is known (or being negotiated)
- there is appetite to fix posture, not just to produce documents

## Exit Criteria

- the obligation-to-control-to-evidence chain is complete and defensible
- remediation plan has named owners, due dates, and acceptance criteria
- residual risk is documented and accepted at the right level
- the next attestation cycle is on the calendar with named owners
- the engagement closes with a defensible regulator / auditor / board package

## Cycling Stance

This playbook is **one-shot for the remediation program** but the lifecycle
afterwards is cyclic. Stage 8 is permanent — the project does not "end" in
the way a quick-solution-design ends. Re-attestation cycles continue at the
cadence required by each regulation.

For a regulation with no expected refresh cadence, set a calendar entry
anyway — regulations evolve, postures decay, and what was sufficient last
year may not be sufficient next year.

## What This Playbook Does Not Do

- It does not produce the broader enterprise architecture (use `full-togaf-adm`)
- It does not modernize for modernization's sake — every change must trace to an obligation
- It does not own the operational testing of controls — partner with audit and operations
- It does not invent regulators' expectations — refer to the actual regulation text and the relevant compliance control guides

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) — most compliance engagements begin where another (often partial) effort left off.
2. Write a one-paragraph framing of the regulator-driven mandate into `notes.md` — what, why, by when, accountability.
3. Read the relevant compliance profiles under [`../../compliance/`](../../compliance/) and pre-load the obligation register.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is accountable, what is the deadline, what is the attestation cadence, what evidence is the regulator most likely to ask for, what waivers may need to be requested.
6. List the in-scope obligations and classify each (high / medium / low) for impact on architecture.
7. Reject the urge to model a target. Stay in `analysis` until baseline posture is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Compliance scope is the central tuning knob.** Set `jurisdictions`, `applicable_regulations`, `industry_sectors`, `control_frameworks`, `data_residency_requirements`, `ai_regulated_use`, and `incident_reporting_requirements` to reflect reality.
- **Roles** — keep `architecture-governance-lead`, `security-architect`, `chief-architect`; add `data-architect` for GDPR / data-residency / data-act engagements; add `business-analyst` for evidence collection.
- **Templates** — keep `decision`, `risk`, `compliance-assessment`; keep `transition-architecture` and `work-package` for remediation waves; keep `principle` and `technology-standard` if the program will create durable guardrails.
- **Default mode** — `analysis` is correct; remediation modeling per wave is fine, but the program-level mode stays analytical.
- **Coordinator** — `coordinator_auto_route: false`; compliance work needs explicit decision points, not auto-routing.
- **Review cadence** — set `governance-review` cadence explicitly; quarterly is a common starting point.
- **Attestation cadence** — declare it per regulation (annual, biennial, per-incident, continuous).

## Decision Points

- **Remediate vs accept residual risk vs request waiver** — explicit per gap, with named approver.
- **Permanent control vs compensating control** — permanent is preferred; compensating is acceptable with measurable signal and expiry.
- **Centralized control plane vs federated** — for cross-domain controls (identity, logging, residency), decide explicitly.
- **Single-evidence-store vs distributed** — centralized evidence is easier to attest; distributed is sometimes the only realistic option.
- **Vendor-managed compliance vs in-house** — when relying on a vendor's compliance posture, validate annually and have a portability stance if they fail.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Which regulations apply to which use cases, and at what classification?
- What is the deadline for first attestation, and what is the cadence thereafter?
- Who is the accountable owner for each obligation?
- What evidence will the regulator (or auditor) most likely ask for?
- What is the residual-risk acceptance authority for each obligation?
- What waivers are currently active, and when do they expire?
- What is the data-residency stance per data class, per jurisdiction?
- What is the incident-reporting obligation per regulation, with timelines?
- How is evidence captured at delivery time, not at attestation time?
- What is the control-testing cadence per control?
- Are there compensating controls, and how are they measured?
- What is the vendor-failure plan for vendors whose compliance posture we rely on?
- What regulatory updates are expected in the next 12 months?

## Recommended Diagrams

- Obligation-to-control-to-evidence map (each obligation → controls that satisfy it → evidence that demonstrates it)
- Control posture heatmap (per domain × control framework, with confidence)
- Remediation wave timeline (waves × obligations × attestation milestones)
- Data-flow diagram annotated with residency, classification, and transfer mechanism per flow
- Waiver-expiry calendar view

## Getting Started

1. Read this playbook.
2. Read the relevant compliance profiles under [`../../compliance/`](../../compliance/).
3. Copy `project-config.yaml` from this folder to your project location.
4. Set jurisdictions, regulations, sectors, and control frameworks to reflect the actual engagement.
5. Run [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) early — the obligation set drives the rest of the engagement.
6. Run [`gap-radar`](../../skills/gap-radar.md) before each `governance-review`, with governance-hygiene emphasis.

## Notes For Reviewers

When reviewing compliance-driven modernization output:

- check that every obligation is traced to a control, and every control to evidence
- check that evidence is captured at delivery time, not reconstructed at attestation
- check that residual risk is accepted at the right level, not silently passed forward
- check that waivers have explicit expiry and remediation plans
- check that compensating controls have measurable signal
- check that attestation cadence is on the calendar, not aspirational
- check that vendor-dependent compliance posture has been independently validated
- check that the engagement did not silently expand into modernization for its own sake
