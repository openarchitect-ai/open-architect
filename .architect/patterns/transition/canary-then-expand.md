# Canary Then Expand

## Purpose

Release change to a small, controlled subset first and then expand gradually so
teams can observe behavior, reduce blast radius, and decide whether broader
rollout is safe.

## When To Use

- production rollout risk is material
- a small subset of users, regions, or workloads can represent broader behavior
- architecture and operations need a controlled expansion path

## When Not To Use

- the change cannot be isolated meaningfully to a subset
- rollout coordination overhead would outweigh the risk reduction

## Assumptions

- the canary slice can be defined safely
- observability and rollback controls are strong enough to support decisions
- business and operational owners can agree on expansion criteria

## Key Components

- canary cohort definition
- success and failure criteria
- monitoring and decision checkpoints
- staged expansion and rollback plan

## Benefits

- reduces blast radius during rollout
- improves confidence before full-scale exposure
- supports evidence-based go or no-go decisions

## Tradeoffs

- increases rollout complexity and coordination
- may extend delivery timelines
- requires strong monitoring and disciplined decision checkpoints

## Common Risks

- choosing an unrepresentative canary cohort
- weak success criteria leading to false confidence
- expanding too quickly before signals stabilize

## Related Templates

- `transition-architecture`
- `work-package`
- `risk`
- `decision`
- `roadmap`
