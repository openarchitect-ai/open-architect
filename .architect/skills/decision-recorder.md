# Decision Recorder

## Purpose

Capture architecture decisions in a structured, reviewable, and traceable form.

## Use When

- major design choices have been made or are being evaluated
- rationale and tradeoffs need to be preserved
- governance or delivery teams need a durable decision record

## Read First

- `.architect/templates/governance/decision.yaml`
- `.architect/patterns/README.md`
- `.architect/patterns/governance/architecture-decision-lifecycle.md`
- `.architect/patterns/governance/architecture-principle-lifecycle.md`
- `.architect/patterns/governance/standards-exception-management.md`
- `.architect/patterns/integration/event-driven-integration.md`
- `.architect/patterns/integration/request-response-integration.md`
- `.architect/patterns/integration/batch-integration.md`
- `.architect/patterns/integration/anti-corruption-layer.md`
- `.architect/patterns/integration/outbox-pattern.md`
- `.architect/patterns/application/api-facade.md`
- `.architect/patterns/application/backend-for-frontend.md`
- `.architect/patterns/data/canonical-data-ownership.md`
- `.architect/patterns/security/identity-federation.md`
- `.architect/patterns/security/layered-security-controls.md`
- `.architect/patterns/transition/strangler-modernization.md`
- `.architect/examples/customer-onboarding-modernization/governance/dec-1001-adopt-customer-activation-event-api.yaml`

## Inputs

- decision topic and context
- considered options
- rationale, assumptions, and consequences
- affected architecture artifacts

## Pattern Guidance

- use `architecture-decision-lifecycle` when a decision needs explicit review, supersession, or retirement handling
- use `architecture-principle-lifecycle` when the decision interprets, refines, supersedes, or challenges an enduring principle
- use `standards-exception-management` when the decision records a controlled deviation from a principle or standard

## Steps

1. State the decision topic in one sentence.
2. Describe the problem and the drivers clearly.
3. Capture the options considered, not just the chosen answer.
4. Reference the relevant reusable patterns that informed the option set.
5. Record the accepted decision and why it won.
6. Link the decision to the constrained or standardized artifacts.
7. Note consequences that follow for delivery, governance, or transition.
8. Set review timing if the decision may need later re-evaluation.

## Outputs

- `decision` artifacts
- links to impacted solutions, interfaces, standards, risks, or work packages
- explicit reference to accepted, rejected, or adapted patterns where relevant
- explicit rationale and status

## Output Checklist

- the decision can be understood without reopening the whole meeting history
- rejected options are visible
- the relevant pattern choices or deviations are visible
- exception handling or review timing is visible when governance requires it
- affected artifacts are linked
- consequences are actionable rather than generic

## Typical Collaboration

- works closely with `solution-architect`, `chief-architect`, and `architecture-governance-lead`
- supports `option-evaluator`, `risk-compliance-assessor`, and `architecture-review`

## Quality Checks

- Avoid writing a decision after implementation has already drifted elsewhere.
- Do not store only the outcome without the rationale.
- Make sure linked requirements and transition artifacts reflect the decision.
- If the design departs from a known pattern, state why the deviation is justified.
