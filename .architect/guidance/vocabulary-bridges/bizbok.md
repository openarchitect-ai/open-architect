# BIZBOK Bridge

## Purpose

Help business architects who use the [Business Architecture Body of
Knowledge (BIZBOK)](https://www.businessarchitectureguild.org/) adopt
Open Architect's structured backbone without abandoning the BIZBOK
vocabulary their stakeholders already understand.

## When To Use This Bridge

- the team works with business architects trained in BIZBOK
- the engagement leads with capability maps, value streams, information
  maps, or organization maps before touching application or technology
- business-architecture artifacts (capability heatmaps, value-stream
  alignment, strategy mapping) are primary stakeholder outputs

## Concept Mapping

| BIZBOK concept | Open Architect equivalent | Notes |
|---|---|---|
| Business capability | `business-capability` | One-to-one. BIZBOK's hierarchical levels (L1, L2, L3, …) map to `business-capability` artifacts linked via `parent`/`child` relationships |
| Capability map (Level 0/1) | a view under `workspace/<project>/views/` | The view references the capability artifacts; the YAML is the truth |
| Value stream | `business-process` + the [`value-stream-to-capability-mapping`](../../patterns/business/value-stream-to-capability-mapping.md) pattern | BIZBOK value streams are stage-based; model each stage as a `business-process` with relationships to the capabilities each stage enables |
| Value stream stage | a `business-process` (with `parent` linking it to the overall value stream) | Stages are processes themselves; the value stream is their parent |
| Information concept | `data-object` (with `classification: business`) | BIZBOK information concepts are business-level data; technology-level data shapes still live in `data-object` but with implementation metadata |
| Information map | a view referencing data-objects + capability-to-information relationships | Same rule — diagram is presentation |
| Organization unit | `organization` | One-to-one |
| Stakeholder | `stakeholder` (with concerns and influence) | BIZBOK treats stakeholders lightly; Open Architect carries explicit concerns |
| Strategy (objectives, drivers) | `objective` + `architecture-vision` | Drivers become objectives; the synthesized direction becomes `architecture-vision` |
| Course of action / Initiative | `initiative` | One-to-one |
| Heatmap / scoring (invest / tolerate / migrate / eliminate) | the [`application-invest-tolerate-migrate-eliminate`](../../patterns/business/application-invest-tolerate-migrate-eliminate.md) pattern + `decision` artifacts | The scoring rationale lives in `decision`; the visualization is a view |
| Capability-to-application mapping | `realizes-capability` relationship on `application` | Open Architect typed relationships make this queryable rather than diagram-only |
| Capability-based planning | the `capability-based-planning` playbook + [`capability-based-planning`](../../patterns/business/capability-based-planning.md) pattern | Use the playbook end-to-end; it's BIZBOK-aligned |

## What Doesn't Map Cleanly

- **BIZBOK's capability levels** can run deep (L4, L5+). Open Architect models capabilities at the level the engagement actually uses — usually L1-L3. Going deeper without need creates artifact churn; record only the levels stakeholders reference.
- **BIZBOK's strategy mapping** (drivers → objectives → strategies → courses of action) doesn't have a single Open Architect template. Use `objective` + `architecture-vision` + `initiative` together, linked by relationships, to represent the same flow.
- **BIZBOK's product map and policy map** aren't first-class Open Architect concepts. Use the [`product-vs-platform-boundary`](../../patterns/business/product-vs-platform-boundary.md) pattern for product framing; record policies as `principle` or `compliance-assessment` artifacts depending on whether they're internal or regulatory.
- **BIZBOK's "value item" / "value proposition"** has no direct template. Record it as a field in the relevant `business-capability` or `business-process` description, or as part of `architecture-vision`.

## Recommended Usage Pattern

1. Start with capabilities. Create `business-capability` artifacts at L1-L2; expand only where the engagement needs detail.
2. Model value streams as `business-process` artifacts; link each stage to the capabilities it enables using `realizes-capability` or `enables-capability` relationships.
3. Use the [`value-stream-to-capability-mapping`](../../patterns/business/value-stream-to-capability-mapping.md) pattern as the structural template.
4. For investment direction per capability, use the [`application-invest-tolerate-migrate-eliminate`](../../patterns/business/application-invest-tolerate-migrate-eliminate.md) pattern; record the scoring rationale in `decision` artifacts.
5. Use the `capability-based-planning` playbook for end-to-end engagements; it's already BIZBOK-aligned in shape.
6. Treat capability and value-stream diagrams as **presentations** of the structured YAML, not as parallel truths.

## Common Confusions

- "Where do value streams go?" There is no `value-stream` template — model each stage as a `business-process` with a parent `business-process` representing the overall stream. The [`value-stream-to-capability-mapping`](../../patterns/business/value-stream-to-capability-mapping.md) pattern is the structural reference.
- "BIZBOK has its own information map — do I still need `data-object`?" Yes. Information concepts and data objects use the same template; BIZBOK's information-map view is generated from those artifacts plus the capability-to-information relationships.
- "Should a BIZBOK capability be `business-capability` or `business-process`?" Capability = stable ability ("Customer Onboarding"). Process = how it's currently done ("Onboard via Web, Phase 2"). Capabilities are durable; processes change as operations evolve.
- "BIZBOK's stakeholder model is lighter than Open Architect's." That's deliberate. Carry the stakeholder concerns explicitly so AI reviewers can check that solutions address them. Concerns are too easy to lose otherwise.
