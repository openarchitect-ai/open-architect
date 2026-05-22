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
  ai/
  application/
  business/
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

- `ai/retrieval-augmented-generation.md`
- `ai/prompt-lifecycle-management.md`
- `ai/continuous-model-evaluation.md`
- `ai/model-version-promotion-gate.md`
- `ai/ai-guardrail-stack.md`
- `ai/agentic-system-bounded-loop.md`
- `ai/embedding-lifecycle-management.md`
- `ai/model-vendor-portability.md`
- `integration/event-driven-integration.md`
- `integration/request-response-integration.md`
- `integration/batch-integration.md`
- `integration/anti-corruption-layer.md`
- `integration/outbox-pattern.md`
- `application/api-facade.md`
- `application/backend-for-frontend.md`
- `business/application-invest-tolerate-migrate-eliminate.md`
- `business/capability-funding-alignment.md`
- `business/business-capability-roadmapping.md`
- `business/product-operating-model-alignment.md`
- `business/product-vs-platform-boundary.md`
- `business/capability-based-planning.md`
- `business/business-capability-heatmap.md`
- `business/value-stream-to-capability-mapping.md`
- `business/portfolio-rationalization.md`
- `business/operating-model-segmentation.md`
- `governance/architecture-standard-waiver-board.md`
- `governance/architecture-assurance-evidence-trail.md`
- `governance/decision-authority-matrix.md`
- `governance/decision-review-and-sunset.md`
- `governance/policy-to-control-traceability.md`
- `governance/reference-architecture-conformance-review.md`
- `governance/control-objective-to-pattern-mapping.md`
- `governance/decision-evidence-packaging.md`
- `governance/reference-architecture-adoption.md`
- `governance/reference-architecture-variance-management.md`
- `governance/architecture-decision-lifecycle.md`
- `governance/architecture-principle-lifecycle.md`
- `governance/standards-exception-management.md`
- `governance/governance-review-gate.md`
- `governance/waiver-expiry-and-remediation.md`
- `governance/architecture-board-decision-escalation.md`
- `governance/standard-lifecycle-management.md`
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
- `data/data-reconciliation.md`
- `data/data-classification-and-handling.md`
- `data/master-data-synchronization.md`
- `data/data-contract-governance.md`
- `data/event-carried-state-transfer.md`
- `data/event-schema-evolution.md`
- `data/golden-record-resolution.md`
- `data/historical-replay-and-rebuild.md`
- `data/data-lineage-and-provenance.md`
- `data/regulated-data-retention-and-legal-hold.md`
- `data/data-residency-and-sovereignty.md`
- `data/data-domain-ownership.md`
- `data/master-reference-data-synchronization.md`
- `data/regulated-data-access-approval.md`
- `data/data-sharing-agreement-governance.md`
- `data/data-quality-rule-governance.md`
- `security/identity-federation.md`
- `security/identity-proofing-and-joiner-mover-leaver.md`
- `security/workload-identity-federation.md`
- `security/secrets-breach-response.md`
- `security/security-control-inheritance.md`
- `security/privileged-session-monitoring.md`
- `security/layered-security-controls.md`
- `security/service-to-service-identity.md`
- `security/audit-and-tamper-evident-logging.md`
- `security/privileged-access-segregation.md`
- `security/zero-trust-network-segmentation.md`
- `security/break-glass-access.md`
- `security/security-zones-and-trust-boundaries.md`
- `security/cross-boundary-data-sharing-controls.md`
- `technology/secrets-and-configuration-management.md`
- `technology/secrets-rotation.md`
- `technology/environment-promotion.md`
- `technology/blue-green-canary-deployment.md`
- `technology/observability-by-design.md`
- `technology/active-active-vs-active-passive.md`
- `technology/multi-region-failover.md`
- `technology/graceful-degradation.md`
- `technology/platform-tenancy-isolation.md`
- `technology/capacity-and-scaling-guardrails.md`
- `technology/cost-optimized-environment-tiering.md`
- `technology/cost-allocation-and-showback.md`
- `technology/environment-drift-detection.md`
- `technology/multi-tenancy-data-isolation.md`
- `technology/runtime-policy-enforcement.md`
- `technology/platform-observability-operating-model.md`
- `technology/ephemeral-environment-strategy.md`
- `technology/shared-service-slo-operating-model.md`
- `technology/shared-platform-guardrail-model.md`
- `technology/service-mesh-adoption.md`
- `transition/coexistence-data-migration.md`
- `transition/phased-decommissioning.md`
- `transition/rollback-and-recovery.md`
- `transition/pilot-then-scale.md`
- `transition/canary-then-expand.md`
- `transition/rollback-readiness-gate.md`
- `transition/release-train-coordination.md`
- `transition/cutover-command-center.md`
- `transition/legacy-batch-sunset.md`
- `transition/branch-by-abstraction.md`
- `transition/dual-write-containment.md`
- `transition/post-cutover-hypercare.md`
- `transition/transition-hypercare-exit-criteria.md`
- `transition/rollback-decision-thresholds.md`
- `transition/parallel-operations-closure.md`
- `transition/incremental-contract-migration.md`
- `transition/legacy-interface-sunset.md`

Expand this library deliberately based on real project use and proven agent needs.
