# Strangler Modernization

## Purpose

Modernize a legacy solution incrementally by introducing new capabilities around
the edges and gradually replacing legacy behavior over time.

## When To Use

- the legacy platform cannot be replaced safely in one step
- phased migration lowers delivery or business risk
- new capabilities can be routed through a new boundary over time

## When Not To Use

- the legacy system is small enough for a straightforward replacement
- the organization cannot sustain parallel-state complexity during transition
- integration boundaries are too entangled to separate incrementally

## Assumptions

- there is a stable point where routing or orchestration can be controlled
- coexistence between old and new components can be governed
- transition states can be tracked explicitly

## Key Components

- existing legacy capability
- new capability slice or facade boundary
- routing or orchestration logic
- migration roadmap and transition states

## Benefits

- reduces big-bang replacement risk
- allows value delivery in smaller increments
- supports learning and correction during modernization

## Tradeoffs

- increases interim complexity
- may prolong dual-running costs
- requires disciplined transition governance

## Common Risks

- unclear exit criteria from interim states
- too many partial migrations with no convergence plan
- poor traceability between transition waves and target outcomes

## Related Templates

- `solution`
- `transition-architecture`
- `gap`
- `work-package`
- `roadmap`
- `decision`
