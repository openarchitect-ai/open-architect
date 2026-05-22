# Open Architect — Workspace Reference

This is the working reference for the `.architect/` workspace. For the project's value pitch, getting-started, and signature capabilities overview, see the [root README](../README.md).

The `.architect/` folder is the project-local architecture capability container: it holds the metamodel (templates), the engagement shapes (playbooks), the reusable patterns, the operating skills, the chosen method, conventions, compliance scope, and the real architecture artifacts produced for the project — all in one predictable place.

The goal is to capture architecture as **structured, linked, machine-readable knowledge** — not disconnected documents — so it can be reasoned over by humans and AI agents alike.

---

## Who this workspace is for

- **Enterprise architects** working on capability, governance, standards, principles, target state, and transition
- **Solution architects** working on requirements, solution scope, services, interfaces, environments, and delivery traceability
- **Architecture teams** that want versioning, reviewability, traceability, and consistent AI behavior across multiple tools (Claude Code, Codex, Copilot, others)

The workspace assumes the architect stays in control. AI assists with bounded tasks (extraction, analysis, review, drafting); it does not auto-progress the work.

---

## Core idea

Each YAML file under a project's `workspace/<project-name>/` folder represents one architecture object:

- one `application`
- one `interface`
- one `business-capability`
- one `decision`
- one `transition-architecture`
- and so on across the metamodel

Objects link to each other through typed `relationships`. This is what makes the workspace queryable, reviewable, and AI-friendly.

---

## How to start

The shortest useful path uses the `architect` CLI:

```bash
# from the repo root
./architect.sh new my-project --playbook quick-solution-design
# or PowerShell
./architect.ps1 new my-project -Playbook quick-solution-design
```

That scaffolds `../workspace/my-project/` with `project-config.yaml`,
`notes.md`, `architect-work/`, and `docs/`. Then follow the playbook's
first-working-session script.

CLI usage and templates: [`cli/README.md`](./cli/README.md).

Manual path: pick a playbook from [`playbooks/`](./playbooks/README.md),
create `../workspace/<your-project>/`, copy the playbook's
`project-config.yaml` into it, and start.

For lighter setup:

- [`config/starter-project.md`](./config/starter-project.md) — minimum useful project shape
- [`config/prompt-recipes.md`](./config/prompt-recipes.md) — practical prompts per mode
- [`config/cheat-sheet.md`](./config/cheat-sheet.md) — fast reference

---

## Signature capabilities

Beyond the metamodel, the workspace gives you:

- **Engagement playbooks** under [`playbooks/`](./playbooks/) — pre-packaged engagement shapes for inventory-only work, quick solution design, migration waves, full TOGAF cycles, AI platform bootstrap, compliance-driven modernization, and post-acquisition integration.
- **Gap Radar skill** at [`skills/gap-radar.md`](./skills/gap-radar.md) — proactive scan that catches what an experienced architect would catch on a fresh read. Checklists live in [`guidance/gap-radar-checklists.md`](./guidance/gap-radar-checklists.md).
- **Project Recap skill** at [`skills/project-recap.md`](./skills/project-recap.md) — read-only re-entry / handover orientation. Protocol in [`guidance/project-recap-protocol.md`](./guidance/project-recap-protocol.md).
- **AI patterns** under [`patterns/ai/`](./patterns/ai/README.md) — RAG, prompt lifecycle, continuous evaluation, model version promotion gates, guardrail stack, agentic bounded loops, embedding lifecycle, vendor portability.
- **Vocabulary bridges** under [`guidance/vocabulary-bridges/`](./guidance/vocabulary-bridges/README.md) — for teams who think in C4, ArchiMate-Lite, or DDD.
- **Compliance layer** under [`compliance/`](./compliance/) — jurisdiction, sector, and control obligations for GDPR, UK GDPR, EU AI Act, NIS2, DORA, HIPAA Security Rule, PCI DSS, FedRAMP, CMMC, and more.

---

## Folder structure

`.architect/` is the **capability library**. Real project work lives in
a sibling `workspace/` folder (one subfolder per project).

