# Financial Services Sector Profile

Use this profile when the architecture supports banks, insurers, payment
providers, investment firms, crypto/digital-asset services, or regulated
financial operations.

## Why It Matters

Financial-services architectures usually face stronger expectations for
resilience, incident response, third-party oversight, identity assurance,
record integrity, fraud resistance, and operational recovery.

## Commonly Relevant Regulation Families

- `DORA`
- `FTC Safeguards Rule`
- `SEC Cyber Disclosure Rules`
- `PCI DSS`
- `MiCA` where digital-asset activities apply

## Architecture-Relevant Questions

- Does the solution support a regulated entity or a critical third-party
  service provider?
- Are payment data, financial account data, or customer financial records in
  scope?
- Is resilience evidence, failover design, or recovery-time proof required for
  approval?
- Does the solution rely on outsourced platforms or vendors that require more
  formal oversight?

## Architecture Implications

- Model resilience, failover, recovery, audit trails, and privileged access as
  core design dimensions.
- Keep supplier dependencies, concentration risk, and operational recovery
  assumptions visible.
- Expect stronger linkage between incident handling, evidence retention, and
  governance review.
- Design for controlled change, clear rollback thresholds, and hypercare where
  material customer or market impact exists.

## Related Control Themes

- `../controls/identity-and-access.md`
- `../controls/incident-reporting-and-response.md`
- `../controls/audit-and-evidence.md`
