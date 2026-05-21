# Blue-Green And Canary Deployment

## Purpose

Reduce deployment risk by introducing new versions gradually or through
switchable parallel runtime states instead of replacing the old version in one
step.

## When To Use

- production rollout risk is significant
- rollback speed matters
- traffic can be shifted or partitioned safely

## When Not To Use

- the platform cannot support parallel or incremental deployment states
- the solution is too small for the operational complexity to be worthwhile
- data changes make coexistence infeasible without additional migration design

## Assumptions

- runtime environments and routing controls support phased exposure
- monitoring can detect rollout issues quickly
- rollback and recovery paths are defined

## Key Components

- current and new deployment states
- traffic-routing or exposure control
- monitoring and health checks
- rollback or promotion decision point

## Benefits

- lowers release blast radius
- improves rollback options
- supports evidence-based promotion under real traffic

## Tradeoffs

- increases operational and environment complexity
- may require duplicate infrastructure temporarily
- needs careful treatment of data and session state

## Common Risks

- weak observability during phased rollout
- hidden incompatibilities with shared state
- incomplete rollback planning

## Related Templates

- `environment`
- `technology-component`
- `transition-architecture`
- `work-package`
- `risk`
