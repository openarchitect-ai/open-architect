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
- `.architect/patterns/governance/standards-exception-management.md`
- `.architect/patterns/governance/waiver-expiry-and-remediation.md`
- `.architect/patterns/governance/governance-review-gate.md`
- `.architect/patterns/governance/reference-architecture-adoption.md`
- `.architect/patterns/security/layered-security-controls.md`
- `.architect/patterns/security/audit-and-tamper-evident-logging.md`
- `.architect/patterns/security/privileged-access-segregation.md`
- `.architect/patterns/security/zero-trust-network-segmentation.md`
- `.architect/patterns/security/break-glass-access.md`
- `.architect/patterns/data/data-classification-and-handling.md`

## Pattern Guidance

- use `standards-exception-management` when non-conformance should be captured as an explicit exception path
- use `waiver-expiry-and-remediation` when temporary waivers need expiry and follow-through
- use `governance-review-gate` when formal checkpoint control should shape review timing
- use `reference-architecture-adoption` when expected reuse or conformance should be assessed against a reference model
- use `layered-security-controls`, `audit-and-tamper-evident-logging`, `privileged-access-segregation`, `zero-trust-network-segmentation`, and `break-glass-access` for stronger control analysis
- use `data-classification-and-handling` when data sensitivity should drive risk or control assessment

## Inputs

- solution and supporting artifacts
- standards, principles, and control expectations
- known design concerns or open issues

## Outputs

- `risk` artifacts
- `compliance-assessment` artifacts
- explicit control, waiver, or exception findings where relevant
- remediation and follow-up actions linked to affected architecture objects

## Output Checklist

- key risks and conformance concerns are explicit
- control expectations are tied to the relevant patterns where useful
- reference-architecture and emergency-access deviations are visible where relevant
- waivers, exceptions, or remediation paths are visible when standards are not met
- follow-up actions are linked back to the affected architecture objects

## Quality Checks

- Do not record risk without naming the affected architecture object or decision context.
- Do not treat every deviation as a permanent exception by default.
- Prefer explicit control patterns over generic security prose.

## Typical Collaboration

- works closely with `security-architect`, `technology-architect`, and `architecture-governance-lead`
- supports `transition-planner` and `architecture-review`
