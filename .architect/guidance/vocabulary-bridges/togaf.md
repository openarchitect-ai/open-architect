# TOGAF Bridge

## Purpose

Help teams trained in the
[TOGAF ADM](https://pubs.opengroup.org/togaf-standard/index.html) adopt
Open Architect. Of all the bridges, this is the cleanest — Open
Architect's template library is deliberately TOGAF-adjacent, so the
vocabulary translates almost one-to-one.

The bridge is most useful when a team needs to keep speaking TOGAF
(stakeholders expect ADM phase outputs, governance asks for compliance
assessments by name, RFPs reference ADM deliverables) while operating in
Open Architect.

## When To Use This Bridge

- the team or its stakeholders are TOGAF-certified and expect ADM
  vocabulary
- the engagement is a full enterprise architecture cycle
- formal architecture compliance, gap analysis, or capability-based
  planning is required
- the organization runs an Architecture Repository and Architecture
  Board

For the full TOGAF cycle, also see the [`full-togaf-adm`](../../playbooks/full-togaf-adm/playbook.md)
playbook — it's the implementation form of this bridge.

## Concept Mapping

### Core artifacts

| TOGAF concept | Open Architect equivalent | Notes |
|---|---|---|
| Stakeholder | `stakeholder` | One-to-one |
| Concern | `stakeholder.concerns` field | TOGAF keeps concerns associated with stakeholders; Open Architect does the same |
| Viewpoint / View | a view document under `workspace/<project>/views/` | Pulls from underlying artifacts; the YAML is the truth |
| Architecture Principle | `principle` | One-to-one |
| Architecture Vision | `architecture-vision` | One-to-one |
| Business Capability | `business-capability` | One-to-one |
| Business Service / Process | `business-process` | TOGAF distinguishes business service from process; Open Architect uses `business-process` for both with metadata to clarify |
| Organization Unit | `organization` | One-to-one |
| Goal / Objective / Driver | `objective` | All three flatten to `objective` with `kind` differentiating |
| Application Component | `application` | One-to-one |
| Application Service | `application-service` | One-to-one |
| Information System Service | `application-service` (with metadata) | TOGAF's IS Service rolls up to application-service |
| Data Entity | `data-object` | One-to-one |
| Technology Component / Platform Service | `technology-component` | One-to-one |
| Technology Standard | `technology-standard` | One-to-one |
| Location / Environment | `environment` | One-to-one |
| Requirement | `requirement` | One-to-one |
| Architecture Decision | `decision` | One-to-one (ADR-style) |
| Risk | `risk` | One-to-one |
| Gap (from gap analysis) | `gap` | One-to-one |
| Work Package | `work-package` | One-to-one |
| Transition Architecture | `transition-architecture` | One-to-one |
| Roadmap | `roadmap` | One-to-one |
| Initiative / Solution | `initiative` (programmatic) + `solution` (designed) | TOGAF's "solution" splits into the change initiative and the designed architecture |
| Architecture Compliance Review | `compliance-assessment` | One-to-one |

### ADM phases → Open Architect templates

| TOGAF ADM phase | Open Architect artifacts | Where to find guidance |
|---|---|---|
| Preliminary | `project-config.yaml`, `principle`, `organization` | `.architect/playbooks/full-togaf-adm/playbook.md` |
| A. Architecture Vision | `architecture-vision`, `stakeholder`, `objective` | Same playbook, Stage 1 |
| B. Business Architecture | `business-capability`, `business-process`, `organization`, `stakeholder` | Same playbook, Stage 2 |
| C. Information Systems Architecture (Data) | `data-object` | Same playbook, Stage 3 |
| C. Information Systems Architecture (Application) | `application`, `application-service`, `interface` | Same playbook, Stage 3 |
| D. Technology Architecture | `technology-component`, `technology-standard`, `environment` | Same playbook, Stage 4 |
| E. Opportunities & Solutions | `solution`, `initiative`, `work-package` | Same playbook, Stage 5 |
| F. Migration Planning | `roadmap`, `transition-architecture`, `work-package`, `gap` | Same playbook, Stage 6 |
| G. Implementation Governance | `decision`, `compliance-assessment`, `architecture-review` skill | Same playbook, Stage 7 |
| H. Architecture Change Management | the [`steady-state-governance`](../../playbooks/steady-state-governance/playbook.md) playbook | Run continuously after H |
| Requirements Management | `requirement` + cross-phase relationships | Always-on across the ADM |

### TOGAF Building Blocks

| TOGAF Building Block | Open Architect equivalent | Notes |
|---|---|---|
| Architecture Building Block (ABB) | `solution` with `kind: logical` (or `solution` at a high abstraction level) | ABBs are design-time; they're solutions before concrete vendor / product choices |
| Solution Building Block (SBB) | `solution` with `kind: physical` + relationships to concrete `application` / `technology-component` artifacts | SBBs realize ABBs with specific tech |
| Reusable ABB | a `solution` referenced from multiple projects, or a `patterns/governance/reference-architecture-adoption.md` adoption record | True reusable assets live as patterns; specific reusable solutions live as solutions referenced from multiple projects |

### TOGAF Repository concepts

| TOGAF concept | Open Architect equivalent | Notes |
|---|---|---|
| Architecture Repository | `.architect/` (capability library) + `workspace/` (project work) | The two together form the working repository |
| Architecture Landscape | the union of `workspace/<project>/` artifacts across active projects | A repository view |
| Reference Library | `.architect/patterns/` + `.architect/method/references/` | Patterns are the reusable design guidance; method references hold ADM and transition guidance |
| Standards Information Base | `.architect/templates/` + `technology-standard` artifacts across projects | The metamodel + active standards |
| Governance Log | `decision` + `compliance-assessment` + `risk` artifacts | The persistent governance record |

## What Doesn't Map Cleanly

- **ADM is a process, not a vocabulary.** The phases describe *when* work happens; Open Architect templates describe *what* the work produces. Use [`.architect/method/references/adm.md`](../../method/references/adm.md) for the process; use this bridge for the vocabulary.
- **ABB vs SBB distinction** lives in `solution.kind` (logical vs physical) plus relationship metadata. Open Architect doesn't enforce a hard split — sometimes the same solution is gradually refined from logical to physical within one artifact.
- **TOGAF Content Metamodel** is conceptually similar to Open Architect's template metamodel but not identical. Open Architect adds explicit lifecycle, evidence, confidence, and ownership truthfulness fields that TOGAF doesn't standardize.
- **TOGAF's deliverable list** (Architecture Definition Document, Architecture Requirements Specification, etc.) isn't directly modeled — those are views composed from the underlying artifacts. The [`review-pack-builder`](../../skills/review-pack-builder.md) and [`delivery-handover-packager`](../../skills/delivery-handover-packager.md) skills assemble similar packaged outputs.
- **TOGAF Architecture Compliance** is broader than `compliance-assessment` — it covers project compliance to the enterprise architecture. Use `compliance-assessment` for the artifact; use the `architecture-review` skill for the activity.

## Recommended Usage Pattern

1. Run the [`full-togaf-adm`](../../playbooks/full-togaf-adm/playbook.md) playbook — it's the implementation form of this bridge.
2. Use the ADM phase → Open Architect artifact table above to know what each phase produces.
3. Treat the chosen project method (`.architect/method/project-method.md`) as the ADM tailoring record.
4. Use the [`architecture-review`](../../skills/architecture-review.md) skill for Architecture Compliance Reviews; record outcomes in `compliance-assessment`.
5. Use the [`review-pack-builder`](../../skills/review-pack-builder.md) skill to assemble TOGAF-style deliverable packs from the underlying artifacts when a formal deliverable is required.
6. Treat ABBs and SBBs as `solution` artifacts at different `kind` levels (logical vs physical); link them with `realizes` relationships.

## Common Confusions

- "Where does TOGAF ADM go?" The *process* lives in [`.architect/method/references/adm.md`](../../method/references/adm.md) and the [`full-togaf-adm`](../../playbooks/full-togaf-adm/playbook.md) playbook. The *artifacts produced* live in the templates listed above. The bridge is the vocabulary translation.
- "I have an ABB — is that a `solution` or an `application`?" If it's a design (logical or physical) you're authoring, it's a `solution`. If it's a system that exists or will exist in the estate, it's an `application`. ABBs are typically `solution` artifacts.
- "Where do TOGAF concerns go?" Inside `stakeholder.concerns`. Concerns travel with the stakeholder rather than as separate artifacts.
- "Open Architect has `principle` and `technology-standard`. Aren't they the same?" No. A principle is a durable rule ("we federate identity, not duplicate it"); a standard is a specific technology decision ("we use OIDC, not SAML, for new integrations"). TOGAF makes the same distinction.
- "What's the equivalent of TOGAF's 'Statement of Architecture Work'?" The combination of `project-config.yaml` + `notes.md` + `architecture-vision` in the project folder. Use the [`project-bootstrapper`](../../skills/project-bootstrapper.md) skill to compose it.
- "What's the equivalent of TOGAF's 'Architecture Contract'?" A combination of `compliance-assessment` (the conformance contract) + `decision` (any granted variances) + `principle` (the architecture rules being signed up to). There is no single artifact.
