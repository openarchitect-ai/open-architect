# Canonical Data Ownership

## Purpose

Establish a clear system of record and stewardship model for shared business
data so integration and reporting flows do not compete over conflicting truth.

## When To Use

- multiple systems store overlapping business entities
- downstream integrations need a consistent source of truth
- ownership and change control for data are currently ambiguous

## When Not To Use

- the domain is intentionally decentralized and does not require one canonical
  business owner
- the pattern would force an unrealistic central model across unrelated domains

## Assumptions

- the business entity has a meaningful owning domain or steward
- consumers can tolerate controlled propagation from the owner system
- data quality and stewardship responsibilities can be assigned

## Key Components

- canonical business entity definition
- owning application or domain
- stewardship and quality responsibilities
- integration rules for publish, consume, and reconcile

## Benefits

- reduces ambiguity over source-of-truth ownership
- improves traceability of data changes
- supports more consistent integration and reporting design

## Tradeoffs

- requires governance discipline
- can slow local autonomy if applied too broadly
- may require migration from informal replicated ownership

## Common Risks

- mistaking technical centralization for business ownership
- weak stewardship follow-through
- unclear exception handling for local copies and cached data

## Related Templates

- `data-object`
- `application`
- `interface`
- `organization`
- `decision`
