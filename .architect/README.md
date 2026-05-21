# Open Architect

Open Architect is an AI-native workspace for enterprise architects and solution architects.

The goal is to capture architecture as structured, linked, machine-readable knowledge rather than disconnected documents. The `.architect` folder is the project-local architecture capability container: it holds guidance, method definitions, flows, roles, templates, and architecture work products in one predictable place.

## What This Workspace Is For

Use this workspace to describe:

- Business architecture
- Application and integration architecture
- Data architecture
- Technology architecture
- Governance and decision-making
- Transition architecture and delivery change

This is intended to support both:

- Enterprise architects who need capability, governance, standards, principles, target state, and transition views
- Solution architects who need requirements, solution scope, services, interfaces, environments, and delivery traceability

## Core Idea

Each YAML file represents one architecture object.

Examples:

- one application
- one interface
- one business capability
- one decision
- one transition architecture

These objects are linked using typed `relationships`, which makes the workspace easier to query, validate, and reason over with AI.

## Folder Structure

```text
.architect/
  architecture/
    application/
    business/
    change/
    data/
    governance/
    technology/
  examples/
  agents/
  patterns/
  compliance/
  runtime/
  schemas/
  validation/
  config/
  flows/
  guidance/
  method/
  project-config.yaml
  roles/
  skills/
  templates/
    agents.md
    application/
    business/
    change/
    data/
    governance/
    technology/
```

Folder intent:

- `architecture/`: actual project architecture objects created from templates
- `examples/`: worked examples and reference projects kept separate from live project work
- `patterns/`: reusable architecture patterns and reference solution approaches
- `compliance/`: compliance-aware reference material for jurisdictions, sectors, and control obligations
- `agents/`: executable agent profiles, runtime contracts, and task/handoff payloads for multi-agent execution
- `runtime/`: live queue, gate, and active-work state for coordinator-led multi-agent execution
- `schemas/`: formal structural contracts for artifact documents
- `validation/`: executable checks for templates and architecture artifact folders
- `config/`: configuration guidance for agent and workspace behavior
- `flows/`: visual or executable architecture workflows
- `guidance/`: conventions, glossary, and local architecture guidance
- `method/`: the selected project architecture method plus reference methods
- `project-config.yaml`: project-level selection of roles, templates, skills, method, and flows
- `roles/`: role descriptions and responsibilities
- `skills/`: agent or reusable architecture skill instructions
- `templates/`: starter metamodel templates grouped by architecture concern

## Template Set

### Enterprise And Business

- `business-capability.yaml`: stable business ability the enterprise needs
- `business-process.yaml`: business process that realizes one or more capabilities
- `organization.yaml`: teams, functions, or operating units that own or steward architecture elements
- `stakeholder.yaml`: internal or external stakeholder with concerns, influence, and decision rights
- `objective.yaml`: measurable business or architecture objective
- `initiative.yaml`: transformation initiative, program, or project
- `architecture-vision.yaml`: high-level architecture direction and value proposition
- `principle.yaml`: durable architecture rule or design guardrail
- `decision.yaml`: specific architecture decision with rationale and impact

### Application, Data, And Technology

- `application.yaml`: application or system in the estate
- `application-service.yaml`: logical service exposed by an application
- `interface.yaml`: concrete integration or API contract
- `data-object.yaml`: canonical business data object
- `technology-component.yaml`: runtime, platform, product, or technical building block
- `technology-standard.yaml`: approved, tolerated, or prohibited technology direction
- `environment.yaml`: runtime boundary such as dev, test, production, or region

### Solution And Delivery

- `solution.yaml`: bounded end-to-end solution architecture
- `requirement.yaml`: business, functional, non-functional, security, or regulatory requirement
- `transition-architecture.yaml`: time-bounded interim architecture state or rollout wave
- `work-package.yaml`: delivery increment that realizes part of a transition
- `gap.yaml`: missing or weak architecture capability that must be addressed
- `roadmap.yaml`: sequenced view of architecture change over time
- `compliance-assessment.yaml`: architecture conformance review and remediation record
- `risk.yaml`: architecture or transition risk with treatment and governance

## Operating Model

Treat `.architect` as the place that answers five questions for the project:

- What architecture artifacts do we use?
- How do we model them?
- Who is responsible for architecture work?
- What method do we follow?
- Where do real project architecture objects live?

In practical terms:

- use `project-config.yaml` to declare what this project will actually use
- use `templates/` to define the metamodel
- use `architecture/` to store actual project instances
- use `examples/` for reference implementations and sample views
- use `patterns/` for reusable architectural approaches and design guidance
- use `compliance/` to scope jurisdiction, sector, privacy, AI, cyber-resilience, and payment/security obligations that should shape the architecture
- use `agents/` to define the executable runtime profiles for roles that should operate as real agents
- use `runtime/` to hold the active queue, handoff state, and review gate state when the project uses true multi-agent execution
- use `schemas/` to define formal machine-readable contracts for artifact structure
- use `validation/` to check template quality and project artifact consistency
- use `config/` to explain how project and agent configuration should work
- use `flows/` for visual or executable workflow definitions
- use `guidance/` to explain local rules
- use `method/` to describe the chosen project method and its tailoring
- use `roles/` to clarify who does what
- use `skills/` for AI or reusable playbooks

## Roles, Skills, And Agents

These three layers are related, but not the same:

- `roles/`
  Describe perspective, accountability, and ownership boundaries.
