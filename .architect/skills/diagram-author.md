# Diagram Author

## Purpose

Produce architecture diagrams from the modeled artifacts so views stay
aligned with the structured architecture rather than becoming
disconnected drawings.

Diagrams are **views of structured truth**, not parallel models.
Every element in a diagram should resolve to an artifact ID that
exists under `workspace/<project-name>/`. Diagram-only entities (boxes
with no backing artifact) are a quality smell.

## Use When

- a stakeholder needs a visual architecture view for a review, briefing, or onboarding
- existing diagrams need to be updated after architecture, decision, or transition changes
- a transition, option comparison, or solution shape would be clearer visually than in prose
- a review gate requires a coordinated view set

## Read First

- [`.architect/guidance/diagram-conventions.md`](../guidance/diagram-conventions.md) — notation selection matrix, storage rules, authoring flow
- [`.architect/guidance/diagram-starter-views/README.md`](../guidance/diagram-starter-views/README.md) — starter templates per notation category
- the relevant architecture artifacts under `workspace/<project-name>/` (solution, application, application-service, interface, data-object, technology-component, environment, transition-architecture, business-capability, etc.)
- if applicable: the [C4 vocabulary bridge](../guidance/vocabulary-bridges/c4.md) for C4-style views, or the [ArchiMate-Lite](../guidance/vocabulary-bridges/archimate-lite.md) bridge if the team uses ArchiMate

## Inputs

- the artifacts to be visualized
- the **question** the diagram must answer (one sentence)
- the **audience** for the view (one phrase)
- diagramming conventions and any project-specific notation preferences

## Steps

1. **Clarify the question and the audience.** Diagrams that don't answer a specific question for a specific audience are decoration. Write the question down in one sentence before drawing.
2. **Pick the notation.** Use the selection matrix in [`diagram-conventions.md`](../guidance/diagram-conventions.md). Default to Mermaid for context, container, ERD, transition, capability, and value-stream views; default to PlantUML for sequence and deployment views.
3. **Identify the artifacts in scope.** Resolve every element you plan to show to an existing artifact ID. Do not invent diagram-only entities. One sanctioned exception: **negative-space-documentation entities** that surface a structural exclusion (e.g. an `excluded_attributes` block, or a field a decision prohibits). See [`diagram-conventions.md`](../guidance/diagram-conventions.md) §"Negative-Space Documentation Entities" for the rules — the entity must trace to a governing artifact and be visually distinguished as a documentation device.
4. **Open the relevant starter from [`diagram-starter-views/`](../guidance/diagram-starter-views/README.md).** Copy into `workspace/<project-name>/views/` (or `.architect/examples/<name>/views/` for worked examples) with the convention's filename pattern.
5. **Replace placeholders with real artifact IDs and `display_name` values.** Keep the diagram skeleton; fill in the data.
6. **Add a "Related Artifacts" footer.** Every diagram lists the artifact IDs it references so reviewers can navigate.
7. **Link back from artifacts — or defer the sweep.** Add `metadata.references` entries with `type: diagram` on the primary artifacts the view is *about*. This makes the diagram findable from the artifact side, not only the view side. **Scoping note:** for multi-view sets touching many artifacts (a 4-view set referencing 17+ artifacts is a common shape), the back-link sweep is its own sub-task and should be **deferred to a dedicated follow-up turn** rather than tailing the view-production turn — bundling N artifact edits into a view-authoring turn creates a giant compound change that is hard to review. Defer with a clear note in the proposed working-log entry and an entry on the architect-task-list naming the artifacts in scope.
8. **Stop at view fidelity, not completeness.** Diagrams omit detail by design. If everything ends up in the diagram, the question wasn't focused enough.

## Outputs

- a diagram source file in `workspace/<project-name>/views/` (or `.architect/examples/<name>/views/` for worked examples) using the conventional filename pattern
- updated `metadata.references` entries on the artifacts the view is about
- a proposed `working-log.md` entry summarizing what view was added and the question it answers, surfaced for architect approval per `architect_work_auto_update_mode`

## Output Checklist

- [ ] the question and audience are explicit at the top of the diagram source file
- [ ] the notation is appropriate for the question (per the selection matrix)
- [ ] every element resolves to an existing artifact ID
- [ ] the "Related Artifacts" section lists the IDs
- [ ] the file is in the correct location with a conventional filename
- [ ] the relevant artifacts reference the diagram via `metadata.references` — **OR** the back-link sweep is explicitly deferred to a follow-up turn (working-log note + architect-task-list entry naming the artifacts)
- [ ] the diagram omits detail that doesn't serve the question (not exhaustive)
- [ ] any negative-space-documentation entities trace to a governing artifact and are visually distinguished (see [`diagram-conventions.md`](../guidance/diagram-conventions.md) §"Negative-Space Documentation Entities")
- [ ] a working-log entry is proposed

## Boundaries

This skill does **not**:

- create new architecture artifacts (use `solution-modeler`, `application-interface-modeler`, `data-modeler`, etc.)
- decide architecture (use `decision-recorder`, `option-evaluator`)
- produce one-off pretty drawings disconnected from the model

This skill **may**:

- propose `metadata.references` updates on artifacts the diagram visualizes
- recommend starter templates from `diagram-starter-views/`
- recommend follow-up skills (`architecture-review`, `review-pack-builder`) once views are in place

## Typical Collaboration

- works closely with `solution-architect`, `integration-architect`, and `technology-architect`
- complements `architecture-documenter` and `artifact-maintainer`
- paired with `review-pack-builder` when preparing for a review gate

## Quality Checks

- **Diagram-only entities** (boxes with no backing artifact) are a red flag — every element should trace to an ID. The one sanctioned exception is a **negative-space-documentation entity** that visualizes a structural exclusion and traces to a governing artifact; see [`diagram-conventions.md`](../guidance/diagram-conventions.md) §"Negative-Space Documentation Entities" for when this is legitimate vs. a smell.
- **Mixed notations** in one diagram (C4 + UML in the same view) usually mean the question isn't focused.
- **Stale views** that haven't been updated after a relevant decision or transition change should be flagged.
- **Everything-in-one-diagram** is showing nothing. Split into multiple focused views.
- **Decorative diagrams** with no question or audience stated at the top fail the basic test.

## Variations

- **Context-only** — a single C4-style context view for a quick stakeholder briefing.
- **Review-pack set** — produce a coordinated set (context + container + sequence + transition) for a formal review.
- **Transition refresh** — update the transition view after wave or work-package changes.
- **Capability heatmap** — produce or refresh the capability-map view for portfolio-level work.
- **Diagram update only** — refresh existing views after architecture changes without producing new ones.
