# Full TOGAF ADM Playbook

## Engagement Shape

- **Stance:** cyclic
- **Default mode:** depends on phase — `inventory` for baseline, `analysis` for vision and gap, `modeling` for target and transition
- **Typical duration:** months to years (ongoing)
- **Output emphasis:** enterprise direction, target state, transitions, governance

## When To Use

Use this playbook when:

- you are running an enterprise architecture cycle, not a single solution
- stakeholders, vision, capabilities, principles, and standards need to exist as durable artifacts
- multiple initiatives and programs depend on the same architectural direction
- transitions cross domains and waves
- architecture governance, compliance, and risk are continuous concerns

## When Not To Use

Do **not** use this playbook when:

- the engagement is one bounded solution (use `quick-solution-design`)
- the engagement is one modernization program (use `migration-wave`)
- the engagement is documentation only (use `inventory-only`)
- the engagement is standing up an AI platform (use `ai-platform-bootstrap`)

## What Good Looks Like

- stakeholders, objectives, and architecture vision are explicit
- baseline and target architecture exist for the relevant domains
- gaps are visible and have planned closure
- transitions, roadmap, and work packages exist and are governed
- decisions, principles, and standards are honored consistently
- compliance, risk, and review run as a continuous cadence, not a finale

## Stages

### Stage 1 — Preliminary And Vision (ADM Preliminary + Phase A)

- **Entry signals:** enterprise or program sponsor exists; ambition is bounded enough to scope
- **Key questions:** who are the stakeholders, what are the strategic objectives, what is the architecture vision, what is the capability set, what are the durable principles
- **Recommended skills:** [`project-bootstrapper`](../../skills/project-bootstrapper.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** stakeholders, objectives, vision, principles, organization map
- **Exit signals:** vision and capability scope are reviewable
- **Review gate:** `project-bootstrap`

### Stage 2 — Business Architecture (ADM Phase B)

- **Entry signals:** vision is in place
- **Key questions:** what business capabilities support the vision, who owns them, what processes realize them, what is changing
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md)
- **Expected outputs:** business capabilities, processes, organization, business gap signal
- **Exit signals:** business architecture supports modeling the IS architecture

### Stage 3 — Information Systems Architecture (ADM Phase C)

- **Entry signals:** business architecture is in place
- **Key questions:** what applications, services, interfaces, and data objects exist today, what is changing, what is in scope, what is the target shape
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`data-modeler`](../../skills/data-modeler.md)
- **Expected outputs:** baseline and target application, service, interface, data models
- **Exit signals:** IS architecture supports technology decisions

### Stage 4 — Technology Architecture (ADM Phase D)

- **Entry signals:** IS architecture is in place
- **Key questions:** what platforms, runtimes, environments, and standards support the IS architecture, what is approved/tolerated/prohibited, what is the operational stance
- **Recommended skills:** [`technology-environment-modeler`](../../skills/technology-environment-modeler.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** technology components, standards, environments, operational stance
- **Exit signals:** target technology shape is reviewable

### Stage 5 — Opportunities, Solutions, Decisions (ADM Phase E)

- **Entry signals:** target shape is in place
- **Key questions:** what initiatives realize the target, what solution slices are in play, what decisions need to be on the record, what gaps exist
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`solution-modeler`](../../skills/solution-modeler.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** initiatives, solution slices, decisions, gap set
- **Exit signals:** chosen direction is decided and traceable
- **Review gate:** `solution-direction` and `decision-approval`

### Stage 6 — Migration Planning (ADM Phase F)

- **Entry signals:** chosen direction is decided
- **Key questions:** what transition states realize the target over time, what work packages close gaps, what is the roadmap, what dependencies exist
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md)
- **Expected outputs:** transition architectures, work packages, roadmap
- **Exit signals:** migration plan is reviewable
- **Review gate:** `transition-plan`

### Stage 7 — Implementation Governance (ADM Phase G)

- **Entry signals:** migration plan is reviewable
- **Key questions:** what compliance and risk implications apply, what evidence will be needed, how are reviews cadenced, what are the residual risks
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`architecture-review`](../../skills/architecture-review.md), [`gap-radar`](../../skills/gap-radar.md)
- **Expected outputs:** compliance assessments, risk register, review packets, residual risk
- **Exit signals:** governance posture is current and evidence-backed
- **Review gate:** `governance-review`

