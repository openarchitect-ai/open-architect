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
4. Capture logical components, integration patterns, and data patterns.
5. Link the solution to its driving capability, process, requirements, and transition path.
6. Record quality attributes that matter to the business outcome.
7. Point to the views that best explain the solution to others.

## Outputs

- `solution` artifacts
- supporting links to applications, interfaces, data objects, environments, and decisions
- a coherent model of scope and design intent

## Output Checklist

- the solution boundary is explicit
- in-scope and out-of-scope concerns are visible
- participating artifacts are linked
- quality attributes and governance expectations are captured
- the solution can be explained through at least one useful view

## Typical Collaboration

- works closely with `solution-architect`, `integration-architect`, `data-architect`, and `technology-architect`
- hands off to `decision-recorder`, `transition-planner`, and `architecture-review`

## Quality Checks

- Do not use the solution artifact as a dumping ground for unrelated design notes.
- Prefer explicit relationships over long cross-references in prose.
- Keep the model architecture-level unless detailed design is explicitly in scope.
