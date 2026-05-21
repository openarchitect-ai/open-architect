# CQRS Read Model

## Purpose

Separate read-optimized views from write ownership so query performance,
consumer simplicity, or reporting needs can be improved without changing the
core transactional model.

## When To Use

- read workloads differ substantially from write ownership concerns
- consumers need denormalized, query-friendly views
- the source model should remain optimized for transactional integrity

## When Not To Use

- the domain is simple enough that one model serves both read and write needs
- eventual consistency between write and read views is unacceptable
- operational overhead would outweigh the read benefit

## Assumptions

- write ownership remains clear
- consumers can tolerate synchronized but not strictly immediate updates
- the read model lifecycle can be monitored and rebuilt if needed

## Key Components

- authoritative write model
- read-model projection or replica
- projection/update mechanism
- consumers optimized for the read view

## Benefits

- improves read performance and consumer simplicity
- avoids polluting the write model for query-specific needs
- supports multiple tailored read views when necessary

## Tradeoffs

- increases consistency and operational complexity
- requires projection monitoring and rebuild strategy
- can blur ownership if the read model is mistaken for the source of truth

## Common Risks

- unclear freshness expectations
- weak recovery strategy for broken projections
- accidental write behavior creeping into the read model

## Related Templates

- `data-object`
- `application`
- `interface`
- `decision`
- `requirement`
