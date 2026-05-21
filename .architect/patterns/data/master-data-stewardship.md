# Master Data Stewardship

## Purpose

Establish accountable stewardship, quality control, and lifecycle rules for
shared master data so key entities remain trustworthy across the estate.

## When To Use

- customer, product, supplier, or similar master entities are shared broadly
- data quality issues create business, reporting, or integration problems
- multiple teams interact with the same critical business entities

## When Not To Use

- the data is local, short-lived, or not broadly reused
- governance overhead would outweigh the value of formal stewardship
- the problem is purely technical duplication rather than business ownership and
  quality control

## Assumptions

- business stewardship responsibilities can be assigned
- data quality expectations can be defined and monitored
- change control for master data can be governed intentionally

## Key Components

- master entity definition
- business steward and technical steward roles
- quality, validation, and exception-handling rules
- change and synchronization controls for downstream consumers

## Benefits

- improves trust in shared business data
- clarifies who owns quality and lifecycle decisions
- reduces downstream ambiguity during integration and reporting

## Tradeoffs

- introduces governance effort
- may slow uncontrolled local changes
- requires sustained stewardship follow-through

## Common Risks

- stewardship assigned nominally but not operationally
- quality rules defined without measurement or enforcement
- local workarounds undermining master data discipline

## Related Templates

- `data-object`
- `organization`
- `application`
- `decision`
- `requirement`
