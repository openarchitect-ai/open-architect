# Rollback Decision Thresholds

## Purpose

Define clear thresholds for deciding when to continue, pause, or roll back
change so transition teams do not rely on ad hoc judgment under pressure.

## When To Use

- release or cutover risk is high enough that rollback decisions matter
- many stakeholders could disagree during an incident without predefined rules
- operational metrics can indicate unacceptable rollout behavior

## When Not To Use

- the change is low-risk and standard operational judgment is sufficient
- rollback is not feasible and forward-fix or containment is the real strategy

## Assumptions

- meaningful thresholds can be defined
- evidence can be observed in near real time
- decision authority for rollback is clear

## Key Components

- threshold metrics or trigger conditions
- decision roles and authority
- observation window and evidence source
- action paths for continue, pause, or rollback

## Benefits

- reduces ambiguity during high-pressure release decisions
- supports faster and more consistent operational response
- improves confidence that rollback is based on agreed signals

## Tradeoffs

- threshold design can be contentious
- rigid thresholds may not fit every scenario perfectly
- metrics and signals must be trustworthy to be useful

## Common Risks

- thresholds too vague to drive action
- teams overriding thresholds without documented rationale
- false confidence in noisy or poorly chosen signals

## Related Templates

- `transition-architecture`
- `work-package`
- `risk`
- `decision`
- `roadmap`
