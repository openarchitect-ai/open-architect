# Skill Roadmap

This roadmap defines the first architecture delivery skills for Open Architect.

## Goal

Build a team of role-based agents that can use reusable skills to deliver new
architecture projects in a structured, reviewable, and traceable way.

## Design Principles

- Skills should support project delivery, not only workspace maintenance.
- Skills should use templates as reference, not replace them.
- Skills should produce real artifacts in `workspace/<project-name>/`.
- Skills should reinforce typed relationships, governance, and transition thinking.
- Skills should use the pattern library as normal decision and modeling context rather than treating patterns as optional extras.
- Skills should be small enough to compose into later agentic flows.

## Wave 1

These are the minimum viable skills for new project delivery:

- `architecture-coordinator`
- `project-bootstrapper`
- `stakeholder-objective-framer`
- `baseline-discovery`
- `requirement-normalizer`
- `requirements-follow-up`
- `solution-modeler`
- `relationship-mapper`
- `decision-recorder`
- `architecture-review`

## Wave 2

These deepen the project model and delivery traceability:

- `application-interface-modeler`
- `data-modeler`
- `technology-environment-modeler`
- `option-evaluator`
- `change-coordinator`
- `transition-planner`

## Wave 3

These strengthen governance and communication:

- `risk-compliance-assessor`
- `review-pack-builder`
- `architecture-documenter`
- `diagram-author`
- `communication-packager`

## Wave 4

These support delivery execution, evidence, and ongoing upkeep:

- `delivery-handover-packager`
- `evidence-curator`
- `artifact-maintainer`

## Suggested Implementation Order

1. `project-bootstrapper`
2. `stakeholder-objective-framer`
3. `requirement-normalizer`
4. `requirements-follow-up`
5. `solution-modeler`
6. `relationship-mapper`
7. `architecture-review`
8. `transition-planner`
9. `architecture-documenter`
10. `diagram-author`
11. remaining specialist and upkeep skills

Use `architecture-coordinator` as the orchestration skill from the start so the
project has one coordinating agent or lead role managing sequence, validation,
handoff quality, and review gates across the other skills.

## Operationalization Guidance

- turn executable skill instructions into pattern-aware playbooks, not template-only checklists
- make pattern selection, pattern rejection, and justified deviation part of the normal skill output where relevant
- use validation, human review packets, and handoff contracts as part of the executable skill boundary
- prove the strongest skills against worked examples and real project slices before broad team rollout

## Outcome

When this roadmap is implemented, the workspace should support:

- initializing a new architecture project
- framing drivers, stakeholders, and outcomes
- capturing baseline and requirements
- coordinating requirement clarification, approval, and verification follow-up
- modeling solutions and supporting artifacts
- linking decisions and traceability
- planning transition and governance activity
- coordinating architecture changes from impact through delivery follow-up
- producing project-ready documents, diagrams, and review packs
- packaging delivery handover and supporting evidence
- keeping documentation and diagrams aligned as the architecture changes
- packaging the resulting architecture for review and communication
