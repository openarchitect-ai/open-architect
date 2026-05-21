# Technology Environment Modeler

## Purpose

Describe the technology building blocks, standards, and runtime environments
that shape the solution and its operational boundaries.

## Use When

- platform choices or environments must be modeled explicitly
- standards and runtime assumptions affect design or governance
- the team needs clarity on where and how the solution will run

## Read First

- `.architect/templates/technology/technology-component.yaml`
- `.architect/templates/technology/technology-standard.yaml`
- `.architect/templates/technology/environment.yaml`
- `.architect/compliance/README.md`
- `.architect/compliance/nis2.md`
- `.architect/compliance/dora.md`
- `.architect/compliance/hipaa-security-rule.md`
- `.architect/compliance/ftc-safeguards-rule.md`
- `.architect/compliance/sec-cyber-disclosure-rules.md`
- `.architect/compliance/pci-dss.md`
- `.architect/patterns/technology/README.md`
- `.architect/patterns/technology/secrets-and-configuration-management.md`
- `.architect/patterns/technology/secrets-rotation.md`
- `.architect/patterns/technology/environment-promotion.md`
- `.architect/patterns/technology/blue-green-canary-deployment.md`
- `.architect/patterns/technology/observability-by-design.md`
- `.architect/patterns/technology/active-active-vs-active-passive.md`
- `.architect/patterns/technology/multi-region-failover.md`
- `.architect/patterns/technology/graceful-degradation.md`
- `.architect/patterns/technology/platform-tenancy-isolation.md`
- `.architect/patterns/technology/capacity-and-scaling-guardrails.md`
- `.architect/patterns/technology/cost-allocation-and-showback.md`
- `.architect/patterns/technology/environment-drift-detection.md`
- `.architect/patterns/technology/ephemeral-environment-strategy.md`
- `.architect/patterns/technology/runtime-policy-enforcement.md`
- `.architect/patterns/technology/shared-service-slo-operating-model.md`
- `.architect/patterns/technology/shared-platform-guardrail-model.md`
- `.architect/patterns/technology/multi-tenancy-data-isolation.md`
- `.architect/patterns/technology/service-mesh-adoption.md`
- `.architect/patterns/security/layered-security-controls.md`
- `.architect/patterns/security/identity-federation.md`
- `.architect/patterns/security/service-to-service-identity.md`
- `.architect/patterns/security/audit-and-tamper-evident-logging.md`
- `.architect/patterns/security/zero-trust-network-segmentation.md`

## Inputs

- solution scope
- platform constraints
- standards and hosting expectations
- environment boundaries such as dev, test, prod, or region

## Steps

1. Confirm the runtime boundaries and operational environments that matter to the solution.
2. Identify the core platform, middleware, hosting, and control components that shape the design.
3. Choose the most relevant technology and operational patterns before inventing local conventions.
4. Model environment differences, promotion expectations, security controls, and operational assumptions explicitly.
5. Link technology choices to standards, requirements, risks, and transition constraints.

## Pattern Guidance

- use `secrets-and-configuration-management` when runtime secrets and environment-specific configuration must be controlled deliberately
- use `secrets-rotation` when credential lifecycle and compromise response matter materially
- use `environment-promotion` when disciplined movement across dev, test, and production boundaries matters
- use `blue-green-canary-deployment` when risk-managed deployment and rollback patterns are important
- use `active-active-vs-active-passive` when resilience posture and failover design materially affect the architecture
- use `multi-region-failover` when regional outage resilience is an explicit requirement
- use `graceful-degradation` when partial service continuity is better than full failure and should be designed intentionally
- use `platform-tenancy-isolation` when shared-platform separation, blast radius, or cost-versus-isolation tradeoffs matter materially
- use `multi-tenancy-data-isolation` when tenant-level data separation is a first-class architecture concern
- use `capacity-and-scaling-guardrails` when expected demand, bottlenecks, or protection thresholds should shape the architecture explicitly
- use `cost-allocation-and-showback` when platform economics should be visible to consumers and funding decisions
- use `environment-drift-detection` when unintended divergence across environments creates operational or compliance risk
- use `ephemeral-environment-strategy` when short-lived environments should replace or reduce long-lived shared environments
- use `runtime-policy-enforcement` when important standards or controls should be enforced continuously at runtime
- use `shared-service-slo-operating-model` when shared-service reliability expectations and ownership should be explicit
- use `shared-platform-guardrail-model` when the platform should set enforceable minimums while preserving team autonomy
- use `service-mesh-adoption` when service-to-service policy, telemetry, and traffic control may justify a platform layer
- use `observability-by-design` when supportability, diagnostics, and runtime governance should be first-class architecture concerns
- use `layered-security-controls`, `identity-federation`, `service-to-service-identity`, `audit-and-tamper-evident-logging`, and `zero-trust-network-segmentation` for cross-cutting security and trust concerns

## Regulation Guidance

- use the regulation profiles when resilience, incident reporting, supplier risk, runtime policy, logging, or environment control obligations materially affect the target design
- make jurisdiction- or sector-specific operational obligations explicit instead of burying them in generic environment notes

## Outputs

- `technology-component` artifacts
- `technology-standard` artifacts
- `environment` artifacts
- explicit environment and operational pattern choices
- links to solution, application, and compliance concerns

## Output Checklist

- runtime environments are explicit
- important platform components and standards are visible
- chosen technology patterns match the operational and risk context
- security, promotion, and deployment assumptions are not hidden in prose
- observability and machine-identity assumptions are explicit where relevant
- resilience posture and audit expectations are explicit where relevant
- secret lifecycle and regional failover expectations are explicit where relevant
- degraded-mode behavior is explicit where continuity depends on it
- tenancy-isolation and trust-boundary expectations are explicit where relevant
- scaling assumptions and protection guardrails are explicit where relevant
- environment drift, ephemeral-environment, or runtime-policy expectations are explicit where governance depends on them
- shared-service SLO, showback, service-mesh, or shared-platform guardrail expectations are explicit where platform operating model depends on them

## Quality Checks

- Do not treat every infrastructure detail as an architecture artifact.
- Do not leave environment promotion or deployment risk implicit when it affects delivery or operations.
- Prefer a known operational pattern over ad hoc environment notes.

## Typical Collaboration

- works closely with `technology-architect` and `security-architect`
- supports `option-evaluator`, `transition-planner`, and `architecture-review`
