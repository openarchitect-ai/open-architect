# Phased Decommissioning

## Purpose

Retire legacy components, interfaces, or data stores through controlled stages
so dependencies can be unwound safely and the target-state simplification is
actually completed.

## When To Use

- legacy assets should be removed gradually after transition milestones
- downstream dependencies, consumers, or data retention constraints prevent
  immediate shutdown
- target-state value depends on removing transitional or obsolete components

## When Not To Use

- the component can be safely retired in one simple step
- no meaningful legacy burden remains once the new path is live

## Assumptions

- decommissioning scope and ownership can be defined clearly
- dependency mapping is good enough to support staged retirement
- exit criteria and retention obligations can be stated

## Key Components

- decommissioning scope and phase plan
- dependency and consumer retirement checks
- archive, retention, or shutdown controls
- final removal decision point

## Benefits

- reduces shutdown risk
- prevents “temporary” legacy coexistence from becoming permanent
- makes target-state simplification measurable

## Tradeoffs

- extends transition work beyond go-live
- requires dependency tracking and follow-through
- can be deprioritized if not tied to explicit outcomes

## Common Risks

- no clear owner for final retirement
- hidden consumers discovered late
- decommissioning deferred indefinitely after the new solution launches

## Related Templates

- `transition-architecture`
- `work-package`
- `gap`
- `roadmap`
- `risk`
- `decision`
