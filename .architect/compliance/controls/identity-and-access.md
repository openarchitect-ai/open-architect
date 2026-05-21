# Identity and Access Control Theme

Use this guide when regulation scope drives stronger expectations around human
and workload identity, privileged access, emergency access, federation, or
access review.

## Typical Regulation Drivers

- `eIDAS / European Digital Identity Framework`
- `HIPAA Security Rule`
- `FTC Safeguards Rule`
- `NIS2`
- `DORA`

## Architecture Questions

- Who or what needs access, and how is trust established?
- Are privileged, emergency, partner, and machine identities handled
  differently where needed?
- Can the architecture support recertification, segregation of duties, and
  evidence of access decisions?

## Architecture Responses

- Make authentication, authorization, federation, privileged-access, and
  workload-identity design explicit.
- Separate standard, privileged, emergency, and external-party access paths.
- Design for periodic review, revocation, audit, and incident containment.

## Useful Patterns

- `../../patterns/security/identity-federation.md`
- `../../patterns/security/service-to-service-identity.md`
- `../../patterns/security/break-glass-access.md`
- `../../patterns/security/privileged-access-segregation.md`
- `../../patterns/security/privileged-session-monitoring.md`
- `../../patterns/security/workload-identity-federation.md`
