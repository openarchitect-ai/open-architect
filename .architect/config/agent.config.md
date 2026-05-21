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
8. If you want one default orchestrating agent, set the coordinator role and skill.
9. Keep ownership truthful; do not let agents guess named owners to make artifacts look complete.
10. If the project will use real multi-agent execution, configure the runtime section and agent profiles explicitly.

## Field Guidance

### `project`

- `name`: project or workspace name
- `architecture_scope`: suggested values include `enterprise`, `solution`, or `enterprise-and-solution`
- `architecture_mode`: use `project-local` unless you later support shared or federated modes
- `primary_method`: the method document the project follows
- `reference_methods`: supporting reference methods such as ADM or transition architecture guidance

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

### `flows.enabled`

Enable only the flows the project intends to use.

Examples:

- `architecture-development`
- `transition-architecture`

### `conventions`

Use this section to declare project-wide expectations that may later be
validated automatically.

Suggested ownership convention for live project artifacts:

- use `confirmed:<owner>` when ownership is actually confirmed
- use `role-placeholder:<role>` when only the responsibility shape is known
- use `tbd` or `unknown` when ownership is not yet known

This keeps architecture stewardship honest and prevents plausible-sounding but
invented ownership from becoming accidental truth.

### `governance`

Use this section to declare the roles that own architecture, requirements, and
review responsibility for the project.

Recommended coordinator fields:

- `coordinator_role`: the default coordinating role for the project
- `coordinator_skill`: the default orchestration skill used to route the next
  step
- `coordinator_auto_route`: when `true`, the coordinator should choose the next
  role or skill unless the user explicitly overrides it

Suggested default:

- `coordinator_role: chief-architect`
- `coordinator_skill: architecture-coordinator`
- `coordinator_auto_route: true`

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

Recommended first runtime:

- `execution_mode: coordinator-led-multi-agent`
- `coordinator_agent_profile: .architect/agents/chief-architect.md`
- `state_root: .architect/runtime`

Without this runtime layer, the workspace should be treated as coordinator-led
single-agent execution that simulates roles and skills rather than instantiating
separate live agents.

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
