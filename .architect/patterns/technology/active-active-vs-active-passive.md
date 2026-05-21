# Active-Active Vs Active-Passive

## Purpose

Choose and govern the right resilience posture for critical runtime components
by deciding whether multiple active instances should share live load or one
instance should remain standby until failover is needed.

## When To Use

- availability and recovery requirements materially affect architecture choices
- the solution spans regions, zones, or critical runtime pairs
- failover behavior must be explicit for governance or operational planning

## When Not To Use

- resilience needs are trivial and do not justify formal topology decisions
- the platform fully abstracts the concern and no meaningful architecture choice
  remains

## Assumptions

- availability and recovery objectives are understood
- data consistency implications of the chosen posture can be handled
- failover ownership and testing can be assigned

## Key Components

- active-active or active-passive deployment posture
- traffic distribution or failover mechanism
- data/state handling approach
- failover testing and operational runbook expectations

## Benefits

- makes resilience tradeoffs explicit
- aligns topology choices to service criticality
- supports clearer risk and recovery planning

## Tradeoffs

- active-active can add significant complexity around state and consistency
- active-passive can reduce cost or complexity but may lengthen failover
- both approaches require ongoing operational validation

## Common Risks

- choosing a resilience posture by default rather than by requirement
- underestimating data-state complexity in active-active designs
- failing to test real failover behavior

## Related Templates

- `technology-component`
- `environment`
- `solution`
- `risk`
- `requirement`
