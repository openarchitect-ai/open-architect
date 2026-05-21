# Event-Carried State Transfer

## Purpose

Carry enough business state in emitted events so consumers can react without
always making follow-up synchronous calls to the source system.

## When To Use

- event consumers need timely local context
- reducing synchronous coupling is important
- the source can publish stable event payloads with meaningful business state

## When Not To Use

- consumers only need a lightweight notification and should fetch current state
  separately
- event payload growth or sensitivity would create unacceptable risk

## Assumptions

- event ownership and schema governance are clear
- payload freshness and duplication expectations can be handled
- consumers can tolerate eventual consistency

## Key Components

- event payload with useful business state
- schema and versioning controls
- consumer-side state handling
- rules for stale, duplicate, or out-of-order events

## Benefits

- reduces follow-up request chatter
- supports looser coupling and better consumer autonomy
- can simplify read-side processing

## Tradeoffs

- increases event payload size and governance burden
- can expose more sensitive data if poorly bounded
- creates stronger schema evolution pressure

## Common Risks

- overloading events with too much state
- stale state misused as authoritative truth
- weak versioning creating fragile consumers

## Related Templates

- `data-object`
- `interface`
- `application-service`
- `decision`
- `risk`
