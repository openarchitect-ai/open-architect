# Agent Config

This guide explains how to use `.architect/project-config.yaml` as the
project-local agent and workspace configuration file for Open Architect.

## Purpose

`project-config.yaml` defines which parts of the Open Architect capability are
active for a specific project and which architecture context an agent should
assume by default.

Use it to decide:

- which roles are in scope
- which templates the project will use
- which skills are enabled
- which flows are active
- which method and reference methods guide the work
- which governance expectations apply
- which execution model and runtime state the agents should use
- which operating style and work mode the user wants by default

This prevents every project from inheriting the full architecture capability by
default.

## How To Use It

Recommended approach:

1. Set the project name and architecture scope.
2. Select the primary method and any reference methods.
3. Enable only the roles that will actually participate.
4. Enable only the templates needed for the project.
5. Enable flows that match the chosen method.
6. Add skills later as the project matures.
7. Confirm governance roles and review expectations.
8. Decide whether the project is `architect-assist` or `coordinator-led`.
9. Set a default work mode such as `inventory`, `analysis`, or `modeling`.
10. If you want one default orchestrating agent, set the coordinator role and skill.
11. Keep ownership truthful; do not let agents guess named owners to make artifacts look complete.
12. If the project will use real multi-agent execution, configure the runtime section and agent profiles explicitly.

## Field Guidance

### `project`

- `name`: project or workspace name
- `architecture_scope`: suggested values include `enterprise`, `solution`, or `enterprise-and-solution`
- `architecture_mode`: use `project-local` unless you later support shared or federated modes
- `operating_style`: suggested values:
  - `architect-assist`
  - `coordinator-led`
  - `external-orchestrated`
- `primary_method`: the method document the project follows
- `reference_methods`: supporting reference methods such as ADM or transition architecture guidance

Recommended default:

- `operating_style: architect-assist`

Use `architect-assist` when the architect remains the primary driver and agents
are meant to support bounded tasks rather than advance a workflow on their own.

### `roles.enabled`

List only the roles used by this project.

Examples:

- small solution-focused project:
  - `solution-architect`
  - `business-analyst`
  - `integration-architect`
  - `security-architect`
- broader transformation:
  - `chief-architect`
  - `business-architect`
  - `enterprise-architect`
  - `solution-architect`
  - specialist roles as needed

### `templates.enabled`

List only the template kinds in scope for the project.

Examples:

- integration-heavy project:
  - `application`
  - `application-service`
  - `interface`
  - `data-object`
  - `solution`
  - `transition-architecture`
- enterprise planning project:
  - `stakeholder`
  - `objective`
  - `business-capability`
  - `architecture-vision`
  - `roadmap`

### `skills.enabled`

This can start empty.

Populate it later when reusable architecture skills are defined in
`.architect/skills/`.

For an architect-assist project, start with a small set such as:

- `baseline-discovery`
- `requirement-normalizer`
- `solution-modeler`
- `architecture-review`

Add coordination-heavy or delivery-heavy skills only when you explicitly want
them.

### `flows.enabled`

Enable only the flows the project intends to use.

Examples:

- `architecture-development`
- `transition-architecture`

### `conventions`

Use this section to declare project-wide expectations that may later be
validated automatically.

Suggested architect-assist conventions:

- `user_is_primary_driver: true`
- `default_work_mode: inventory`
- `artifact_creation_requires_explicit_request: true`
- `next_step_recommendations_only: true`
- `auto_progression: false`
- `ask_before_scope_changes: true`
- `ask_before_status_changes: true`
- `ask_before_owner_creation: true`

Suggested ownership convention for live project artifacts:

- use `confirmed:<owner>` when ownership is actually confirmed
- use `role-placeholder:<role>` when only the responsibility shape is known
- use `tbd` or `unknown` when ownership is not yet known

This keeps architecture stewardship honest and prevents plausible-sounding but
invented ownership from becoming accidental truth.

You can also express how the agent should handle unresolved questions.

Recommended convention:

- `ask_user_on_blocking_open_questions: true`
- `allow_progress_on_non_blocking_open_questions: true`

Use this when the project wants the coordinator to ask the user directly when
an open question materially blocks safe progression, instead of only recording
that question in summaries or handoffs.

