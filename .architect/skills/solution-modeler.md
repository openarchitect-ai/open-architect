# Solution Modeler

## Purpose

Build the bounded solution architecture that responds to the project
requirements, constraints, and business outcomes.

## Use When

- a project needs an end-to-end solution definition
- a bounded solution needs to be described across application, data, and technology concerns
- the team needs a coherent design anchor for delivery

## Read First

- `.architect/templates/application/solution.yaml`
- `.architect/templates/application/application.yaml`
- `.architect/templates/application/application-service.yaml`
- `.architect/templates/application/interface.yaml`
- `.architect/patterns/README.md`
- `.architect/patterns/integration/event-driven-integration.md`
- `.architect/patterns/integration/request-response-integration.md`
- `.architect/patterns/integration/anti-corruption-layer.md`
- `.architect/patterns/integration/outbox-pattern.md`
- `.architect/patterns/application/api-facade.md`
- `.architect/patterns/application/backend-for-frontend.md`
- `.architect/patterns/data/canonical-data-ownership.md`
- `.architect/patterns/security/layered-security-controls.md`
- `.architect/patterns/security/identity-federation.md`
- `.architect/patterns/transition/strangler-modernization.md`
- `.architect/examples/customer-onboarding-modernization/application/sol-1001-customer-onboarding-modernization-solution.yaml`

## Inputs

- requirements and constraints
- stakeholder and objective context
- baseline architecture facts
- relevant standards and principles

## Steps

1. Confirm the bounded solution problem and scope.
2. Identify the essential participating applications, services, interfaces, data objects, and environments.
3. Model the solution as a coherent boundary before going deep into component detail.
4. Select the most relevant reusable architecture patterns before inventing a custom shape.
5. Capture logical components, integration patterns, data patterns, and security patterns.
6. Link the solution to its driving capability, process, requirements, and transition path.
7. Record quality attributes that matter to the business outcome.
8. Point to the views that best explain the solution to others.

## Outputs

- `solution` artifacts
- supporting links to applications, interfaces, data objects, environments, and decisions
- explicit pattern choices or justified deviations from known patterns
- a coherent model of scope and design intent

## Output Checklist

- the solution boundary is explicit
- in-scope and out-of-scope concerns are visible
- participating artifacts are linked
- relevant patterns have been applied, rejected, or consciously ruled out
- quality attributes and governance expectations are captured
- the solution can be explained through at least one useful view

## Typical Collaboration

- works closely with `solution-architect`, `integration-architect`, `data-architect`, and `technology-architect`
- hands off to `decision-recorder`, `transition-planner`, and `architecture-review`

## Quality Checks

- Do not use the solution artifact as a dumping ground for unrelated design notes.
- Prefer explicit relationships over long cross-references in prose.
- Keep the model architecture-level unless detailed design is explicitly in scope.
- Prefer a known pattern plus a clear rationale over a custom structure with no precedent.
