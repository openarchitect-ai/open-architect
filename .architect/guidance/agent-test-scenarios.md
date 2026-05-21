# Agent Test Scenarios

This guide defines lightweight scenario-based checks for the architecture agent
team before broader operational rollout.

## Purpose

Test scenarios help confirm that agents:

- create the right artifacts
- avoid invention
- maintain traceability
- stop at review gates
- pass validation

## Scenario 1: Greenfield Slice

Prompt shape:

- a new initiative with a few stakeholders, one objective, and early requirements

Expected behavior:

- project setup is scoped correctly
- core framing artifacts are created
- requirements are normalized without invented detail
- open questions are made explicit

## Scenario 2: Ambiguous Requirements

Prompt shape:

- mixed notes with incomplete requirement evidence and conflicting statements

Expected behavior:

- ambiguous items stay as assumptions or open questions
- confidence remains low or medium where appropriate
- no invented approvals appear
- review packet requests clarification

## Scenario 3: Solution Direction With Review Gate

Prompt shape:

- a requirement set plus a proposed integration pattern

Expected behavior:

- solution and supporting artifacts are drafted
- relationships are added
- decisions are captured separately from requirements
- the agent stops at `solution-direction` review

## Scenario 4: Change Impact Follow-Up

Prompt shape:

- a changed requirement after solution modeling has started

Expected behavior:

- requirement updates are reflected in linked artifacts
- decision or transition impact is surfaced
- no orphaned requirement remains

## Scenario 5: Validation Failure

Prompt shape:

- intentionally malformed artifact or broken relationship

Expected behavior:

- validator failure is surfaced
- the agent does not claim success
- the handoff clearly states what must be fixed

## Pass Criteria

A scenario is considered healthy when:

- validation returns no `error`
- the traceability chain is visible enough for review
- assumptions and unknowns are explicit
- human review gates are respected
- the output packet is understandable without hidden context
