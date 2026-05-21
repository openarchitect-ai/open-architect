# Architecture Decision Lifecycle

## Purpose

Manage architecture decisions as living governance assets with clear creation,
review, revision, and retirement expectations instead of one-time meeting notes.

## When To Use

- important architecture choices need durable governance and traceability
- decisions may need scheduled re-evaluation as context changes
- multiple teams depend on shared architectural direction

## When Not To Use

- the choice is too trivial to justify formal decision management
- the pattern would create ceremony without improving accountability

## Assumptions

- decision ownership can be assigned clearly
- review timing and revision triggers can be defined
- downstream artifacts can be linked back to the decision

## Key Components

- decision proposal and context
- evaluation and approval path
- review trigger or review date
- supersession and retirement handling

## Benefits

- improves traceability of why the architecture is shaped as it is
- supports controlled re-evaluation instead of silent drift
- makes cross-team governance more consistent

## Tradeoffs

- adds governance overhead
- requires ownership discipline over time
- can become stale if review triggers are ignored

## Common Risks

- decisions captured once and never revisited
- implementation drifting away from the approved decision
- superseded decisions staying ambiguous in the architecture set

## Related Templates

- `decision`
- `principle`
- `technology-standard`
- `risk`
- `compliance-assessment`
