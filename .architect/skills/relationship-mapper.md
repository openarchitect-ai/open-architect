# Relationship Mapper

## Purpose

Strengthen traceability by converting loose references into explicit typed
relationships between architecture artifacts.

## Use When

- artifacts exist but are weakly connected
- traceability needs to become queryable and reviewable
- a project must show how requirements, solutions, interfaces, data, and change items relate

## Read First

- `.architect/templates/agents.md`
- `.architect/examples/customer-onboarding-modernization/README.md`

## Inputs

- existing architecture artifacts across domains
- known dependencies, realizations, impacts, and ownership links

## Steps

1. Identify the core path you need to make traceable.
   For example: stakeholder -> objective -> requirement -> solution -> work-package.
2. Review each artifact for implicit links currently buried in prose.
3. Convert those links into typed `relationships`.
4. Use the strongest accurate relationship type you have rather than a generic link.
5. Add reciprocal or complementary links where they materially improve navigation and reasoning.
6. Re-check impact paths after decisions or requirements change.

## Outputs

- normalized `relationships` arrays across artifacts
- clearer end-to-end traceability
- explicit impact paths for review and transition planning

## Output Checklist

- critical artifacts are not isolated
- relationship types are meaningful
- traceability from requirements to delivery is visible
- impact analysis can follow real links instead of guesswork

## Typical Collaboration

- supports almost every role
- is especially important for `solution-architect`, `integration-architect`, and `architecture-governance-lead`

## Quality Checks

- Avoid vague links when a better semantic relationship exists.
- Do not create links you cannot justify from evidence or architecture intent.
- Prefer a smaller number of high-value links over a large number of weak ones.
