# Steady-State Governance Playbook

## Engagement Shape

- **Stance:** continuous — this is the *operate the architecture function* engagement, not a project
- **Default mode:** `analysis` and `review` (with explicit moves to `decision` per board cycle)
- **Typical duration:** ongoing
- **Output emphasis:** running the practice — board cadence, decision lifecycle, principle and standard stewardship, exception process, evidence chain, gap-radar cadence

## When To Use

Use this playbook when:

- the architecture function exists and needs to be **operated**, not stood up
- an architecture board / review forum exists or is being established
- principles, standards, and decisions accumulate and need lifecycle management
- exceptions and waivers need governance and expiry
- ongoing gap-radar / project-recap cadences are part of the practice
- the goal is keeping architecture *healthy*, not delivering a project

## When Not To Use

Do **not** use this playbook when:

- standing up the architecture function from scratch (use `full-togaf-adm` or run `project-bootstrapper`)
- specific project work (use the relevant project playbook)
- post-incident urgency (use `post-incident-architecture-review`)
- regulator-driven work (use `compliance-driven-modernization`)
- modernization execution (use `migration-wave`)

## What Good Looks Like

- predictable architecture board / review cadence with prepared inputs and explicit outputs
- principle and standard lifecycle visible (proposed → approved → revised → superseded → retired)
- decision register kept current — accepted decisions reviewed on sunset cadence, not just appended
- exception/waiver process operational with **explicit expiry** and remediation plan per waiver
- gap-radar cadence operational; findings routed to decisions, principles, or roadmap
- project-recap cadence operational at the start of each working session
- residual debt and risk visibility (without drama or hoarding)
- the practice survives an architect rotation — the operating model is documented, not in someone's head
- measurable health signals — decision throughput, waiver expiry adherence, board meeting decision rate, principle currency

## Stages

### Stage 1 — Frame The Practice

- **Entry signals:** the architecture function exists; a sponsor wants it to operate more reliably
- **Key questions:** what does "good" look like as an operating practice, what cadences exist today, what decision authority exists, what is the ambition (lighter / stronger / smarter), who is accountable for the practice
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`architecture-coordinator`](../../skills/architecture-coordinator.md)
- **Expected outputs:** practice charter, current cadence inventory, ambition statement, accountable owner
- **Exit signals:** the charter is reviewable by the function's sponsor

### Stage 2 — Baseline The Current Practice

- **Entry signals:** charter is in hand
- **Key questions:** what reviews happen today (cadence, attendance, decisions), how many decisions are accepted vs draft vs lingering, what principles and standards exist, how many waivers are outstanding, what is the gap-radar / project-recap cadence today
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md), [`gap-radar`](../../skills/gap-radar.md) (governance-hygiene emphasis)
- **Expected outputs:** practice baseline — current cadences, decision throughput, principle inventory, waiver inventory, evidence gaps
- **Exit signals:** the baseline is honest; weak areas are flagged, not hidden

### Stage 3 — Define The Operating Cadence

- **Entry signals:** baseline is in hand
- **Key questions:** what runs quarterly (board, principle/standard refresh), what runs monthly (exception review, decision review, debt review, gap-radar sweep), what runs per-event (review-gate work, decision approval), who attends, who decides, what prep is required
- **Recommended skills:** [`architecture-coordinator`](../../skills/architecture-coordinator.md), [`decision-recorder`](../../skills/decision-recorder.md), [`review-pack-builder`](../../skills/review-pack-builder.md)
- **Expected outputs:** cadence calendar, attendee + decision-authority matrix, prep expectations per cadence
- **Exit signals:** the cadence is on the calendar with clear inputs, attendees, and outputs

### Stage 4 — Define Decision And Principle Lifecycle

- **Entry signals:** cadence is defined
- **Key questions:** how do decisions move draft → proposed → accepted → revised → superseded, what triggers a decision sunset review, how do principles evolve, what is the standard lifecycle (proposed → tolerated → approved → deprecated → prohibited → retired)
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** decision lifecycle policy, principle lifecycle policy, standard lifecycle policy, sunset triggers
- **Exit signals:** lifecycle policies are reviewable and consistent
- **Review gate:** `decision-approval`

### Stage 5 — Define Exception / Waiver Process

