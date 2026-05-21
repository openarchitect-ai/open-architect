# Decision Review And Sunset

## Purpose

Review architecture decisions over time and retire or replace them when their
context, assumptions, or usefulness has changed.

## When To Use

- important decisions have a limited useful life
- architecture guidance risks becoming stale if never revisited
- teams need a structured way to reassess past choices without informal drift

## When Not To Use

- the decision is trivial and unlikely to need future reassessment
- no meaningful trigger or review cadence can be defined

## Assumptions

- significant decisions are documented and traceable
- review triggers or dates can be assigned
- decision retirement will influence standards, plans, or implementations

## Key Components

- review trigger or schedule
- reassessment criteria
- retained, changed, or sunset outcome
- follow-through updates to affected artifacts

## Benefits

- reduces accumulation of stale architecture decisions
- improves adaptability as technology and business context change
- supports clearer governance of long-lived guidance

## Tradeoffs

- adds lifecycle overhead to decision management
- requires discipline to revisit decisions that appear settled
- may reopen debates if review criteria are vague

## Common Risks

- decisions reviewed perfunctorily without real reassessment
- sunset outcomes not propagated to dependent artifacts
- important decisions lingering indefinitely without any trigger

## Related Templates

- `decision`
- `principle`
- `technology-standard`
- `roadmap`
- `risk`
