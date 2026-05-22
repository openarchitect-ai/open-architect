# Security Uplift Playbook

## Engagement Shape

- **Stance:** quasi-cyclic — bootstrap is one-shot, but security posture is continuous
- **Default mode:** `analysis` (with disciplined moves to `modeling` per uplift slice)
- **Typical duration:** months for the uplift program; ongoing operationally
- **Output emphasis:** target security architecture, defense-in-depth posture, prioritized control roadmap, evidence chain

## When To Use

Use this playbook when:

- the CISO or threat landscape is driving architectural change (not a specific regulator)
- the organization is rolling out zero-trust, defense-in-depth, or a major identity strategy
- a recent threat model exposes architectural gaps that need coordinated remediation
- security needs to become a first-class architectural concern across many solutions
- multiple solutions need consistent security uplift (identity, secrets, audit, encryption, isolation)

## When Not To Use

Do **not** use this playbook when:

- a regulator is the dominant driver (use `compliance-driven-modernization`)
- a specific incident just happened (use `post-incident-architecture-review`)
- a single solution needs security review (use `quick-solution-design` with a security focus)
- this is M&A-driven security integration (use `post-acquisition-integration`)

## What Good Looks Like

- explicit target security architecture grounded in a current threat model
- defense-in-depth posture across identity, network, runtime, data, and observability layers
- identity, access, encryption, secrets, audit, and detection all explicit and operationally testable
- prioritized control uplift roadmap with named owners and timelines
- residual risk accepted at the right level
- security observability that operates as a control, not a dashboard
- a measurable improvement target (not just "more secure")

## Stages

### Stage 1 — Frame The Uplift

- **Entry signals:** sponsor exists (typically CISO or CIO); the driver is clear (zero-trust ambition, threat-landscape shift, audit finding without regulator scope, breach risk)
- **Key questions:** why now, what success looks like, what is in/out of scope, what is the threat-model anchor, who is the decision authority
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** uplift charter, stakeholders, success measures (control coverage, MTTD, MTTR, blast-radius metrics), scope
- **Exit signals:** the charter is reviewable by the sponsor

### Stage 2 — Baseline Current Security Posture

- **Entry signals:** scope is bounded
- **Key questions:** which controls exist today, how they perform, where coverage is weak, what evidence supports the current posture, what is the maturity per layer
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md), [`gap-radar`](../../skills/gap-radar.md)
- **Expected outputs:** control posture per layer (identity, network, runtime, data, observability), evidence inventory, known coverage gaps
- **Exit signals:** the posture is reviewable; weak items are flagged, not hidden

### Stage 3 — Threat Model The Estate

- **Entry signals:** baseline posture is in hand
- **Key questions:** who are the realistic adversaries (external, supply-chain, insider, opportunistic, targeted), what hurts most if compromised (crown jewels), what attack paths are credible, what is the current detection vs prevention balance
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** threat model with adversaries, crown jewels, credible attack paths, current control effectiveness signal
- **Exit signals:** the threat model is defensible; control gaps are mapped to attack paths

### Stage 4 — Decide Target Posture

- **Entry signals:** threat model is in place
- **Key questions:** zero-trust depth (network-segmentation only, identity-aware, full per-request), identity strategy (federation, workload identity, joiner-mover-leaver), defense-in-depth layering, secrets strategy, audit strategy
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** target posture decisions per layer with rationale and consequences
- **Exit signals:** the target posture is decided and defensible
- **Review gate:** `decision-approval`

### Stage 5 — Plan Uplift Waves

- **Entry signals:** target posture is decided
- **Key questions:** which control gaps must close first (by risk and dependency), what is the wave shape, what is the rollback approach per cutover, what is the operational reality check per wave
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** uplift wave plan, per-wave success criteria, rollback approach, dependencies between waves
- **Exit signals:** the wave plan is reviewable and traceable to threat model

### Stage 6 — Govern (Residual Risk, Exceptions, Evidence)

- **Entry signals:** wave plan is in place
- **Key questions:** how is residual risk accepted and reviewed, what is the exception process for solutions that cannot meet the target, what evidence does the control chain generate, how is the threat model refreshed
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** residual-risk register, exception process, evidence chain, threat-model refresh cadence
- **Exit signals:** governance posture is current and operable
- **Review gate:** `governance-review`

### Stage 7 — Wave 1 Uplift Slice

- **Entry signals:** governance is in place
- **Key questions:** what is the smallest useful Wave 1 (often: identity for one critical estate slice), who is the pilot, what proves the wave succeeded
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Wave 1 control uplift delivered, evidence captured, blast-radius / detection improvements measured
- **Exit signals:** Wave 1 has shipped and demonstrated improvement
- **Review gate:** `transition-plan`

### Stage 8 — Ongoing Operation

