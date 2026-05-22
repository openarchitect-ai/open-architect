# Requirements Follow-Up

## Purpose

Coordinate the ongoing clarification, approval, traceability, and verification
follow-up needed to keep architecture requirements actionable over time.

## Use When

- new requirements arrive after initial modeling has started
- existing requirements are ambiguous, blocked, or unapproved
- verification progress needs to be tracked through delivery and governance

## Read First

- `.architect/templates/application/requirement.yaml`
- `.architect/examples/customer-onboarding-modernization/application/req-1001-customer-activation-reliability.yaml`

## Inputs

- existing `requirement` artifacts
- open questions, decisions, and stakeholder feedback
- verification plans and delivery status

## Steps

1. Capture the new or changed requirement input from source material, stakeholder feedback, or working notes.
2. Normalize and classify the requirement change so its type (functional, non-functional, security, regulatory) and lifecycle stance are explicit.
3. Identify which requirements are blocked, ambiguous, stale, or weakly linked, and assign clarification ownership.
   Business ambiguity goes to business owners; solution ambiguity goes to the solution team.
4. Assess impact on solution, interfaces, data, technology, and transition state.
5. Record or update architecture decisions where the change materially affects direction. Route to `decision-recorder` when warranted.
6. Update relationships as solution and transition artifacts evolve so traceability remains explicit.
7. Update gaps, transition architectures, and work packages where the change shifts what must be delivered.
8. Review risk, compliance, and delivery readiness implications. Route to `risk-compliance-assessor` when material.
9. Publish follow-up actions, due dates, and governance status into the project cadence.

## Outputs

- updated `requirement` artifacts with clearer lifecycle, approval, and verification status
- explicit follow-up actions, open questions, and ownership expectations
- stronger links from requirements to solutions, decisions, interfaces, and work packages

## Output Checklist

- requirement status reflects reality
- changed requirements have visible downstream impact
- verification follow-up is explicit
- no critical requirement is left orphaned from the solution or transition plan

## Typical Collaboration

- works closely with `business-analyst` and `solution-architect`
- supports `relationship-mapper`, `decision-recorder`, `change-coordinator`, and `architecture-review`

## Quality Checks

- Do not let requirements remain approved if the delivery path materially changed.
- Do not track follow-up only in separate meeting notes.
- Prefer updating the requirement artifact and linked objects together.
