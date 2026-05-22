# Evidence And Quality

This guide defines how Open Architect treats evidence, confidence, and quality
checks so artifacts remain trustworthy and reviewable.

> **Note on bindings.** This file describes the *narrative principles*
> behind evidence and quality. The *AI behavioral bindings* tied to
> `evidence_required_for_approval`, `traceability_required`, and
> `default_agent_output_status` live in
> [`config/bindings.md`](../config/bindings.md)
> §"Evidence and traceability". Architects read this file for
> understanding; AI agents must also read `bindings.md`
> for what to do.

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

## Agent Behavior Rules

When an agent creates or updates artifacts, it should:

1. Prefer minimal truthful output over speculative completion.
2. Use source-backed facts first.
3. Put uncertainty into assumptions or open questions.
4. Lower confidence when evidence is weak.
5. Ask for clarification through follow-up artifacts or notes rather than inventing answers.
6. Keep decisions separate from requirements and separate both from assumptions.
7. Default new artifacts to `draft` status; reserve stronger statuses for architect-driven transitions. (Governed by `default_agent_output_status` and `allow_agent_auto_approval` — see [`bindings.md`](../config/bindings.md) §4 and §3.)

Good default instruction:

```text
Do not fill missing architecture information by inference unless the inference
is explicitly marked as an assumption with low confidence. If evidence is
missing, record the gap and the follow-up needed instead of inventing content.
```

## Minimum Quality Check

Before considering an artifact usable, confirm:

- the core fact statements are evidenced or explicitly marked as assumptions
- confidence is realistic
- important claims have references where possible
- unresolved gaps are visible
- status does not overstate certainty or approval

If those checks fail, the artifact should be treated as exploratory rather than
authoritative.

## Approval Gates

Two convention flags gate artifact-approval transitions on the
evidence-and-quality dimension:

- **`evidence_required_for_approval`** — gates approval on the
  presence of references in the artifact's `metadata.references`
  field. The intent: an artifact moving to `approved` should be
  defensible.
- **`traceability_required`** — gates approval on the presence of
  upstream `traces-to` references. The intent: an architecture artifact
  is only as trustworthy as the chain back to the requirement,
  objective, or decision it derives from.

For the exact AI behavior when each flag is `true` or `false`, see
[`bindings.md`](../config/bindings.md)
§"Evidence and traceability". The `architecture-review` skill reports
violations of these gates as blocking findings.
