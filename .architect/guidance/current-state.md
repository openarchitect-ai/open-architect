# Current State

This file captures the current state of the Open Architect workspace so work can
resume quickly in a later session.

## Level

`current-state.md` is `Advanced` maintainer content.

It is useful for:

- repo maintainers
- long-running workspace evolution
- understanding how the capability was built over time

It is not the best starting point for normal architect-assist use. For normal
project work, prefer:

- [`.architect/README.md`](../README.md)
- [`.architect/config/README.md`](../config/README.md)
- [starter-project.md](../config/starter-project.md)
- [prompt-recipes.md](../config/prompt-recipes.md)

## Purpose

Open Architect is shaped as an open source, AI-native architecture workspace
for enterprise architects and solution architects.

The `.architect/` folder is the **capability library** — templates,
playbooks, patterns, skills, roles, method, compliance, guidance, CLI,
schemas, validation, and the multi-agent execution scaffold.

A sibling `workspace/` folder holds the architect's **real project work**
(one folder per project). `workspace/` is gitignored; the CLI creates and
populates it on demand.

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
- Added the first executable multi-agent runtime scaffold:
  - `.architect/agents/`
  - `.architect/runtime/`
  - execution model, agent profiles, task and handoff payloads, and runtime queue/gate state
  - makes the distinction between roles, skills, and actual multi-agent execution explicit
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
- Added persona-driven scanning skills:
  - `gap-radar` with substantive checklist guidance under `guidance/gap-radar-checklists.md`
  - `project-recap` with read-order and drift-detection protocol under `guidance/project-recap-protocol.md`
  - both registered as on-demand skills, both strictly read-only on architecture artifacts
- Pivoted flows and config presets into a single engagement-playbook concept:
  - replaced `flows/` and `config/presets/` with `playbooks/`
  - seeded `inventory-only`, `quick-solution-design`, `migration-wave`, `full-togaf-adm`
  - each playbook bundles brief + ready-to-clone `project-config.yaml`
  - removed the `flows:` block from `project-config.yaml`; added `project.playbook` field
  - updated READMEs, config guidance, and skill references to point to playbooks
- Added `.architect/README.md` as the internal workspace guide
- Added root `README.md` as the open source project README
- Added `LICENSE` using Apache-2.0
- Normalized public project name to:
  - `Open Architect`
- Separated capability library from workspace work:
  - moved `.architect/architecture/` content to a top-level `workspace/` sibling
  - `.architect/` is now purely the capability library (templates, playbooks, patterns, skills, guidance, method, compliance, etc.)
  - `workspace/<project-name>/` is where each project's real work lives (project-config.yaml, notes.md, architect-work/, docs/, business/, application/, data/, technology/, governance/, change/, views/)
  - updated READMEs, config guidance, skill instructions, agent artifacts, and `.gitignore` to reflect the new layout
- Expanded the playbook catalog to 24 engagement shapes across 8 families:
  - discovery & decision: `inventory-only`, `portfolio-rationalization`, `vendor-evaluation-and-selection`, `capability-based-planning`
  - solution / design: `quick-solution-design`
  - modernization & transition: `migration-wave`, `tech-debt-remediation`, `cloud-migration`, `domain-driven-redesign`, `decommissioning-program`
  - platform bootstrap: `ai-platform-bootstrap`, `platform-engineering-bootstrap`, `enterprise-integration-bootstrap`, `data-platform-modernization`
  - enterprise cycle: `full-togaf-adm`
  - driver-specific: `compliance-driven-modernization`, `security-uplift`, `post-incident-architecture-review`, `business-continuity-readiness`
  - M&A lifecycle: `acquisition-due-diligence`, `post-acquisition-integration`, `divestiture-separation`
  - practice setup & operation: `architecture-team-bootstrap`, `steady-state-governance`
  - each playbook follows the 16-section structure with Stages, Anti-Patterns, Decision Points, Sample Backlog Of Open Questions, Recommended Diagrams, Customization Guide, and a ready-to-clone `project-config.yaml`
- Added first-class AI pattern domain under `patterns/ai/`:
  - retrieval-augmented-generation, prompt-lifecycle-management, continuous-model-evaluation, model-version-promotion-gate, ai-guardrail-stack, agentic-system-bounded-loop, embedding-lifecycle-management, model-vendor-portability
  - referenced by `ai-platform-bootstrap` playbook and gap-radar's AI Platform Checks section
- Added vocabulary bridges under `guidance/vocabulary-bridges/`:
  - concept maps from C4, ArchiMate-Lite, and DDD to Open Architect templates and patterns
  - so teams thinking in those vocabularies can land in the workspace without retraining
- Refined the display contract:
  - architect-friendly response section order in `AGENTS.md` and `config/response-display.md`
  - emoji-prefixed status labels: ✅ CONFIRMED, 🟡 PROVISIONAL, ❓ OPEN, 🚫 BLOCKER, 🔵 ACTION, 📥 REQUEST, 📌 DECISION, 💡 TIP, ⚠️ WARNING
- Shipped the `architect` CLI (Group A):
  - zero-dependency cross-platform shell scripts under `.architect/cli/` (PowerShell + Bash) with repo-root delegators
  - commands: `init`, `new <project> [--playbook <name>]`, `list-playbooks`, `list-projects`, `playbook <name>`, `--help [command]`, `--version`
  - typo suggestion for misspelled playbook names; per-command help; Windows PS 5.x emoji-safe output
