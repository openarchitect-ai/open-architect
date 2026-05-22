# Architecture Team Bootstrap Playbook

## Engagement Shape

- **Stance:** one-shot for the initial bootstrap, with explicit handoff to `steady-state-governance`
- **Default mode:** `analysis` (defining the function shape)
- **Typical duration:** months
- **Output emphasis:** architecture function — purpose and authority, founding principles (small set), operating model, hiring plan, tooling stance, initial cadence

## When To Use

Use this playbook when:

- creating an architecture function where none exists
- a startup / scale-up establishing architecture for the first time
- a traditional business standing up an architecture practice for digital transformation
- post-merger or spinoff entity creating its own architecture function (the new entity needs its own practice)
- a single architect-of-one role that must become a team
- the existing architecture has been ad-hoc and the sponsor wants formal stewardship

## When Not To Use

Do **not** use this playbook when:

- the function exists and just needs to be operated (use `steady-state-governance`)
- the function exists and needs to run a strategic cycle (use `full-togaf-adm`)
- specific project work (use the appropriate project-shaped playbook)
- the work is operational engineering dressed up as architecture (it is not architecture — don't fund it as such)

## What Good Looks Like

- explicit charter for the architecture function — purpose, scope, authority, relationships
- founding principles — small set (5–7), owned, useful, refreshable
- operating model — roles, skills, decision authority, escalation paths, working cadence
- hiring plan with role definitions and sequencing
- tooling stance (this Open Architect workspace and complementary tools)
- initial cadence (board, review, exception process)
- explicit relationship with delivery and product (peer, not gatekeeper)
- handoff to `steady-state-governance` for ongoing operation

## Stages

### Stage 1 — Frame The Function

- **Entry signals:** sponsor exists at executive level (CTO, CIO, COO, or founder-equivalent); the need is articulated (digital transformation, post-merger / spin-off, scaling pain, audit / regulatory expectation, mature out of ad-hoc)
- **Key questions:** why now, what is the function expected to do (and not do), what is the authority (advisory, gatekeeping, decision-making), where does it report, who is the sponsor, what is the timeline to "in operation"
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`project-bootstrapper`](../../skills/project-bootstrapper.md)
- **Expected outputs:** function charter, sponsor and reporting line, authority stance (advisory / gatekeeping / decision-making), timeline
- **Exit signals:** the charter is reviewable by the executive sponsor

### Stage 2 — Establish Founding Principles

