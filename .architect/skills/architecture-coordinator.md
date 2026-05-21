# Architecture Coordinator

## Purpose

Coordinate end-to-end architecture work across framing, modeling, decision,
review, validation, compliance, transition follow-up, and human review gates.

This skill is the orchestration layer for a project or pilot. It does not try to
replace specialist skills. It sequences them, checks handoffs, and keeps the
work coherent.

## Use When

- a new project or pilot needs one coordinating agent or lead role
- multiple skills or specialist roles will contribute to the same architecture slice
- the team needs a single place to track sequence, readiness, blockers, and review gates
- human reviewers need one consolidated progress and handoff view

## Read First

- `.architect/project-config.yaml`
- `.architect/flows/architecture-development.flow.md`
- `.architect/guidance/handoff-contracts.md`
- `.architect/guidance/traceability-rules.md`
- `.architect/guidance/id-and-naming-rules.md`
- `.architect/guidance/human-review-packet.md`
- `.architect/guidance/role-boundaries.md`
- `.architect/guidance/agent-test-scenarios.md`
- `.architect/skills/role-skill-matrix.md`

## Inputs

- project or pilot folder
- current artifact set
- current stage in the architecture flow
- enabled roles and skills
- configured coordinator role and coordinator skill
- known review gates, compliance constraints, and delivery expectations

## Steps

1. Confirm the working slice.
   Identify the project or pilot folder, the in-scope artifacts, and the current delivery stage.
2. Check configuration and boundaries.
   Confirm that enabled roles, templates, skills, compliance scope, and coordinator settings support the work being attempted.
3. Select the next skill sequence.
   Choose the smallest useful next chain, such as framing, requirement normalization, solution modeling, decision capture, review, or transition planning.
   Unless the user explicitly says otherwise, the coordinator should decide
   which skill or specialist role acts next.
4. Define explicit handoff expectations.
   State what each contributing skill should produce, what it must not invent, and where it should stop for review.
5. Track traceability and review readiness.
   Make sure stakeholder, objective, requirement, solution, decision, and change links remain visible enough for review.
6. Trigger validation and review at the right time.
   Require validation after meaningful modeling changes and stop at the configured human review gates.
7. Classify open questions.
   Distinguish `blocking` open questions from `non-blocking` ones.
   A blocking question changes whether the next step can be taken safely or honestly.
   A non-blocking question matters, but the next bounded step can still proceed without pretending the answer is known.
8. Ask the user when blocking open questions require it.
   If project configuration says to ask on blocking open questions, pause and ask the user directly when the next safe step depends on an unresolved answer.
   Do not let those questions stay buried only in summaries if they materially affect routing or design.
9. Maintain a coordination summary.
   Keep one concise view of current stage, completed artifacts, open questions, blockers, pending reviews, and next recommended action.
10. Escalate when needed.
   Route unresolved conflicts, approval ambiguity, or role-boundary tension to `chief-architect` or `architecture-governance-lead`.

## Outputs

- recommended next skill sequence
- explicit handoff instructions for the next work step
- consolidated coordination summary for the project or pilot
- clear statement of current review gate, validation status, and blockers

## Coordination Summary Template

- current slice
- current stage
- artifacts created or updated
- open questions
- assumptions still in force
- validation status
- next required human review gate
- next recommended skill

## Output Checklist

- current work stage is explicit
- next skill sequence is intentional rather than ad hoc
- the next selected role or skill is explicit
- review gates are visible
- traceability gaps are called out
- blockers and unknowns are explicit
- no approval state is implied without review evidence
- blocking open questions are surfaced to the user when configured rather than only logged silently
- non-blocking open questions are carried forward explicitly without stalling safe bounded work

## Typical Collaboration

- usually led by `chief-architect`
- works closely with `architecture-governance-lead`
- coordinates `project-bootstrapper`, `stakeholder-objective-framer`, `requirement-normalizer`, `solution-modeler`, `decision-recorder`, `transition-planner`, and `architecture-review`

## Quality Checks

- Do not let specialist skills drift into unbounded architecture work.
- Do not make the user manually route every step when the project uses a
  default coordinator model.
- Do not skip validation after meaningful artifact changes.
- Do not allow review gates to become implicit.
- Do not hide ambiguity; surface it in the coordination summary.
- Do not keep materially blocking questions inside artifacts only when the project configuration says the user should be asked directly.
- Do not let non-blocking questions silently mutate into assumed facts just to keep the flow moving.
