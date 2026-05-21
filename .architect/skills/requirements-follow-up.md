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
- `.architect/flows/requirements-change-coordination.flow.md`
- `.architect/examples/customer-onboarding-modernization/application/req-1001-customer-activation-reliability.yaml`

## Inputs

- existing `requirement` artifacts
- open questions, decisions, and stakeholder feedback
- verification plans and delivery status

## Steps

1. Review requirement lifecycle, approval, and verification status.
2. Identify which requirements are blocked, ambiguous, stale, or weakly linked.
3. Route clarification to the right owner.
   Business ambiguity goes to business owners; solution ambiguity goes to the solution team.
4. Update relationships as the solution and transition artifacts evolve.
5. Confirm whether each changed requirement needs a new decision, work-package update, or transition update.
6. Track verification readiness, not only requirement wording.
7. Publish follow-up actions and due dates into the project cadence.

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
