# Vendor Evaluation And Selection Playbook

## Engagement Shape

- **Stance:** one-shot, decision-focused
- **Default mode:** `analysis` (with explicit moves to `decision`)
- **Typical duration:** weeks to a few months
- **Output emphasis:** evidence-backed vendor scoring, decision with named approver, contract terms input, exit criteria documented

## When To Use

Use this playbook when:

- selecting a major vendor (enterprise software, SaaS, platform, cloud provider, integration tool, AI provider)
- a structured RFI / RFP process is appropriate
- multiple vendors compete or could compete
- the decision needs to be defensible at executive level
- contract terms (exit clause, SLAs, pricing, portability) are part of the engagement

## When Not To Use

Do **not** use this playbook when:

- tactical tool selection where `option-evaluator` alone is enough
- build vs buy where build is leaning (use `option-evaluator` or `quick-solution-design`)
- vendor selection bundled into a larger engagement (use that engagement's option-evaluator step)
- procurement-only (no architectural input required)

## What Good Looks Like

- explicit selection criteria with weights, agreed before vendors are evaluated
- scored evaluations per vendor, evidence-cited
- demo and reference call coordination with consistent scripts
- contract terms input — exit clause, SLAs, pricing structure, data portability, IP protections
- decision with named approver and rationale
- residual risk and assumption explicit
- handoff to procurement and the implementation team

## Stages

### Stage 1 — Frame The Selection

- **Entry signals:** sponsor exists; the need is clear (capability gap, vendor consolidation, contract renewal, modernization)
- **Key questions:** why now, what success looks like, what is the decision authority, what is the timeline, what is the budget envelope
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** selection charter, sponsor, decision authority, timeline, budget envelope
- **Exit signals:** the charter is reviewable by the sponsor

### Stage 2 — Define Selection Criteria With Weights

- **Entry signals:** charter is in hand
- **Key questions:** what are the must-have criteria, what are the nice-to-have criteria, what are the disqualifiers, how are criteria weighted (functional fit, NFRs, security, total cost, vendor stability, exit options, support)
- **Recommended skills:** [`requirement-normalizer`](../../skills/requirement-normalizer.md), [`option-evaluator`](../../skills/option-evaluator.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** criteria taxonomy with weights, disqualifiers, scoring rubric per criterion
- **Exit signals:** the criteria are agreed *before* vendors are evaluated, not after
- **Review gate:** `requirement-baseline`

### Stage 3 — Long-List Vendors

- **Entry signals:** criteria are in place
- **Key questions:** which vendors are credible candidates, what does market research show, what are the consolidation candidates, what is the analyst-coverage signal
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** long-list of candidate vendors with high-level fit signal
- **Exit signals:** the long-list is defensible (≥3 vendors minimum, often 5–8)

### Stage 4 — RFI / RFP Cycle

- **Entry signals:** long-list is in place
- **Key questions:** what is asked in the RFI / RFP, what is the response format, what is the response timeline, what is the evaluation process
- **Recommended skills:** [`requirement-normalizer`](../../skills/requirement-normalizer.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** RFI / RFP document, response collection mechanism, evaluation rubric per criterion
- **Exit signals:** vendor responses are collected and triaged

### Stage 5 — Short-List And Demos

- **Entry signals:** RFI / RFP responses are in
- **Key questions:** which vendors advance, what is the demo script (same script per vendor for comparability), what are the reference call expectations, what are the must-see capabilities
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** short-list (typically 2–3 vendors), demo script, reference call script, vendor-specific scoring inputs
- **Exit signals:** short-list is defensible and demos are scheduled

### Stage 6 — Score

- **Entry signals:** demos and reference calls are complete
- **Key questions:** how does each vendor score on each weighted criterion, what is the evidence per score, what are the gaps per vendor, what are the dealbreakers
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`evidence-curator`](../../skills/evidence-curator.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** vendor scores per criterion with evidence cited, gap analysis per vendor, dealbreaker register
- **Exit signals:** scoring is reviewable and defensible

### Stage 7 — Decide

- **Entry signals:** scoring is in place
- **Key questions:** what is the chosen vendor, what is the rationale, what is the residual risk, what assumptions remain, what are the contract terms required to make this work
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** decision with rationale, named approver, residual risk, assumptions
- **Exit signals:** the decision is on the record
- **Review gate:** `decision-approval`

### Stage 8 — Contract Terms Input

- **Entry signals:** decision is approved
- **Key questions:** what exit clause is needed, what SLAs must be in contract, what data portability rights, what IP protections, what termination-for-convenience timeline, what pricing structure (per-seat, per-transaction, fixed, hybrid)
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** contract-terms requirements document for procurement / legal, handover packet to implementation team
- **Exit signals:** procurement and implementation teams have what they need

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`requirement-normalizer`](../../skills/requirement-normalizer.md)
4. [`baseline-discovery`](../../skills/baseline-discovery.md)
5. [`option-evaluator`](../../skills/option-evaluator.md) — primary skill for scoring
6. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
7. [`evidence-curator`](../../skills/evidence-curator.md)
8. [`solution-modeler`](../../skills/solution-modeler.md) — when assessing fit against the target architecture
9. [`decision-recorder`](../../skills/decision-recorder.md) — primary skill for the final decision
10. [`gap-radar`](../../skills/gap-radar.md)
11. [`architecture-review`](../../skills/architecture-review.md)
12. [`architecture-documenter`](../../skills/architecture-documenter.md)
13. [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)

## Review Gates That Apply

- `requirement-baseline` — confirm selection criteria and weights *before* vendor evaluation
- `solution-direction` — confirm short-list and target architecture fit
- `decision-approval` — confirm vendor decision with named approver

`governance-review` typically not in scope unless the selection is for a regulated capability.
`transition-plan` typically belongs to the implementation engagement that follows.

## Patterns Likely To Apply

- **Decision and governance:**
  - [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md)
  - [decision-authority-matrix](../../patterns/governance/decision-authority-matrix.md)
  - [decision-evidence-packaging](../../patterns/governance/decision-evidence-packaging.md)
  - [standards-exception-management](../../patterns/governance/standards-exception-management.md)
- **Business:**
  - [portfolio-rationalization](../../patterns/business/portfolio-rationalization.md)
- **Security / compliance considerations during scoring:**
  - [cross-boundary-data-sharing-controls](../../patterns/security/cross-boundary-data-sharing-controls.md)
  - [data-residency-and-sovereignty](../../patterns/data/data-residency-and-sovereignty.md)
- **For AI-vendor selection, also:**
  - [model-vendor-portability](../../patterns/ai/model-vendor-portability.md)

## Common Anti-Patterns

- **Selection criteria written after vendor preferences are known** — the rubric is reverse-engineered from the desired outcome.
- **Demo-driven decisions** — the vendor who wins the room, not the one that fits the requirements.
- **No exit clause negotiated** — vendor knows you can't leave, prices rise.
- **Reference calls with vendor's hand-picked customers** — biased signal; ask for at least one customer the vendor *didn't* pick.
- **Lowest-cost wins (TCO ignored)** — surprise costs over 3–5 years dominate the initial price.
- **Politics over evidence** — the executive's preferred vendor wins regardless of score; the rubric becomes theatre.
- **Single-evaluator scoring** — one person's preferences shape the outcome; no triangulation.
- **Contract terms left to procurement after architectural fit is decided** — exit posture, SLAs, data portability ignored until too late.
- **No dealbreaker register** — soft criteria masquerading as hard ones, or vice versa.
- **Inconsistent demo scripts** — vendors demoed on different scenarios; results not comparable.
- **No mandatory PoC for high-stakes choices** — selecting on slideware.
- **Vendor lock-in pretended away** — claimed portability with no plan or test.
- **Long-list with two real candidates** — selection is theatre when only one vendor was ever credible.
- **Compliance / security as last-stage check** — selected vendor disqualified at security review after weeks of work.
- **No residual risk register** — the decision is "accepted" with no honest catalog of what could still go wrong.

## Entry Criteria

- a sponsor with funding and decision authority
- a clear capability need (or contract renewal driver)
- a timeline and budget envelope
- at least three credible candidate vendors (or willingness to extend the long-list)
- appetite for evidence-backed selection, not the executive's preferred vendor

## Exit Criteria

- vendor decision is on the record with named approver and rationale
- contract terms requirements are handed to procurement / legal
- implementation team has the handover packet
- residual risks and assumptions are explicit
- the next engagement (implementation, integration, or rollout) can start

## Cycling Stance

This playbook is **one-shot**. Vendor selection is a discrete engagement.

When the selected vendor's contract comes up for renewal, run a fresh engagement — do not let this playbook become a permanent rolling review. For ongoing vendor relationship management, that lives under `steady-state-governance` cadences.

## What This Playbook Does Not Do

- It does not implement the chosen vendor — that is the implementation engagement
- It does not negotiate the contract — that is procurement / legal (this playbook produces the terms input)
- It does not run procurement compliance / approval — partner with procurement
- It does not handle build-vs-buy decisions where build is leaning — use `option-evaluator` or `quick-solution-design`
- It does not handle multi-vendor portfolio analysis — use `portfolio-rationalization`

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if any prior vendor work exists in the project folder.
2. Write a one-paragraph selection charter into `notes.md` — capability need, decision authority, timeline, budget envelope.
3. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
4. Pre-load `open-questions.md` with: who is the decision authority, what is the timeline, what is the budget envelope, what are the must-have criteria, what are the disqualifiers, what is the exit-posture bar.
5. Draft the criteria taxonomy and weight ranges (provisional). Validate with stakeholders *before* vendor evaluation.
6. Identify the long-list candidates.
7. Resist demoing any vendor before criteria are agreed.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — usually `solution` for tactical selection, `enterprise-and-solution` for platform selection.
- **Compliance scope** — set if vendor handles regulated data (GDPR, HIPAA, PCI, sectoral), AI use (AI Act), or cross-border data (residency).
- **Roles** — keep `chief-architect`, `architecture-governance-lead`, `business-analyst`; add `security-architect` for security-sensitive selection; add `data-architect` for data-platform vendors; add `integration-architect` for integration tooling; add `solution-architect` for solution-level fit.
- **Templates** — keep `requirement`, `decision`, `risk`, `principle`; keep `compliance-assessment` for regulated selection.
- **Default mode** — `analysis` is correct; explicit `decision` at Stages 7–8.
- **Coordinator** — `coordinator_auto_route: false`; vendor selection is high-stakes and needs explicit human routing.
- **PoC requirement** — for high-stakes choices, require a mandatory PoC in Stage 5. Declare this in `requirement-normalizer`.
- **Exit posture bar** — declare early: accept lock-in, API-parity portability, full data portability. Each level affects RFP wording.
- **Reference call rigor** — vendor-picked (lighter) vs we-pick (heavier) vs both. Both is most defensible.

## Decision Points

- **Long-list size** — wider (8+ vendors, more rigor) vs narrower (3–5, faster). Wider for high-stakes; narrower for tactical.
- **RFI vs RFP** — RFI (lighter, capability-focused) vs RFP (heavier, response-focused). Stack: RFI → short-list → RFP.
- **Mandatory PoC** — yes (more rigor, longer cycle) vs no (faster, more risk).
- **Reference call rigor** — vendor-picked only, plus we-pick, or both. Both is recommended for high-stakes.
- **Scoring approach** — weighted-sum (simple, can hide tradeoffs) vs multi-dimensional (more honest, harder to summarize). Multi-dimensional is recommended for high-stakes.
- **Dealbreaker explicitness** — soft (compensating controls allowed) vs hard (immediate disqualification). Hard is clearer.
- **Contract terms timing** — included in RFP responses (vendors price the terms in) vs negotiated after selection (lower stated price, higher negotiation cost).

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the decision authority for the final selection?
- What is the timeline (RFI / RFP / decision / contract / start-of-implementation)?
- What is the budget envelope (initial, 3-year TCO, 5-year TCO)?
- What are the must-have criteria? What are the disqualifiers?
- What is the exit-posture bar (accept lock-in / API parity / data portability)?
- What is the regulatory frame (GDPR, HIPAA, PCI, AI Act, sectoral)?
- What is the integration shape required (API, event, batch, file, B2B)?
- What are the SLA expectations (uptime, latency, support tier)?
- What is the data portability requirement (export format, frequency, completeness)?
- What is the mandatory-PoC stance?
- What is the reference-call rigor (vendor-picked, we-pick, both)?
- What is the scoring approach (weighted-sum vs multi-dimensional)?
- What is the contract-term timing (RFP-included vs post-selection)?
- What is the residual-risk acceptance authority?

## Recommended Diagrams

- Criteria weight matrix (criteria × weight × rubric)
- Vendor short-list radar chart (vendors × criteria, normalized)
- Scoring summary table (vendors × criteria × score × evidence reference)
- Dealbreaker register (vendor × disqualifier triggered × evidence)
- TCO comparison (vendors × 3–5 year TCO with line-item breakdown)
- Exit posture map (vendor × portability surface × test status)
- Decision summary (chosen vendor × rationale × residual risk × assumptions × approver)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`. Declare exit posture bar and PoC requirement in `notes.md`.
4. Run [`requirement-normalizer`](../../skills/requirement-normalizer.md) to lock criteria *before* any vendor demo.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Ownership Truthfulness Risks* (vendor claims that can't be evidenced) and *Inconsistencies* (criteria drift between stages).

## Notes For Reviewers

When reviewing vendor evaluation and selection output:

- check that criteria and weights were agreed *before* vendors were scored
- check that every score is evidence-cited
- check that reference calls included at least one we-picked customer (for high-stakes selection)
- check that exit clause, SLAs, data portability are in the contract terms input
- check that TCO is calculated, not just initial price
- check that the dealbreaker register is honest (no soft criteria masquerading as hard ones)
- check that compliance / security was reviewed early, not at the end
- check that residual risk has named accepting authority
- check that the chosen vendor's win is defensible to someone outside the room
