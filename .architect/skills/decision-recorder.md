# Decision Recorder

## Purpose

Capture architecture decisions in a structured, reviewable, and traceable form.

## Use When

- major design choices have been made or are being evaluated
- rationale and tradeoffs need to be preserved
- governance or delivery teams need a durable decision record

## Read First

- `.architect/templates/governance/decision.yaml`
- `.architect/examples/customer-onboarding-modernization/governance/dec-1001-adopt-customer-activation-event-api.yaml`

## Inputs

- decision topic and context
- considered options
- rationale, assumptions, and consequences
- affected architecture artifacts

## Steps

1. State the decision topic in one sentence.
2. Describe the problem and the drivers clearly.
3. Capture the options considered, not just the chosen answer.
4. Record the accepted decision and why it won.
5. Link the decision to the constrained or standardized artifacts.
6. Note consequences that follow for delivery, governance, or transition.
7. Set review timing if the decision may need later re-evaluation.

## Outputs

- `decision` artifacts
- links to impacted solutions, interfaces, standards, risks, or work packages
- explicit rationale and status

## Output Checklist

- the decision can be understood without reopening the whole meeting history
- rejected options are visible
- affected artifacts are linked
- consequences are actionable rather than generic

## Typical Collaboration

- works closely with `solution-architect`, `chief-architect`, and `architecture-governance-lead`
- supports `option-evaluator`, `risk-compliance-assessor`, and `architecture-review`

## Quality Checks

- Avoid writing a decision after implementation has already drifted elsewhere.
- Do not store only the outcome without the rationale.
- Make sure linked requirements and transition artifacts reflect the decision.
