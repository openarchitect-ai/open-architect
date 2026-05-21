# Execution Model

This document defines how Open Architect moves from role-guided authoring to
true multi-agent execution.

## Purpose

Roles, skills, and flows describe architecture work conceptually.

The execution model defines how that work runs operationally.

## Layers

- `roles/`
  Responsibility and perspective.
- `skills/`
  Repeatable work procedure.
- `agents/`
  Executable runtime profile that binds a role to default skills, write scope,
  and stop conditions.
- `runtime/`
  The active queue, current work state, and review gate tracking.

## Supported Modes

### `single-agent-guided`

One agent follows role and skill guidance manually.

Use this when:

- the workspace is still being designed
- the task is small
- specialist separation is not yet required

### `coordinator-led-multi-agent`

One coordinator routes work to bounded specialist agents.

Use this when:

- the project needs real handoffs
- file ownership boundaries matter
- review gates should be visible and enforced

This is the recommended Wave 1 mode.

### `external-orchestrated`

An external queue or automation service invokes agents and stores runtime state.

Use this later when:

- concurrency matters
- auditability needs stronger automation
- runtime behavior moves beyond repo-local coordination

## Default Coordinator Model

The default execution model is:

- coordinator role: `chief-architect`
- coordinator skill: `architecture-coordinator`
- specialist agents only act when assigned
- specialist agents do not self-route the next major step
- all review gates route back through the coordinator

## Agent Task Contract

Every executable step should start with an `agent-task` payload that states:

- task id
- assigned agent
- role
- skill
- scope
- input artifacts
- writable paths
- expected outputs
- validation requirement
- review gate
- stop conditions

## Agent Handoff Contract

Every completed step should end with an `agent-handoff` payload that states:

- handoff id
- from agent
- to agent
- source task id
- changed artifacts
- evidence summary
- assumptions
- open questions
- validation summary
- requested next action
- review gate context

## Runtime State

The minimum runtime state is:

- `runtime/active-work.yaml`
  Current project slice, coordinator, and active stage.
- `runtime/agent-queue.yaml`
  Queued, active, blocked, and completed tasks.
- `runtime/review-gates.yaml`
  Known review gates and their current status.

## Validation Rule

Before an agent can hand off work:

- required validation must run
- validation summary must be recorded
- errors must block completion
- warnings must be disclosed in the handoff

## Human Review Rule

Agents may prepare approval recommendations, but they must pause at human gates.

Human gates should normally include:

- project bootstrap
- requirement baseline
- solution direction
- decision approval
- governance review
- transition plan

## Recommended Wave 1 Agent Set

Start with:

- `chief-architect`
- `business-analyst`
- `solution-architect`
- `security-architect`
- `architecture-governance-lead`

And primarily exercise these skills:

- `architecture-coordinator`
- `project-bootstrapper`
- `requirement-normalizer`
- `solution-modeler`
- `decision-recorder`
- `risk-compliance-assessor`
- `architecture-review`
