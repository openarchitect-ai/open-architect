# EU / EEA Jurisdiction Profile

Use this profile when the project operates in the European Union or European
Economic Area, serves EU/EEA users, processes EU/EEA personal data, or depends
on regulated digital products or critical services in that region.

## Why It Matters

Architects should assume that EU/EEA work often brings stronger expectations
around privacy, AI governance, cybersecurity, operational resilience, digital
identity trust, accessibility, and cross-border data movement.

## Commonly Relevant Regulation Families

- `GDPR`
- `EU AI Act`
- `NIS2`
- `DORA`
- `Cyber Resilience Act`
- `EU Data Act`
- `eIDAS / European Digital Identity Framework`

## Architecture-Relevant Questions

- Does the solution process personal data of people in the EU/EEA?
- Does the solution support an AI use case that may fall into prohibited,
  high-risk, or transparency-regulated categories?
- Does the solution support an essential or important entity, or a financial
  service subject to resilience obligations?
- Does the solution use digital identity, qualified trust services, electronic
  signatures, or wallet-based authentication?
- Do data flows leave the EU/EEA or depend on non-EU processors or platforms?

## Architecture Implications

- Model data protection, minimization, retention, and transfer constraints
  explicitly.
- Treat identity, audit, incident response, resilience, and supplier
  dependencies as first-class concerns.
- Record whether the solution requires regional hosting, transfer controls, or
  evidence of lawful processing.
- Expect stronger traceability between business purpose, data handling, AI use,
  and control design.

## Review Triggers

- Cross-border transfer of personal or sensitive data
- High-risk or externally facing AI capability
- Critical-service or regulated-financial-service dependency
- Use of digital identity, trust services, or cross-border sign-on
- Product features that may fall under cybersecurity-by-design obligations

## Related Control Themes

- `../controls/data-protection-and-privacy.md`
- `../controls/identity-and-access.md`
- `../controls/incident-reporting-and-response.md`
- `../controls/audit-and-evidence.md`
