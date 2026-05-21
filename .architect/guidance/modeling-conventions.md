# Modeling Conventions

This guide defines how architecture artifacts should be modeled when
information is partial, evolving, or spread across multiple sources.

## Core Rule

Do not invent architecture facts to make a template look complete.

If the information is not known, not evidenced, or not yet agreed, record that
state explicitly instead of filling the gap with plausible-sounding detail.

## Modeling Posture

Use progressive elaboration rather than forced completeness:

- create partial but truthful artifacts early
- add detail only when evidence or explicit decisions exist
- prefer a thin, reliable artifact over a rich, speculative one

## Information Types

Agents and architects should separate four kinds of content:

- `fact`: supported by source evidence, an authoritative artifact, or an explicit stakeholder statement
- `assumption`: plausible working hypothesis that is not yet confirmed
- `decision`: an intentional choice that has been made and should be recorded as such
- `open question`: unresolved point that needs clarification before stronger modeling is possible

Do not store assumptions or open questions as if they were settled facts.

## Missing Information Policy

When information is incomplete:

- use `unknown` or `tbd` where a field needs an explicit placeholder
- leave optional fields empty if no reliable value exists
- keep the artifact in `draft` or `proposed` status until evidence improves
- add follow-up items instead of guessing the answer

Never infer owners, environments, interfaces, constraints, dates, or governance
status purely to satisfy a template.

## Assumptions And Open Questions

Use these patterns consistently:

- store assumptions under `notes.assumptions`
- store unresolved gaps under `notes.open_questions`
- store notable evidence gaps under `notes.data_gaps` when helpful

Recommended example:

```yaml
notes:
  assumptions:
    - Customer onboarding remains the initiating business event.
  open_questions:
    - Which team owns end-to-end replay operations after go-live?
  data_gaps:
    - No confirmed production SLA document was available at the time of modeling.
```

These local extensions are allowed even if they are not yet formalized in every
template.

## Relationship Rules

Only create typed relationships that you can justify from evidence, architecture
intent, or an explicit decision.

Prefer:

- a smaller set of strong, meaningful links
- explicit confidence on weaker links
- follow-up actions when the relationship is suspected but unconfirmed

Avoid generic or decorative links that exist only to make the model look
connected.
