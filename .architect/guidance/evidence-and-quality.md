# Evidence And Quality

This guide defines how Open Architect treats evidence, confidence, and quality
checks so artifacts remain trustworthy and reviewable.

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
