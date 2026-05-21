# Data Protection and Privacy Control Theme

Use this guide to translate privacy and data-protection obligations into
architecture-relevant control expectations.

## Typical Regulation Drivers

- `GDPR`
- `CCPA/CPRA`
- `HIPAA Security Rule`
- `COPPA`
- `FERPA`
- `EU Data Act`

## Architecture Questions

- What regulated or sensitive data classes are in scope?
- Why is each class collected, stored, processed, shared, or retained?
- Can the system support rights handling, correction, deletion, or export where
  required?
- Are transfer, residency, and third-party sharing boundaries explicit?

## Architecture Responses

- Classify data and make purpose, retention, and sharing rules visible.
- Separate optional from necessary processing.
- Model subject identifiers, lineage, and data ownership so rights workflows are
  technically possible.
- Record where privacy-sensitive data crosses applications, regions, or vendor
  boundaries.

## Useful Patterns

- `../../patterns/data/data-classification-and-handling.md`
- `../../patterns/data/data-lineage-and-provenance.md`
- `../../patterns/data/data-domain-ownership.md`
- `../../patterns/data/data-sharing-agreement-governance.md`
- `../../patterns/data/regulated-data-retention-and-legal-hold.md`
