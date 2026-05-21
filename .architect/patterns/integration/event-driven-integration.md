# Event-Driven Integration

## Purpose

Coordinate distributed systems through published events so producers and
consumers can evolve with looser coupling than direct point-to-point calls.

## When To Use

- downstream systems need to react to business events
- multiple consumers depend on the same state change
- temporal decoupling is more important than immediate synchronous response
- modernization should reduce point-to-point dependency chains

## When Not To Use

- a strict synchronous confirmation is required before the initiating process
  can proceed
- event ordering and consistency expectations cannot be handled safely
- the operational maturity for messaging, retries, and observability is absent

## Assumptions

- business events can be defined clearly
- consumers can handle eventual consistency
- the platform supports messaging, replay, and monitoring appropriately

## Key Components

- event producer
- message broker or event backbone
- event contract and schema governance
- one or more subscribing consumers
- dead-letter, retry, and observability mechanisms

## Benefits

- reduces producer-consumer coupling
- enables fan-out to multiple consumers
- supports more incremental modernization

## Tradeoffs

- adds operational complexity
- requires stronger monitoring and contract governance
- debugging end-to-end flow can be harder than synchronous calls

## Common Risks

- poorly defined event contracts
- unmanaged event versioning
- duplicate or out-of-order consumption without proper controls

## Related Templates

- `solution`
- `application`
- `application-service`
- `interface`
- `data-object`
- `technology-component`

## Related Decisions

- delivery semantics
- event ownership
- schema evolution strategy
