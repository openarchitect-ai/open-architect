# Audit and Evidence Control Theme

Use this guide when the architecture needs to support traceability, audit,
assurance review, decision evidence, or control-verification expectations.

## Typical Regulation Drivers

- `HIPAA Security Rule`
- `SEC Cyber Disclosure Rules`
- `FTC Safeguards Rule`
- `DORA`
- `PCI DSS`

## Architecture Questions

- Can the architecture explain who approved what, on what basis, and with which
  evidence?
- Are operational logs, security events, decision records, and control evidence
  retained in a reviewable way?
- Is the audit trail strong enough for internal review, external audit, or
  regulatory inquiry?

## Architecture Responses

- Treat evidence capture as an architectural concern, not just a process note.
- Keep logs, decision records, access evidence, and control-traceability
  artifacts visible.
- Make retention, immutability, provenance, and review access explicit where
  material.

## Useful Patterns

- `../../patterns/security/audit-and-tamper-evident-logging.md`
- `../../patterns/governance/architecture-assurance-evidence-trail.md`
- `../../patterns/governance/decision-evidence-packaging.md`
- `../../patterns/governance/policy-to-control-traceability.md`
- `../../patterns/governance/reference-architecture-conformance-review.md`
