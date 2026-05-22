# Post-Incident Architecture Review Playbook

## Engagement Shape

- **Stance:** one-shot, time-bounded (urgent), with follow-on hypercare
- **Default mode:** `analysis` initially, then `modeling` for the fix, then back to `analysis` for permanent guardrails
- **Typical duration:** weeks for review and decisions; months for full remediation
- **Output emphasis:** root-cause architectural decisions, permanent guardrails, evidence chain, communications package

## When To Use

Use this playbook when:

- a major outage, breach, data loss, or systemic failure has happened
- architecture changes are urgent — not optional
- leadership, regulators, or customers need to know what is changing and why
- the organization wants to prevent the *class* of failure, not just this instance
- the incident has implications across multiple solutions or shared infrastructure

## When Not To Use

Do **not** use this playbook when:

- minor incident with an operational fix only (not architectural)
- a regulator is the primary driver and the engagement is broader compliance work (use `compliance-driven-modernization`)
- the fix is at code level only, not architecture (handle as normal operational remediation)
- pre-emptive security uplift without a triggering incident (use `security-uplift`)
- the incident is a service degradation that ops fixed (write the postmortem, don't open a playbook)

## What Good Looks Like

- root cause traced to architecture, not just code
- architectural decisions that prevent recurrence of the *class*, not just this instance
- permanent guardrails (detection, prevention, blast-radius limits) in place and tested
- evidence chain for regulator, board, customers, or auditor as applicable
- residual risk owned at the right level and time-bound
- post-incident review process improved (so the next one is faster and cleaner)
- communications handled — internal and external — without surprises

## Stages

### Stage 1 — Incident Framing

- **Entry signals:** the incident is contained or moving toward containment; an after-action review is being convened
- **Key questions:** what happened, when, scope, who is affected, what is the current status, what communications have already gone out, who is the accountable executive
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** incident framing document with timeline, scope, affected parties, current containment status
- **Exit signals:** the framing is accepted by the accountable executive

### Stage 2 — Architectural Root-Cause Analysis

- **Entry signals:** framing is in hand
- **Key questions:** what enabled this — not just the trigger but the architecture that allowed it, where were the assumptions wrong, what shared infrastructure / interface / control failed, could this happen elsewhere in the estate
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** architectural RCA — contributing factors, broken assumptions, where the failure could spread, blast-radius analysis
- **Exit signals:** the RCA distinguishes architectural cause from operational trigger; "could this happen elsewhere" is answered honestly

### Stage 3 — Decide Architectural Change

- **Entry signals:** RCA is reviewable
- **Key questions:** what architectural changes are required, what are the alternatives, what is the urgency / phasing, what stays and what changes
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** decisions for architectural change with rationale, options, urgency, dependencies
- **Exit signals:** the chosen changes are decided and reviewable
- **Review gate:** `decision-approval`

### Stage 4 — Decide Permanent Guardrails

- **Entry signals:** architectural change is decided
- **Key questions:** what detection must catch the class of failure earlier next time, what prevention must block it, what blast-radius limits must contain it if it recurs, what controls are operationally testable
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** guardrail design (detection, prevention, blast-radius), with testability and owners
- **Exit signals:** guardrails are reviewable; the class of failure is bounded

### Stage 5 — Plan Remediation Waves

- **Entry signals:** decisions and guardrails are in place
- **Key questions:** what must ship first (often the guardrails), what can wait, what is the hypercare plan per wave, what is rollback if a fix introduces a new failure, what is the operational reality check
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`solution-modeler`](../../skills/solution-modeler.md), [`gap-radar`](../../skills/gap-radar.md)
- **Expected outputs:** remediation wave plan with explicit hypercare, rollback approach, success criteria
- **Exit signals:** the wave plan is reviewable and traceable to RCA
- **Review gate:** `transition-plan`

### Stage 6 — Communicate (Internal And External)

- **Entry signals:** remediation plan is approved
- **Key questions:** what does the board need to know, what does the regulator need to know (and by when), what do customers need to know, what is the internal communication, what is the legal / PR coordination
- **Recommended skills:** [`evidence-curator`](../../skills/evidence-curator.md), [`architecture-documenter`](../../skills/architecture-documenter.md), [`architecture-review`](../../skills/architecture-review.md)
- **Expected outputs:** communication packets per audience (board, regulator, customer, internal), evidence chain
- **Exit signals:** communications are coordinated and approved
- **Review gate:** `governance-review`

### Stage 7 — Execute Remediation