### Stage 8 — Architecture Change Management (ADM Phase H)

- **Entry signals:** delivery has started; change requests and learnings are coming in
- **Key questions:** what has changed in inputs, what decisions need to be revisited, what re-baselining is needed, what feeds the next cycle
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`change-coordinator`](../../skills/change-coordinator.md), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** updated artifacts, change records, next-cycle drivers
- **Exit signals:** the next cycle has clear drivers; current cycle is closed cleanly

## ADM Phase Mapping

| ADM phase style | Templates | Skills |
|---|---|---|
| Preliminary / Capability | `principle`, `organization` | `project-bootstrapper` |
| A — Vision | `stakeholder`, `objective`, `architecture-vision` | `stakeholder-objective-framer` |
| B — Business | `business-capability`, `business-process`, `organization` | `baseline-discovery`, `architecture-documenter` |
| C — Information Systems | `application`, `application-service`, `interface`, `data-object` | `application-interface-modeler`, `data-modeler` |
| D — Technology | `technology-component`, `technology-standard`, `environment` | `baseline-discovery`, `option-evaluator` |
| E — Opportunities and Solutions | `solution`, `initiative`, `gap` | `option-evaluator`, `solution-modeler` |
| F — Migration Planning | `transition-architecture`, `work-package`, `roadmap` | `transition-planner` |
| G — Implementation Governance | `compliance-assessment`, `risk`, `decision` | `risk-compliance-assessor`, `architecture-review` |
| H — Architecture Change Management | `decision`, `risk` | `requirements-follow-up`, `change-coordinator` |

This mapping is a starting point, not a constraint. Tailor in [`project-method.md`](../../method/project-method.md).

## Recommended Skill Sequence (First Cycle)

1. [`project-bootstrapper`](../../skills/project-bootstrapper.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`requirement-normalizer`](../../skills/requirement-normalizer.md)
5. [`option-evaluator`](../../skills/option-evaluator.md)
6. [`decision-recorder`](../../skills/decision-recorder.md)
7. [`solution-modeler`](../../skills/solution-modeler.md)
8. [`transition-planner`](../../skills/transition-planner.md)
9. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
10. [`gap-radar`](../../skills/gap-radar.md) — sweep before every gate
11. [`architecture-review`](../../skills/architecture-review.md)
12. [`architecture-coordinator`](../../skills/architecture-coordinator.md) — orchestrate the cycle

## Review Gates That Apply

All six default gates apply:

- `project-bootstrap`
- `requirement-baseline`
- `solution-direction`
- `decision-approval`
- `governance-review`
- `transition-plan`

## Patterns Likely To Apply

Most of the pattern library is in scope across a full cycle. Pre-curate
when each section opens:

- Business: [capability-based-planning](../../patterns/business/capability-based-planning.md), [value-stream-to-capability-mapping](../../patterns/business/value-stream-to-capability-mapping.md), [portfolio-rationalization](../../patterns/business/portfolio-rationalization.md)
- Governance: [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md), [architecture-principle-lifecycle](../../patterns/governance/architecture-principle-lifecycle.md), [standards-exception-management](../../patterns/governance/standards-exception-management.md), [governance-review-gate](../../patterns/governance/governance-review-gate.md), [reference-architecture-adoption](../../patterns/governance/reference-architecture-adoption.md)
- Application / integration patterns when shaping IS architecture
- Transition patterns when sequencing migration

## Common Anti-Patterns

- **Treating ADM as waterfall** — phases inform each other; sequencing is not strict.
- **Modeling everything everywhere** — enable only the domains the cycle needs; expand later cycles.
- **Vision divorced from delivery** — decisions and transitions that contradict the architecture vision should trigger review, not silent acceptance.
- **Principles that nobody honors** — declared and then ignored; either enforce via decisions or retire them.
- **Standards without exception process** — a standard with no waiver mechanism becomes either a rubber stamp or a deal-breaker. Both fail.
- **Governance-as-finale** — Phase G is continuous, not end-of-cycle.
- **Skipping `gap-radar`** — easy to miss things at this scope; sweep before every gate.
- **Cycle abandonment** — Phase H feeds Phase A; if no one runs the cycle again, the architecture rots.

