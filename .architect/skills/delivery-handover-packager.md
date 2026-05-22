# Delivery Handover Packager

## Purpose

Produce implementation-oriented handover outputs so delivery teams can act on
the architecture with clear scope, constraints, assumptions, and sequencing.

## Use When

- build teams need architecture handover material
- a work package is moving from architecture into delivery execution
- cutover, interface, or environment expectations need to be packaged for implementation teams

## Inputs

- solution, interface, environment, transition, and work-package artifacts
- key decisions, constraints, and open issues
- delivery method and team expectations

## Outputs

- a delivery handover **publication package** under `workspace/<project>/publications/<date>-<gate>/` (typically `<date>-transition-plan` or `<date>-delivery-handover`) in the standard shape defined in [`publication-package-shape.md`](../guidance/publication-package-shape.md): `README.md`, `manifest.yaml`, `provenance.yaml`, implementation-oriented scope summaries, interface / cutover / environment notes, and any referenced diagrams under `views/`
- a `working-log.md` entry in the project recording that a handover package was assembled

## Boundaries

This skill **produces** the handover package. **What your organization does with it — upload to the delivery team's wiki, route through Jira / Azure DevOps, transform into a delivery brief in the org's format — is your documentation and delivery-coordination policy, not Open Architect's scope.** See [`publication-package-shape.md`](../guidance/publication-package-shape.md) for the boundary statement in full.

## Typical Collaboration

- works closely with `solution-architect`, `integration-architect`, and `technology-architect`
- complements `transition-planner` and `architecture-documenter`
- run [`gap-radar`](./gap-radar.md) before handover; transitions without rollback approach and gaps without closing work packages are common blockers
