# Coexistence Data Migration

## Purpose

Manage transition periods where legacy and target solutions must coexist while
data is synchronized, partitioned, or progressively migrated over time.

## When To Use

- old and new solutions must run in parallel during transition
- data cannot be moved safely in one cutover event
- business continuity depends on staged migration or coexistence rules

## When Not To Use

- data can be moved in a clean one-time cutover with low risk
- coexistence would create more confusion than value
- ownership and reconciliation rules cannot be defined clearly

## Assumptions

- coexistence duration and exit criteria can be stated
- synchronization, reconciliation, and exception handling can be governed
- source-of-truth rules remain visible during each phase

## Key Components

- legacy and target data states
- migration or synchronization mechanism
- reconciliation and exception handling controls
- phase-specific ownership and cutover rules

## Benefits

- reduces big-bang migration risk
- supports staged transition and business continuity
- makes interim data-control rules explicit

## Tradeoffs

- increases temporary complexity
- requires disciplined ownership and reconciliation
- can prolong technical debt if exit criteria are weak

## Common Risks

- unclear source-of-truth shifts during transition
- incomplete reconciliation between old and new states
- interim coexistence lasting longer than intended

## Related Templates

- `transition-architecture`
- `gap`
- `work-package`
- `roadmap`
- `data-object`
- `decision`
