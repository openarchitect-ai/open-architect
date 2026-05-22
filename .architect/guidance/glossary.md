# Glossary

This glossary defines the core terms used across the Open Architect workspace.
Use it to keep humans and agents aligned on the meaning of artifacts, skills,
playbooks, patterns, statuses, and evidence-related concepts.

## A

### Architecture Artifact

A concrete project output stored under `workspace/<project-name>/`, such as
a requirement, solution, decision, risk, or transition architecture entry.

### Architecture Vision

A high-level statement of the intended architecture direction, future state, and
value proposition for a change initiative.

### Application

An application or system in the estate that provides business or technical
capability and participates in the architecture model.

### Application Service

A logical service exposed by an application, usually representing a business or
technical capability boundary that other components consume.

### Assumption

A plausible working statement that is not yet confirmed. Assumptions should be
stored as assumptions, not presented as settled fact.

## B

### Baseline

The current-state architecture as it exists today. Baseline artifacts should
describe what is true now, not what is planned or desired later.

### Business Capability

A stable business ability the enterprise needs, independent of a particular
organization structure or implementation.

### Business Process

A flow of business work that realizes one or more business capabilities through
activities, handoffs, and control points.

## C

### Change Register

A chronological, sponsor-readable log of requirement and scope changes
on a single engagement. Lives at
`workspace/<project-name>/architect-work/change-register.md`. Each
entry captures the change type ([Requirement Change Type](#requirement-change-type)),
source, requirements touched, impact assessment, decision-threshold
evaluation, freeze-gate status, and confirmation state.

Populated by the [Change Coordinator](#change-coordinator) skill per
the procedure in `guidance/requirement-change-handling.md` and the
architectural shape in `patterns/governance/requirement-change-protocol.md`.

Distinct from `working-log.md` (project narrative, all activity) and
from per-requirement `metadata.change_log` (granular history). The
register is the aggregated, sponsor-facing view.

### Change Coordinator

The OA skill that runs the requirement-change protocol on a live
engagement: classify the change, assess impact, evaluate the decision
threshold, respect the freeze gate, apply the change to artifacts,
populate the change register, and log a working-log entry. See
`.architect/skills/change-coordinator.md`.

### Capability Library

The `.architect/` folder. Holds the Open Architect templates, playbooks,
patterns, skills, roles, method, compliance guidance, CLI, schemas,
validation, and multi-agent execution scaffold — everything that defines
*how* architecture work is done in this workspace. Versioned via
`.architect/VERSION`; contract-level changes are recorded in
`.architect/CHANGELOG.md`. Contrast with the [Workspace](#workspace),
which holds real project work.

### Capability Maintenance

The maintainer-facing discipline of keeping the capability library
internally consistent as it evolves. When you add, rename, move, or
remove anything in `.architect/`, several related files need to update
in lockstep (CHANGELOG, current-state, glossary, README, skill
"Read First" lists, playbook references). The ripple-effects-per-change
guide lives at `.architect/guidance/capability-maintenance.md`. Drift
detection is supported by the [Capability Radar](#capability-radar)
skill and `Validate-Capability.ps1`.

### Capability Radar

A cross-cutting scanning skill that scans `.architect/` for drift,
inconsistencies, broken references, and stale documentation across the
capability library itself. Analog of [Gap Radar](#gap-radar) but
pointed at `.architect/` rather than `workspace/<project>/`. Runs the
mechanical subset (broken markdown links, missing file references)
that `Validate-Capability.ps1` also implements, plus concept-level
checks (glossary completeness, CHANGELOG currency, cross-doc
consistency, structural drift). See
`.architect/skills/capability-radar.md` and the checklists at
`.architect/guidance/capability-radar-checklists.md`.

### Capability Version

The Open Architect capability version recorded in `.architect/VERSION`,
following semantic versioning. The `architect --version` CLI command
reads it at runtime; contract-level changes are recorded in
`.architect/CHANGELOG.md`. Major / minor / patch rules are documented at
the top of that changelog.

### Confidence

An explicit statement of how reliable an artifact field or relationship is,
usually captured through `metadata.confidence` or relationship-level
`confidence`.

### Compliance Assessment

An architecture governance artifact that records conformance findings,
exceptions, remediation expectations, and review outcomes.

### Controller

In privacy regulation, the party that determines the purposes and means of
processing personal data.

## D

### Decision

An intentional architecture choice with rationale, options considered, impacts,
and governance status. A decision is not the same thing as a requirement or an
assumption.

### Draft

A working status for content that is incomplete, exploratory, or not yet ready
for approval. Agents should usually create artifacts in draft form first.

### Data Object

A canonical business data object that is important enough to be modeled
explicitly across applications, interfaces, and governance concerns.

### Data Residency

A constraint or obligation that affects where data may be stored, processed, or
replicated geographically.

## E

### Engagement Family

A grouping of playbooks that share an engagement shape. The 24 playbooks
are organized into 8 families: discovery & decision, solution/design,
modernization & transition, platform bootstrap, enterprise cycle,
driver-specific, M&A lifecycle, and practice setup & operation. Families
help architects narrow the catalog before picking a specific playbook.

### Environment

A runtime boundary such as development, test, production, region, or operational
segment used to describe where architecture elements run.

### Evidence

The source support behind an architecture statement, such as stakeholder input,
existing documentation, standards, diagrams, or other authoritative records.

### Example Project

A worked reference project stored under `.architect/examples/` to demonstrate
how templates become linked artifacts without mixing sample content into live
project work.

## G

### Gap

A missing, weak, or insufficient architecture capability that must be addressed
through change, transition planning, or delivery work.

### Gap Radar

A proactive scanning skill that catches what an experienced architect would
catch on a fresh read: missing required content, cross-artifact
contradictions, invented owners, governance hygiene issues, drift signals,
and AI-era modernity gaps. Findings reference the applicable architecture
pattern and carry severity markers. Run before review gates, after stretches
of intensive modeling, or as routine cadence. See
[`skills/gap-radar.md`](../skills/gap-radar.md) and the checklist at
[`guidance/gap-radar-checklists.md`](./gap-radar-checklists.md). Pairs with
Project Recap for project re-entry.

### Governance Review

A formal or semi-formal checkpoint where architecture content is reviewed for
quality, risk, compliance, traceability, and decision readiness.

## H

### Human Review Gate

A deliberate stop point where agent output must be reviewed by a human before
work can move into stronger approval or governance states.

## I

### Initiative

A transformation effort, program, or project that provides the change context
for architecture work.

### Interface

A concrete integration point or API contract through which applications or
services exchange information or invoke behavior.

## L

### Legal Hold

A requirement to preserve data and suspend normal deletion or disposal because
of investigation, dispute, or legal obligation.

## O

### Open Question

An unresolved point that still needs clarification before stronger modeling,
approval, or delivery decisions can be made.

### Objective

A measurable business or architecture outcome that helps define the purpose and
success criteria of the work.

### Organization

A team, function, operating unit, or other organizational entity that owns,
stewards, approves, or operates architecture elements.

## P

### Pattern

A reusable architecture design approach with explicit purpose, applicability,
key components, benefits, tradeoffs, and risks. Patterns live under
`.architect/patterns/<domain>/` and are first-class working context for
modeling, decision, and review skills.

### Playbook

A pre-packaged engagement shape that bundles a recommended skill sequence,
applicable review gates, anti-patterns, customization guide, and a
ready-to-clone `project-config.yaml`. Playbooks live under
`.architect/playbooks/` and answer "what shape of engagement is this?".
Each project picks one playbook; there is no workspace-level default.
Playbooks are organized into Engagement Families.

### Project Recap

A read-only re-entry / handover skill for an architect joining a project
mid-stream or returning after time away. Walks the project state and
surfaces what's confirmed, what's open, what's stale, what has drifted
between recent source material and current artifacts, and what matters
most right now. Run this first when re-entering a project; run Gap Radar
afterwards. See [`skills/project-recap.md`](../skills/project-recap.md)
and the protocol at
[`guidance/project-recap-protocol.md`](./project-recap-protocol.md).

### Project Config

The `project-config.yaml` file that declares a project's chosen playbook,
applicable compliance scope (jurisdiction, sector, regulations, control
frameworks), governance controls (review checkpoints, approval roles), and
per-project tailoring.

Lives only at the project level: `workspace/<project-name>/project-config.yaml`.
Cloned from the chosen playbook's `project-config.yaml` template when
`architect new <project> --playbook <name>` scaffolds the project, then
tailored per engagement.

Workspace-level defaults (conventions, operating style, primary method)
that all projects inherit live separately in
`.architect/config/workspace-defaults.yaml` — see
[Capability Library](#capability-library).

### Proposed

A status indicating that an artifact or change is sufficiently formed for
review, but not yet approved or accepted.

### Principle

A durable architecture rule or design guardrail that shapes solution and
technology choices over time.

### Processor

In privacy regulation, a party that processes personal data on behalf of a
controller.

## R

### Reference

A link to supporting evidence, such as a document, diagram, standard, or other
source recorded in `metadata.references`.

### Regulated Data

Data whose storage, access, transfer, retention, or use is materially affected
by legal, regulatory, contractual, or policy obligations.

### Regulation Profile

A workspace reference note under `.architect/compliance/` that summarizes why
an external law, regulation, or standard matters to architecture work.

### Relationship

A typed link between architecture artifacts that makes traceability explicit and
queryable, for example requirement to solution, decision to interface, or work
package to transition architecture.

### Role

A perspective and responsibility set assigned to an architecture participant or
agent, such as solution architect, data architect, or architecture governance
lead.

### Roadmap

A sequenced view of architecture change over time, usually connecting transition
states, work packages, dependencies, and delivery timing.

### Review Checkpoint

A named point in an engagement where architecture work is expected to pause
for human review, clarification, or approval. Checkpoints are declared per
project in `governance.review_checkpoints` and per playbook in *Review Gates
That Apply*.

### Requirement Change Type

The taxonomy used by the [Change Coordinator](#change-coordinator)
skill to classify a requirement change. Four values:

- `new` — a requirement that didn't exist before
- `modified` — an existing requirement's content, scope, or acceptance criteria materially changed
- `removed` — an existing requirement is no longer in scope
- `superseded` — an existing requirement is replaced by one or more new requirements with the same intent

Conflict is a *trigger*, not a type — resolution produces one of the
four. See `guidance/requirement-change-handling.md`.

### Requirement Freeze Enforcement

A project-config convention controlling how strictly post-baseline
requirement changes are gated. Three values:

- `off` — changes apply directly; no freeze-gate ceremony
- `advisory` (recommended default) — changes apply but the register flags post-baseline landings; the next review gate acknowledges them
- `strict` — post-baseline changes pause until the sponsor or coordinator formally re-opens the requirement set; suited to regulated engagements (DORA, NIS2, HIPAA)

Set in `project-config.yaml` under
`conventions.requirement_freeze_enforcement`. The `requirement-baseline`
review checkpoint is the freeze line.

### Risk

An architecture or transition concern that could materially affect delivery,
operations, compliance, value, or governance outcomes.

## S

### Skill

A reusable architecture procedure that an agent or architect can apply to do
a specific kind of architecture work, such as baseline discovery, solution
modeling, relationship mapping, or decision recording. Skills live under
`.architect/skills/`. Note: in this workspace, "playbook" refers to an
engagement-shape playbook, not a skill playbook.

### Solution

A bounded end-to-end architecture response to a defined business problem,
requirements, and constraints.

### Source Of Truth

The primary authoritative location or owner for an artifact, typically recorded
under `metadata.source_of_truth`.

### Source Priority

The relative authority level of a source or artifact, used to distinguish
informational content from preferred or authoritative content.

### Stakeholder

An internal or external person, group, or role with concerns, influence,
decision rights, or ownership interest in the architecture.

### Superseded

A status indicating that an artifact, decision, or requirement has been
replaced by a newer, more relevant item and should no longer be treated as
current guidance.

## T

### Target State

The intended future architecture state that the project is trying to reach.

### Template

A canonical starter shape for one kind of architecture object. Templates define
how a requirement, solution, decision, environment, or other artifact should be
structured.

### Technology Component

A runtime, platform, product, or technical building block that supports the
solution or wider architecture estate.

### Technology Standard

An approved, tolerated, or prohibited technology direction that guides
technology selection and governance decisions.

### Traceability

The ability to follow meaningful links across artifacts, such as from
stakeholder to objective to requirement to solution to delivery change.

### Transition Architecture

A time-bounded interim architecture state that bridges baseline and target
state, often representing a rollout wave, migration phase, or controlled
intermediate design.

## V

### Verified

A status indicating that a requirement, control, or expectation has supporting
verification evidence rather than only intention or design-time assertion.

### Vocabulary Bridge

A guidance document that maps an external architecture vocabulary (such as
TOGAF, ArchiMate-Lite, C4, DDD, BIZBOK, or a Cloud Well-Architected
framework) to Open Architect concepts, so teams using that vocabulary
can adopt the workspace without abandoning their existing models.
Vocabulary bridges live under `.architect/guidance/vocabulary-bridges/`.

## W

### Work Package

A delivery increment that realizes part of a transition architecture or closes
one or more architecture gaps.

### Working Log

A chronological, plain-language record of what happened on a project,
newest entry on top. Lives at
`workspace/<project-name>/architect-work/working-log.md`. Distinct from
the four topical files (`open-questions.md`,
`answers-and-confirmations.md`, `evidence-requests.md`,
`architect-task-list.md`), which organize by category. The working
log organizes by time so the project's story can be read linearly —
useful for handover, audit defense, or re-entry after time away.
Skills propose entries when they run (`project-recap`,
`baseline-discovery`, `gap-radar`, etc.); the architect approves
before write per `architect_work_auto_update_mode`.

### Workspace

The sibling folder at the repo root (next to `.architect/`) that holds the
architect's real project work — one subfolder per engagement. Each
`workspace/<project-name>/` contains `project-config.yaml`, `notes.md`,
`architect-work/`, `docs/`, and the typed artifact subfolders (business/,
application/, data/, technology/, governance/, change/, views/).
`workspace/` is gitignored and initialized by the `architect` CLI.
Contrast with the [Capability Library](#capability-library), which holds
the templates, playbooks, patterns, skills, roles, method, compliance, and
CLI.

## Working Rule

If a term is unclear during modeling, prefer:

1. looking for an explicit definition in this glossary
2. checking the related template or guidance file
3. recording an open question instead of silently choosing a meaning

## Status Guidance

Use status terms carefully:

- `draft`: still being shaped
- `proposed`: ready for review, not yet approved
- `accepted` or `approved`: explicitly confirmed by the right authority
- `verified`: supported by evidence of satisfaction or conformance
- `superseded`: replaced by a newer item
