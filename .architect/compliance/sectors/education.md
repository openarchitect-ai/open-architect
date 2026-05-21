# Education Sector Profile

Use this profile when the solution supports schools, universities, student
services, learning systems, student-record processing, or education-oriented
digital products.

## Why It Matters

Education architectures often mix student records, identity flows, parental
rights considerations, and third-party platform use. The architecture needs to
support privacy, role separation, record access controls, and clear data-use
boundaries.

## Commonly Relevant Regulation Families

- `FERPA`
- `COPPA` where children are in scope
- `CCPA/CPRA` where consumer privacy obligations also apply

## Architecture-Relevant Questions

- Does the system handle student education records, grades, attendance, or
  learner analytics?
- Are minors, guardians, or school-authorized representatives part of the
  access model?
- Are third-party learning tools receiving student-linked data?
- Can the solution explain who can access which education records and why?

## Architecture Implications

- Model student identity, guardian/parent interactions, consent boundaries, and
  record access explicitly.
- Treat analytics, sharing, and third-party integrations as governance
  decisions, not just technical connections.
- Keep evidence of access decisions, data-sharing rationale, and retention
  behavior visible.

## Related Control Themes

- `../controls/data-protection-and-privacy.md`
- `../controls/identity-and-access.md`
- `../controls/audit-and-evidence.md`