- **Entry signals:** plan is approved and communications coordinated
- **Key questions:** what is the per-wave delivery, how are guardrails verified, how is hypercare staffed, what is the recurrence check
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`gap-radar`](../../skills/gap-radar.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** remediation waves executed (often handed off to `migration-wave` or `compliance-driven-modernization`); guardrails verified live; hypercare runbook
- **Exit signals:** remediation is shipped, guardrails are operational

### Stage 8 — Lessons-Learned Integration

- **Entry signals:** remediation is live
- **Key questions:** what principles or patterns should be updated, what should be added to the playbook library, what should be added to `gap-radar` checklists, what review-gate process should change
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md), [`requirements-follow-up`](../../skills/requirements-follow-up.md)
- **Expected outputs:** updated principles, patterns, playbook entries, gap-radar checks (where applicable); after-action review process improvements
- **Exit signals:** the institution is materially harder to break in this way again

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md) — focused on the incident path
4. [`relationship-mapper`](../../skills/relationship-mapper.md)
5. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — primary skill for this engagement
6. [`evidence-curator`](../../skills/evidence-curator.md) — heavy emphasis for regulator / board
7. [`option-evaluator`](../../skills/option-evaluator.md)
8. [`decision-recorder`](../../skills/decision-recorder.md) — primary skill for this engagement
9. [`solution-modeler`](../../skills/solution-modeler.md)
10. [`transition-planner`](../../skills/transition-planner.md)
11. [`gap-radar`](../../skills/gap-radar.md)
12. [`architecture-review`](../../skills/architecture-review.md)
13. [`architecture-documenter`](../../skills/architecture-documenter.md)
14. [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)

## Review Gates That Apply

- `requirement-baseline` — confirm incident framing and RCA are reviewable
- `decision-approval` — confirm architectural change and guardrail decisions
- `governance-review` — confirm communications, evidence chain, regulator engagement
- `transition-plan` — confirm remediation wave plan with hypercare

## Patterns Likely To Apply

- **Reliability and recovery:**
  - [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
  - [parallel-run](../../patterns/transition/parallel-run.md)
  - [post-cutover-hypercare](../../patterns/transition/post-cutover-hypercare.md)
  - [transition-hypercare-exit-criteria](../../patterns/transition/transition-hypercare-exit-criteria.md)
  - [rollback-decision-thresholds](../../patterns/transition/rollback-decision-thresholds.md)
  - [cutover-command-center](../../patterns/transition/cutover-command-center.md)
- **Resilience:**
  - [graceful-degradation](../../patterns/technology/graceful-degradation.md)
  - [multi-region-failover](../../patterns/technology/multi-region-failover.md)
  - [active-active-vs-active-passive](../../patterns/technology/active-active-vs-active-passive.md)
  - [blue-green-canary-deployment](../../patterns/technology/blue-green-canary-deployment.md)
- **Observability:**
  - [observability-by-design](../../patterns/technology/observability-by-design.md)
- **Security breach response:**
  - [secrets-breach-response](../../patterns/security/secrets-breach-response.md)
  - [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)
  - [break-glass-access](../../patterns/security/break-glass-access.md)
- **Governance and evidence:**
  - [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md)
  - [decision-evidence-packaging](../../patterns/governance/decision-evidence-packaging.md)
  - [governance-review-gate](../../patterns/governance/governance-review-gate.md)
  - [architecture-board-decision-escalation](../../patterns/governance/architecture-board-decision-escalation.md)

## Common Anti-Patterns

- **Blame-driven post-mortem** — architects or operators blamed, system not changed. Class of failure recurs.
- **Single-cause fixation** — real incidents are multi-cause. Fixing one factor leaves the others armed.
- **Guardrails that only block this exact trigger** — the next variant gets through.
- **"We added more monitoring" as the only fix** — monitoring is detection, not prevention; without action it's just better-informed failure.
- **Operational fix labeled as architectural change** — runbook tweak documented as RCA; the same problem ships in six months.
- **Post-incident report becomes a deliverable, not a change** — filed, archived, never executed.
- **No hypercare after fix deployment** — the fix recurs in a different form because nobody is watching.
- **Skipping "could this happen elsewhere"** — the same architectural assumption breaks in another solution six months later.
- **Treating security incidents as IT incidents** — and missing the regulatory and legal dimensions.
- **Recommendations nobody owns** — actions on the table, owners absent. Nothing ships.
- **Communication mishandled** — regulator finds out from the press; customers learn about it from their bank.
- **Lessons captured but principles / patterns not updated** — institutional learning skipped.
- **RTO and MTTR confused** — recovery time objective vs mean time to recover are not the same; conflating them hides the gap.
- **Vanity remediation** — tools procured, dashboards added, root cause untouched.

## Entry Criteria

- the incident is contained or moving toward containment
- an accountable executive exists (the one named in the incident communication)
- after-action review has been convened or is being convened
- there is appetite for architectural change, not just operational remediation

## Exit Criteria

- root cause is traced to architecture and is defensible
- architectural changes are decided with named owners
- permanent guardrails are designed and have measurable signal
- remediation has shipped (or has a credible wave plan with named owners)
- communications are completed (board, regulator, customer, internal as applicable)
- residual risk is owned at the right level and time-bound
- lessons are integrated (principles, patterns, gap-radar checks updated where applicable)

## Cycling Stance

This playbook is **one-shot per incident**. It is not a continuous engagement.

The *practice* of running post-incident architecture reviews can be ongoing (every major incident triggers this playbook), but each instance closes when the remediation ships and lessons are integrated.

If the incident exposes a broader posture issue, hand off to `security-uplift` or `compliance-driven-modernization` for the longer-term work.

## What This Playbook Does Not Do

- It does not run the incident response itself — that is the SOC / SRE / on-call function
- It does not own ongoing security operations — partner with security ops
- It does not handle pre-emptive uplift — use `security-uplift`
- It does not produce the broader enterprise architecture cycle — use `full-togaf-adm`
- It does not run the regulator notification process directly — that is the legal / compliance function (this playbook supplies the evidence)

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) — incidents almost always have prior context (alerts, partial postmortems, comms drafts).
2. Write a one-paragraph incident framing into `notes.md` — what, when, scope, current containment status.
3. Identify the accountable executive and the regulatory / customer notification clock if applicable.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: what is the architectural cause vs operational trigger, where else could this happen, what controls were assumed but absent, what is the blast-radius reality vs assumption, what is the detection delta (when did we see vs when did it start).
6. Map the incident path (entry → propagation → blast → containment) at the architectural level.
7. Resist designing the fix until RCA is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — typically `enterprise-and-solution`; reduce only if the incident is genuinely local.
- **Compliance scope** — set jurisdictions and regulations if the incident has regulatory exposure (privacy → GDPR; security → NIS2, DORA; financial sector → SEC cyber disclosure rules).
- **Roles** — keep `chief-architect`, `architecture-governance-lead`, `security-architect` (most incidents touch security), `business-analyst` (for impact); add others by incident class.
- **Templates** — keep `decision`, `risk`, `compliance-assessment`; keep `transition-architecture` and `work-package` for remediation waves.
- **Default mode** — `analysis` is correct; switch to `modeling` only when the fix is being designed.
- **Coordinator** — `coordinator_auto_route: false`; high-stakes decisions, explicit human routing.
- **Notification clock** — record the regulatory notification deadline explicitly in `roadmap` from Day 1 if applicable.
- **Hypercare scope** — explicit ownership and duration; "we'll watch it for a while" is not hypercare.

