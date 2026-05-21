# Archival And Retention

## Purpose

Control how data is retained, archived, and disposed of over time so business,
 legal, operational, and cost constraints are handled explicitly.

## When To Use

- data must be retained or deleted under policy or regulation
- older data should be moved out of operational stores
- audit, reporting, or recovery needs depend on retention choices

## When Not To Use

- the data has no meaningful retention or archival concern
- the pattern would add governance overhead without practical value

## Assumptions

- retention obligations can be identified
- archive ownership and retrieval expectations can be assigned
- disposal rules can be governed safely

## Key Components

- retention classes or periods
- archive storage and access model
- purge or disposal controls
- retrieval and audit expectations

## Benefits

- reduces ambiguity over how long data should exist
- supports compliance and cost management
- improves planning for operational and historical data needs

## Tradeoffs

- adds governance and operational complexity
- archive retrieval may be slower or more controlled than live access
- poor classification can create unnecessary retention cost

## Common Risks

- retaining data longer than intended by default
- archiving without clear retrieval or disposal ownership
- operational systems carrying historical data they should not keep

## Related Templates

- `data-object`
- `requirement`
- `risk`
- `compliance-assessment`
- `environment`
