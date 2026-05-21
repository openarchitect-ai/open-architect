# Stakeholder Objective Framer

## Purpose

Turn project context into structured stakeholder, objective, and vision
artifacts that anchor later architecture work.

## Use When

- the project needs business framing before solution design
- stakeholders, concerns, or outcomes are still described only in prose
- an architecture vision needs to be made explicit

## Read First

- `.architect/templates/business/stakeholder.yaml`
- `.architect/templates/business/objective.yaml`
- `.architect/templates/governance/architecture-vision.yaml`
- `.architect/patterns/business/README.md`
- `.architect/patterns/business/capability-based-planning.md`
- `.architect/patterns/business/business-capability-heatmap.md`
- `.architect/patterns/business/business-capability-roadmapping.md`
- `.architect/patterns/business/capability-funding-alignment.md`
- `.architect/patterns/business/product-operating-model-alignment.md`
- `.architect/patterns/business/value-stream-to-capability-mapping.md`
- `.architect/examples/customer-onboarding-modernization/README.md`

## Inputs

- business problem or initiative brief
- stakeholder notes or workshop output
- expected outcomes, drivers, and constraints

## Steps

1. Identify the sponsor, key business owner, and review forum.
2. Capture the primary business concerns and architecture concerns separately.
3. Convert desired outcomes into measurable objectives.
4. Draft the architecture vision in problem, future-state, and value-proposition form.
5. Use a capability lens when it helps anchor priorities and later roadmap choices.
6. Link stakeholder, objective, and vision artifacts explicitly.
7. Confirm what is in scope and out of scope before solution work starts.

## Pattern Guidance

- use `capability-based-planning` when business capabilities should anchor priorities, scope, or later roadmap choices
- use `business-capability-heatmap` when capability prioritization should be made visible through comparative health, importance, or pain signals
- use `business-capability-roadmapping` when the framing should explicitly support multi-phase capability evolution over time
- use `capability-funding-alignment` when objectives and capability priorities should influence investment framing, not just scope statements
- use `product-operating-model-alignment` when product ownership and operating boundaries materially shape the architecture vision
- use `value-stream-to-capability-mapping` when end-to-end value flow should shape capability priorities or architecture framing

## Outputs

- `stakeholder` artifacts
- `objective` artifacts
- `architecture-vision` artifacts
- linked concerns and expected value statements

## Output Checklist

- at least one sponsor or accountable stakeholder is explicit
- objectives are measurable rather than aspirational only
- the vision names both the problem and the future state
- capability anchors are explicit when the project needs a stable business-planning frame
- capability heatmap or prioritization context is explicit when capability tradeoffs drive the framing
- capability roadmap implications are explicit when the initiative spans staged evolution rather than one release
- funding and operating-model implications are explicit when the architecture vision depends on them
- value-stream context is explicit when the architecture should be framed around delivered value flow
- stakeholder, objective, and vision artifacts are linked
- in-scope and out-of-scope boundaries are visible

## Typical Collaboration

- works closely with `business-analyst` and `business-architect`
- provides inputs to `requirement-normalizer` and `solution-modeler`

## Quality Checks

- Do not confuse project activities with business outcomes.
- Do not leave stakeholder concerns only in meeting notes.
- Prefer one clear architecture vision over several overlapping prose fragments.
