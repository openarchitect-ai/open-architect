# California Jurisdiction Profile

Use this profile when the solution serves California residents, handles
California consumer data, or exposes business processes that may trigger
California privacy rights and opt-out obligations.

## Why It Matters

California is often the first U.S. state scope architects need to handle
explicitly. It raises stronger requirements around privacy notices, consumer
rights handling, data-sharing decisions, and evidence that the architecture can
support those rights operationally.

## Commonly Relevant Regulation Families

- `CCPA/CPRA`
- `COPPA` when children's data is in scope

## Architecture-Relevant Questions

- Can the system locate, export, delete, or correct consumer-linked data?
- Does the design share personal information with third parties in ways that
  require opt-out handling or contractual controls?
- Are identity verification, consent, and rights-response workflows designed as
  real operating capabilities rather than manual afterthoughts?

## Architecture Implications

- Model subject and household identifiers carefully enough to support rights
  requests.
- Separate operational necessity from optional sharing, profiling, or
  advertising use.
- Keep retention, disclosure, and third-party data-sharing logic visible in
  the architecture.
- Expect tighter collaboration between data, application, security, and
  compliance reviewers.

## Review Triggers

- Consumer rights workflows are missing or underdefined
- Third-party sharing is present but data-use purpose is unclear
- Sensitive personal information is stored without clear access segmentation
- Data lineage is insufficient to support deletion or correction requests

## Related Control Themes

- `../controls/data-protection-and-privacy.md`
- `../controls/audit-and-evidence.md`
