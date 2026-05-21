# Traceability Rules

This guide defines the minimum traceability expectations for Open Architect.

## Core Rule

Architecture artifacts should form an explainable chain from business intent to
delivery change.

The default minimum chain is:

- `stakeholder -> objective -> requirement -> solution -> decision -> transition-architecture -> work-package`

Not every project starts with every artifact, but the chain should become more
complete over time rather than less complete.

## Minimum Required Traceability

For the common project-delivery path, ensure:

- each `objective` is linked to at least one `stakeholder` or `architecture-vision`
- each `requirement` is linked to at least one `objective`, `solution`, `decision`, or `work-package`
- each `solution` is linked to its driving `requirement` set
- each `decision` is linked to impacted solution, interface, data, or transition artifacts
- each `transition-architecture` is linked to the initiative, decision, or gap driving it
- each `work-package` is linked to the transition architecture or gap it addresses

## Traceability Questions

Reviewers and agents should be able to answer:

- why does this artifact exist
- what upstream concern or objective does it serve
- what downstream design or delivery element does it affect
- which decisions or risks change its meaning

If those questions cannot be answered, traceability is too weak.

## Preferred Relationship Direction

Prefer typed relationships that express meaning clearly, for example:

- `articulates-objective`
- `constrained-by-requirement`
- `traced-to-decision`
- `realizes-transition-architecture`
- `addressed-by`

Avoid using weak catch-all semantics when a clearer relationship is available.

## Review Expectations

Traceability is considered weak when:

- a requirement is approved but not linked to solution or delivery artifacts
- a decision exists without any visible impact links
- a work package exists without a parent transition or gap context
- a solution claims scope that is not tied to business or requirement drivers

## Agent Rule

When an artifact is created or updated, the agent should ask:

- what drives this artifact
- what does this artifact constrain, realize, or change

If the answer is not yet known, the agent should record the missing traceability
explicitly instead of inventing it.
