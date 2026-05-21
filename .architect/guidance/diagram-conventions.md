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
5. Create the diagram source in `.architect/architecture/views/`.
6. Link the diagram from the relevant architecture artifacts.
7. Refresh the diagram when architecture changes affect the view.

## Default Storage Pattern

Project-specific diagram sources should live in:

```text
.architect/architecture/views/
```

Recommended file naming:

- `context-<subject>.md`
- `sequence-<subject>.puml`
- `process-<subject>.bpmn`
- `deployment-<subject>.puml`
- `transition-<subject>.md`

Recommended storage rules:

- use Markdown with embedded Mermaid for lightweight views
- use PlantUML when UML sequence, deployment, or more explicit technical notation is helpful
- use BPMN files for controlled business process models
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

## Role Guidance

- `solution-architect`: context, container, interaction, and deployment views
- `business-architect`: capability, process, and business interaction views
- `integration-architect`: sequence and interface views
- `data-architect`: logical data and information flow views
- `technology-architect`: deployment and environment views
- `architecture-governance-lead`: review-ready summary views
