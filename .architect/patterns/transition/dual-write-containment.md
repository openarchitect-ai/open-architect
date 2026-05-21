# Dual-Write Containment

## Purpose

Limit the duration, scope, and risk of dual-write behavior during transition so
temporary parallel updates do not become a permanent source of inconsistency or
hidden coupling.

## When To Use

- a migration phase requires updates to old and new targets concurrently
- decommissioning or coexistence cannot happen in a single cutover step
- architecture needs explicit controls around temporary consistency risk

## When Not To Use

- a safer pattern such as event sourcing, outbox, or single-writer migration is
  feasible
- dual writes would create uncontrolled integrity risk with no compensating
  controls

## Assumptions

- the dual-write window can be bounded
- reconciliation and rollback approaches exist
- ownership of write sequencing and failure handling is clear

## Key Components

- defined dual-write scope and duration
- ordering and failure-handling rules
- reconciliation and monitoring controls
- exit criteria to return to a single-writer model

## Benefits

- supports staged migration where immediate cutover is impractical
- makes temporary coexistence more explicit and governable
- creates clearer exit conditions for transition teams

## Tradeoffs

- adds consistency risk and operational complexity
- increases failure-mode analysis needs
- can hide architectural indecision if allowed to persist too long

## Common Risks

- dual write becoming permanent
- partial failures leaving systems out of sync
- weak observability around divergence and replay needs

## Related Templates

- `transition-architecture`
- `interface`
- `data-object`
- `work-package`
- `risk`