- **Entry signals:** lifecycle policies are in place
- **Key questions:** how does a team request an exception, what evidence is required, who approves, what is the maximum waiver duration, what is the remediation expectation at expiry, how are stale waivers caught, what is the escalation path
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** exception/waiver process, evidence template, approval matrix, expiry policy, escalation path
- **Exit signals:** the process can be operated without ad-hoc judgment
- **Review gate:** `governance-review`

### Stage 6 — Define Escalation And Authority

- **Entry signals:** lifecycle and exception policies are in place
- **Key questions:** who decides what (decision authority matrix), when does a decision escalate to the architecture board, when does the board escalate to executive sponsor, what is the dispute resolution path
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** decision authority matrix, escalation paths, dispute resolution policy
- **Exit signals:** the authority is documented; no team has to guess who decides

### Stage 7 — Pilot The Practice

- **Entry signals:** policies are in place
- **Key questions:** what is the first cadence cycle, who attends, what is the prep, what decisions are on the agenda, what are the success measures
- **Recommended skills:** [`architecture-coordinator`](../../skills/architecture-coordinator.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`review-pack-builder`](../../skills/review-pack-builder.md)
- **Expected outputs:** first board / review cycle executed; first formal exception cycle executed; first gap-radar sweep executed
- **Exit signals:** the practice has produced its first set of operating evidence

### Stage 8 — Operate Continuously

