# Requirement Normalizer

## Purpose

Turn mixed project inputs into a structured set of architecture requirements,
constraints, assumptions, and quality expectations.

## Use When

- requirements exist in emails, notes, user stories, or mixed prose
- architecture-relevant constraints need to be separated from noise
- the solution team needs an authoritative requirement baseline

## Read First

- `.architect/templates/business/requirement.yaml`
- `.architect/guidance/conventions.md`
- `.architect/guidance/modeling-conventions.md`
- `.architect/guidance/evidence-and-quality.md`
- `.architect/guidance/lifecycle-and-dates.md`
- `.architect/examples/customer-onboarding-modernization/business/req-1001-customer-activation-reliability.yaml`

## Inputs

- business requirements
- non-functional expectations
- regulatory or security constraints
- assumptions and open questions

## Steps

1. Gather all requirement-like inputs.
   Include business asks, non-functional constraints, regulatory rules, and delivery assumptions.
2. Separate requirements from decisions and open issues.
3. Classify each requirement.
   Use requirement type, category, priority, and criticality deliberately.
4. Write fit criteria and constraints in concrete, testable form.
5. Assign business owner, requirement owner, and verification owner.
6. Link the requirement to the relevant solution, interface, service, decision, or work package.
7. Leave unresolved ambiguity as open assumptions or follow-up, not hidden prose.

## Outputs

- `requirement` artifacts
- categorized constraints and assumptions
- traceable links from requirements to stakeholders, objectives, and solutions

## Output Checklist

- each requirement has a clear statement and fit criteria
- ownership is explicit
- verification intent is present
- the requirement is linked to the architecture objects it constrains
- ambiguity is surfaced rather than buried

## Typical Collaboration

- works closely with `business-analyst` and `solution-architect`
- provides inputs to `solution-modeler`, `decision-recorder`, and `architecture-review`

## Quality Checks

- Avoid vague phrases like `must be performant` without measurable fit criteria.
- Do not mix implementation design into the requirement unless it is truly a constraint.
- Ensure changed requirements can later be tracked by `requirements-follow-up`.
