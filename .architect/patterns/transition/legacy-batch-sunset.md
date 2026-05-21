# Legacy Batch Sunset

## Purpose

Retire legacy batch processes in a controlled way once improved integration or
processing approaches are in place, so obsolete jobs do not linger indefinitely
 as operational debt.

## When To Use

- newer event, API, or modernized batch paths are replacing older jobs
- batch dependencies are holding back target-state architecture
- transition success depends on removing legacy processing, not just adding new
  paths beside it

## When Not To Use

- the legacy batch process remains the only reliable option
- no viable replacement path or consumer migration plan exists yet

## Assumptions

- replacement behavior can be validated
- downstream consumers of the batch output can be identified
- shutdown criteria can be agreed and measured

## Key Components

- replacement process and scope
- dependency and consumer inventory
- deprecation, coexistence, and shutdown plan
- monitoring and post-sunset verification

## Benefits

- reduces operational debt and redundant processing
- improves clarity of transition end-state
- supports cleaner modernization outcomes

## Tradeoffs

- requires active dependency discovery and migration management
- coexistence periods can add temporary complexity
- shutdown timing may be contentious for dependent teams

## Common Risks

- hidden consumers discovered too late
- legacy batch retained indefinitely as a fallback habit
- replacement path not mature enough when sunset begins

## Related Templates

- `application-service`
- `interface`
- `transition-architecture`
- `work-package`
- `decision`