- **Entry signals:** pilot cycle is complete
- **Key questions:** how is each cadence kept on schedule, how is preparation enforced, how are decisions reviewed for sunset, how is the practice itself reviewed and refreshed
- **Recommended skills:** [`architecture-coordinator`](../../skills/architecture-coordinator.md), [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`gap-radar`](../../skills/gap-radar.md), [`project-recap`](../../skills/project-recap.md), [`artifact-maintainer`](../../skills/artifact-maintainer.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** ongoing cadence cycles delivered; principle / standard / decision lifecycle maintained; waiver expiry tracked; gap-radar findings routed; practice health signals captured
- **Exit signals:** the practice operates without heroics

## Recommended Skill Sequence

The skill mix shifts depending on the cadence point — these run continuously, not as a fixed sequence:

1. [`architecture-coordinator`](../../skills/architecture-coordinator.md) — primary skill for this engagement (orchestrates the practice)
2. [`project-recap`](../../skills/project-recap.md) — at the start of every working session
3. [`gap-radar`](../../skills/gap-radar.md) — at the cadence defined (monthly recommended)
4. [`decision-recorder`](../../skills/decision-recorder.md) — at board cycles and per-event
5. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — for waiver evaluation and ongoing risk posture
6. [`architecture-review`](../../skills/architecture-review.md) — per review gate
7. [`evidence-curator`](../../skills/evidence-curator.md) — continuously, especially around waivers and audits
8. [`artifact-maintainer`](../../skills/artifact-maintainer.md) — for principle, standard, and decision lifecycle upkeep
9. [`requirements-follow-up`](../../skills/requirements-follow-up.md) — when requirements drift triggers governance review
10. [`review-pack-builder`](../../skills/review-pack-builder.md) — for board preparation
11. [`communication-packager`](../../skills/communication-packager.md) — for stakeholder communications
12. [`architecture-documenter`](../../skills/architecture-documenter.md) — for governance reporting

## Review Gates That Apply

The gates here are cadence-driven, not project-driven:

- `decision-approval` — per board cycle
- `governance-review` — per cycle (often quarterly)
- `project-bootstrap` — when a new in-scope project enters the practice
- `transition-plan` — when the practice itself is being changed (rare)

## Patterns Likely To Apply

Most of the governance pattern library is in scope for this engagement:

- **Decision lifecycle:**
  - [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md)
  - [decision-review-and-sunset](../../patterns/governance/decision-review-and-sunset.md)
  - [decision-authority-matrix](../../patterns/governance/decision-authority-matrix.md)
  - [decision-evidence-packaging](../../patterns/governance/decision-evidence-packaging.md)
  - [architecture-board-decision-escalation](../../patterns/governance/architecture-board-decision-escalation.md)
- **Principle and standard lifecycle:**
  - [architecture-principle-lifecycle](../../patterns/governance/architecture-principle-lifecycle.md)
  - [standard-lifecycle-management](../../patterns/governance/standard-lifecycle-management.md)
  - [standards-exception-management](../../patterns/governance/standards-exception-management.md)
- **Exception / waiver lifecycle:**
  - [waiver-expiry-and-remediation](../../patterns/governance/waiver-expiry-and-remediation.md)
  - [architecture-standard-waiver-board](../../patterns/governance/architecture-standard-waiver-board.md)
- **Review and conformance:**
  - [governance-review-gate](../../patterns/governance/governance-review-gate.md)
  - [reference-architecture-conformance-review](../../patterns/governance/reference-architecture-conformance-review.md)
  - [reference-architecture-adoption](../../patterns/governance/reference-architecture-adoption.md)
  - [reference-architecture-variance-management](../../patterns/governance/reference-architecture-variance-management.md)
- **Evidence and assurance:**
  - [architecture-assurance-evidence-trail](../../patterns/governance/architecture-assurance-evidence-trail.md)
  - [policy-to-control-traceability](../../patterns/governance/policy-to-control-traceability.md)
  - [control-objective-to-pattern-mapping](../../patterns/governance/control-objective-to-pattern-mapping.md)

## Common Anti-Patterns

- **Board theatre** — meets, nothing decides. Attendance high, decision throughput zero.
- **Phantom approvals** — decisions marked `accepted` without evidence or attendance record.
- **Waivers forever** — exception process produces permanent exceptions with no remediation plan; the standard becomes optional.
- **Principle inflation** — too many principles, nobody honors them; the list becomes folklore.
- **Standard stagnation** — standards never retired even when obsolete; teams maintain compatibility with dead technology direction.
- **Decision log without re-review** — accepted decisions never revisited; folklore replaces rationale within 18 months.
- **Gap-radar as PR exercise** — runs on a cadence, no action follows from findings.
- **Architecture function as gatekeeper only** — slows delivery, adds no clarity; teams route around it.
- **Single-person practice** — when the architect leaves, the practice dies. No documented operating model.
- **No measurable outcomes** — "we govern" without signal. No decision throughput, no waiver expiry adherence, no principle currency.
- **Calendar reviews with no preparation** — boards walk in cold, decisions deferred, cycle wastes everyone's time.
- **Exception process bypassed by VIPs** — formal process exists, senior leaders go around it; the process loses credibility.
- **Decisions without sunset triggers** — accepted forever, even when the context changed.
- **Conflating governance with control** — governance enables defensible decisions; control enforces them. Different functions.
- **Ad-hoc decisions outside the cadence** — important calls made in hallways, never enter the register.

## Entry Criteria

- the architecture function exists in some form
- a sponsor wants it to operate more reliably
- some artifacts exist (decisions, principles, standards) — even if inconsistent
- there is appetite for cadence, not just deliverables
- a coordinating role can be named (often `chief-architect` or `architecture-governance-lead`)

## Exit Criteria

This playbook does not "exit" in the project sense — the steady-state is the deliverable. But each *initialization phase* (Stages 1–7) has a clean exit:

- the operating cadence is on the calendar
- lifecycle policies are documented for decisions, principles, standards
- exception process is operable with expiry and escalation
- decision authority matrix exists
- first cadence cycle has been executed and produced evidence
- ongoing operation (Stage 8) is running

## Cycling Stance

This playbook is **continuous**. Once initialized:

- **Quarterly:** architecture board, principle review, standard refresh, decision sunset review
- **Monthly:** exception review, decision review, debt review, gap-radar sweep
- **Per session:** project-recap at start
- **Per-event:** review-gate work, decision approval as needed
- **Annually:** practice health review — is the cadence right, are the policies still fit, is the authority matrix current

The practice should be measurable. Track decision throughput, waiver expiry adherence, principle currency, gap-radar findings closure rate.

## What This Playbook Does Not Do

- It does not deliver projects — partner with project-shaped playbooks for the work itself
- It does not stand up the architecture function from zero — use `full-togaf-adm` or `project-bootstrapper`
- It does not own product / delivery roadmaps — those are delivery functions
- It does not handle a specific incident or modernization — use the appropriate driver-specific playbook

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) — most steady-state work begins where some prior practice exists.
2. Write a one-paragraph practice charter into `notes.md` — what "good" looks like as an operating practice.
3. Walk the current cadence (boards, reviews, refresh cycles) and note what is on the calendar today.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the practice sponsor, what decision authority exists, how many decisions are accepted vs lingering, how many waivers are outstanding (and how many past expiry), what is the current principle inventory, what is the standard refresh cadence.
6. List the top 5 health signals you want to track (decision throughput, waiver expiry adherence, principle currency, gap-radar findings closure rate, etc.).
7. Resist redesigning the practice until baseline is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Cadence ambition** — heavier (monthly board, quarterly principle refresh) vs lighter (quarterly board, annual principle refresh). Pick based on org maturity and decision velocity.
- **Roles** — keep `chief-architect`, `architecture-governance-lead`; add `enterprise-architect` for principle/standard stewardship; add domain architects for technical depth at board.
- **Templates** — keep `decision`, `principle`, `technology-standard`, `risk`, `compliance-assessment`; add `architecture-vision` if direction-setting is in scope.
- **Default mode** — `analysis` and `review` are correct; switch to `decision` per board cycle.
- **Coordinator** — `coordinator_auto_route: false` always for this playbook; governance decisions need explicit human routing.
- **Authority matrix strictness** — strict (every classification has a named approver) vs principle-based (escalation paths defined). Strict scales better.
- **Decision sunset cadence** — annual vs biennial vs context-driven. Annual is the safer default.
- **Waiver max duration** — 90 days, 180 days, 365 days. Shorter is safer; longer is more practical for complex remediation.
- **Practice health signals** — pick 5 measurable signals at most. More than that becomes noise.

