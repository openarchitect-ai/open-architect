# Data Modeler

## Purpose

Define the key business data objects, ownership, exchange points, and
classification concerns that matter to the architecture.

## Use When

- project data concepts are unclear or inconsistent
- canonical data objects need to be established
- integration and compliance depend on clear data semantics

## Read First

- `.architect/templates/data/data-object.yaml`
- `.architect/patterns/data/canonical-data-ownership.md`
- `.architect/patterns/data/master-data-stewardship.md`
- `.architect/patterns/data/cqrs-read-model.md`
- `.architect/patterns/data/reference-data-management.md`
- `.architect/patterns/data/data-replication-and-cache-invalidation.md`
- `.architect/patterns/data/archival-and-retention.md`
- `.architect/examples/customer-onboarding-modernization/data/do-1001-customer-profile.yaml`

## Inputs

- business concepts
- integration requirements
- source systems and data flows
- classification and stewardship expectations

## Steps

1. Identify the core business data objects that matter to the project outcome.
2. Confirm ownership, stewardship, and source-of-truth expectations for each important object.
3. Choose the most relevant data pattern before inventing local conventions.
4. Model exchange points, quality expectations, sensitivity, and lifecycle assumptions explicitly.
5. Link data objects to the driving applications, interfaces, requirements, and decisions.

## Pattern Guidance

- use `canonical-data-ownership` when source-of-truth ownership must be clarified
- use `master-data-stewardship` when lifecycle, stewardship, and quality control need stronger governance
- use `cqrs-read-model` when read concerns should be optimized separately from write ownership
- use `reference-data-management` when shared codes, classifications, or lookup values must stay consistent across systems
- use `data-replication-and-cache-invalidation` when copies or caches create freshness and correctness concerns
- use `archival-and-retention` when lifecycle, retention, or disposal rules matter materially

## Outputs

- `data-object` artifacts
- explicit data ownership or stewardship model choices
- linked ownership and usage relationships
- structured notes on sensitivity, quality, and lifecycle expectations

## Output Checklist

- important business data objects are named and bounded clearly
- ownership and stewardship are visible
- chosen data patterns match the project need
- reference-data governance is explicit where shared code sets or classifications matter
- replication, freshness, retention, or disposal expectations are explicit where relevant
- related applications, interfaces, requirements, and decisions are linked

## Quality Checks

- Do not confuse physical storage copies with business ownership.
- Do not leave stewardship implicit when multiple systems touch the same object.
- Prefer an explicit data pattern over ambiguous local data handling notes.

## Typical Collaboration

- works closely with `data-architect`, `integration-architect`, and `security-architect`
- supports `risk-compliance-assessor` and `architecture-review`