- `skills/`
  Describe reusable procedures for doing architecture work.
- `agents/`
  Describe executable runtime profiles that bind a role to allowed skills, write
  scope, validation, and handoff behavior.

Without `agents/` and `runtime/`, the workspace should be treated as
coordinator-led single-agent execution that simulates specialist roles.

With `agents/` and `runtime/`, the workspace can support actual multi-agent
orchestration with bounded specialists and explicit handoffs.

## How To Use The Templates

Before creating architecture content, tailor [`.architect/project-config.yaml`](project-config.yaml) so the project explicitly selects:

- active roles
- in-scope templates
- chosen method and reference methods
- enabled flows
- enabled skills
- applicable jurisdictions, sectors, and regulations

This keeps the workspace intentional and avoids treating every project as if it
must use the full capability set.

Guidance for this file is in [`.architect/config/agent.config.md`](config/agent.config.md).

### For Enterprise Architecture

A typical enterprise architecture flow is:

1. Define drivers, expectations, and outcomes with `stakeholder`, `objective`, and `architecture-vision`.
2. Define the business anchor with `business-capability`.
3. Add `business-process` and `organization` to describe realization and ownership.
4. Capture strategic guardrails using `principle` and `technology-standard`.
5. Record target change through `initiative` and `decision`.
6. Link impacted `application`, `data-object`, `interface`, and `technology-component` entries.
7. Define phased change using `roadmap`, `transition-architecture`, `gap`, and `work-package`.
8. Govern realization through `compliance-assessment` and `risk`.

### For Solution Architecture

A typical solution architecture flow is:

1. Create a `solution` for the bounded architecture you are designing.
2. Capture constraints in `requirement`, `decision`, `principle`, and `technology-standard`.
3. Align the solution to `stakeholder`, `objective`, and `architecture-vision`.
4. Model the participating `application`, `application-service`, `interface`, `data-object`, and `technology-component` entries.
5. Add `environment` to describe runtime, security, and operational boundaries.
6. Use `transition-architecture`, `work-package`, `compliance-assessment`, and `risk` when delivery happens over time.

## Recommended Authoring Order

If you are starting a new initiative, use this order:

1. `stakeholder`
2. `objective`
3. `architecture-vision`
4. `business-capability`
5. `organization`
6. `application`
7. `data-object`
8. `application-service`
9. `interface`
10. `technology-component`
11. `principle`
12. `technology-standard`
13. `requirement`
14. `decision`
15. `solution`
16. `initiative`
17. `roadmap`
18. `transition-architecture`
19. `gap`
20. `work-package`
21. `environment`
22. `compliance-assessment`
23. `risk`

You do not need every template on day one. Start with the smallest useful set, then expand.

## Baseline, Target, And Transition

The recommended modeling approach is:

- Use the core templates to describe baseline architecture facts
- Use the same templates to describe target architecture facts
- Use `transition-architecture` to describe interim states between baseline and target
- Use `gap` to capture what is missing or weak
- Use `work-package` to describe the delivery increments that close those gaps

Avoid cloning the whole architecture for every phase unless an object genuinely becomes a different version.

## How Relationships Should Work

Prefer typed relationships over loose notes.

Example:

```yaml
relationships:
  - type: realizes-capability
    target_kind: business-capability
    target_id: BC-0001
    strength: primary
    confidence: high
```

This allows people and AI agents to answer questions like:

- What capabilities does this solution realize?
- Which interfaces are constrained by this decision?
- Which work packages close this gap?
- Which applications are affected by this transition?

## How To Read A Template

Each template follows the same high-level shape:

```yaml
template:
  kind: application
  version: 1.1
  schema_version: 1.1

spec:
  id: APP-0001
  name: customer-relationship-management
  display_name: Customer Relationship Management
  aliases: []
  summary: Short machine-friendly summary.
  description: >
    Longer human-readable description.
```

Important sections:

- `classification`: what kind of thing this is
- `status`: lifecycle and operating state
- `ownership`: who is accountable
- `metadata`: provenance, confidence, review, and references
- `relationships`: links to other architecture objects
- `governance`: rules, approvals, exceptions, or review cadence
- `notes`: assumptions and risks

## Naming And Structure Rules

Use:

- singular file names
- lowercase `kebab-case`
- file stem matching `template.kind`

Examples:

- `application.yaml` -> `kind: application`
- `transition-architecture.yaml` -> `kind: transition-architecture`
- `technology-standard.yaml` -> `kind: technology-standard`

Each template should include:

- `id`
- `name`
- `display_name`
- `aliases`
- `summary`
- `description`
- `metadata`
- `relationships`

More detailed authoring guidance is in [agents.md](templates/agents.md).

## Suggested Next Steps

To make this workspace operational, the next best additions are:

1. Add additional worked examples under `examples/`.
2. Turn the strongest playbooks into executable agent instructions.
3. Deepen schema precision and schema-aware validation behavior.
4. Prove the expanded pattern library through real project use and executable agent scenarios.
5. Add automation for ID generation, relationship checks, broken reference detection, and approval-quality validation.

## Starting Small

If you want a minimal but useful first architecture slice, create:

1. one `stakeholder`
2. one `objective`
3. one `business-capability`
4. one `application`
5. one `data-object`
6. one `application-service`
7. one `interface`
8. one `requirement`
9. one `decision`
10. one `solution`
11. one `transition-architecture`

That is usually enough to demonstrate the value of the workspace before modeling the wider estate.
