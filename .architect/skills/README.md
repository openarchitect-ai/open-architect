# Skills

This folder contains the reusable skills that architecture agents can apply when
delivering a new architecture project.

Templates are the reference model. Skills are how agents use that model to do
real work in a project.

## Purpose

Use this folder for:

- agent instructions that describe repeatable architecture work
- role-supporting playbooks that can be reused across projects
- modeling, review, transition, and governance accelerators
- team-level skill definitions that can later be orchestrated through flows

## How To Think About Skills

- `templates/` define the canonical shapes of architecture objects
- `roles/` define perspective, accountability, and ownership
- `skills/` define reusable capabilities that role-based agents can apply
- `flows/` define orchestration across multiple skills and steps
- `architecture/` contains the actual project artifacts produced by people or agents

Skills should focus on implementation work such as discovery, framing,
modeling, linking, decision-making, transition planning, and review.

## Initial Skill Set

The initial delivery-oriented skill catalog is:

- `project-bootstrapper.md`
- `stakeholder-objective-framer.md`
- `baseline-discovery.md`
- `requirement-normalizer.md`
- `requirements-follow-up.md`
- `solution-modeler.md`
- `application-interface-modeler.md`
- `data-modeler.md`
- `technology-environment-modeler.md`
- `relationship-mapper.md`
- `decision-recorder.md`
- `option-evaluator.md`
- `risk-compliance-assessor.md`
- `change-coordinator.md`
- `transition-planner.md`
- `architecture-review.md`
- `architecture-documenter.md`
- `diagram-author.md`
- `review-pack-builder.md`
- `delivery-handover-packager.md`
- `evidence-curator.md`
- `artifact-maintainer.md`
- `communication-packager.md`

Supporting documents:

- `roadmap.md`
- `role-skill-matrix.md`

## Recommended Use

For a new project, start with:

1. `project-bootstrapper`
2. `stakeholder-objective-framer`
3. `baseline-discovery`
4. `requirement-normalizer`
5. `requirements-follow-up`
6. `solution-modeler`
7. `relationship-mapper`
8. `decision-recorder`
9. `transition-planner`
10. `architecture-review`
11. output-oriented delivery skills such as `architecture-documenter` and `diagram-author`

## Next Step

These files define the skill taxonomy and scope. A later step can turn the most
valuable skills into full agent instructions or orchestrated flows.
