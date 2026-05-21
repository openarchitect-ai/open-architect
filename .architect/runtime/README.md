# Runtime

This folder holds the live execution state for coordinator-led multi-agent work.

## Level

`runtime/` is an `Advanced` part of the workspace.

Most projects do not need it.

## Purpose

Use `runtime/` when the project wants more than role simulation.

These files let the coordinator and specialist agents share:

- current stage
- task queue
- handoff sequence
- gate status

If the project is operating in the normal `architect-assist` style, these files
should stay in their neutral template state.

## Files

- `active-work.yaml`
  High-level state for the current project slice.
- `agent-queue.yaml`
  Queued, active, blocked, and completed tasks.
- `review-gates.yaml`
  Current review gate statuses and required approvals.

## Rule

Runtime state should be updated by the coordinator as work progresses.

Specialist agents should not rewrite queue or gate state unless the coordinator
explicitly delegates that responsibility.
