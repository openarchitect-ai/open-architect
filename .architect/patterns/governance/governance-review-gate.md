# Governance Review Gate

## Purpose

Introduce explicit review checkpoints where architecture work must be assessed
 for evidence, traceability, risk, and approval readiness before it moves to
 the next stage.

## When To Use

- key project milestones need human governance approval
- architectural risk, compliance, or standards conformance must be checked
- multi-agent or multi-team work needs a clear stop-and-review point

## When Not To Use

- the work is too small and low-risk to justify a formal gate
- the pattern would create ceremony with no meaningful review decision

## Assumptions

- reviewers and decision rights are defined
- gate criteria can be stated clearly
- evidence and findings can be assembled consistently

## Key Components

- gate trigger or milestone
- review criteria and evidence packet
- reviewer roles and decision authority
- outcome path: approve, conditionally approve, reject, or escalate

## Benefits

- makes governance expectations explicit
- reduces silent drift into unreviewed implementation
- improves accountability for exceptions and approvals

## Tradeoffs

- adds process overhead
- can slow delivery if gate criteria are unclear
- requires disciplined reviewer participation

## Common Risks

- gates becoming a checklist with no real scrutiny
- unclear approval ownership
- review findings not flowing back into the architecture set

## Related Templates

- `decision`
- `risk`
- `compliance-assessment`
- `work-package`
- `transition-architecture`
