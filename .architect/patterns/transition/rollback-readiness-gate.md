# Rollback Readiness Gate

## Purpose

Require explicit rollback readiness before high-risk change proceeds so teams
know whether recovery is practical, tested, and timely if rollout behavior is
unacceptable.

## When To Use

- production change carries meaningful business or operational risk
- rollback is possible but needs planning and validation
- release governance needs a concrete pre-go-live checkpoint

## When Not To Use

- the change is low-risk enough that lightweight recovery planning is adequate
- rollback is impossible and the architecture instead relies on forward-fix or
  containment strategies

## Assumptions

- rollback scope and triggers can be defined
- dependencies and data implications are understood
- decision-makers will use the gate to pause unsafe rollout when needed

## Key Components

- rollback criteria and trigger conditions
- rollback procedure and ownership
- validation or rehearsal evidence
- go or no-go review checkpoint

## Benefits

- improves readiness for adverse rollout outcomes
- makes recovery expectations explicit before release
- reduces optimism bias around production change safety

## Tradeoffs

- adds preparation and review overhead
- may slow release cadence for high-change environments
- some changes are difficult to roll back cleanly even with planning

## Common Risks

- rollback documented but not truly testable
- hidden data dependencies invalidating the plan
- gate treated as a checklist rather than a real safety decision

## Related Templates

- `transition-architecture`
- `work-package`
- `risk`
- `decision`
- `roadmap`
