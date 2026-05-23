# Diagram Conventions

This guide defines how diagrams should be created, which notations are preferred
for different architecture questions, and how diagram sources should be stored
in the workspace.

## Purpose

Use this guide so architecture diagrams are:

- derived from the structured architecture model
- chosen for a clear purpose and audience
- consistent across projects
- maintainable by people and agents over time

## Core Rules

- Start from the architecture artifacts, not from a blank drawing.
- Choose the simplest notation that answers the question well.
- Prefer text-based diagram sources that can be versioned in the repository.
- Keep each diagram focused on one concern, audience, or review question.
- Link important diagrams from the relevant architecture artifacts using `metadata.references`.
- Update diagrams when requirements, decisions, transitions, or interfaces change.

## How Diagrams Should Be Created

The expected authoring flow is:

1. Identify the question the diagram must answer.
2. Identify the audience for the view.
3. Select the relevant architecture artifacts and relationships.
4. Choose the notation using the selection matrix below.
5. Open the matching starter from [`diagram-starter-views/`](./diagram-starter-views/README.md) and copy it into the project.
6. Create the diagram source in `workspace/<project-name>/views/` for live project work.
7. Replace placeholder artifact IDs with real ones from the project.
8. Link the diagram from the relevant architecture artifacts via `metadata.references`.
9. Refresh the diagram when architecture changes affect the view.

See [`../skills/diagram-author.md`](../skills/diagram-author.md) for the
skill-level procedure, output checklist, and quality checks.

## Default Storage Pattern

Project-specific diagram sources should live in:

```text
workspace/<project-name>/views/
```

Worked example diagrams should live alongside their example project, for example:

```text
.architect/examples/<example-name>/views/
```

Starter templates for each notation category live in:

```text
.architect/guidance/diagram-starter-views/
```

Copy from there into the project's `views/` folder; tailor as needed.

Recommended file naming:

- `context-<subject>.md`
- `container-<subject>.md`
- `sequence-<subject>.puml`
- `deployment-<subject>.puml`
- `data-<subject>.md`
- `process-<subject>.md` (Mermaid swimlane) or `process-<subject>.bpmn` (controlled BPMN)
- `transition-<subject>.md`
- `capability-<subject>.md`
- `value-stream-<subject>.md`

Recommended storage rules:

- use Markdown with embedded Mermaid for lightweight views (context, container, ERD, transition, capability, value-stream, BPMN-ish process)
- use PlantUML when full UML sequence (with notes / returns / async) or deployment (with nested nodes) is needed — Mermaid's support for those is too thin for production use
- use real BPMN files for controlled business process governance where audit semantics matter
- keep filenames short, descriptive, and stable

## Notation Selection Matrix

| Concern | Primary notation | Use when | Notes |
| --- | --- | --- | --- |
| Business process | `BPMN` | the diagram describes flow of work, control points, or handoffs | This is already aligned in `business-process.yaml` for controlled process changes. |
| Solution context | `C4-style` context view | the audience needs system scope, actors, and external dependencies | Treat C4 as a view style rather than a strict modeling language. |
| Solution structure | `C4-style` container or component view | the audience needs bounded solution structure and responsibilities | Best for solution architecture and application collaboration. |
| Runtime interaction | `UML sequence` | timing, orchestration, API calls, or event interactions matter | Prefer when behavior over time is more important than static structure. |
| Data structure | `ERD` or logical data model | the audience needs entities, keys, and important relationships | Keep it architecture-level unless detailed design is explicitly needed. |
| Deployment and environment | `UML deployment` or deployment topology view | hosting boundaries, runtime placement, and environment segmentation matter | Use for production, region, network, and operational boundary views. |
| Transition and roadmap | custom transition view | phased change, waves, dependencies, and interim states matter | Do not force UML when a simpler transition view communicates better. |
| Capability and portfolio view | custom map or heatmap | the question is about business capability, investment, maturity, or estate posture | These are EA views, not standard UML views. |

## Default Authoring Choices

Unless a stronger reason exists, use:

- `BPMN` for business process diagrams
- `C4-style` for solution context and structure diagrams
- `UML sequence` for interface and integration behavior
- `ERD` or logical data model notation for architecture-level data views
- `UML deployment` or deployment topology for environment and runtime views
- custom transition views for roadmap and change sequencing

## What We Are Not Standardizing By Default

The workspace does not currently require one notation for everything.

In particular:

- `ArchiMate` is not the default modeling notation for this workspace today
- `UML` is used selectively where it fits the question
- `BPMN` is used selectively for process modeling

This keeps the workspace template-driven and question-driven instead of forcing
all architecture views into a single notation family.

## Relevance Decision Rule

To decide whether a notation is relevant, ask:

1. What exact question must this diagram answer?
2. Who will read it?
3. Is the concern process, structure, behavior, data, deployment, or transition?
4. Does the audience need formal semantics or just a clear architecture view?
5. Can the team maintain the diagram as the model changes?

If the answer is unclear, prefer the simplest view that remains traceable to the
underlying architecture artifacts.

## Artifact Linking Rule

Important diagrams should be referenced from the related architecture artifacts.

Example:

```yaml
metadata:
  references:
    - type: diagram
      title: Solution Context Diagram
      url: ./views/context-customer-master-modernization.md
```

## Negative-Space Documentation Entities

Diagrams normally render only elements that resolve to an existing
artifact ID — diagram-only "entities" (boxes with no backing artifact)
are otherwise a quality smell. There is one sanctioned exception:
**negative-space-documentation entities**, which surface what is
*deliberately structurally excluded* in a way readers cannot miss.

A negative-space-documentation entity may appear in a diagram when:

- the absence carries architectural intent (a constraint, regulatory
  restriction, decision exclusion) that prose alone would let a reader
  miss
- the entity *traces* to an existing `excluded_attributes` block, or
  to a governing artifact (typically a `decision` that prohibits the
  field, relationship, or component)
- the diagram's "Related Artifacts" footer lists every artifact the
  exclusion traces to, making the trace-back explicit
- the entity is **visually distinguished** so it reads as a
  documentation device, not a real element. Use one of:
  - dashed border / dotted lines
  - italic label
  - explicit `EXCLUDED_BY_<DECISION-ID>` prefix in the entity name
  - a comment block annotating the entity as documentation, not data

Example shape (ERD):

```text
EXCLUDED_BY_DEC_0005 {
  string engineer_identifier "NEVER PRESENT — DEC-0005 Option X"
  string precise_eta          "NEVER PRESENT — DEC-0005 Option X"
  string location             "NEVER PRESENT — DEC-0005 Option X"
}
```

This is the diagram-side equivalent of the `excluded_attributes`
block in `data-object.yaml` v1.2 — same negative-space-documentation
pattern, one structural layer up. Prefer it over silently omitting
the constraint; the reader sees the architecture-as-code from the
view alone, not just from the YAML.

## Role Guidance

- `solution-architect`: context, container, interaction, and deployment views
- `business-architect`: capability, process, and business interaction views
- `integration-architect`: sequence and interface views
- `data-architect`: logical data and information flow views
- `technology-architect`: deployment and environment views
- `architecture-governance-lead`: review-ready summary views
