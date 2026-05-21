# Software Products Profile

Use this profile when the architecture targets a product or platform delivered
to customers, partners, or deployers as a software offering rather than only as
an internal business system.

## Why It Matters

Product architectures often need clearer handling of release responsibility,
customer trust, vulnerability management, update paths, AI features,
observability, and supportability across different deployment contexts.

## Commonly Relevant Regulation Families

- `Cyber Resilience Act`
- `EU AI Act` where regulated AI features are present
- accessibility, privacy, and consumer-protection obligations relevant to the
  product market

## Architecture-Relevant Questions

- Is the product customer-operated, vendor-operated, or hybrid?
- Are update, patching, vulnerability, telemetry, and support paths explicit?
- Does the product expose AI capability, personal data, or multi-tenant risk?
- Are customer trust, evidence, and security boundary expectations visible?

## Architecture Implications

- Treat release control, runtime policy, telemetry, and support access as part
  of the core design.
- Keep product boundary, tenant isolation, dependency update, and evidence
  paths visible.
- Expect stronger alignment between architecture, product, security, and
  operations roles.

## Related Control Themes

- `../controls/ai-governance-and-model-risk.md`
- `../controls/data-protection-and-privacy.md`
- `../controls/accessibility-and-inclusive-service-design.md`
- `../controls/audit-and-evidence.md`
