# Conventions

This guide defines the default modeling conventions for Open Architect projects.
Its main purpose is to help humans and agents produce architecture artifacts
that are traceable, honest about uncertainty, and safe from speculative
completion.

## Core Rule

Do not invent architecture facts to make a template look complete.

If the information is not known, not evidenced, or not yet agreed, record that
state explicitly instead of filling the gap with plausible-sounding detail.

## Modeling Posture

Use progressive elaboration rather than forced completeness:

- create partial but truthful artifacts early
- add detail only when evidence or explicit decisions exist
- prefer a thin, reliable artifact over a rich, speculative one

## Information Types

Agents and architects should separate four kinds of content:

- `fact`: supported by source evidence, an authoritative artifact, or an explicit stakeholder statement
- `assumption`: plausible working hypothesis that is not yet confirmed
- `decision`: an intentional choice that has been made and should be recorded as such
- `open question`: unresolved point that needs clarification before stronger modeling is possible

Do not store assumptions or open questions as if they were settled facts.

## Missing Information Policy

When information is incomplete:

- use `unknown` or `tbd` where a field needs an explicit placeholder
- leave optional fields empty if no reliable value exists
- keep the artifact in `draft` or `proposed` status until evidence improves
- add follow-up items instead of guessing the answer

Never infer owners, environments, interfaces, constraints, dates, or governance
status purely to satisfy a template.

## Evidence Rules

Every non-obvious claim should be supportable by evidence.

Expected evidence sources include:

- stakeholder interviews or workshop outputs
- existing architecture artifacts
- delivery documents or backlog items
- standards, policies, or regulatory sources
- diagrams or system inventories
- explicit user instructions in the working session

Use `metadata.references` to point to the strongest available source.

If no evidence exists yet:

- lower the confidence level
- mark the item as an assumption or open question
- avoid presenting it as finalized architecture fact

## Confidence Rules

Use `metadata.confidence` deliberately:

- `low`: inferred working position, partial evidence, or unresolved ambiguity
- `medium`: reasonable evidence exists, but some important detail is still unconfirmed
- `high`: supported by authoritative evidence or explicit owner confirmation

Do not use `high` confidence when the content is based on agent inference alone.

Relationship confidence should follow the same rule. If a relationship is
possible but not evidenced, either lower confidence or do not model it yet.

## Assumptions And Open Questions

Use these patterns consistently:

- store assumptions under `notes.assumptions`
- store unresolved gaps under `notes.open_questions`
- store notable evidence gaps under `notes.data_gaps` when helpful

Recommended example:

```yaml
notes:
  assumptions:
    - Customer onboarding remains the initiating business event.
  open_questions:
    - Which team owns end-to-end replay operations after go-live?
  data_gaps:
    - No confirmed production SLA document was available at the time of modeling.
```

These local extensions are allowed even if they are not yet formalized in every
template.

## Status Rules

Use lifecycle and approval fields to reflect certainty honestly:

- early or partial artifacts should normally remain `draft`, `proposed`, or equivalent
- do not mark architecture content as `approved` unless the relevant authority has actually approved it
- do not mark requirements as `verified` unless verification evidence exists

Status must reflect reality, not intent.

## Relationship Rules

Only create typed relationships that you can justify from evidence, architecture
intent, or an explicit decision.

Prefer:

- a smaller set of strong, meaningful links
- explicit confidence on weaker links
- follow-up actions when the relationship is suspected but unconfirmed

Avoid generic or decorative links that exist only to make the model look
connected.

## Agent Behavior Rules

When an agent creates or updates artifacts, it should:

1. Prefer minimal truthful output over speculative completion.
2. Use source-backed facts first.
3. Put uncertainty into assumptions or open questions.
4. Lower confidence when evidence is weak.
5. Ask for clarification through follow-up artifacts or notes rather than inventing answers.
6. Keep decisions separate from requirements and separate both from assumptions.

Good default instruction:

```text
Do not fill missing architecture information by inference unless the inference
is explicitly marked as an assumption with low confidence. If evidence is
missing, record the gap and the follow-up needed instead of inventing content.
```

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

## Naming And ID Guidance

Document project-specific conventions here as needed, including:

- naming conventions
- ID patterns
- environment naming
- relationship patterns
- approved terminology

## Minimum Quality Check

Before considering an artifact usable, confirm:

- the core fact statements are evidenced or explicitly marked as assumptions
- confidence is realistic
- important claims have references where possible
- unresolved gaps are visible
- status does not overstate certainty or approval

If those checks fail, the artifact should be treated as exploratory rather than
authoritative.
