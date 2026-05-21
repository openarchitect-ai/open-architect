# Data Lineage And Provenance

## Purpose

Make the origin, movement, transformation, and stewardship of data explicit so
trust, auditability, and impact analysis improve across the architecture.

## When To Use

- data moves across multiple systems, transformations, or reporting layers
- users need to trust where important data came from and how it changed
- governance, audit, or incident analysis depends on traceable data history

## When Not To Use

- the data scope is highly local and simple with minimal transformation
- the effort of detailed lineage would outweigh the value for the domain

## Assumptions

- source and transformation points can be identified
- stewardship exists for important datasets
- lineage will be used for governance, troubleshooting, or compliance

## Key Components

- source system identification
- transformation and movement trace
- stewardship and ownership markers
- lineage storage, visualization, or reporting approach

## Benefits

- improves trust in analytics and operational data
- supports faster impact analysis and troubleshooting
- strengthens audit and compliance posture

## Tradeoffs

- can be labor-intensive to maintain
- may require metadata tooling or discipline across many teams
- detailed lineage is harder in loosely coupled or event-heavy ecosystems

## Common Risks

- lineage captured once but not maintained
- incomplete visibility around manual or out-of-band changes
- stakeholders assuming lineage proves data quality automatically

## Related Templates

- `data-object`
- `application`
- `interface`
- `technology-component`
- `compliance-assessment`
