# Anti-Corruption Layer

## Purpose

Protect a target solution or bounded domain from awkward, unstable, or legacy
upstream models by translating external concepts into a cleaner internal model.

## When To Use

- a legacy or external system has a poor or incompatible domain model
- direct reuse of the external model would pollute the target solution
- the target domain needs a cleaner long-term contract than the source provides

## When Not To Use

- the source contract is already well-governed and close to the target domain
- the translation layer would add complexity without protecting anything useful
- the target is intentionally just a passthrough integration

## Assumptions

- the target domain boundary is meaningful and worth protecting
- translation logic and ownership can be maintained over time
- the source contract is not fully under the target team’s control

## Key Components

- external source contract
- translation or mapping layer
- target internal model
- validation and error-handling rules for mismatch scenarios

## Benefits

- protects internal domain clarity
- reduces long-term coupling to legacy semantics
- supports cleaner modernization pathways

## Tradeoffs

- adds translation logic to own and test
- can increase latency or processing complexity
- requires disciplined boundary definition

## Common Risks

- translation logic growing opaque or inconsistent
- partial leakage of source semantics into the target model
- underestimating source contract volatility

## Related Templates

- `solution`
- `application`
- `application-service`
- `interface`
- `data-object`
- `decision`

## Related Decisions

- source-to-target mapping ownership
- internal canonical model scope
- migration and coexistence strategy
