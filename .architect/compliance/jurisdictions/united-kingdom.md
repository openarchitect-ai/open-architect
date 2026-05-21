# United Kingdom Jurisdiction Profile

Use this profile when the project operates in the United Kingdom, serves UK
users or customers, or handles data and services that fall under UK-specific
privacy, resilience, identity, or sector obligations.

## Why It Matters

UK regulatory handling often looks similar to EU handling at a high level, but
architects should not assume they are interchangeable. Data transfer, privacy
governance, financial-sector resilience, and public-sector assurance can differ
enough to change architecture decisions.

## Commonly Relevant Regulation Families

- `UK GDPR` or UK privacy obligations derived from GDPR-style controls
- `DORA` where cross-border financial-service dependencies matter
- `NIS2`-adjacent resilience and cyber expectations where UK equivalents or
  contractual obligations shape the architecture
- `PCI DSS`

## Architecture-Relevant Questions

- Does the solution need to separate UK data-handling logic from EU handling?
- Are regional hosting, support, audit, or evidence expectations different for
  UK operations?
- Does the solution support regulated financial, health, education, or public
  services in the UK?
- Do cross-border flows between the UK, EU/EEA, and the U.S. need explicit
  treatment?

## Architecture Implications

- Record UK-relevant data transfer, retention, and oversight assumptions
  explicitly.
- Treat sector overlays as important, especially for financial services and
  public-facing services.
- Avoid hiding UK-vs-EU operational differences inside generic “regional”
  wording if they materially affect control design.

## Review Triggers

- UK-only regulated operations
- Cross-border data movement between the UK and other regions
- Public-service or regulated-financial-service dependencies
- Different incident, reporting, or evidence expectations between UK and EU

## Related Control Themes

- `../controls/data-residency-and-cross-border-transfer.md`
- `../controls/incident-reporting-and-response.md`
- `../controls/audit-and-evidence.md`
