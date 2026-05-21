# Governance Conventions

This guide defines the default human-in-the-loop and approval behavior for Open
Architect work.

## Human In The Loop Rules

Open Architect should operate on the principle:

- agents may draft
- humans approve

Agents can propose:

- new or updated artifacts
- relationships
- diagrams
- requirement clarifications
- draft decisions
- draft transition changes

Agents should not silently finalize:

- approval status changes to `approved`, `accepted`, or equivalent
- governance position changes
- major scope changes
- key ownership assignments
- material decision outcomes
- verification or compliance status claims without evidence

## Human Review Gates

Human review should normally occur at these checkpoints:

- project bootstrap and scope alignment
- first requirement baseline
- first coherent solution direction
- every major architecture decision
- governance or review-pack submission
- transition architecture and roadmap approval

If the work touches one of these gates, agents should stop and present a review
summary rather than continue as if approval already exists.

## Review Summary Pattern

Before handoff to a human reviewer, the agent should summarize:

- what changed
- which artifacts were added or updated
- what is evidenced
- what is assumed
- what remains unknown
- what requires approval or rejection
- recommended next action

This keeps the human review focused on meaningful deltas rather than forcing a
full re-read of every artifact.

## Approval And Status Rules

Unless a project explicitly overrides the rule:

- agent-created artifacts should default to `draft` or `proposed`
- only a human approver should move critical artifacts to `approved`, `accepted`, or `verified`
- if evidence weakens or scope changes materially, approval status should be reconsidered

An agent may prepare the status recommendation, but a human should confirm the
state transition at the checkpoint.

## Escalation Triggers

Agents should pause for human input when:

- a new decision materially changes scope or architecture direction
- two plausible interpretations exist and the difference matters
- a required owner or approver is unknown
- evidence conflicts across sources
- a requirement, risk, or compliance issue could materially affect delivery
- approval would be needed to continue safely

When one of these triggers occurs, the agent should record the issue explicitly
instead of choosing a path silently.