```text
.architect/                  ← capability library (this folder)
  cli/              ← `architect` CLI (architect.ps1, architect.sh, templates/)
  playbooks/        ← engagement shapes (start here)
  patterns/         ← reusable architecture patterns (incl. patterns/ai/)
  templates/        ← the metamodel (what each artifact kind looks like)
  skills/           ← reusable procedures (incl. gap-radar, project-recap)
  roles/            ← role descriptions and accountabilities
  method/           ← chosen project method + ADM and transition references
  guidance/         ← conventions, glossary, vocabulary-bridges/
  compliance/       ← jurisdiction, sector, and control obligations
  examples/         ← worked reference projects (use the same project shape as workspace/)
  agents/           ← runtime profiles for multi-agent execution (advanced)
  runtime/          ← live queue / gate state (advanced)
  schemas/          ← formal JSON Schema contracts (advanced)
  validation/       ← validators for templates and artifacts (advanced)
  config/           ← workspace and agent configuration guides
  project-config.yaml ← workspace-level skeleton; real projects pick a playbook

../workspace/                ← where the architect's project work lives
  <project-name>/
    project-config.yaml      ← chosen playbook + tailoring
    notes.md
    architect-work/          ← architect-owned working notes
    docs/                    ← source material
    business/  application/  data/  technology/  governance/  change/  views/
```

---

## Template set

The metamodel covers:

**Enterprise and business**

- `business-capability` — stable business ability the enterprise needs
- `business-process` — process that realizes one or more capabilities
- `organization` — team, function, or operating unit that owns or stewards architecture
- `stakeholder` — internal or external stakeholder with concerns, influence, decision rights
- `objective` — measurable business or architecture outcome
- `initiative` — transformation initiative, program, or project
- `architecture-vision` — high-level architecture direction and value proposition
- `principle` — durable architecture rule or design guardrail
- `decision` — specific architecture decision with rationale and impact

**Application, data, technology**

- `application` — application or system in the estate
- `application-service` — logical service exposed by an application
- `interface` — concrete integration point or API contract
- `data-object` — canonical business data object
- `technology-component` — runtime, platform, product, or technical building block
- `technology-standard` — approved, tolerated, or prohibited technology direction
- `environment` — runtime boundary (dev, test, production, region, segment)

**Solution and delivery**

- `solution` — bounded end-to-end solution architecture
- `requirement` — business, functional, non-functional, security, or regulatory requirement
- `transition-architecture` — time-bounded interim architecture state or rollout wave
- `work-package` — delivery increment that realizes part of a transition
- `gap` — missing or weak architecture capability that must be addressed
- `roadmap` — sequenced view of architecture change over time
- `compliance-assessment` — architecture conformance review and remediation record
- `risk` — architecture or transition risk with treatment and governance

---

## Operating model

The workspace answers five questions for the project:

1. What engagement shape is this? — `playbooks/`
2. What artifacts do we use? — `templates/` and `project-config.yaml`
3. Who is responsible? — `roles/`
4. What method do we follow? — `method/`
5. Where do real project artifacts live? — `../workspace/<project-name>/`

In practical terms:

- Use `playbooks/` to pick the engagement shape and start with a pre-packaged config.
- Use `project-config.yaml` to declare what this project will actually use.
- Use `templates/` to define the metamodel.
- Use `../workspace/<project-name>/` to store real project instances.
- Use `patterns/` for reusable architectural approaches and design guidance.
- Use `compliance/` to scope jurisdiction, sector, privacy, AI, cyber-resilience, and payment/security obligations.
- Use `skills/` for reusable procedures (incl. `gap-radar`, `project-recap`, `solution-modeler`, etc.).
- Use `guidance/` for conventions, glossary, and `vocabulary-bridges/` for C4 / ArchiMate / DDD teams.
- Use `method/` to describe the chosen project method and its tailoring.
- Use `agents/` and `runtime/` only when the project explicitly opts into multi-agent execution.
- Use `schemas/` and `validation/` only when formal artifact contracts and runnable checks are wanted.

### Roles, skills, agents — three distinct layers

- `roles/` — perspective, accountability, ownership boundaries
- `skills/` — reusable procedures for doing architecture work
- `agents/` — executable runtime profiles that bind a role to allowed skills, write scope, validation, and handoff behavior

Without `agents/` and `runtime/`, the workspace is treated as **architect-led single-agent execution** that can switch among specialist roles and skills on demand.

With `agents/` and `runtime/`, the workspace supports **actual multi-agent orchestration** with bounded specialists and explicit handoffs.

### Recommended default style

For most real projects, start in `architect-assist`:

- the architect remains the primary driver
- agents help with bounded tasks (extraction, analysis, review, drafting)
- inventory and analysis come before modeling
- architecture artifacts are created only when explicitly requested
- multi-agent orchestration is opt-in, not assumed

---

## Workspace levels

