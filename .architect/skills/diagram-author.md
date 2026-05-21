# Diagram Author

## Purpose

Produce architecture diagrams from the modeled artifacts so views stay aligned
with the structured architecture rather than becoming disconnected drawings.

## Use When

- context, application, interface, data flow, environment, or transition views are needed
- a review or delivery team needs a visual architecture view
- existing diagrams need to be updated after architecture changes

## Inputs

- solution, application, interface, data, environment, and transition artifacts
- the intended view type and audience
- diagramming conventions and notation expectations from `.architect/guidance/diagram-conventions.md`

## Outputs

- architecture diagrams based on the underlying model
- view-specific visual summaries such as context, interaction, deployment, or transition diagrams
- updated diagrams after requirements or decisions change
- diagram sources stored under `.architect/architecture/views/`

## Typical Collaboration

- works closely with `solution-architect`, `integration-architect`, and `technology-architect`
- complements `architecture-documenter` and `artifact-maintainer`
