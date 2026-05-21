# Parallel Run

## Purpose

Operate old and new solution paths simultaneously for a controlled period so
outputs, behavior, or operational readiness can be compared before full cutover.

## When To Use

- confidence in a replacement or migration must be built before full switchover
- business risk of a direct cutover is high
- comparable outputs or behaviors can be observed during coexistence

## When Not To Use

- duplicate running cost or complexity is unjustifiable
- the old and new paths cannot be compared meaningfully
- the organization cannot support dual-operation governance

## Assumptions

- duration and exit criteria can be defined
- reconciliation or comparison logic can be designed
- ownership for discrepancy handling is assigned

## Key Components

- legacy and target operating paths
- comparison or reconciliation mechanism
- cutover criteria
- fallback or rollback path

## Benefits

- reduces confidence risk before full cutover
- makes discrepancies visible before irreversible migration
- supports more deliberate transition governance

## Tradeoffs

- increases temporary cost and complexity
- requires explicit reconciliation effort
- can prolong transition if exit criteria are weak

## Common Risks

- no clear end to the parallel run
- discrepancies discovered but not resolved systematically
- parallel run treated as proof without proper measurement

## Related Templates

- `transition-architecture`
- `roadmap`
- `work-package`
- `gap`
- `risk`
