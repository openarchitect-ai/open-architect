# Risk Compliance Assessor

## Purpose

Identify architecture risks, control concerns, and conformance issues early
enough to influence design and delivery.

## Use When

- a solution needs security, compliance, or governance review
- standards and principles may not be fully met
- risks need to be recorded and treated explicitly

## Read First

- `.architect/templates/governance/risk.yaml`
- `.architect/templates/governance/compliance-assessment.yaml`
- `.architect/compliance/README.md`
- `.architect/compliance/gdpr.md`
- `.architect/compliance/eu-ai-act.md`
- `.architect/compliance/nis2.md`
- `.architect/compliance/dora.md`
- `.architect/compliance/hipaa-security-rule.md`
- `.architect/compliance/ftc-safeguards-rule.md`
- `.architect/compliance/sec-cyber-disclosure-rules.md`
- `.architect/compliance/pci-dss.md`
- `.architect/compliance/ccpa-cpra.md`
- `.architect/patterns/governance/README.md`
- `.architect/patterns/security/README.md`
- `.architect/patterns/data/README.md`
- `.architect/patterns/governance/architecture-assurance-evidence-trail.md`
- `.architect/patterns/governance/architecture-standard-waiver-board.md`
- `.architect/patterns/governance/decision-authority-matrix.md`
- `.architect/patterns/governance/policy-to-control-traceability.md`
- `.architect/patterns/governance/reference-architecture-conformance-review.md`
- `.architect/patterns/governance/standards-exception-management.md`
- `.architect/patterns/governance/waiver-expiry-and-remediation.md`
- `.architect/patterns/governance/governance-review-gate.md`
- `.architect/patterns/governance/reference-architecture-adoption.md`
- `.architect/patterns/security/layered-security-controls.md`
- `.architect/patterns/security/audit-and-tamper-evident-logging.md`
- `.architect/patterns/security/security-control-inheritance.md`
- `.architect/patterns/security/secrets-breach-response.md`
- `.architect/patterns/security/privileged-session-monitoring.md`
- `.architect/patterns/security/privileged-access-segregation.md`
- `.architect/patterns/security/zero-trust-network-segmentation.md`
- `.architect/patterns/security/break-glass-access.md`
- `.architect/patterns/data/data-sharing-agreement-governance.md`
- `.architect/patterns/data/data-classification-and-handling.md`
- `.architect/patterns/data/regulated-data-access-approval.md`

## Pattern Guidance

- use `standards-exception-management` when non-conformance should be captured as an explicit exception path
- use `waiver-expiry-and-remediation` when temporary waivers need expiry and follow-through
- use `governance-review-gate` when formal checkpoint control should shape review timing
- use `reference-architecture-adoption` when expected reuse or conformance should be assessed against a reference model
- use `architecture-standard-waiver-board` when standards exceptions need a named review forum and lifecycle
- use `reference-architecture-conformance-review` when alignment to the relevant reference architecture should be assessed explicitly
- use `architecture-assurance-evidence-trail` when governance needs stronger traceability from findings to evidence and review outcomes
- use `decision-authority-matrix` when control, exception, or escalation authority is unclear and creates governance risk
- use `policy-to-control-traceability` when higher-level policy intent should be mapped to concrete control expectations
- use `layered-security-controls`, `audit-and-tamper-evident-logging`, `security-control-inheritance`, `privileged-access-segregation`, `privileged-session-monitoring`, `zero-trust-network-segmentation`, `break-glass-access`, and `secrets-breach-response` for stronger control and incident-readiness analysis
- use `data-classification-and-handling`, `regulated-data-access-approval`, and `data-sharing-agreement-governance` when data sensitivity and cross-boundary obligations should shape risk or control assessment

## Regulation Guidance

- use the regulation profiles to determine whether the project has explicit privacy, AI, cyber-resilience, financial, health, public-company disclosure, or payment-security obligations
- do not assume one jurisdiction or act is sufficient when the project spans regions, sectors, or data types
- prefer recording explicit applicability, non-applicability, or uncertainty rather than leaving regulatory scope implicit

## Inputs

- solution and supporting artifacts
- standards, principles, and control expectations
- known design concerns or open issues
- applicable regulations, sectors, and jurisdiction constraints

## Outputs

- `risk` artifacts
- `compliance-assessment` artifacts
- explicit control, waiver, or exception findings where relevant
- remediation and follow-up actions linked to affected architecture objects

## Output Checklist

- key risks and conformance concerns are explicit
- applicable regulations and regulatory uncertainty are explicit
- control expectations are tied to the relevant patterns where useful
- reference-architecture and emergency-access deviations are visible where relevant
- control-inheritance, policy-traceability, and secrets-response assumptions are explicit where relevant
- assurance-evidence and decision-authority expectations are explicit where governance depends on them
- regulated-data access and cross-boundary sharing controls are explicit where relevant
- waivers, exceptions, or remediation paths are visible when standards are not met
- follow-up actions are linked back to the affected architecture objects

## Quality Checks

- Do not record risk without naming the affected architecture object or decision context.
- Do not treat every deviation as a permanent exception by default.
- Prefer explicit control patterns over generic security prose.

## Typical Collaboration

- works closely with `security-architect`, `technology-architect`, and `architecture-governance-lead`
- supports `transition-planner` and `architecture-review`
