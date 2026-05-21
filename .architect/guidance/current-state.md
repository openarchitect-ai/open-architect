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
- Added a compliance-aware reference layer:
  - `.architect/compliance/README.md`
  - starter regulation profiles for GDPR, EU AI Act, NIS2, DORA, HIPAA Security Rule, FTC Safeguards Rule, SEC cyber disclosure rules, PCI DSS, and CCPA/CPRA
  - adds jurisdiction, sector, and control-obligation context for architecture work in regulated settings
- Expanded the compliance layer further:
  - added Cyber Resilience Act, EU Data Act, eIDAS / European Digital Identity Framework, MiCA, COPPA, and FERPA
  - broadens coverage for product cybersecurity, data-sharing obligations, digital identity trust, crypto regulation, children's privacy, and education-record controls
- Added and then substantially expanded the reusable architecture pattern library:
  - `.architect/patterns/README.md`
  - now covers a broad cross-section of business, application, integration, data, governance, security, technology, and transition concerns
  - includes patterns for business framing and funding, decision and assurance governance, data ownership and contract control, identity and security controls, platform and runtime operating models, and staged transition and cutover management
  - provides reusable architecture guidance distinct from templates and project artifacts, and is now a first-class working context for many skills
- Wired reusable patterns into core delivery skills:
  - `solution-modeler`
  - `application-interface-modeler`
  - `decision-recorder`
  - makes patterns part of normal agent read-first and modeling behavior
- Wired reusable patterns into additional delivery skills:
  - `data-modeler`
  - `technology-environment-modeler`
  - `transition-planner`
  - `architecture-review`
  - makes pattern selection and review part of normal data, technology, transition, and governance work
- Extended pattern-aware skill guidance further:
  - `decision-recorder` now includes governance-pattern usage
  - `technology-environment-modeler` now includes observability and service-identity usage
  - `transition-planner` now includes feature-toggle and parallel-run usage
  - `architecture-review` now reads governance patterns directly during review
- Extended pattern-aware skill guidance again:
  - `data-modeler` now includes reference-data management usage
  - `technology-environment-modeler` now includes resilience posture and audit logging usage
  - `transition-planner` now includes phased-decommissioning usage
  - `architecture-review` now reads the new audit, reference-data, resilience, and decommissioning patterns directly
- Extended pattern-aware skill guidance once more:
  - `data-modeler` now includes replication/cache and archival/retention usage
  - `technology-environment-modeler` now includes secrets-rotation and multi-region failover usage
  - `transition-planner` now includes cutover-rehearsal usage
  - `architecture-review` now reads the new review-gate, data-lifecycle, credential, and failover patterns directly
- Extended pattern-aware skill guidance further again:
  - `stakeholder-objective-framer` now includes capability-based planning usage
  - `decision-recorder` now includes architecture-principle-lifecycle usage
  - `data-modeler` now includes data-reconciliation usage
  - `technology-environment-modeler` now includes graceful-degradation usage
  - `transition-planner` now includes rollback-and-recovery usage
  - `architecture-review` now reads the new business, governance, privileged-access, reconciliation, degradation, and recovery patterns directly
- Extended pattern-aware skill guidance yet again:
  - `stakeholder-objective-framer` now includes value-stream-to-capability mapping usage
  - `data-modeler` now includes data-classification-and-handling usage
  - `technology-environment-modeler` now includes zero-trust segmentation and platform-tenancy usage
  - `transition-planner` now includes pilot-then-scale usage
  - `risk-compliance-assessor` now includes waiver, governance-gate, control, and data-handling pattern usage
  - `architecture-review` now reads the new value-stream, waiver, trust-boundary, tenancy, and staged-adoption patterns directly
- Extended pattern-aware skill guidance once again:
  - `risk-compliance-assessor` now includes reference-architecture and break-glass usage
  - `data-modeler` now includes master-data-synchronization usage
  - `technology-environment-modeler` now includes capacity-and-scaling-guardrails usage
  - `transition-planner` now includes branch-by-abstraction and post-cutover-hypercare usage
  - `architecture-review` now reads the new reference-alignment, emergency-access, synchronization, scaling, seam-based migration, and hypercare patterns directly
- Refreshed the most pattern-heavy skills to match the expanded pattern library:
  - updated `stakeholder-objective-framer`, `data-modeler`, `decision-recorder`, `risk-compliance-assessor`, `technology-environment-modeler`, `transition-planner`, and `architecture-review`
  - widened their read-first context, pattern guidance, and output checks so newer business, governance, data, technology, security, and transition patterns are part of normal use
