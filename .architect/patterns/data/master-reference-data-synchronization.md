# Master Reference Data Synchronization

## Purpose

Synchronize master or reference data deliberately across dependent systems so
shared classifications, codes, and core entities remain aligned as change
propagates through the estate.

## When To Use

- many systems depend on shared master or reference data
- stale or inconsistent reference values create operational or reporting issues
- architecture needs a repeatable model for distributing authoritative changes

## When Not To Use

- the data is effectively local and not reused across systems
- synchronization complexity would outweigh the business value of alignment

## Assumptions

- authoritative ownership is defined
- consumers can be identified and synchronized through controlled mechanisms
- propagation timing and consistency expectations are understood

## Key Components

- authoritative source and ownership
- synchronization mechanism and cadence
- change detection and version handling
- reconciliation and exception management

## Benefits

- reduces inconsistencies in shared master or reference data
- improves trust in downstream processing and reporting
- supports better governance of enterprise-wide data values

## Tradeoffs

- adds synchronization and monitoring complexity
- can create dependency on the quality of the source system
- consumers may need change-tolerant handling for update timing

## Common Risks

- hidden consumers missed during synchronization design
- slow propagation causing temporary but harmful inconsistency
- unclear conflict handling when consumers mutate copied data locally

## Related Templates

- `data-object`
- `application-service`
- `interface`
- `decision`
- `risk`