- Moved versioning from CLI-internal to capability-level:
  - `.architect/VERSION` is the single source of truth (semver, 0.1.0 baseline)
  - `.architect/CHANGELOG.md` follows the Keep a Changelog convention with explicit MAJOR / MINOR / PATCH rules
  - `architect --version` reports the capability version, not a CLI version
- Split workspace-level defaults from engagement config:
  - renamed `.architect/project-config.yaml` to `.architect/config/workspace-defaults.yaml`
  - slimmed it to workspace-level concerns only: `project:` metadata, default method, `conventions:` block, and minimal `runtime:` defaults
  - removed engagement-specific blocks (compliance scope, roles enabled, templates enabled, skills enabled, governance review checkpoints) — those now live exclusively in each project's `workspace/<project-name>/project-config.yaml`
  - updated skills, validator, agent task artifact, AGENTS.md, and documentation to reference the new path

## Current Structure

Top-level layout:

- `.architect/` — capability library (the tool)
- `workspace/<project-name>/` — sibling folder where each project's real work lives (gitignored)
- `architect.ps1` / `architect.sh` — repo-root CLI delegators

Inside `.architect/`:

- `VERSION` — single source of truth for the capability version (semver)
- `CHANGELOG.md` — Keep-a-Changelog history
- `README.md` — workspace reference
- `project-config.yaml` — workspace-level skeleton (real projects pick a playbook)
- `cli/` — `architect` CLI source (PowerShell + Bash) and starter templates
- `playbooks/` — 24 engagement shapes across 8 families
- `patterns/` — reusable architecture patterns (incl. first-class `patterns/ai/`)
- `templates/` — the metamodel (25 template kinds)
- `skills/` — reusable procedures (incl. `gap-radar`, `project-recap`)
- `roles/` — role descriptions and accountabilities
- `method/` — chosen project method + ADM and transition references
- `guidance/` — conventions, glossary, gap-radar checklists, project-recap protocol, `vocabulary-bridges/`
- `compliance/` — jurisdiction, sector, and control obligations
- `examples/` — worked reference projects (same shape as `workspace/`)
- `agents/` — runtime profiles for multi-agent execution (advanced)
- `runtime/` — live queue / gate state (advanced)
- `schemas/` — formal JSON Schema contracts (advanced)
- `validation/` — validators for templates and artifacts (advanced)
- `config/` — workspace and agent configuration guides

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

Baseline coverage (templates, playbooks, patterns, compliance, scanning
skills, CLI, versioning) is now in place. The remaining work is mostly
about proof, operational use, automation, and contributor readiness.

High priority:

- **Real-project proving under `workspace/`**
  - exercise the playbooks against live engagements, not only the worked
    example
  - capture friction back into playbooks, gap-radar checklists, and
    project-recap protocol
- **More worked examples across engagement shapes**
  - `examples/` still contains only the customer-onboarding modernization
    case; one example per family would dramatically improve adoption
  - regulated, public-sector, AI-platform, and M&A scenarios are the
    most useful next examples
- **Turn the strongest skill instructions into executable agent payloads**
  - bind selected skills to `agents/` profiles with bounded write scopes,
    explicit handoffs, and review gates
  - run the existing agent test scenarios against those payloads
- **Make `validation/` execute gap-radar checklists mechanically**
  - today the checklists are guidance; a runnable equivalent would
    catch the same findings without an architect prompting `gap-radar`
- **Deepen schema-driven enforcement**
  - broaden conditional schema rules (approval evidence, verification,
    compliance review)
  - validate cross-artifact approval/evidence rules across full project
    folders, not only the worked example
- **Open source contributor readiness**
  - add `CONTRIBUTING.md`, issue templates, contribution guide
  - clarify pattern/playbook contribution shape so external contributors
    can extend the catalog without breaking conventions

Medium priority:

- **AI patterns Tier 2** — inference caching, FinOps signals, tenant
  isolation, AI Act Article 50 disclosure, hallucination handling,
  red-team programs, human-in-the-loop review
- **Additional vocabulary bridges** — BIZBOK, Wardley Mapping, AWS
  Well-Architected, Google Cloud Architecture Framework
- **Compliance-to-control traceability in practice** — tighter linkage
  from compliance profiles to artifacts, assessments, review packets,
  and validator behavior
- **Engagement-shape gaps in the playbook catalog** — hybrid/edge,
  OT/IT convergence, sustainability-driven architecture, AI red-team
  programs

Future direction:

- ID uniqueness, broken-reference detection, required-metadata
  validation, enum validation as runnable checks
- Slash-command shims for Claude / Codex so the workspace's skills are
  invokable directly from the CLI surface those tools provide
- Optional CLI extensions only when real use exposes friction (status,
  gap-radar trigger, project-recap trigger, upgrade-config, delete,
  doctor, dry-run on `new`)

## Suggested Resume Point

If work resumes later, the best next task is:

1. **Prove the catalog against a live engagement** — pick one playbook
   (e.g. `quick-solution-design` or `ai-platform-bootstrap`), run a
   real project slice under `workspace/`, and capture friction back
   into the playbook + gap-radar checklists.
2. **Add a second worked example** to `examples/` that exercises a
   different family from the existing customer-onboarding case.
3. **Then** turn the strongest skills into executable agent payloads
   and run the agent test scenarios against them.

## Notes

- Baseline coverage is broad and mature (capability v0.1.0). The
  bottleneck has moved from "what's missing" to "how to prove and
  operationalize what's there."
- The capability version is tracked in `.architect/VERSION` and the
  changelog in `.architect/CHANGELOG.md` records every contract-level
  change going forward.