## Decision Points

- **Cadence weight** — quarterly board (lighter) vs monthly board (heavier). Decide based on decision velocity and org size.
- **Single board vs multiple** — one cross-cutting board vs domain boards (data, security, platform, integration). Larger orgs often have multiple.
- **Authority model** — flat (all decisions go to the same approver) vs matrix (per-classification × per-impact level). Matrix scales.
- **Waiver max duration** — short (≤90 days, more remediation pressure) vs long (≤365 days, more practical).
- **Decision sunset trigger** — calendar-based (annual review) vs event-driven (only review on context change). Calendar is safer.
- **Standard lifecycle strictness** — proposed/approved/deprecated/retired strict path, or looser. Strict scales.
- **Practice scope** — full enterprise vs domain-specific. Smaller orgs can use a single steady-state instance; larger ones may run multiple.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the practice sponsor at executive level?
- What decision authority exists today, and what is missing?
- How many decisions are accepted, draft, lingering, superseded?
- How many waivers are outstanding, and how many are past expiry?
- What is the current principle inventory? Which are honored, which are folklore?
- What is the standard refresh cadence today?
- What is the current gap-radar cadence (if any)?
- What is the project-recap cadence at session start?
- What are the practice health signals we will measure?
- What is the decision authority matrix (per-classification × per-impact level)?
- What is the maximum waiver duration?
- What is the escalation path when a team and the practice disagree?
- What is the dispute resolution policy?
- How is the practice itself reviewed for fitness?

## Recommended Diagrams

- Cadence calendar (quarterly × monthly × per-event × per-session, with attendees and prep expectations)
- Decision authority matrix (classification × impact level × named approver)
- Decision lifecycle diagram (draft → proposed → accepted → revised → superseded → retired, with sunset triggers)
- Principle lifecycle diagram (proposed → approved → revised → superseded → retired)
- Standard lifecycle diagram (proposed → tolerated → approved → deprecated → prohibited → retired)
- Exception process flow (request → evidence → review → decision → expiry → remediation)
- Practice health dashboard mock-up (decision throughput, waiver expiry adherence, principle currency, gap-radar findings closure rate)
- Escalation path diagram (team → practice → board → executive sponsor)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name` and role enablement. Most steady-state engagements run at the enterprise level.
4. Run [`architecture-coordinator`](../../skills/architecture-coordinator.md) as the coordinating skill; it is the orchestrator for this engagement.
5. Run [`gap-radar`](../../skills/gap-radar.md) at the cadence you set, with particular attention to *Governance Hygiene* (stale waivers, phantom approvals, premature `accepted`).

## Notes For Reviewers

When reviewing steady-state governance output:

- check that the cadence is on the calendar with named attendees and prep expectations
- check that decision authority is documented (not just "the board decides")
- check that waivers have explicit expiry and remediation plans (not perpetual)
- check that principles and standards have lifecycle status, not just existence
- check that decision sunset triggers exist (annual review minimum)
- check that gap-radar findings are routed to action (decisions, principles, roadmap), not just logged
- check that practice health signals are measurable and reported
- check that the operating model is documented enough that the practice survives an architect rotation
- check that escalation paths are explicit and used (not bypassed in practice)
- check that the practice does not become a gatekeeper — its purpose is clarity, not delay
