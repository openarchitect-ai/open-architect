# Access Recertification and Segregation of Duties Control Theme

Use this guide when the architecture must support periodic access review,
separation of incompatible responsibilities, or stronger proof that elevated
access is justified and governable.

## Typical Regulation Drivers

- financial, healthcare, education, and public-sector assurance expectations
- `HIPAA Security Rule`
- `FTC Safeguards Rule`
- internal control and governance obligations

## Architecture Questions

- Can the system separate standard, privileged, approval, and oversight roles?
- Is recurring access review technically possible with the identity model in
  use?
- Are emergency or temporary access paths controlled and visible?

## Architecture Responses

- Model role boundaries, approval paths, and review evidence explicitly.
- Separate incompatible privileges where material risk exists.
- Treat recertification, revocation, and emergency-access evidence as part of
  the architecture control model.

## Useful Patterns

- `../../patterns/security/privileged-access-segregation.md`
- `../../patterns/security/privileged-session-monitoring.md`
- `../../patterns/security/break-glass-access.md`
- `../../patterns/security/identity-proofing-and-joiner-mover-leaver.md`
