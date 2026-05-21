# Shared Service SLO Operating Model

## Purpose

Define how shared services set, own, monitor, and review service-level
objectives so consumer expectations and provider responsibilities stay aligned.

## When To Use

- multiple teams depend on shared services with operational expectations
- reliability targets must be managed explicitly across provider-consumer
  boundaries
- architecture needs more than raw monitoring and must define service
  accountability

## When Not To Use

- the service is too local or informal for SLO management to add value
- the organization is not ready to support operational review against SLOs

## Assumptions

- important service outcomes can be measured
- provider and consumer roles can agree on expectations
- SLOs will influence design, support, or escalation behavior

## Key Components

- service objectives and indicators
- ownership and review cadence
- breach response and escalation model
- consumer communication and expectation management

## Benefits

- improves clarity of reliability expectations
- supports more disciplined shared-service operations
- helps teams make tradeoffs between speed, cost, and resilience

## Tradeoffs

- requires operational maturity and measurement discipline
- can create friction if objectives are unrealistic or poorly negotiated
- review overhead increases as service portfolios grow

## Common Risks

- SLOs defined but not operationalized
- consumer expectations drifting from documented objectives
- breach reviews focused on blame rather than improvement

## Related Templates

- `application-service`
- `technology-component`
- `environment`
- `risk`
- `technology-standard`
