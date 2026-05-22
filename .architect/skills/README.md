# Skills

This folder contains the reusable skills that architecture agents can apply when
supporting an architecture project.

Templates are the reference model. Skills are how agents use that model to do
real work in a project.

## Purpose

Use this folder for:

- agent instructions that describe repeatable architecture work
- role-supporting procedures that can be reused across projects
- modeling, review, transition, and governance accelerators
- team-level skill definitions that engagement playbooks can sequence

## How To Think About Skills

- `templates/` define the canonical shapes of architecture objects
- `roles/` define perspective, accountability, and ownership
- `skills/` define reusable capabilities that role-based agents can apply
- `agents/` define the executable runtime profiles that may invoke those skills
- `playbooks/` define the engagement shape — which skills to use, in what order, against which gates
- `runtime/` stores live queue and gate state when multi-agent execution is enabled
- `architecture/` contains the actual project artifacts produced by people or agents

Skills should focus on implementation work such as discovery, framing,
modeling, linking, decision-making, transition planning, and review.

In the default `architect-assist` model, skills are on-demand utilities. They
should help the architect complete the current task, not assume that the
workspace should advance into the next lifecycle step automatically.

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

## Levels

### Core

Most projects can start with a small set:

- `baseline-discovery`
- `architecture-review`
- `requirement-normalizer`
- `solution-modeler`
- `transition-planner`

### Optional

Add these when the project needs more structured modeling or richer delivery support:

- `stakeholder-objective-framer`
- `application-interface-modeler`
- `data-modeler`
- `technology-environment-modeler`
- `decision-recorder`
- `option-evaluator`
- `architecture-documenter`
- `diagram-author`

### Advanced

Use these only when the project explicitly wants coordination-heavy, review-heavy, or upkeep-heavy behavior:

- `architecture-coordinator`
- `requirements-follow-up`
- `relationship-mapper`
- `change-coordinator`
- `risk-compliance-assessor`
- `review-pack-builder`
- `delivery-handover-packager`
- `evidence-curator`
- `artifact-maintainer`
- `communication-packager`

## Recommended Use

For a new project, start with:

1. `baseline-discovery`
2. `architecture-review`
3. `requirement-normalizer`
4. `solution-modeler`
5. `transition-planner`
6. output-oriented skills such as `architecture-documenter` and `diagram-author`

Add `architecture-coordinator` only when the project explicitly wants a
coordinating operating model. Specialist skills should not choose the next major
skill or role on their own unless the user explicitly directs it.

## Execution Note

Skills alone do not create true multi-agent execution.

Without `../agents/` and `../runtime/`, a project should normally be treated as
architect-led single-agent work that can switch among specialist roles and
skills on demand.

Use the execution model in `../agents/execution-model.md` when you want skills
to be run by separate bounded agents with real task and handoff artifacts.

## Next Step

Wave 1 skills now include concrete step-by-step instructions and an execution
scaffold. The next step is to prove those skills through real work. In most
projects, that should begin with source-first discovery and analysis before
any runtime queue state, review gates, or formal handoff artifacts are
introduced.

Before broad team operationalization, use the guidance set for:

- handoff contracts
- traceability rules
- ID and naming rules
- human review packet structure
- agent test scenarios
- role boundaries
