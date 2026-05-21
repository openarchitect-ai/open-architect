# Data Reconciliation

## Purpose

Compare and resolve differences between related data sets so transitions,
replication, reporting, and operational trust are supported by explicit control
rather than assumption.

## When To Use

- multiple systems or stores hold related records that can drift apart
- migrations, parallel runs, or replicated views need consistency checks
- business or regulatory trust depends on proving alignment between data sets

## When Not To Use

- only one authoritative data set exists and no meaningful comparison is needed
- the cost of reconciliation exceeds the risk of inconsistency

## Assumptions

- comparison rules can be defined meaningfully
- discrepancies can be investigated and resolved
- reconciliation ownership is assigned

## Key Components

- source and comparison data sets
- reconciliation rules and tolerances
- exception handling and remediation path
- evidence or reporting of reconciliation outcomes

## Benefits

- improves trust in data movement and coexistence
- exposes hidden drift earlier
- supports migration and reporting control

## Tradeoffs

- adds operational effort
- may require additional staging or comparison tooling
- can surface disagreements that need business resolution

## Common Risks

- reconciliation rules too weak to catch meaningful drift
- no owner for unresolved discrepancies
- comparison run without remediation follow-through

## Related Templates

- `data-object`
- `interface`
- `transition-architecture`
- `risk`
- `decision`
