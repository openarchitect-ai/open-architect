# Graceful Degradation

## Purpose

Preserve the most important user or business outcomes when parts of the system
are impaired by reducing or disabling non-critical features in a controlled way.

## When To Use

- the solution depends on external services or fragile dependencies
- partial service is meaningfully better than full outage
- resilience design should distinguish critical and non-critical behavior

## When Not To Use

- the process cannot tolerate partial behavior safely
- degraded operation would create more confusion or risk than a clear failure

## Assumptions

- critical versus non-critical functions can be defined
- users or operators can understand degraded states
- monitoring can detect when degradation is active

## Key Components

- critical-path capability definition
- degraded-mode behavior or feature suppression
- user, operator, or downstream signaling
- recovery conditions for returning to normal behavior

## Benefits

- reduces blast radius of dependency failures
- improves resilience of key business outcomes
- supports more intentional continuity design

## Tradeoffs

- adds design and testing complexity
- can create confusing edge cases if poorly communicated
- requires clear prioritization of what really matters

## Common Risks

- degraded mode undefined until failure happens
- critical and non-critical functions not agreed
- hidden business impact of long-running degraded operation

## Related Templates

- `solution`
- `application-service`
- `interface`
- `requirement`
- `risk`