Use `allow_progress_on_non_blocking_open_questions: true` when the project
wants the coordinator and specialist agents to keep moving on bounded work as
long as the unresolved question does not make the next step unsafe or
misleading.

### Work Modes

Use a default work mode so the agent knows what kind of help is wanted before
it starts producing architecture outputs.

Recommended modes:

- `inventory`
  - extract and structure facts from source material
  - do not invent architecture conclusions
  - do not create architecture artifacts unless explicitly asked
- `analysis`
  - summarize, cluster, compare, or identify dependencies and risks
  - recommendations are allowed
  - architecture artifacts still require explicit request
- `modeling`
  - create or update architecture artifacts
  - use only when the user explicitly wants architecture assets
- `review`
  - critique an existing model, decision, or artifact set
- `decision`
  - compare options and recommend a choice

See [`.architect/guidance/work-modes.md`](../guidance/work-modes.md) for the
full behavior guidance.

### `governance`

Use this section to declare the roles that own architecture, requirements, and
review responsibility for the project.

Recommended coordinator fields:

- `coordinator_role`: the default coordinating role for the project
- `coordinator_skill`: the default orchestration skill used to route the next
  step
- `coordinator_auto_route`: when `true`, the coordinator should choose the next
  role or skill unless the user explicitly overrides it

Suggested coordinator-led default:

- `coordinator_role: chief-architect`
- `coordinator_skill: architecture-coordinator`
- `coordinator_auto_route: true`

Suggested architect-assist default:

- `coordinator_auto_route: false`

Use `false` when the architect wants next-step recommendations but does not want
the workspace to move itself through a process.

### `runtime`

Use this section when the project wants actual multi-agent execution rather than
only role-guided single-agent work.

Suggested fields:

- `execution_mode`
  - `single-agent-guided`
  - `coordinator-led-multi-agent`
  - `external-orchestrated`
- `coordinator_agent_profile`
  - path to the coordinating runtime profile under `agents/`
- `state_root`
  - path to the live runtime state folder
- `task_artifact`
  - standard task payload used for assignments
- `handoff_artifact`
  - standard handoff payload used between agents
- `allow_parallel_specialists`
  - whether multiple specialist agents may run at once
- `require_validation_before_handoff`
  - whether a specialist agent must validate before completing a handoff

Recommended architect-assist runtime:

- `execution_mode: single-agent-guided`
- `allow_parallel_specialists: false`

Recommended coordinator-led runtime:

- `execution_mode: coordinator-led-multi-agent`
- `coordinator_agent_profile: .architect/agents/chief-architect.md`
- `state_root: .architect/runtime`

Without this runtime layer, the workspace should be treated as single-agent work
that can switch among roles and skills without instantiating separate live
agents.

## Approval Threshold

In an architect-assist project, agents should default to:

- allowed without asking:
  - extract facts
  - summarize documents
  - cluster interfaces or applications
  - compare options
  - recommend next steps
- ask first:
  - create or update architecture artifacts
  - create review packets or runtime artifacts
  - change scope assumptions
  - change statuses or approvals
  - introduce owners or stakeholders not grounded in source evidence

## Open Question Behavior

If `conventions.ask_user_on_blocking_open_questions` is `true`:

- the coordinator should ask the user directly when an unresolved question
  materially blocks the next safe step
- specialist agents may record open questions, but should route blocking ones
  back through the coordinator
- non-blocking questions may still be tracked in notes, handoffs, or review
  packets without pausing the flow

If `conventions.allow_progress_on_non_blocking_open_questions` is `true`:

- unresolved but non-blocking questions should be classified explicitly as
  `non-blocking`
- agents may continue with the next safe bounded step
- those questions should still be carried forward in coordination summaries,
  handoffs, review packets, or `notes.open_questions`
- the presence of a non-blocking question should not be turned into a fake
  fact just to make the artifact look complete

## Suggested Defaults

If you are unsure, start with:

- `architecture_scope: enterprise-and-solution`
- `architecture_mode: project-local`
- a small but realistic role set
- a reduced template set instead of the full library
- one or two flows

## Good Practice

- keep the configuration small and intentional
- review it when the project scope changes
- align it to the chosen project method
- treat it as the control point for future automation and validation
- if one coordinating role should route the rest of the work, make that explicit
  in `governance` so agents do not guess differently
