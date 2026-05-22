# Changelog

All notable changes to the **Open Architect capability** (templates,
playbooks, patterns, skills, guidance, method, compliance, CLI) are
recorded here.

This project follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
and the [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
convention.

The single source of truth for the current version is
[`.architect/VERSION`](./VERSION). The `architect --version` command
reads it at runtime.

## Versioning rules

- **MAJOR (1.0.0, 2.0.0, ...)** — breaking changes to the conventions
  adopters depend on: metamodel kinds, playbook structure, display
  contract section names, CLI command interfaces, gap-radar checklist
  output shape.
- **MINOR (0.x.0)** — additive changes: new playbooks, new patterns,
  new skills, new CLI commands, new guidance, expanded compliance
  coverage.
- **PATCH (0.0.x)** — fixes, clarifications, doc improvements with no
  contract change.

Pre-1.0 (`0.x.y`) means the conventions are not yet declared stable.
Minor bumps may still introduce small breaking changes if the conceptual
shape demands it; major bump to 1.0 will signal the contract is frozen.

---

## [Unreleased]

### Added

- **Playbook v1 refresh + regulated-playbook freeze-enforcement guidance.**
  A capability-radar pass over all 24 playbooks surfaced two
  asymmetries: (1) the four original v1 playbooks (`inventory-only`,
  `quick-solution-design`, `migration-wave`, `full-togaf-adm`) were
  missing the `Sample Backlog Of Open Questions` and `Recommended
  Diagrams` sections that all 20 v2-v6 playbooks have, and
  `inventory-only` was also missing `Decision Points`. (2) The newer
  `requirement_freeze_enforcement` convention had no playbook-level
  guidance on when to set it to `strict`. Closed both:
  - Backfilled all four v1 playbooks with engagement-appropriate
    `Sample Backlog Of Open Questions` and `Recommended Diagrams`;
    backfilled `Decision Points` in `inventory-only`. Recommended-Diagrams
    sections reference the relevant starter view templates.
  - Added a `Customization Guide` bullet recommending
    `requirement_freeze_enforcement: strict` to the four most regulated
    playbooks: `compliance-driven-modernization`,
    `post-incident-architecture-review`, `business-continuity-readiness`,
    and `post-acquisition-integration`. Each bullet links to
    `guidance/requirement-change-handling.md` for the rationale.

  All 24 playbooks now have the core 16 + optional 3 sections
  (Sample Backlog Of Open Questions, Decision Points, Recommended
  Diagrams), bringing v1 to v2-v6 parity.
- **Requirement-change handling discipline.** Requirements drift was
  previously handled only by scattered `metadata.change_log` lines and
  ad-hoc updates; no single procedure existed. New artifacts close the
  gap:
  - `guidance/requirement-change-handling.md` — the architect's 8-step
    procedure with a four-type taxonomy (new / modified / removed /
    superseded), explicit decision-threshold rule (promote to a
    `decision` when any of: touches >1 solution, alters compliance
    posture, materially affects timeline / cost, crosses a review gate,
    sponsor requests), and freeze-gate semantics
  - `patterns/governance/requirement-change-protocol.md` — the
    architectural shape of the protocol, suitable for engagements that
    explicitly customize it
  - `skills/change-coordinator.md` rewritten from a vague
    Inputs/Outputs stub into a full delivery-skill (Read First, Steps,
    Outputs, Output Checklist, Boundaries, Quality Checks, Variations)
    that specializes on requirement-change
  - `architect-work/change-register.md` — new 6th file in the CLI
    scaffold; the sponsor-readable aggregated log of scope changes on
    a project. Template at
    `cli/templates/architect-work/change-register.md`; both CLIs
    auto-include it on `architect new`
  - `conventions.requirement_freeze_enforcement` flag added to
    `workspace-defaults.yaml` with three modes (off / advisory /
    strict); documented in `agent.config.md`
  - `gap-radar-checklists.md` Section 6 gains two new drift signals:
    requirement-drift (requirement changed without downstream
    re-review) and register-drift (change_log entry without matching
    register row)
- **Diagrams-as-code depth pass.** Diagram authoring is now a
  substantive workflow, not just guidance:
  - `skills/diagram-author.md` rewritten from a thin Inputs/Outputs
    stub to a full skill with Read First, Steps (8-step procedure),
    Output Checklist, Boundaries, Quality Checks, and Variations —
    matching the shape of other delivery skills.
  - `guidance/diagram-starter-views/` new folder with 9 starter
    templates covering the full notation matrix: `context-view.md`,
    `container-view.md`, `sequence-view.puml`, `deployment-view.puml`,
    `data-erd.md`, `business-process-view.md`,
    `transition-wave-view.md`, `capability-heatmap.md`,
    `value-stream-view.md`. Mermaid where it works (renders natively
    on GitHub); PlantUML for full sequence and deployment views.
    Each starter has placeholder artifact IDs, a `Related Artifacts`
    section, and a `Tailoring` note.
  - `guidance/diagram-conventions.md` updated to reference the starter
    library and to extend the filename / notation guidance.
- **Capability maintenance + drift detection.** Three new artifacts
  keep the `.architect/` library internally consistent as it evolves:
  - [`guidance/capability-maintenance.md`](./guidance/capability-maintenance.md) — the maintainer playbook ("when you add a skill, here are the 5 files to also update")
  - [`skills/capability-radar.md`](./skills/capability-radar.md) + [`guidance/capability-radar-checklists.md`](./guidance/capability-radar-checklists.md) — a cross-cutting scanning skill for drift in the capability library itself (analog of `gap-radar` but pointed at `.architect/`)
  - [`validation/Validate-Capability.ps1`](./validation/Validate-Capability.ps1) — mechanical link checker that implements the radar's mechanical subset; walks every markdown file under `.architect/` plus `AGENTS.md` and root README, verifies every relative link resolves. Non-zero exit on broken links — suitable for pre-commit / CI use.
- **`architect status [project-name]` CLI command** — richer
  per-project status summary. Reads `project-config.yaml`,
  `architect-work/working-log.md`, and the topical architect-work files
  to surface, per actively-worked project: playbook, last activity
  (latest working-log entry), biggest signal (parsed from the log
  entry's `Biggest signal:` section), active blockers (`- 🚫 ...`
  bullets across architect-work), next 3 immediate tasks (top bullets
  from the `Immediate` section of architect-task-list, labeled with
  their Ask/Confirm/Request/Decide sub-section), and totals. Empty /
  sparse projects show only last-touched date and totals. With no
  argument: portfolio view. With a project name: deep view of one
  project. `list-projects` stays minimal (one line per project);
  `status` is the richer view. Implemented in both PowerShell and Bash
  CLIs. Documented in `.architect/cli/README.md`.
- **Working log convention** — a fifth `architect-work/` file,
  `working-log.md`, capturing a chronological plain-language narrative
  of the project (newest entry on top). Distinct from the four topical
  files, which organize by category. Skills (`project-recap`,
  `baseline-discovery`, `gap-radar`) now propose a working-log entry
  when they run. Template lives at
  `cli/templates/architect-work/working-log.md`; CLI scaffold copies it
  for every new project. Documented in `config/agent.config.md`,
  `guidance/glossary.md`, the affected skill files, and
  `guidance/project-recap-protocol.md` and
  `guidance/gap-radar-checklists.md`.
- **Three vocabulary bridges** under `guidance/vocabulary-bridges/`:
  TOGAF (the cleanest 1:1 since OA's templates are TOGAF-adjacent; covers
  ADM-phase → artifact mapping, building blocks, repository concepts),
  BIZBOK (business-architect vocabulary; capability maps, value streams,
  information maps), and Cloud Well-Architected (combined AWS + Azure +
  GCP pillars; review findings persisted as gaps / risks / decisions).
- **Structured-choice convention** added to the display contract.
  Responses surface 2-4 discrete-option decisions via the host's
  structured-choice UI (e.g. `AskUserQuestion` in Claude Code) instead
  of prose options, for immediate next-step choices, `Decide` tasks
  with pickable options, and option-comparison tables. Updated
  `AGENTS.md`, `.architect/config/response-display.md`, and added
  `response_structured_choices: true` to workspace defaults.

### Changed

- Split workspace-level defaults from engagement config: renamed
  `.architect/project-config.yaml` to
  `.architect/config/workspace-defaults.yaml`. Slimmed to workspace-only
  concerns (conventions, default method, runtime defaults). Engagement-
  specific blocks (compliance scope, roles enabled, templates enabled,
  skills enabled, governance review checkpoints) now live exclusively in
  `workspace/<project>/project-config.yaml`. Updated skills, validator,
  agent task artifact, AGENTS.md, and documentation accordingly.

---

## [0.1.0] — 2026-05-22

First formalized version of the Open Architect capability. This is the
baseline that future versions track against.

### Added

- **Workspace metamodel** — 25 template kinds covering business,
  application, data, technology, governance, change, and solution
  delivery (stakeholder, objective, architecture-vision, business-
  capability, business-process, organization, principle, application,
  application-service, interface, data-object, technology-component,
  technology-standard, environment, requirement, solution, decision,
  initiative, roadmap, transition-architecture, work-package, gap,
  compliance-assessment, risk).
- **24 engagement playbooks** organized into 8 families (Discovery &
  decision, Solution / design, Modernization & transition, Platform
  bootstrap, Enterprise cycle, Driver-specific, M&A lifecycle, Practice
  setup & operation). Each playbook follows a 16-section structure with
  Stages, Anti-Patterns, Decision Points, Sample Backlog Of Open
  Questions, Recommended Diagrams, Customization Guide, and a
  ready-to-clone `project-config.yaml`.
- **AI patterns** — 8 first-class patterns under `patterns/ai/`:
  retrieval-augmented-generation, prompt-lifecycle-management,
  continuous-model-evaluation, model-version-promotion-gate,
  ai-guardrail-stack, agentic-system-bounded-loop,
  embedding-lifecycle-management, model-vendor-portability.
- **Persona-driven scanning skills** — `gap-radar` (proactive scan with
  substantive checklists under `guidance/gap-radar-checklists.md`) and
  `project-recap` (read-only re-entry / handover briefing with protocol
  under `guidance/project-recap-protocol.md`).
- **Pattern library** across application, integration, data, security,
  technology, transition, business, governance domains (~80 patterns).
- **Compliance layer** covering GDPR, UK GDPR, EU AI Act, NIS2, DORA,
  Cyber Resilience Act, EU Data Act, HIPAA Security Rule, FTC Safeguards,
  SEC cyber disclosure, PCI DSS, CCPA/CPRA, FedRAMP, CMMC, plus
  jurisdiction profiles (EU/EEA, UK, US, California, Canada) and sector
  profiles (financial-services, healthcare, education, payments,
  public-sector, critical-infrastructure, software-products,
  life-sciences-and-pharma, consumer-digital).
- **Vocabulary bridges** — concept maps from C4, ArchiMate-Lite, and
  DDD to Open Architect templates and patterns
  (`guidance/vocabulary-bridges/`).
- **Display contract** — architect-friendly response format with
  emoji-prefixed status labels (`AGENTS.md`,
  `config/response-display.md`).
- **`architect` CLI** — zero-dependency cross-platform shell scripts
  (PowerShell + Bash) with repo-root delegators. Commands: `init`,
  `new <project> [--playbook <name>]`, `list-playbooks`, `list-projects`,
  `playbook <name>`, `--help [command]`, `--version`.
- **Workspace layout** — `.architect/` holds the capability library;
  sibling `workspace/` holds the architect's actual project work (one
  folder per project). `workspace/` is gitignored; the CLI initializes
  and populates it on demand.
- **Schema layer** — first-pass JSON Schema contracts for the core
  template kinds, with conditional rules for approval, evidence, and
  reference patterns (`schemas/`).
- **Validation** — PowerShell validators for template structure and
  artifact-folder consistency (`validation/`).
- **Multi-agent execution scaffold** — optional `agents/` runtime
  profiles, task and handoff payload shapes, and `runtime/` queue/gate
  state for projects that intentionally opt into orchestration.
- **Method references** — TOGAF ADM and transition-architecture
  reference content under `method/references/`, plus
  `method/project-method.md` for project-specific tailoring.
- **Guidance set** — conventions, glossary, evidence-and-quality,
  governance-conventions, lifecycle-and-dates, traceability-rules,
  id-and-naming-rules, human-review-packet, agent-test-scenarios,
  diagram-conventions, role-boundaries, handoff-contracts.

### Notes

- This is the baseline release. Future entries will record changes
  *relative to* this baseline.
- The `architect` CLI internal feature set at this release is what was
  shipped as Group A (init, new, list-playbooks, list-projects,
  playbook, per-command help, typo suggestion, encoding fix). The CLI
  no longer maintains its own version — it reports the capability
  version from this file.