| Level | What it gives you | When to use |
|---|---|---|
| **Core** | `playbooks/`, `project-config.yaml`, `../workspace/`, `config/`, `guidance/`, `templates/`, small subset of `roles/` and `skills/` | normal architect-assist work |
| **Optional** | broader `roles/`, broader `skills/`, `compliance/`, richer template coverage | projects that need more explicit structure but not full orchestration |
| **Advanced** | `agents/`, `runtime/`, `schemas/`, `validation/` | multi-agent execution, stronger automation, deeper formal controls |

---

## Modeling guidance

### Baseline, target, and transition

- Use the core templates to describe baseline architecture facts
- Use the same templates to describe target architecture facts
- Use `transition-architecture` to describe interim states between baseline and target
- Use `gap` to capture what is missing or weak
- Use `work-package` to describe the delivery increments that close those gaps

Avoid cloning the whole architecture per phase unless an object genuinely becomes a different version.

### Recommended authoring order

If you are starting a new initiative, use this order (skip anything not in scope):

1. `stakeholder` → 2. `objective` → 3. `architecture-vision` → 4. `business-capability` → 5. `organization` → 6. `application` → 7. `data-object` → 8. `application-service` → 9. `interface` → 10. `technology-component` → 11. `principle` → 12. `technology-standard` → 13. `requirement` → 14. `decision` → 15. `solution` → 16. `initiative` → 17. `roadmap` → 18. `transition-architecture` → 19. `gap` → 20. `work-package` → 21. `environment` → 22. `compliance-assessment` → 23. `risk`

You do not need every template on day one. Start with the smallest useful set and expand.

### How relationships should work

Prefer typed relationships over loose notes:

```yaml
relationships:
  - type: realizes-capability
    target_kind: business-capability
    target_id: BC-0001
    strength: primary
    confidence: high
```

This lets humans and AI agents answer:

- What capabilities does this solution realize?
- Which interfaces are constrained by this decision?
- Which work packages close this gap?
- Which applications are affected by this transition?

### Template anatomy

Each template follows the same shape:

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

- `classification` — what kind of thing this is
- `status` — lifecycle and operating state
- `ownership` — who is accountable (use truthful values: `confirmed:<owner>`, `role-placeholder:<role>`, `tbd`, `unknown`)
- `metadata` — provenance, confidence, review, references
- `relationships` — links to other architecture objects
- `governance` — rules, approvals, exceptions, review cadence
- `notes` — assumptions and risks

### Naming and structure rules

- singular file names
- lowercase `kebab-case`
- file stem matches `template.kind`

Examples: `application.yaml` → `kind: application`, `transition-architecture.yaml` → `kind: transition-architecture`.

Each template should include: `id`, `name`, `display_name`, `aliases`, `summary`, `description`, `metadata`, `relationships`.

Detailed authoring guidance: [`templates/agents.md`](./templates/agents.md).

---

## Starting small

If you want a minimal but useful first architecture slice, create one of each:

`stakeholder` → `objective` → `business-capability` → `application` → `data-object` → `application-service` → `interface` → `requirement` → `decision` → `solution` → `transition-architecture`

That is usually enough to demonstrate the value of the workspace before modeling the wider estate.

---

## Where to read next

- [`playbooks/README.md`](./playbooks/README.md) — engagement-shape catalog and how to pick one
- [`config/agent.config.md`](./config/agent.config.md) — operating style, approval thresholds, work modes, runtime guidance
- [`config/response-display.md`](./config/response-display.md) — the display contract for AI responses inside this workspace
- [`guidance/conventions.md`](./guidance/conventions.md) — entry point for modeling, evidence, governance, lifecycle, and diagram conventions
- [`guidance/glossary.md`](./guidance/glossary.md) — shared workspace vocabulary
- [`guidance/vocabulary-bridges/README.md`](./guidance/vocabulary-bridges/README.md) — bridges from C4 / ArchiMate-Lite / DDD
- [`method/project-method.md`](./method/project-method.md) — the chosen project method
- [`patterns/README.md`](./patterns/README.md) — the full pattern library
- [`compliance/README.md`](./compliance/README.md) — compliance-aware reference material

---

## Suggested next steps for this workspace

The current direction for ongoing work:

1. ✅ Prove the new persona-driven skills (`gap-radar`, `project-recap`) against real project slices
2. 🟡 Add worked examples across more engagement shapes (the existing customer-onboarding example only exercises one)
3. 🟡 Add Tier 2 AI patterns (inference caching, FinOps signals, tenant isolation, AI Act Article 50 disclosure, hallucination handling, red-teaming, human-in-the-loop review)
4. 🟡 Turn the strongest skill instructions into executable agent payloads
5. 🟡 Make `validation/` execute the gap-radar checklists mechanically, not only describe them
6. 🟡 Add ID generation, broken-reference detection, and approval-quality validation