## Decision Points

- **Architectural change vs operational change** — be honest about which the RCA points to.
- **Detection vs prevention investment** — for the class of failure, which improves the posture more?
- **Blast-radius reduction vs prevention** — if prevention is impractical, reducing blast radius may be the more honest remediation.
- **Communicate now vs after remediation** — depends on regulatory requirement and customer impact; legal and PR are partners.
- **Hypercare duration** — proportional to the change's blast radius and the system's recovery profile.
- **Lessons scope** — update principles only, or extend to patterns, gap-radar checks, and review-gate process.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- What was the architectural cause (vs the operational trigger)?
- Where else in the estate could this happen?
- What controls were assumed to exist but did not, or did not perform?
- What was the actual blast radius vs the assumed blast radius?
- What was the detection delta (when did we see this vs when did it start)?
- Who is the accountable executive?
- What is the regulator notification clock (if applicable)?
- What is the customer / partner notification clock (if applicable)?
- What is the legal / PR coordination?
- What guardrails (detection, prevention, blast-radius) are missing?
- What is the hypercare duration and ownership?
- What principles, patterns, or gap-radar checks should be updated as lessons?
- What is the residual-risk acceptance level for time-bounded gaps?

## Recommended Diagrams

- Incident path diagram (entry → propagation → blast → containment, architectural level)
- Architectural RCA fishbone (contributing factors across people, process, technology, controls)
- "Could this happen elsewhere" map (similar architectural pattern × where it exists × current control state)
- Blast-radius diagram before vs after remediation
- Guardrail layer diagram (detection × prevention × blast-radius limit per attack class)
- Remediation timeline (waves × communications × hypercare exit criteria × regulator clock)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`. Set compliance scope based on the incident class (privacy, security, financial-sector, sector-specific).
4. Open [`architecture/<your-project>/architect-work/`](.) and pre-load the incident framing and notification clock immediately.
5. Run [`baseline-discovery`](../../skills/baseline-discovery.md) on the incident path *before* designing the fix.
6. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Drift Signals* (assumptions vs reality) and *Ownership Truthfulness Risks* (control ownership claims that didn't hold).

## Notes For Reviewers

When reviewing post-incident architecture review output:

- check that the RCA distinguishes architectural cause from operational trigger
- check that "could this happen elsewhere" is answered honestly, not skipped
- check that guardrails address the class of failure, not just this exact trigger
- check that detection and prevention are distinct investments, not conflated
- check that blast-radius reduction is considered, not only prevention
- check that hypercare has named ownership and duration
- check that communications were coordinated (no party learned from a different one)
- check that lessons updated principles, patterns, or gap-radar checks — not just an archived document
- check that residual risk has named accepting authority and time-bound expiry
- check that the post-incident review process itself improved (so the next one is faster)
