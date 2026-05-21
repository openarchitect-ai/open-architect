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
- `.architect/patterns/technology/secrets-and-configuration-management.md`
- `.architect/patterns/technology/environment-promotion.md`
- `.architect/patterns/technology/blue-green-canary-deployment.md`
- `.architect/patterns/technology/observability-by-design.md`
- `.architect/patterns/security/layered-security-controls.md`
- `.architect/patterns/security/identity-federation.md`
- `.architect/patterns/security/service-to-service-identity.md`

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
- use `environment-promotion` when disciplined movement across dev, test, and production boundaries matters
- use `blue-green-canary-deployment` when risk-managed deployment and rollback patterns are important
- use `observability-by-design` when supportability, diagnostics, and runtime governance should be first-class architecture concerns
- use `layered-security-controls`, `identity-federation`, and `service-to-service-identity` for cross-cutting security and trust concerns

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

## Quality Checks

- Do not treat every infrastructure detail as an architecture artifact.
- Do not leave environment promotion or deployment risk implicit when it affects delivery or operations.
- Prefer a known operational pattern over ad hoc environment notes.

## Typical Collaboration

- works closely with `technology-architect` and `security-architect`
- supports `option-evaluator`, `transition-planner`, and `architecture-review`
