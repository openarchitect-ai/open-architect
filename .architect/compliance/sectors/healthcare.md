# Healthcare Sector Profile

Use this profile when the architecture supports healthcare delivery,
health-information exchange, healthcare operations, or systems that store or
process protected health information.

## Why It Matters

Healthcare systems often combine sensitive data, life-impacting workflows, and
strong expectations around confidentiality, integrity, availability, and audit
access. Architects should treat security and privacy design as inseparable from
clinical or operational continuity.

## Commonly Relevant Regulation Families

- `HIPAA Security Rule`
- `GDPR` where EU/EEA patient or workforce data is involved
- `CCPA/CPRA` where California consumer rights are relevant

## Architecture-Relevant Questions

- Does the system store protected health information or support regulated care
  or claims workflows?
- Are access decisions granular enough for treatment, operations, and
  administrative roles?
- Is audit logging strong enough to support investigation and accountability?
- Are backup, recovery, downtime, and continuity assumptions explicit?

## Architecture Implications

- Model identity, role-based access, audit, encryption, retention, and secure
  integration as non-optional concerns.
- Design interfaces and data stores with minimum-necessary access in mind.
- Keep emergency access, break-glass behavior, and evidence trails explicit.
- Expect stronger review involvement from security, data, and compliance roles.

## Related Control Themes

- `../controls/data-protection-and-privacy.md`
- `../controls/identity-and-access.md`
- `../controls/audit-and-evidence.md`
