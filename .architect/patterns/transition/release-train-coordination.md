# Release Train Coordination

## Purpose

Coordinate change across multiple teams or dependent releases through a shared
cadence so sequencing, readiness, and integration risk are managed explicitly.

## When To Use

- several teams or systems must align for a meaningful release outcome
- dependencies create delivery risk that cannot be handled fully by isolated
  team planning
- transition planning needs a repeatable coordination rhythm

## When Not To Use

- the change is sufficiently independent for normal team release practices
- a forced common cadence would slow low-coupling delivery unnecessarily

## Assumptions

- meaningful dependencies can be identified
- teams can commit to shared readiness checkpoints
- coordination decisions will influence sequencing and scope

## Key Components

- common release cadence
- dependency map
- readiness and integration checkpoints
- cross-team issue escalation and decision path

## Benefits

- improves visibility of cross-team dependencies
- reduces surprise integration risk late in delivery
- supports more deliberate sequencing of complex change

## Tradeoffs

- adds coordination overhead
- can constrain highly independent teams
- requires disciplined participation and escalation

## Common Risks

- release train becoming bureaucracy without real dependency management
- hidden dependencies surfacing too late
- local teams optimizing for train dates rather than sustainable quality

## Related Templates

- `transition-architecture`
- `work-package`
- `initiative`
- `roadmap`
- `risk`
