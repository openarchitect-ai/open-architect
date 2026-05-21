# Canada Jurisdiction Profile

Use this profile when the project operates in Canada, serves Canadian users or
customers, or processes data that may be subject to Canadian privacy,
residency, public-sector, or sector-specific expectations.

## Why It Matters

Canadian architectures often need explicit thinking about privacy, data
sharing, records handling, cross-border processing, and public-sector
assurance, especially when services span provinces or use providers outside
Canada.

## Commonly Relevant Regulation Families

- Canadian privacy obligations and sector expectations
- public-sector or provincial sovereignty and records constraints
- cross-border transfer and outsourcing expectations

## Architecture-Relevant Questions

- Does the solution process sensitive personal or citizen-linked data?
- Are provincial or public-sector hosting and access expectations in scope?
- Do support, analytics, backup, or vendor operations move data outside
  Canada?
- Are there stronger expectations around data-sharing agreements or access
  approval?

## Architecture Implications

- Keep residency, transfer, records, and vendor-access assumptions explicit.
- Treat public-sector and health-like use cases as likely to need stronger
  evidence and review.
- Avoid collapsing Canadian scope into a generic “North America” model when
  data handling or oversight differs materially.

## Related Control Themes

- `../controls/data-residency-and-cross-border-transfer.md`
- `../controls/data-sharing-and-disclosure-governance.md`
- `../controls/audit-and-evidence.md`
