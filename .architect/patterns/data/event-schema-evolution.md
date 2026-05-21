# Event Schema Evolution

## Purpose

Evolve event contracts safely over time so publishers and consumers can change
without destabilizing dependent integrations.

## When To Use

- event-driven integrations are in place or planned
- multiple consumers depend on a shared event contract
- business change is likely to affect event payload structure or meaning

## When Not To Use

- the integration is purely synchronous and no event contract exists
- the event is short-lived and has no meaningful external dependency surface

## Assumptions

- event ownership is defined
- compatibility expectations can be agreed
- schema versioning and rollout discipline can be maintained

## Key Components

- versioning strategy
- compatibility rules
- publisher and consumer coordination
- deprecation and retirement path

## Benefits

- reduces breaking change risk for event consumers
- supports more sustainable event-driven architecture growth
- improves clarity on ownership and contract change expectations

## Tradeoffs

- adds governance overhead around contract changes
- may increase publisher complexity during transition periods
- requires better documentation and observability than ad hoc events

## Common Risks

- unmanaged semantic drift
- version sprawl without retirement discipline
- consumers making unsafe assumptions about optional or reordered fields

## Related Templates

- `interface`
- `application-service`
- `data-object`
- `decision`
- `technology-standard`
