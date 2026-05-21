# Outbox Pattern

## Purpose

Publish events reliably from transactional systems by writing the event to an
outbox store within the same business transaction and dispatching it
asynchronously afterward.

## When To Use

- business state changes must be emitted as events reliably
- dual-write risk between database update and event publication is unacceptable
- the solution needs stronger consistency between persisted state and emitted
  events

## When Not To Use

- no event publication is needed
- the platform already guarantees the required publication semantics another way
- the operational complexity outweighs the reliability benefit

## Assumptions

- the transaction boundary is well understood
- an outbox table or equivalent durable store can be introduced
- dispatch, retry, and replay can be monitored operationally

## Key Components

- business transaction
- outbox record store
- dispatcher or relay process
- event broker or downstream publication mechanism

## Benefits

- reduces dual-write failure risk
- improves reliability of event publication
- supports controlled retry and replay behavior

## Tradeoffs

- adds storage and dispatch complexity
- requires monitoring for stuck or repeated publications
- can introduce small publication delay

## Common Risks

- poor deduplication handling downstream
- weak cleanup strategy for old outbox records
- dispatch failures not being surfaced clearly

## Related Templates

- `solution`
- `application`
- `application-service`
- `interface`
- `technology-component`
- `decision`

## Related Decisions

- delivery semantics
- replay and retention policy
- deduplication strategy
