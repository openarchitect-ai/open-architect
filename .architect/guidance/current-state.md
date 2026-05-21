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
- Split general conventions into focused guidance files:
  - `.architect/guidance/modeling-conventions.md`
  - `.architect/guidance/evidence-and-quality.md`
  - `.architect/guidance/governance-conventions.md`
  - `.architect/guidance/lifecycle-and-dates.md`
  - kept `.architect/guidance/conventions.md` as the short guidance entry point
- Added a shared terminology glossary:
  - `.architect/guidance/glossary.md`
  - defines core workspace terms across artifacts, skills, flows, governance, and evidence
- Added initial template validation support:
  - `.architect/validation/README.md`
  - `.architect/validation/Validate-Templates.ps1`
  - validates template structure, required keys, core enums, and common date fields
- Extended validation beyond the baseline template contract:
  - `.architect/validation/Validate-Templates.ps1`
  - `.architect/validation/Validate-ArchitectureArtifacts.ps1`
  - adds template-specific enum checks, relationship target-kind validation, reusable artifact-folder validation, local reference checks, and error vs warning severity handling
- Added first-pass formal schema support:
  - `.architect/schemas/README.md`
  - `.architect/schemas/common-definitions.schema.json`
  - `.architect/schemas/requirement.schema.json`
  - `.architect/schemas/solution.schema.json`
  - `.architect/schemas/decision.schema.json`
  - defines a shared artifact contract plus initial high-value schemas for live architecture documents
- Expanded schema coverage across the worked-example artifact set:
  - application, application-service, interface, data-object
  - environment, technology-component
  - stakeholder, objective, business-capability, business-process
  - architecture-vision, initiative, transition-architecture, work-package, risk
  - gives schema-aware validation coverage across most core project-delivery artifacts already in use
- Added schema coverage for the remaining core library kinds:
  - organization, principle, technology-standard
  - roadmap, gap, compliance-assessment
  - gives the repo a broad first-pass schema layer across the full core template library
- Deepened schema precision and template-schema integration:
  - kind-specific artifact ID patterns
  - stronger shared reference and uniqueness rules
  - conditional approval/evidence expectations for governed artifact kinds
  - template validation now checks schema coverage and schema JSON validity
- Enforced deeper schema-aligned artifact rules in validation:
  - schema-aware artifact validation now checks kind-specific ID patterns
  - duplicate aliases and tags now fail validation
  - invalid reference URL shapes now fail validation
  - approval or verification signals without evidence now fail validation
  - low-confidence approved artifacts now fail validation
- Moved conditional artifact rules toward schema-driven enforcement:
  - artifact validation now interprets supported `if` / `then` schema rules directly
  - requirement verification, approval evidence, and compliance review checks are no longer only hand-coded one-offs
- Added operationalization guidance for multi-agent rollout:
  - `.architect/guidance/handoff-contracts.md`
  - `.architect/guidance/traceability-rules.md`
  - `.architect/guidance/id-and-naming-rules.md`
  - `.architect/guidance/human-review-packet.md`
  - `.architect/guidance/agent-test-scenarios.md`
  - `.architect/guidance/role-boundaries.md`
  - defines handoffs, traceability, naming, review packets, test scenarios, and role boundaries before full team execution
- Wired schema-aware validation into artifact checking:
  - `.architect/validation/Validate-ArchitectureArtifacts.ps1`
  - applies schema-derived required-section and enum checks for covered artifact kinds without replacing existing repo-aware validation
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
- `.architect/schemas/`
- `.architect/validation/`
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
- Run the new agent test scenarios against those executable instructions
- Extend live-project validation and operational use under `.architect/architecture/`
  - validate real project artifact folders, not only the worked example
  - use the review packet format and role-boundary guidance during real project handoffs
- Deepen validation and schema-driven enforcement
  - keep growing `.architect/validation/`
  - deepen schema precision for covered kinds and broaden direct enforcement of conditional schema rules
  - add fuller schema-level YAML parsing when or if a dependency strategy is chosen
- Extend template and artifact validation depth
  - validate cross-artifact approval/evidence rules beyond the worked example set
  - add richer warning rules for evidence, confidence, and approval quality
- Extend artifact-folder validation coverage
  - validate live project artifacts under `.architect/architecture/`
  - add stronger review-gate checks during active project execution
- Add explicit review/governance cadence guidance
  - define the recurring review rhythm for ongoing architecture projects
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

1. turn the strongest playbooks into executable agent instructions using the new handoff, traceability, and review guidance
2. run the new agent test scenarios against those executable instructions
3. extend live-project validation and deepen schema precision and enforcement further

## Notes

- The repository is still in an early framework stage.
- The structure is strong, but it now needs examples and validation to become
  fully operational.