## Entry Criteria

- a sponsor exists at enterprise or program level
- the engagement is genuinely cross-domain or cross-initiative
- governance, compliance, and risk are real ongoing concerns
- there is appetite for durable architecture artifacts, not just a deliverable

## Exit Criteria (Per Cycle)

A cycle is complete when:

- the architecture vision is confirmed and approved
- baseline and target are documented for in-scope domains
- gaps are visible and addressed in a roadmap
- transitions are sequenced and governed
- compliance, risk, and decision records are current
- the next cycle's drivers and inputs are clear

## Cycling Stance

This playbook is **cyclic**. Expect:

- periodic re-baselining as the estate evolves
- requirements and decisions to be revisited under [`requirements-follow-up`](../../skills/requirements-follow-up.md)
- ongoing governance through [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- regular [`gap-radar`](../../skills/gap-radar.md) sweeps as part of cadence
- regular [`project-recap`](../../skills/project-recap.md) at the start of each cycle for orientation

## What This Playbook Does Not Do

- It does not replace tailoring — use [`project-method.md`](../../method/project-method.md) to record the organization's specific method tailoring
- It does not require every TOGAF artifact — use only what the engagement needs
- It does not assume waterfall sequencing across phases — phases can overlap and inform each other

## First Working Session

In the first session:

1. Confirm sponsor and cycle ambition (one paragraph in `notes.md`).
2. Run [`project-bootstrapper`](../../skills/project-bootstrapper.md). Tailor the cloned config — full TOGAF rarely needs every role enabled on day one.
3. Open [`project-method.md`](../../method/project-method.md) and record the organization's specific tailoring stance.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who owns the vision, what is the cycle cadence, what is the scope of in-scope domains, what is the architecture review forum, what is the principle/standard adoption process, what is the waiver mechanism.
6. Identify the highest-leverage stakeholders (5–8) and run [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md).
7. Resist the urge to model anything beyond stage 1 in session 1.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Roles** — start with the minimum useful role set; not every TOGAF role needs to exist on day one.
- **Templates** — drop `architecture-vision` only if a real vision already exists elsewhere; keep `principle` only if principles will be enforced.
- **Compliance scope** — set jurisdictions, regulations, frameworks, residency, AI-regulated-use; this is the layer that materially shapes review packets.
- **Default mode** — `inventory` is the safe default; switch per phase.
- **Coordinator** — `coordinator_auto_route: false` is the safer default for full cycles; reconsider only when the cycle is mature and the architect is deeply trusted.
- **Cycle cadence** — quarterly vs annual vs continuous; record this in `project-method.md`.
- **Reference methods** — keep `adm.md` and `transition-architecture.md`; add others when the organization uses them.

## Decision Points

- **Vision-first vs baseline-first** — for greenfield enterprise architectures, start vision-first. For mature estates, baseline-first usually surfaces real constraints.
- **Capability-based vs portfolio-based planning** — pick early; mixing them creates noise.
- **Standards strictness** — approved/tolerated/prohibited with waivers, or approved-only with explicit deprecation — pick a model.
- **Decision lifecycle weight** — heavy ADR with extensive options vs lightweight option-summary — pick per organization.

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Tailor [`project-method.md`](../../method/project-method.md) to the organization's actual method.
4. Adjust `project.name`, `compliance`, and role enablement to fit the organization.
5. Start with [`project-bootstrapper`](../../skills/project-bootstrapper.md) and the `project-bootstrap` review gate.
6. Run [`gap-radar`](../../skills/gap-radar.md) before each gate.

## Notes For Reviewers

When reviewing full-cycle output:

- check that principles and standards are honored by decisions
- check that traceability runs end-to-end (stakeholder → objective → solution → transition)
- check that governance is continuous, not just at exit
- check that compliance and risk posture is current and evidence-backed
- check that ownership entries reflect reality, not the template
- check that re-baselining cadence is realistic, not aspirational
- check that the next cycle's drivers are visible — a cycle that does not feed the next is a one-shot dressed up as a cycle
