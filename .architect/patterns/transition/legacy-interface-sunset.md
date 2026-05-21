# Legacy Interface Sunset

## Purpose

Retire legacy interfaces in a controlled way once replacement paths exist, so
old contracts do not remain indefinitely in support without clear business
justification.

## When To Use

- new interfaces or integration paths have replaced older ones
- providers need a structured way to phase out deprecated contracts
- transition value depends on actually removing legacy dependencies

## When Not To Use

- no viable replacement path exists yet
- the legacy interface remains the only stable option for key consumers

## Assumptions

- migration progress by consumers can be measured
- deprecation and sunset dates can be communicated clearly
- providers can support coexistence for a limited period

## Key Components

- replacement interface and migration path
- deprecation notice and sunset criteria
- consumer migration tracking
- final shutdown and support withdrawal plan

## Benefits

- prevents indefinite support of obsolete interfaces
- improves clarity for consumer migration
- supports cleaner target-state architecture

## Tradeoffs

- requires active migration management
- can create short-term provider overhead during coexistence
- may trigger escalation with slow-moving consumers

## Common Risks

- no real sunset enforcement
- poor visibility of remaining legacy consumers
- replacement path not mature enough when the sunset is announced

## Related Templates

- `interface`
- `application-service`
- `transition-architecture`
- `work-package`
- `decision`
