# United States Jurisdiction Profile

Use this profile when the project operates in the United States, serves U.S.
customers or users, or processes data governed by U.S. sector-specific and
state-specific obligations.

## Why It Matters

The U.S. model is less uniform than the EU model. Architects often need to
reason about a combination of federal, state, sector, and contractual
obligations rather than one single horizontal privacy regime.

## Commonly Relevant Regulation Families

- `HIPAA Security Rule`
- `FTC Safeguards Rule`
- `SEC Cyber Disclosure Rules`
- `PCI DSS`
- `COPPA`
- `FERPA`
- `CCPA/CPRA` when California residents are in scope

## Architecture-Relevant Questions

- Is the solution in a regulated sector such as healthcare, education,
  financial services, or payment processing?
- Does the solution handle children's data, student records, payment card
  data, or sensitive consumer information?
- Is the organization public-company-facing or otherwise subject to strong
  cyber-governance and incident-disclosure expectations?
- Does the solution operate across multiple U.S. states with different privacy
  obligations?

## Architecture Implications

- Model sector-specific controls explicitly rather than assuming a universal
  rule set.
- Separate public data, confidential business data, regulated personal data,
  and sector-specific record classes.
- Expect stronger emphasis on auditability, security controls, incident
  processes, and third-party oversight.
- Capture state-specific privacy duties where the project handles consumer
  rights, targeted advertising, or sale/sharing constraints.

## Review Triggers

- Healthcare, financial, education, or payments scope
- Consumer privacy rights across multiple states
- Material incident escalation and disclosure sensitivity
- Third-party processors handling regulated data classes

## Related Sector Guides

- `../sectors/financial-services.md`
- `../sectors/healthcare.md`
- `../sectors/education.md`
