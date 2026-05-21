# Rollback And Recovery

## Purpose

Define how the architecture can recover safely when a transition, deployment, or
cutover does not behave as intended, including when to roll back and when to
recover forward.

## When To Use

- transition or release risk is material
- failure during rollout could create significant business or operational impact
- there is a meaningful choice between reverting and stabilizing forward

## When Not To Use

- the change is trivial and recovery paths are obvious
- the architecture cannot realistically roll back and only forward recovery is
  possible

## Assumptions

- rollback or recovery triggers can be defined
- data and dependency implications are understood
- accountable decision makers are named

## Key Components

- failure triggers and decision checkpoints
- rollback path and constraints
- forward-recovery path and constraints
- evidence, communication, and ownership model

## Benefits

- improves operational readiness for high-risk change
- makes recovery thinking explicit before failure occurs
- supports better governance of transition risk

## Tradeoffs

- adds planning and rehearsal effort
- may expose that some changes are hard to reverse
- requires realistic treatment of data-state consequences

## Common Risks

- rollback assumed possible when data changes make it unsafe
- no clear threshold for deciding rollback versus recovery
- communication and ownership gaps during incident response

## Related Templates

- `transition-architecture`
- `work-package`
- `risk`
- `decision`
- `environment`