- **Entry signals:** Wave 1 is live
- **Key questions:** how is the threat model refreshed, how are controls tested continuously, how are new solutions onboarded to the target posture, how are exceptions reviewed and retired
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`gap-radar`](../../skills/gap-radar.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** threat-model refresh cadence, continuous control-test cadence, onboarding runbook, exception review calendar
- **Exit signals:** the uplift is operating as a continuous capability

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — primary skill for this engagement
5. [`evidence-curator`](../../skills/evidence-curator.md)
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`solution-modeler`](../../skills/solution-modeler.md)
9. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
10. [`transition-planner`](../../skills/transition-planner.md)
11. [`gap-radar`](../../skills/gap-radar.md)
12. [`architecture-review`](../../skills/architecture-review.md)
13. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm threat model and target posture scope
- `solution-direction` — confirm uplift architecture and layer choices
- `decision-approval` — confirm zero-trust depth, identity strategy, defense-in-depth choices
- `governance-review` — confirm residual risk acceptance, exception process, evidence chain
- `transition-plan` — confirm wave plan and Wave 1 readiness

## Patterns Likely To Apply

- **Identity and access:**
  - [identity-federation](../../patterns/security/identity-federation.md)
  - [workload-identity-federation](../../patterns/security/workload-identity-federation.md)
  - [identity-proofing-and-joiner-mover-leaver](../../patterns/security/identity-proofing-and-joiner-mover-leaver.md)
  - [service-to-service-identity](../../patterns/security/service-to-service-identity.md)
  - [privileged-access-segregation](../../patterns/security/privileged-access-segregation.md)
  - [break-glass-access](../../patterns/security/break-glass-access.md)
  - [privileged-session-monitoring](../../patterns/security/privileged-session-monitoring.md)
- **Network and zones:**
  - [zero-trust-network-segmentation](../../patterns/security/zero-trust-network-segmentation.md)
  - [security-zones-and-trust-boundaries](../../patterns/security/security-zones-and-trust-boundaries.md)
- **Defense-in-depth:**
  - [layered-security-controls](../../patterns/security/layered-security-controls.md)
  - [security-control-inheritance](../../patterns/security/security-control-inheritance.md)
  - [cross-boundary-data-sharing-controls](../../patterns/security/cross-boundary-data-sharing-controls.md)
- **Audit and breach response:**
  - [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)
  - [secrets-breach-response](../../patterns/security/secrets-breach-response.md)
- **Secrets and config:**
  - [secrets-and-configuration-management](../../patterns/technology/secrets-and-configuration-management.md)
  - [secrets-rotation](../../patterns/technology/secrets-rotation.md)
- **Governance:**
  - [standards-exception-management](../../patterns/governance/standards-exception-management.md)
  - [waiver-expiry-and-remediation](../../patterns/governance/waiver-expiry-and-remediation.md)
  - [policy-to-control-traceability](../../patterns/governance/policy-to-control-traceability.md)

## Common Anti-Patterns

- **Tool-first security** — buying a SIEM / EDR / CSPM and calling the architecture secure.
- **Defense-in-depth without depth** — layers exist on paper, but they all fail at the same boundary.
- **Zero-trust as marketing** — east-west traffic still trusted; the perimeter is gone but trust isn't.
- **Compliance theatre** — controls exist on paper, never tested.
- **Secrets in environment variables with no rotation** — and no break-glass plan for compromise.
- **Audit logs without retention or analysis** — generates data, surfaces nothing.
- **Threat model done once, never refreshed** — the threat landscape moves quarterly.
- **"We have firewalls"** — perimeter security as a complete answer in a perimeter-less estate.
- **Weak joiner stage** — identity proofing skipped at onboarding, gaming the whole identity chain.
- **Break-glass as default access** — emergency access used routinely; nobody notices when it's misused.
- **Uplift without operational reality check** — controls deployed, operators have no runbook, alerts ignored.
- **No measurable security KPIs** — "more secure" is the outcome; nothing can be proven or improved.

## Entry Criteria

- a sponsor with security authority (CISO, CIO, head of security)
- the driver is clear (threat landscape shift, audit finding, board mandate, zero-trust ambition)
- baseline visibility into current controls exists or can be gathered
- there is appetite for architectural change, not just tool procurement

## Exit Criteria (Bootstrap)

- target security architecture is decided with rationale
- uplift wave plan is reviewable and traceable to threat model
- residual risk is accepted at the right level
- Wave 1 control uplift has shipped and demonstrated improvement
- exception process is operable
- threat-model refresh cadence is on the calendar

## Cycling Stance

This playbook is **quasi-cyclic**. Bootstrap is one-shot — once the uplift program is running, Stages 1–7 do not repeat in the same form. But security posture is continuous:

- **per new solution onboarded:** Stages 4–5 cycle at solution level
- **per threat-model refresh (quarterly or per major change):** Stage 3 cycles
- **per exception review (quarterly recommended):** governance review cycle

## What This Playbook Does Not Do

- It does not handle a specific live incident — use `post-incident-architecture-review`
- It does not handle regulator-driven security — use `compliance-driven-modernization`
- It does not own ongoing security operations (SOC, incident response) — partner with security ops
- It does not procure security tools — that is a separate engagement, often `vendor-evaluation-and-selection` flavored

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior security work exists.
2. Write a one-paragraph uplift charter into `notes.md` — why, by when, what success looks like.
3. Take an initial position on zero-trust depth (network-segmentation only, identity-aware, full per-request). Provisional is fine.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the sponsor with security authority, what is the most recent threat-model output, what controls exist today, what audit findings are open, what crown jewels exist, what is the current identity strategy maturity.
6. List the top 5 crown jewels — what hurts most if compromised.
7. Resist designing controls until threat model is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Compliance scope** — typically includes cybersecurity frameworks; add `nis2`, `dora`, sectoral cyber rules if applicable to the estate.
- **Roles** — keep `security-architect` (primary), `chief-architect`, `architecture-governance-lead`; add `data-architect` for data-classification heavy work; add `integration-architect` for identity federation work.
- **Templates** — keep `principle`, `technology-standard`, `decision`, `risk`, `compliance-assessment`; keep `transition-architecture` and `work-package` for the uplift waves.
- **Default mode** — `analysis` is correct; switch to `modeling` only per wave.
- **Coordinator** — `coordinator_auto_route: false`; security uplift is decision-heavy and needs explicit human routing.
- **Threat model anchor** — declare which threat model framework (STRIDE, attack trees, ATT&CK, custom). Affects the rest.
- **Zero-trust depth** — pick early: network-segmentation only, identity-aware, full per-request. Determines the rest of the architecture.
- **Identity strategy** — federation vs single IdP, workload identity approach, joiner-mover-leaver maturity.
- **Evidence cadence** — control testing cadence (continuous, monthly, quarterly). Defines operational reality.

## Decision Points

- **Zero-trust depth** — network-segmentation, identity-aware, full per-request. Each layer up costs more and protects more.
- **Identity strategy** — federation vs centralized IdP, workload identity model, joiner-mover-leaver maturity.
- **Secrets strategy** — vault-centric vs platform-managed, rotation cadence, break-glass model.
- **Network strategy** — perimeter-only (legacy), zoned, microsegmented, zero-trust.
- **Audit strategy** — centralized SIEM, distributed with central correlation, tamper-evident logging scope.
- **Detection vs prevention balance** — investing more in prevention can reduce detection load and vice versa.
- **Exception process strictness** — every exception time-bound and reviewed, vs trusted-team broad waivers.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- What is the most recent threat model, and when was it refreshed?
- Who is the sponsor with security authority?
- What audit findings are currently open?
- What crown jewels exist (what hurts most if compromised)?
- What is the current identity strategy (IdP, federation, workload identity, JML maturity)?
- What is the network architecture today (perimeter, zones, microseg, zero-trust)?
- What is the secrets strategy (vault, rotation cadence, break-glass)?
- What is the audit strategy (SIEM coverage, retention, correlation, tamper-evidence)?
- What is the detection vs prevention investment balance?
- What is the exception process for solutions that can't meet target posture?
- What controls are tested continuously, and what only at audit?
- What is the residual-risk acceptance authority?

## Recommended Diagrams

- Threat model diagram (adversaries × attack paths × crown jewels × current control effectiveness)
- Target posture layer diagram (identity → network → runtime → data → observability, with control mapping)
- Defense-in-depth view per attack path (showing the layers each path must defeat)
- Trust boundary map (zones, segmentation, east-west vs north-south traffic posture)
- Uplift wave timeline (waves × controls × dependencies × success criteria)
- Identity flow per critical interaction (user / workload → IdP → resource, with verification points)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, compliance scope, and role enablement.
4. Run [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) before [`solution-modeler`](../../skills/solution-modeler.md) — for security uplift, the threat model is the constraint set.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Present-Day Standards Gaps* (zero-trust, secrets rotation cadence, audit) and *Ownership Truthfulness Risks* (control ownership).

## Notes For Reviewers

When reviewing security uplift output:

- check that the threat model is current and grounds the decisions
- check that controls are operationally testable, not just declarative
- check that defense-in-depth has actual depth (independent layers, not duplicated ones)
- check that residual risk has named accepting authority
- check that exception process has expiry and remediation, not perpetual waivers
- check that detection capability matches blast-radius assumptions
- check that joiner-mover-leaver is operable, not just defined
- check that the uplift addresses the threat model, not the team's preferred technologies
- check that improvement targets are measurable (MTTD, MTTR, control coverage, exception count)
