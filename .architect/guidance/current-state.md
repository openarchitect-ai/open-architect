# Current State

This file captures the current state of the Open Architect workspace so work can
resume quickly in a later session.

## Purpose

Open Architect is being shaped as an open source, AI-native architecture
workspace for enterprise architects and solution architects.

The `.architect` folder is intended to act as the project-local architecture
capability container, including:

- config
- guidance
- method definition
- reference methods
- flows
- roles
- skills
- templates
- real architecture artifacts

## Completed

- Created the core architecture template library across:
  - business
  - application
  - data
  - technology
  - governance
  - change
- Added AI-friendly structure to templates:
  - `aliases`
  - `summary`
  - `metadata`
  - `relationships`
- Added transition architecture support templates:
  - `transition-architecture`
  - `work-package`
  - `gap`
- Added broader EA and SA coverage templates:
  - `requirement`
  - `solution`
  - `technology-standard`
  - `principle`
  - `environment`
- Added ADM-support templates:
  - `stakeholder`
  - `objective`
  - `architecture-vision`
  - `roadmap`
  - `compliance-assessment`
  - `risk`
- Added template naming and authoring guidance in:
  - `.architect/templates/agents.md`
- Added template-specific enum guidance and inline enum hints in YAML templates
- Reorganized templates into domain subfolders
- Expanded `.architect` into a broader capability structure:
  - `architecture/`
  - `config/`
  - `flows/`
  - `guidance/`
  - `method/`
  - `roles/`
  - `skills/`
  - `templates/`
- Added role starter documents:
  - chief architect
  - business analyst
  - business architect
  - enterprise architect
  - solution architect
  - data architect
  - integration architect
  - domain architect
  - security architect
  - technology architect
  - architecture governance lead
- Added method starter documents and reorganized method structure:
  - project method
  - ADM reference
  - transition architecture reference
- Split project method from future flow execution:
  - `.architect/method/` for selected project method and references
  - `.architect/flows/` for future visual or executable flows
- Added project-level architecture configuration:
  - `.architect/project-config.yaml`
  - selects active roles, templates, flows, and method references for a project
- Added configuration guidance for project and agent setup:
  - `.architect/config/agent.config.md`
  - explains how to tailor `project-config.yaml`
- Added an initial architecture delivery skill taxonomy:
  - `.architect/skills/README.md`
  - `.architect/skills/roadmap.md`
  - `.architect/skills/role-skill-matrix.md`
  - one markdown file per proposed delivery skill
- Added coordination-focused architecture assets:
  - `.architect/skills/requirements-follow-up.md`
  - `.architect/skills/change-coordinator.md`
  - `.architect/flows/requirements-change-coordination.flow.md`
- Added delivery-output architecture skills:
  - `.architect/skills/architecture-documenter.md`
  - `.architect/skills/diagram-author.md`
  - `.architect/skills/review-pack-builder.md`
  - `.architect/skills/delivery-handover-packager.md`
  - `.architect/skills/evidence-curator.md`
  - `.architect/skills/artifact-maintainer.md`
  - narrowed `.architect/skills/communication-packager.md` to stakeholder communication
- Added diagram governance guidance:
  - `.architect/guidance/diagram-conventions.md`
  - `.architect/architecture/views/README.md`
  - defines notation selection, storage conventions, and diagram creation rules
- Added anti-hallucination modeling conventions:
  - `.architect/guidance/conventions.md`
  - defines evidence, confidence, unknown, assumption, open-question, and partial-artifact rules
- Added a shared terminology glossary:
  - `.architect/guidance/glossary.md`
  - defines core workspace terms across artifacts, skills, flows, governance, and evidence
- Added human-in-the-loop governance controls:
  - `.architect/project-config.yaml`
  - `.architect/guidance/conventions.md`
  - `.architect/flows/architecture-development.flow.md`
  - `.architect/flows/requirements-change-coordination.flow.md`
  - defines review gates, approval roles, and default agent stop points
- Added a worked example architecture project:
  - `.architect/examples/customer-onboarding-modernization/README.md`
  - linked business, application, data, technology, governance, and change artifacts
  - three example views under `.architect/examples/customer-onboarding-modernization/views/`
- Turned Wave 1 skills into concrete playbooks:
  - `project-bootstrapper`
  - `stakeholder-objective-framer`
  - `baseline-discovery`
  - `requirement-normalizer`
  - `requirements-follow-up`
  - `solution-modeler`
  - `relationship-mapper`
  - `decision-recorder`
  - `architecture-review`
- Added flow placeholders:
  - architecture development
  - requirements and change coordination
  - transition architecture
- Added `.architect/README.md` as the internal workspace guide
- Added root `README.md` as the open source project README
- Added `LICENSE` using Apache-2.0
- Normalized public project name to:
  - `Open Architect`

## Current Structure

Key folders:

- `.architect/templates/`
- `.architect/architecture/`
- `.architect/architecture/views/`
- `.architect/examples/`
- `.architect/config/`
- `.architect/guidance/`
- `.architect/method/`
- `.architect/flows/`
- `.architect/project-config.yaml`
- `.architect/roles/`
- `.architect/skills/`

Current role library:

- chief architect
- business analyst
- business architect
- enterprise architect
- solution architect
- data architect
- integration architect
- domain architect
- security architect
- technology architect
- architecture governance lead

## Recommended Next Steps

High priority:

- Turn the most valuable playbooks into executable agent instructions
- Validate the worked example against relationship, enum, and required-field checks
- Add validation or schema support
  - e.g. `.architect/schemas/` or `.architect/validation/`
- Extend `guidance/conventions.md` with:
  - ID generation rules
  - traceability expectations
  - review/governance cadence
  - validation expectations for evidence and confidence
- Add validation for human review controls
  - e.g. prevent agent-generated approval states without explicit review evidence
- Add more worked diagram examples under `.architect/examples/`

Open source hygiene:

- Add `CONTRIBUTING.md`
- Add issue templates or roadmap notes
- Optionally add a `NOTICE` file if needed later

Future direction:

- Replace flow placeholder docs with real visual/editor flow definitions
- Add automation for:
  - ID uniqueness checks
  - broken relationship detection
  - required metadata validation
  - enum validation

## Suggested Resume Point

If work resumes later, the best next task is:

1. turn the strongest playbooks into executable agent instructions and real flows
2. validate the worked example and tighten conventions for IDs, traceability, and evidence quality
3. add glossary, stronger conventions, and schema or validation support

## Notes

- The repository is still in an early framework stage.
- The structure is strong, but it now needs examples and validation to become
  fully operational.
