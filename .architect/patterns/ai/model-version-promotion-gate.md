# Model Version Promotion Gate

## Purpose

Gate model and prompt version promotion behind explicit eval thresholds,
red-team passes, and human sign-off, so production behavior changes are
controlled and reversible.

## When To Use

- promoting model versions, prompt versions, or both to production carries risk
- regulatory or audit expectations require gate evidence
- multiple environments exist (dev, eval, staging, prod) and need
  promotion criteria
- incident response or rollback requires knowing exactly what changed when

## When Not To Use

- the system is at a stage where iteration speed dominates risk (early prototype)
- no eval pipeline exists to gate against — build that first (see
  [continuous-model-evaluation](./continuous-model-evaluation.md))

## Assumptions

- an eval pipeline exists with attributable, reproducible results
- a red-team or adversarial-eval mechanism exists
- a routing or pointer mechanism can switch production traffic between versions
- a registry holds versions with metadata

## Key Components

- offline eval threshold (quality, safety, cost)
- online eval threshold (when canary or shadow traffic applies)
- red-team / adversarial-eval pass requirement
- human sign-off step (named approver role)
- canary / shadow / blue-green strategy for promotion
- rollback path (pointer flip, not redeploy)
- promotion record (who, when, evidence)
- post-promotion monitoring window with explicit owner

## Benefits

- promotion decisions are evidence-backed
- rollback is fast and bounded
- audit trail is preserved
- regressions are caught before broad exposure

## Tradeoffs

- adds promotion latency
- requires eval and red-team to be ready as gates
- requires explicit approver and on-call coverage for the post-promotion window

## Common Risks

- gate bypass during incident pressure
- thresholds set too loose, becoming rubber stamps
- eval gold set known to the optimizing team — overfitting to the gate
- red-team pass treated as one-shot rather than per-promotion
- rollback path untested
- post-promotion monitoring window with no named owner

## Related Templates

- decision
- risk
- application-service
- compliance-assessment
- technology-component

## Related Decisions

- eval thresholds per quality, safety, cost dimension
- red-team scope per promotion type
- approver role and escalation path
- canary / shadow / blue-green choice
- post-promotion monitoring window length and owner
