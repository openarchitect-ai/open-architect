# Data Sharing Agreement Governance

## Purpose

Govern formal agreements for data sharing so purpose, scope, obligations, and
controls are explicit when data crosses organizational or trust boundaries.

## When To Use

- data is shared across business units, partners, or regulated boundaries
- access expectations, permitted use, or obligations need formal agreement
- architecture choices must reflect more than just transport and schema

## When Not To Use

- the exchange is fully internal and low-risk with no additional agreement need
- the concern is purely technical and no meaningful policy or usage constraint
  applies

## Assumptions

- sharers and receivers can agree on responsibilities
- data purpose, scope, and restrictions can be defined
- agreements will influence interface and operating behavior

## Key Components

- data scope and purpose
- usage, retention, and protection obligations
- approval and review lifecycle
- breach, issue, and termination handling

## Benefits

- improves clarity of cross-boundary data responsibilities
- supports better compliance and accountability
- reduces ambiguity around permitted use and stewardship

## Tradeoffs

- adds legal and governance overhead
- agreement maintenance can lag behind technical change
- may slow onboarding of new data consumers

## Common Risks

- agreements written but not reflected in system behavior
- unclear ownership of reviews and updates
- consumers using data outside the intended scope

## Related Templates

- `data-object`
- `interface`
- `compliance-assessment`
- `risk`
- `decision`
