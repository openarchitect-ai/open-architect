# Application Interface Modeler

## Purpose

Describe the application landscape, exposed services, and integration contracts
that participate in a solution.

## Use When

- applications and interfaces need to be modeled explicitly
- integration-heavy solutions need service and contract clarity
- interface ownership and dependencies must be made traceable

## Read First

- `.architect/templates/application/application.yaml`
- `.architect/templates/application/application-service.yaml`
- `.architect/templates/application/interface.yaml`
- `.architect/patterns/integration/event-driven-integration.md`
- `.architect/patterns/integration/request-response-integration.md`
- `.architect/patterns/integration/batch-integration.md`
- `.architect/patterns/integration/anti-corruption-layer.md`
- `.architect/patterns/integration/outbox-pattern.md`
- `.architect/patterns/application/api-facade.md`
- `.architect/patterns/application/backend-for-frontend.md`
- `.architect/examples/customer-onboarding-modernization/application/if-1001-customer-activation-event-api.yaml`

## Inputs

- solution scope
- known applications and services
- integration requirements and message flows

## Steps

1. Confirm which applications are in scope and what responsibilities they hold.
2. Identify the exposed services and concrete interfaces that need to be modeled.
3. Choose the most relevant interaction pattern before defining contracts.
4. Model service ownership, interface purpose, and dependency direction explicitly.
5. Capture key data exchanges, timing expectations, and operational assumptions.
6. Link interfaces to the driving solution, requirements, decisions, and data objects.

## Pattern Guidance

- use `event-driven-integration` when consumers can react asynchronously to business events
- use `request-response-integration` when immediate confirmation is required
- use `batch-integration` when controlled periodic synchronization is the right fit
- use `anti-corruption-layer` when legacy or external semantics should not leak directly into the target domain
- use `outbox-pattern` when reliable event publication is needed from a transactional source
- use `api-facade` or `backend-for-frontend` when consumer-facing contracts should be stabilized or optimized

## Outputs

- `application` artifacts
- `application-service` artifacts
- `interface` artifacts
- explicit pattern-aligned interaction choices
- linked ownership and dependency relationships

## Output Checklist

- application and service ownership are explicit
- interfaces have a clear purpose and contract direction
- chosen interaction patterns match the business and operational need
- related solution, requirement, decision, and data-object links are present

## Quality Checks

- Do not model every technical endpoint if the architecture-level contract is what matters.
- Do not mix batch, synchronous, and event-driven assumptions without making the boundary explicit.
- Prefer a known integration pattern over ad hoc interface prose.

## Typical Collaboration

- works closely with `solution-architect` and `integration-architect`
- supports `relationship-mapper`, `risk-compliance-assessor`, and `transition-planner`
