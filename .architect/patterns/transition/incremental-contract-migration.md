# Incremental Contract Migration

## Purpose

Evolve or replace interfaces and contracts gradually so consumers and providers
can move safely over time instead of relying on one disruptive cutover.

## When To Use

- interface changes affect multiple consumers
- compatibility and adoption timing vary across dependent teams
- a big-bang contract switch would create avoidable delivery risk

## When Not To Use

- the contract has a single tightly coordinated consumer
- a clean one-step replacement is genuinely low risk

## Assumptions

- old and new contracts can coexist for a period
- consumer migration progress can be tracked
- deprecation and sunset expectations can be enforced

## Key Components

- old and new contract versions
- migration sequencing for consumers
- compatibility, mapping, or adaptation rules
- deprecation and sunset criteria

## Benefits

- reduces consumer disruption
- supports safer phased change
- improves visibility of migration progress and laggards

## Tradeoffs

- prolongs coexistence and support effort
- requires stronger version and deprecation discipline
- can create extra complexity in provider implementations

## Common Risks

- no clear sunset path for the old contract
- consumers staying indefinitely on deprecated versions
- weak visibility of which consumers have migrated

## Related Templates

- `interface`
- `application-service`
- `transition-architecture`
- `work-package`
- `decision`
