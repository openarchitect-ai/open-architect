# Human Review Packet

This guide defines the standard packet an agent should prepare when handing work
to a human reviewer.

## Purpose

Human review should focus on meaningful deltas, not force the reviewer to
reverse-engineer what changed.

## Required Packet Contents

Every review packet should include:

- `review_type`
  - for example `requirement-baseline`, `solution-direction`, `decision-approval`, `governance-review`
- `scope`
  - what project slice or concern is under review
- `changed_artifacts`
  - artifact IDs or paths added or updated
- `evidence_summary`
  - what is evidenced and by which sources
- `assumptions`
  - what is still based on working assumptions
- `open_questions`
  - what remains unresolved
- `validation_summary`
  - validator used plus `VALIDATION_SUMMARY` line
- `approval_requested`
  - what exact approval, rejection, or clarification is needed
- `recommended_next_action`
  - what should happen immediately after review

## Suggested Packet Format

```text
Review Type: solution-direction
Scope: customer onboarding modernization wave 1
Changed Artifacts: SOL-1001, IF-1001, DEC-1001
Evidence Summary: based on requirements REQ-1001 and sequence view references
Assumptions: downstream consumer can process activation events within agreed SLA
Open Questions: final event payload ownership confirmation
Validation Summary: VALIDATION_SUMMARY validator=artifacts status=passed checked=19 errors=0 warnings=0
Approval Requested: confirm solution direction and event-based activation pattern
Recommended Next Action: proceed to transition planning and review-pack preparation
```

## Review Packet Rules

- keep it short enough to scan quickly
- do not hide unresolved gaps
- do not summarize approval as already granted
- include warnings if any remain

## Agent Rule

If a human gate is reached, the agent should produce a review packet and pause
instead of continuing into approval-state work.
