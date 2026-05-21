# Agents

This folder contains executable agent profiles for Open Architect.

## Purpose

Use `agents/` when you want runtime-oriented multi-agent execution instead of
only role descriptions and skill playbooks.

The distinction is:

- `roles/`
  Perspective, accountability, and ownership boundaries.
- `skills/`
  Reusable procedures and work playbooks.
- `agents/`
  Runtime profiles that combine a role, a bounded skill set, write scope, stop
  conditions, and handoff behavior.
- `runtime/`
  The queue, state, and gate records used while agents are executing.

## Why This Exists

Without this folder, role-based work is still mostly coordinator-led
single-agent behavior that simulates specialist roles.

With `agents/` plus `runtime/`, the workspace can model:

- which role is instantiated as a real agent
- which skills that agent may execute by default
- what files it may edit
- what validation it must run
- when it must stop and hand control back to the coordinator

## Included

- `execution-model.md`
  Overall runtime contract for coordinator-led multi-agent execution.
- `artifacts/agent-task.yaml`
  Standard task payload for the next assigned agent step.
- `artifacts/agent-handoff.yaml`
  Standard handoff payload between agents.
- `chief-architect.md`
  Default coordinating agent profile.
- `business-analyst.md`
  Framing and requirement-quality agent profile.
- `solution-architect.md`
  Solution-shaping agent profile.
- `security-architect.md`
  Security and compliance assessment agent profile.
- `architecture-governance-lead.md`
  Review and governance gate agent profile.

## Default Operating Model

The recommended first execution mode is:

- one coordinating agent: `chief-architect`
- bounded specialist agents
- artifact-backed task and handoff payloads
- runtime state stored under `../runtime/`
- human review gates still explicit and manual

## Rule

Agents are not free-form personas.

Each agent should:

- accept assigned scope from the coordinator
- use the allowed skills and write scope only
- run required validation before handoff
- produce a task result or handoff artifact
- stop at the configured review gate
