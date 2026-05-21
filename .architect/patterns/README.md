# Architecture Patterns

This folder contains reusable architecture patterns for Open Architect.

Use patterns for solution guidance that sits between abstract templates and
project-specific architecture artifacts:

- `templates/` define the shape of architecture objects
- `patterns/` describe reusable design approaches and tradeoffs
- `architecture/` contains live project artifacts
- `examples/` shows worked reference implementations

## Folder Structure

```text
patterns/
  application/
  data/
  governance/
  integration/
  security/
  technology/
  transition/
```

## What A Pattern Should Contain

Each pattern should normally capture:

- purpose
- when to use
- when not to use
- assumptions and prerequisites
- key components and interactions
- benefits
- tradeoffs
- common risks
- related templates
- related decisions
- related diagrams or examples

## How Patterns Help

Patterns make the workspace more useful for both architects and agents:

- architects can start from known approaches instead of inventing from scratch
- agents can propose grounded solution shapes instead of improvising
- reviews can compare a solution against known tradeoffs and constraints
- examples stay project-specific while patterns stay reusable

## Current Set

This folder now includes a broad reusable set:

- `integration/event-driven-integration.md`
- `integration/request-response-integration.md`
- `integration/batch-integration.md`
- `integration/anti-corruption-layer.md`
- `integration/outbox-pattern.md`
- `application/api-facade.md`
- `application/backend-for-frontend.md`
- `governance/architecture-decision-lifecycle.md`
- `governance/standards-exception-management.md`
- `governance/governance-review-gate.md`
- `transition/strangler-modernization.md`
- `transition/feature-toggle-rollout.md`
- `transition/parallel-run.md`
- `transition/cutover-rehearsal.md`
- `data/canonical-data-ownership.md`
- `data/master-data-stewardship.md`
- `data/cqrs-read-model.md`
- `data/reference-data-management.md`
- `data/data-replication-and-cache-invalidation.md`
- `data/archival-and-retention.md`
- `security/identity-federation.md`
- `security/layered-security-controls.md`
- `security/service-to-service-identity.md`
- `security/audit-and-tamper-evident-logging.md`
- `technology/secrets-and-configuration-management.md`
- `technology/secrets-rotation.md`
- `technology/environment-promotion.md`
- `technology/blue-green-canary-deployment.md`
- `technology/observability-by-design.md`
- `technology/active-active-vs-active-passive.md`
- `technology/multi-region-failover.md`
- `transition/coexistence-data-migration.md`
- `transition/phased-decommissioning.md`

Expand this library deliberately based on real project use and proven agent needs.
