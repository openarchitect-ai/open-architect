# Request-Response Integration

## Purpose

Connect systems through direct synchronous calls when the initiating flow needs
an immediate response or confirmation before it can proceed safely.

## When To Use

- the caller requires immediate validation or confirmation
- the business process cannot continue without a direct response
- the interaction volume and latency profile are acceptable for synchronous
  dependency

## When Not To Use

- consumers can tolerate eventual consistency
- the interaction fan-out would create fragile dependency chains
- resilience, latency, or availability constraints make tight coupling unsafe

## Assumptions

- service ownership and contract versioning are clear
- timeout, retry, and fallback behavior are intentionally designed
- operational teams can support synchronous dependency monitoring

## Key Components

- calling service or application
- target service or API
- request and response contract
- timeout, retry, and error handling strategy

## Benefits

- simple interaction model
- immediate feedback to the caller
- easier to reason about for confirmation-style processes

## Tradeoffs

- tighter temporal coupling
- availability and latency of the dependency affect the caller directly
- scaling behavior depends on downstream responsiveness

## Common Risks

- hidden dependency chains across many synchronous calls
- weak timeout or retry policies
- using synchronous calls where an event or batch pattern would be safer

## Related Templates

- `solution`
- `application`
- `application-service`
- `interface`
- `requirement`

## Related Decisions

- synchronous versus asynchronous integration choice
- timeout and retry policy
- fallback and degradation strategy
