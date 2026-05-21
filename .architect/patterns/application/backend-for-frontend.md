# Backend For Frontend

## Purpose

Provide a channel-specific backend layer that shapes data and interactions for a
particular user experience such as web, mobile, or partner portal consumers.

## When To Use

- different channels need different aggregation, latency, or payload needs
- the client should not coordinate many backend calls directly
- channel teams need controlled evolution without exposing internal service
  complexity

## When Not To Use

- all channels can use the same stable API without material compromise
- the pattern would create needless duplication with no channel-specific value
- the BFF would become the main place for core domain logic

## Assumptions

- channel ownership is clear
- shared domain logic remains in downstream domain services
- observability and contract management are designed for the BFF layer

## Key Components

- channel-specific API layer
- aggregation and composition logic
- authentication and session handling aligned to the channel need
- downstream service integrations

## Benefits

- optimizes the contract for each channel
- reduces client orchestration complexity
- isolates channel changes from backend domain services

## Tradeoffs

- adds another service layer to own and operate
- can duplicate logic across channels if boundaries are weak
- increases total API surface area

## Common Risks

- channel logic creeping into core domain behavior
- inconsistent security or observability between BFFs
- over-fragmentation into too many thin BFFs

## Related Templates

- `solution`
- `application`
- `application-service`
- `interface`
- `requirement`

## Related Decisions

- channel ownership model
- API boundary and versioning strategy
- aggregation versus passthrough responsibility
