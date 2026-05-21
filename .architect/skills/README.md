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

The reusable pattern library under `../patterns/` should be treated as normal
working context across modeling, decision, review, risk/compliance,
technology, data, and transition skills, especially when choosing interaction
styles, solution shapes, modernization approaches, data ownership models,
security approaches, runtime controls, or rollout patterns.

## Initial Skill Set

The initial delivery-oriented skill catalog is:

- `architecture-coordinator.md`
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

1. `architecture-coordinator`
2. `project-bootstrapper`
3. `stakeholder-objective-framer`
4. `baseline-discovery`
5. `requirement-normalizer`
6. `requirements-follow-up`
7. `solution-modeler`
8. `relationship-mapper`
9. `decision-recorder`
10. `transition-planner`
11. `architecture-review`
12. output-oriented delivery skills such as `architecture-documenter` and `diagram-author`

If the project uses a coordinating operating model, `architecture-coordinator`
should remain the default routing point across those steps. Specialist skills
should not choose the next major skill or role on their own unless the user
explicitly directs it.

## Next Step

Wave 1 skills now include concrete playbook steps and a linked worked example.
The next step is to turn the most valuable playbooks into executable agent
instructions or orchestrated flows.

Before broad team operationalization, use the guidance set for:

- handoff contracts
- traceability rules
- ID and naming rules
- human review packet structure
- agent test scenarios
- role boundaries