- Extended the remaining key skill and workspace docs to reflect the larger pattern model:
  - updated `solution-modeler`, `application-interface-modeler`, and `risk-compliance-assessor` again where older pattern subsets still lingered
  - updated `skills/README.md` and `roles/README.md` so patterns are treated as normal working context across delivery and role behavior, not just a side reference set
- Wired the compliance layer into configuration and core skills:
  - updated `project-config.yaml` with jurisdictions, sectors, applicable regulations, control frameworks, data residency, AI-regulated use, and incident-reporting flags
  - updated `project-bootstrapper`, `risk-compliance-assessor`, `data-modeler`, and `technology-environment-modeler` so regulation scope is part of normal architecture work
  - updated readmes and glossary so regulation concepts are part of the workspace vocabulary and structure
- Turned the regulation subfolders into working guidance layers:
  - added jurisdiction profiles for `eu-eea`, `united-states`, and `california`
  - added sector profiles for `financial-services`, `healthcare`, and `education`
  - added control guides for privacy, identity and access, incident response, and audit/evidence translation
- Expanded the regulation guidance model further:
  - added a `united-kingdom` jurisdiction profile and a `payments` sector profile
  - added control guides for third-party risk, data residency and cross-border transfer, AI governance and model risk, business continuity and resilience, and payment security
- Expanded the regulation sectors and controls again:
  - added sector profiles for `public-sector`, `critical-infrastructure`, and `software-products`
  - added control guides for records retention and legal hold, access recertification and segregation of duties, data sharing and disclosure governance, and accessibility/inclusive service design
- Expanded the regulation model once more:
  - added a `canada` jurisdiction profile and sector profiles for `consumer-digital` and `life-sciences-and-pharma`
  - added control guides for model validation and AI assurance, change control and release assurance, and vendor exit and portability
- Expanded the root regulation profile set further:
  - added `uk-gdpr`, `european-accessibility-act`, `glba`, `fedramp`, `cmmc`, `cjis-security-policy`, and `lgpd`
  - updated the sample regulation configuration to surface the broader profile set and added `accessibility` as a control framework example
- Seeded the first live pilot under `.architect/architecture/`:
  - added `pilot-digital-referral-intake` as a compact regulated greenfield scenario
  - included a scenario brief, starter artifacts across business, application, governance, and data, and an explicit proving sequence for Wave 1 agent execution
- Added a dedicated coordination skill for end-to-end pilot and project orchestration:
  - `architecture-coordinator`
  - positions `chief-architect` as the coordinating role for skill sequencing, handoffs, validation timing, and human review gates
- Made the single-coordinator operating model explicit:
  - added `coordinator_role`, `coordinator_skill`, and `coordinator_auto_route` to `project-config.yaml`
  - updated agent config, role boundaries, handoff contracts, and skill guidance so one coordinating role can route the next skill or role by default unless the user overrides it
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
- `.architect/patterns/`
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
- Expand the reusable pattern library only where real usage shows clear gaps
  - add more patterns when live project use or executable agents expose missing guidance
  - link patterns more explicitly to templates, decisions, skills, and example diagrams

## Remaining Gaps

The largest remaining gaps are no longer in baseline coverage. They are in
operational use, proof, and automation.

- Executable agent behavior
  - most skills are still high-quality playbooks rather than truly executable
    agent instructions
  - the workspace still needs a stronger operational contract for agent inputs,
    stop conditions, and validation behavior
- Real-project proving
  - the structure is broad and mature, but it still needs proving against live
    work under `.architect/architecture/`, not only examples and scaffolding
  - handoff, review, validation, and compliance guidance should be exercised in
    real project use
- Repeatable agent testing
  - agent test scenarios exist, but the project still needs a repeatable way to
    run and evaluate agents against them
  - this includes checking traceability, stop conditions, evidence handling,
    and review-gate behavior
- Deeper validation and enforcement
  - validators and schemas exist, but more cross-artifact, governance-aware,
    and compliance-aware checks should become automatic
  - the strongest gaps are around approval controls, evidence sufficiency, and
    review-state enforcement
- Example depth
  - the worked example is useful, but the project would benefit from more
    varied examples across enterprise, regulated, public-sector, and
    product-oriented scenarios
- Flow and diagram maturity
  - the flow layer is useful, but still lighter than the patterns, skills,
    compliance, and validation layers
  - more executable flow behavior and more worked diagram examples would
    improve operational readiness
- Open source contributor readiness
  - the repo still needs stronger contribution standards, contributor guidance,
    and project-governance details for broader community use
- Compliance-to-control traceability in practice
  - the compliance library is now broad, but the next step is tighter linkage
    from compliance profiles to artifacts, assessments, review packets, and
    validation behavior

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
