# Data Residency and Cross-Border Transfer Control Theme

Use this guide when jurisdiction or sector scope creates explicit expectations
about where data is stored, processed, replicated, backed up, or accessed from.

## Typical Regulation Drivers

- `GDPR`
- `CCPA/CPRA`
- `EU Data Act`
- sector or contract-specific sovereignty obligations

## Architecture Questions

- Which data classes must stay in a region, country, or approved provider
  boundary?
- Do operational logs, backups, analytics copies, or support access cross the
  same boundaries as primary business data?
- Can regional processing be separated without breaking resilience or support
  models?
- Are cross-border transfers visible enough to govern and review?

## Architecture Responses

- Treat residency as an architectural constraint, not just a deployment note.
- Model data location, replication, support access, backup, and analytics flows
  explicitly.
- Keep regional exception handling visible where perfect localization is not
  possible.
- Expect closer coordination between data, security, technology, and governance
  roles.

## Useful Patterns

- `../../patterns/data/data-classification-and-handling.md`
- `../../patterns/data/data-lineage-and-provenance.md`
- `../../patterns/data/data-domain-ownership.md`
- `../../patterns/technology/platform-tenancy-isolation.md`
- `../../patterns/technology/multi-tenancy-data-isolation.md`
