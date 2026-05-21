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

One agent supports the architect directly while switching among role and skill
guidance as needed.

Use this when:

- the architect remains the primary driver
- the task is discovery, analysis, review, or bounded modeling
- specialist separation is not yet required
- you want recommendations without automatic process progression

### `coordinator-led-multi-agent`

One coordinator routes work to bounded specialist agents.

Use this when:

- the project needs real handoffs
- file ownership boundaries matter
- review gates should be visible and enforced

Use this only when the project explicitly wants managed handoffs, queue state,
and visible review routing.

### `external-orchestrated`

An external queue or automation service invokes agents and stores runtime state.

Use this later when:

- concurrency matters
- auditability needs stronger automation
- runtime behavior moves beyond repo-local coordination

## Default Architect-Assist Model

The default execution model should normally be:

- execution mode: `single-agent-guided`
- operating style: `architect-assist`
- the architect decides when to move from inventory to analysis to modeling
- the agent may recommend next steps, but should not auto-progress
- artifact creation requires explicit request

## Coordinator Model

If the project opts into coordination, the default coordinator model is:

- coordinator role: `chief-architect`
- coordinator skill: `architecture-coordinator`
- specialist agents only act when assigned
- specialist agents do not self-route the next major step
- all review gates route back through the coordinator

## Agent Task Contract

Every executable multi-agent step should start with an `agent-task` payload that
states:

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

Every completed multi-agent step should end with an `agent-handoff` payload that
states:

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

The minimum runtime state for multi-agent execution is:

- `runtime/active-work.yaml`
  Current project slice, coordinator, and active stage.
- `runtime/agent-queue.yaml`
  Queued, active, blocked, and completed tasks.
- `runtime/review-gates.yaml`
  Known review gates and their current status.

## Validation Rule

Before a multi-agent step can hand off work:

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

## Recommended Starting Point

Start with `single-agent-guided` plus a small specialist set. Move to
coordinator-led execution only after the architect confirms that the extra
structure is helpful.

## Recommended Wave 1 Agent Set

If multi-agent execution is enabled, start with:

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
