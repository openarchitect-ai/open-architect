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
- `.architect/compliance/README.md`
- `.architect/compliance/gdpr.md`
- `.architect/compliance/hipaa-security-rule.md`
- `.architect/compliance/pci-dss.md`
- `.architect/compliance/ccpa-cpra.md`
- `.architect/patterns/data/README.md`
- `.architect/patterns/data/canonical-data-ownership.md`
- `.architect/patterns/data/master-data-stewardship.md`
- `.architect/patterns/data/cqrs-read-model.md`
- `.architect/patterns/data/reference-data-management.md`
- `.architect/patterns/data/data-replication-and-cache-invalidation.md`
- `.architect/patterns/data/archival-and-retention.md`
- `.architect/patterns/data/data-reconciliation.md`
- `.architect/patterns/data/data-classification-and-handling.md`
- `.architect/patterns/data/master-data-synchronization.md`
- `.architect/patterns/data/data-contract-governance.md`
- `.architect/patterns/data/data-lineage-and-provenance.md`
- `.architect/patterns/data/data-domain-ownership.md`
- `.architect/patterns/data/data-sharing-agreement-governance.md`
- `.architect/patterns/data/regulated-data-access-approval.md`
- `.architect/patterns/data/regulated-data-retention-and-legal-hold.md`
- `.architect/patterns/data/master-reference-data-synchronization.md`
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
- use `data-reconciliation` when migration, coexistence, or replicated views need explicit comparison and discrepancy handling
- use `data-classification-and-handling` when sensitivity levels should drive storage, access, movement, or retention choices
- use `master-data-synchronization` when shared master entities must propagate reliably to multiple consuming systems
- use `data-contract-governance` when producer-consumer expectations for shared data should be explicit and change-controlled
- use `data-lineage-and-provenance` when trust, auditability, or impact analysis depends on showing data origin and transformation
- use `data-domain-ownership` when stewardship and decision rights are unclear across business or system boundaries
- use `data-sharing-agreement-governance` when cross-boundary sharing obligations must be explicit beyond schema and transport
- use `regulated-data-access-approval` when access to sensitive or regulated data needs formal approval and review
- use `regulated-data-retention-and-legal-hold` when disposal, preservation, or investigation obligations shape the design materially
- use `master-reference-data-synchronization` when shared master or reference values must remain aligned across dependent systems

## Regulation Guidance

- use the regulation profiles when data residency, retention, access approval, legal hold, or personal-data handling obligations are likely to shape the model
- prefer explicit regulatory data classifications and ownership boundaries over generic "sensitive data" wording

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
- reconciliation expectations are explicit where multiple data states must align
- data classification and handling expectations are explicit where risk or regulation depends on them
- synchronization expectations are explicit where master data must remain aligned across systems
- data-contract, lineage, and domain-ownership expectations are explicit where trust or cross-team coordination depends on them
- regulated access, legal-hold, or sharing-agreement expectations are explicit where policy or external boundaries depend on them
- related applications, interfaces, requirements, and decisions are linked

## Quality Checks

- Do not confuse physical storage copies with business ownership.
- Do not leave stewardship implicit when multiple systems touch the same object.
- Prefer an explicit data pattern over ambiguous local data handling notes.

## Typical Collaboration

- works closely with `data-architect`, `integration-architect`, and `security-architect`
- supports `risk-compliance-assessor` and `architecture-review`