- **Entry signals:** charter is in hand
- **Key questions:** what are the 5–7 principles this function will be known for, what is the rationale per principle, how will principles be honored vs become folklore, who owns each principle
- **Recommended skills:** [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`decision-recorder`](../../skills/decision-recorder.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** founding principle set (small), rationale and ownership per principle, enforcement stance
- **Exit signals:** the principles are reviewable and feel honest, not aspirational
- **Review gate:** `decision-approval`

### Stage 3 — Design The Operating Model

- **Entry signals:** principles are in place
- **Key questions:** what roles exist (chief-architect, business-analyst, specialist architects, governance lead), what skills do they need, what is decision authority per classification, what is the escalation path, what is the working cadence (board, review, exception), what is the relationship with delivery and product, what is the architect-assist default for AI tools used by the function
- **Recommended skills:** [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`architecture-coordinator`](../../skills/architecture-coordinator.md)
- **Expected outputs:** operating model — roles, skills per role, decision authority matrix, escalation paths, cadence, peer-vs-gatekeeper stance
- **Exit signals:** the operating model is reviewable by the function's sponsor and by delivery / product peer leaders

### Stage 4 — Plan Hiring

- **Entry signals:** operating model is in place
- **Key questions:** what is the role-sequencing (which role first, second, third), what are the role definitions, what partner roles outside the architecture function are needed (business analysts, product managers, security partners), what is the realistic timeline, what is the budget, what is the build-vs-hire-vs-consult balance
- **Recommended skills:** [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`decision-recorder`](../../skills/decision-recorder.md), [`communication-packager`](../../skills/communication-packager.md)
- **Expected outputs:** hiring plan — role definitions, sequencing, timeline, budget, partner roles
- **Exit signals:** HR / recruiting can act on the plan; sponsor has approved the budget

### Stage 5 — Choose Tooling

- **Entry signals:** hiring plan is in place
- **Key questions:** what is the primary tooling stance (this Open Architect workspace; alternatives), what diagramming tooling, what decision log / ADR mechanism, what catalog / repository for principles and standards, what integration with code repository and ticketing
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** tooling decisions with rationale, integration approach with delivery tooling
- **Exit signals:** the function has a working environment, not a tooling debate

### Stage 6 — Define Initial Cadence And Processes

- **Entry signals:** tooling is decided
- **Key questions:** what is the board cadence (monthly / quarterly), what is the exception process, what is the gap-radar cadence, what is the project-recap discipline at session start, what is the playbook-selection process when a project enters the practice
- **Recommended skills:** [`architecture-coordinator`](../../skills/architecture-coordinator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`gap-radar`](../../skills/gap-radar.md), [`review-pack-builder`](../../skills/review-pack-builder.md)
- **Expected outputs:** initial cadence calendar, exception process, gap-radar cadence, playbook-selection flow
- **Exit signals:** the function has a defined operating rhythm
- **Review gate:** `governance-review`

### Stage 7 — Run First Cycle

- **Entry signals:** processes are defined; at least one role is hired
- **Key questions:** what is the first formal decision the function will record, what is the first board / review cycle, what was learned, what needs adjustment in the operating model
- **Recommended skills:** [`architecture-coordinator`](../../skills/architecture-coordinator.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`decision-recorder`](../../skills/decision-recorder.md), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** first cycle delivered (decisions, reviews, retrospective), adjustments to the operating model, first health-signal capture
- **Exit signals:** the function has run a real cycle, not a planning cycle

### Stage 8 — Hand Off To `steady-state-governance`

- **Entry signals:** first cycle is complete; lessons captured
- **Key positions:** what is the operating model the function is handing off to its own steady-state, what is the cadence calendar, what is the documented operating model that survives an architect rotation
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md), [`artifact-maintainer`](../../skills/artifact-maintainer.md)
- **Expected outputs:** handoff packet to `steady-state-governance` — operating model, cadence, policies, health signals, lessons from first cycle
- **Exit signals:** the function operates without the bootstrap engagement being open
- **Review gate:** `transition-plan`

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md) — primary skill for this engagement
3. [`project-bootstrapper`](../../skills/project-bootstrapper.md) — primary skill (this is bootstrapping the practice)
4. [`option-evaluator`](../../skills/option-evaluator.md)
5. [`decision-recorder`](../../skills/decision-recorder.md)
6. [`architecture-coordinator`](../../skills/architecture-coordinator.md)
7. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — for compliance posture
8. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md) — for tooling decisions
9. [`gap-radar`](../../skills/gap-radar.md)
10. [`architecture-review`](../../skills/architecture-review.md)
11. [`review-pack-builder`](../../skills/review-pack-builder.md)
12. [`communication-packager`](../../skills/communication-packager.md)
13. [`architecture-documenter`](../../skills/architecture-documenter.md)
14. [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
15. [`artifact-maintainer`](../../skills/artifact-maintainer.md)

## Review Gates That Apply

- `project-bootstrap` — confirm the function charter, scope, and authority
- `decision-approval` — confirm founding principles, operating model, tooling
- `governance-review` — confirm initial cadence and processes
- `transition-plan` — confirm handoff to `steady-state-governance`

`solution-direction` and `requirement-baseline` typically not in scope — this engagement bootstraps the practice; the practice's outputs come after.

## Patterns Likely To Apply

- **Governance lifecycle:**
  - [architecture-principle-lifecycle](../../patterns/governance/architecture-principle-lifecycle.md)
  - [decision-authority-matrix](../../patterns/governance/decision-authority-matrix.md)
  - [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md)
  - [governance-review-gate](../../patterns/governance/governance-review-gate.md)
  - [architecture-board-decision-escalation](../../patterns/governance/architecture-board-decision-escalation.md)
  - [standard-lifecycle-management](../../patterns/governance/standard-lifecycle-management.md)
  - [standards-exception-management](../../patterns/governance/standards-exception-management.md)
- **Operating model:**
  - [product-operating-model-alignment](../../patterns/business/product-operating-model-alignment.md)
  - [product-vs-platform-boundary](../../patterns/business/product-vs-platform-boundary.md)
  - [operating-model-segmentation](../../patterns/business/operating-model-segmentation.md)

## Common Anti-Patterns

- **Architecture as gatekeeper from Day 1** — the function loses credibility before earning it; teams route around.
- **Hiring before defining the model** — 5 architects, no operating model; they collide, contradict, or scatter.
- **50 principles on Day 1** — folklore from the start; nothing distinguishable, nothing enforceable.
- **No relationship with delivery teams** — architecture in a silo; teams don't know what the function is for.
- **Standards without exception process** — architecture as friction; valid exceptions are denied, the function becomes the enemy.
- **Architecture function reporting too low** — ignored; lacks authority to decide what it is asked to decide.
- **Architecture function reporting too high** — detached from delivery reality; produces strategy nobody operates.
- **Single architect-of-one expected to be the function** — no resilience, no rotation, no peer review; the function ends when that person leaves.
- **Buying enterprise architecture tooling before defining the operating model** — tooling drives the practice instead of the other way around.
- **Compliance posture deferred** ("we'll address that when we have to") — by the time you have to, it's expensive.
- **Decision authority unclear — every decision escalates** — the function exists but does not decide.
- **No handoff plan to steady-state** — the bootstrap engagement never ends; the function remains in setup mode.
- **Architecture function modeled on a previous employer's** — fit was for that org, not this one.
- **Architecture as PowerPoint** — function produces strategy decks, never artifacts that engineers use.
- **No measurable function-health signal** — "we govern" with no signal; impossible to improve.
- **Confusing architecture with engineering management** — different jobs; conflating them makes both worse.

## Entry Criteria

- a sponsor exists at executive level (CTO, CIO, COO, founder)
- the strategic need is articulated (digital transformation, post-merger, audit / regulatory, scaling pain, maturing out of ad-hoc)
- there is appetite for cadence and discipline, not only deliverables
- a budget envelope exists (or can be negotiated)
- there is at least one initial role that can be hired or appointed

## Exit Criteria (Bootstrap)

- function charter is approved with authority and reporting line explicit
- founding principles are recorded (small set, owned, useful)
- operating model is documented with decision authority and escalation
- hiring plan is approved with role sequencing and timeline
- tooling stance is decided
- initial cadence is on the calendar
- at least one first cycle has been run with retrospective captured
- handoff to `steady-state-governance` is complete

## Cycling Stance

This playbook is **one-shot per function bootstrap**. Once the function is operational and `steady-state-governance` is running, the bootstrap engagement closes.

If the org spins up a second architecture function (e.g. domain-specific subsidiary), run a fresh engagement for it.

## What This Playbook Does Not Do

- It does not run the broader enterprise architecture cycle — use `full-togaf-adm` after the function is bootstrapped and the strategic ambition is set
- It does not deliver projects — use the appropriate project-shaped playbook
- It does not own ongoing operation — that is `steady-state-governance`
- It does not handle people hiring beyond defining the roles and sequencing — that is HR / recruiting
- It does not buy tooling — that is procurement (this playbook produces the tooling decision)

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if any prior architecture context exists in this org.
2. Write a one-paragraph function charter into `notes.md` — why now, what the function is expected to do, what authority it has, where it reports.
3. Take an initial position on authority (advisory / gatekeeping / decision-making). Provisional is fine; this shapes the rest.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the sponsor, where does the function report, what authority does it have, what is the relationship with delivery and product, what is the timeline to "in operation", what budget envelope exists, what is the build-vs-hire-vs-consult balance, what compliance posture applies.
6. Identify 5–7 candidate founding principles (provisional).
7. Resist hiring before the operating model is defined.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — usually `enterprise`; reduce to `solution` only when bootstrapping a single-domain function.
- **Compliance scope** — usually light; set if the new entity has regulatory obligations (financial services, healthcare, public sector, AI Act in scope).
- **Roles** — start small. `chief-architect` and `business-analyst` are usually the first two; add specialist roles per the operating model.
- **Templates** — keep `principle`, `decision`, `architecture-vision`, `stakeholder`, `objective`, `organization`; add `technology-standard` only when the function will steward standards.
- **Default mode** — `analysis` is correct; this engagement is design-of-the-function, not project work.
- **Coordinator** — `coordinator_auto_route: false`; function-level decisions need explicit human routing.
- **Authority stance** — declare early. Advisory (lighter, faster to set up, lower friction) vs gatekeeping (heavier, harder to staff, more authority) vs decision-making (highest impact, requires explicit executive backing). Each affects all downstream.
- **Tooling stance** — this Open Architect workspace is one option; alternatives include enterprise EA tools (LeanIX, Ardoq, BiZZdesign, Mega), text-as-code approaches, or hybrid. Decide based on team size and ambition.
- **Cadence ambition** — quarterly (lighter, fits small orgs) vs monthly (heavier, requires more capacity). Pick based on decision velocity.

## Decision Points

- **Authority stance** — advisory / gatekeeping / decision-making. Most successful functions start advisory and earn gatekeeping authority through demonstrated value.
- **Reporting line** — CTO / CIO / COO / founder. Affects perceived value and access to decisions.
- **Operating model shape** — central team (all architects in one group) vs federated (architects embedded in domains) vs hybrid. Hybrid is most common at mid-size.
- **Build-vs-hire-vs-consult** — building (longer, more culture-fit) vs hiring (faster, less culture-fit) vs consulting (fastest, no permanence). Most orgs do hybrid.
- **Tooling stance** — text-as-code (this workspace style) vs enterprise EA tool vs hybrid. Text-as-code scales lighter; EA tools scale heavier with more enterprise audit / visualization.
- **Cadence ambition** — quarterly vs monthly. Match to decision velocity.
- **Principle set size** — small (5–7, more memorable, more honored) vs large (10–20, more coverage, more folklore). Small wins.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the executive sponsor with budget authority for the function?
- Where does the function report (CTO / CIO / COO / founder)?
- What authority does the function have (advisory / gatekeeping / decision-making)?
- What is the timeline to "in operation"?
- What budget envelope exists for hiring and tooling?
- What is the build-vs-hire-vs-consult balance?
- What compliance posture applies (financial services, healthcare, public sector, AI Act)?
- What is the relationship with delivery and product (peer, gatekeeper, advisor)?
- What founding principles would be true and useful for this org?
- What roles do we need first, second, third?
- What tooling stance fits this org's size and ambition?
- What is the cadence ambition (quarterly / monthly)?
- What is the exception process for teams that need to deviate?
- What is the handoff plan to `steady-state-governance`?

## Recommended Diagrams

- Function charter (purpose × scope × authority × reporting line × sponsor)
- Operating model diagram (roles × skills × decision authority × escalation × cadence × peer-vs-gatekeeper)
- Hiring sequencing (roles × timeline × dependencies × partner roles)
- Tooling stance map (tools × purpose × integration with delivery / code / ticketing)
- Cadence calendar (board × review × exception × gap-radar × project-recap)
- Decision authority matrix (decision classification × impact level × named approver)
- Relationship map (architecture function × delivery × product × security × data × compliance × executive sponsor)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`, compliance scope (if regulated), and role enablement to start small.
4. Pick an initial authority stance and record it in `notes.md`.
5. Resist hiring or buying tooling until the operating model is defined.
6. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Ownership Truthfulness Risks* (the function's own ownership claims) and *Governance Hygiene* (cadence on the calendar, decisions actually made).

## Notes For Reviewers

When reviewing architecture team bootstrap output:

- check that the function charter has explicit authority, not vague "thought leadership"
- check that the principles set is small and useful, not a folklore catalog
- check that the operating model documents decision authority, not "the architecture board decides"
- check that the hiring plan has role definitions, not just headcount asks
- check that the tooling stance follows the operating model, not vice versa
- check that the initial cadence is on the calendar
- check that the first cycle was run and produced real decisions, not planning artifacts
- check that the handoff to `steady-state-governance` is explicit
- check that the function is not positioned as a gatekeeper before it has earned authority
- check that the function is not modeled on a previous employer's — fit is for *this* org
- check that the function survives the founder architect leaving (the operating model is documented, not in their head)
