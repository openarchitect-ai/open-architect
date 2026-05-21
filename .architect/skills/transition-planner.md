# Transition Planner

## Purpose

Plan how the architecture moves from baseline to target through manageable
intermediate states and delivery increments.

## Use When

- the target state cannot be delivered in one step
- gaps and work packages need to be made explicit
- the architecture needs a sequenced transition path

## Read First

- `.architect/templates/change/transition-architecture.yaml`
- `.architect/templates/change/gap.yaml`
- `.architect/templates/change/work-package.yaml`
- `.architect/templates/change/roadmap.yaml`
- `.architect/patterns/transition/strangler-modernization.md`
- `.architect/patterns/transition/coexistence-data-migration.md`
- `.architect/patterns/transition/feature-toggle-rollout.md`
- `.architect/patterns/transition/parallel-run.md`
- `.architect/patterns/transition/phased-decommissioning.md`
- `.architect/patterns/transition/cutover-rehearsal.md`
- `.architect/patterns/technology/environment-promotion.md`
- `.architect/patterns/technology/blue-green-canary-deployment.md`

## Inputs

- baseline and target architecture facts
- decisions, constraints, and dependencies
- delivery sequencing assumptions

## Steps

1. Confirm the baseline, target, and the main reasons the transition cannot happen in one step.
2. Identify the critical gaps, dependencies, and sequencing constraints.
3. Choose the most relevant transition and rollout patterns before defining waves.
4. Model the intermediate transition states and the work packages that move the architecture forward.
5. Link transition choices back to requirements, decisions, risks, and operational constraints.

## Pattern Guidance

- use `strangler-modernization` when legacy replacement should happen incrementally
- use `coexistence-data-migration` when old and new data states must coexist during transition
- use `feature-toggle-rollout` when exposure should be controlled separately from deployment timing
- use `parallel-run` when old and new paths must coexist temporarily for confidence-building or reconciliation
- use `phased-decommissioning` when legacy assets should be retired deliberately after migration or coexistence phases
- use `cutover-rehearsal` when the production transition is risky enough to justify practice before the real event
- use `environment-promotion` and `blue-green-canary-deployment` when rollout risk and release control matter

## Outputs

- `transition-architecture` artifacts
- `gap` artifacts
- `work-package` artifacts
- `roadmap` artifacts

## Output Checklist

- transition states are explicit rather than implied
- the chosen transition pattern matches the delivery reality
- gaps and work packages are linked to real architecture movement
- dependencies, risks, and review points are visible
- cutover, coexistence, or exposure-control assumptions are explicit where relevant
- decommissioning expectations are explicit where target-state simplification depends on them
- rehearsal expectations are explicit where cutover confidence depends on them

## Quality Checks

- Do not turn the roadmap into a generic delivery plan with no architecture meaning.
- Do not define transition states without exit criteria or rationale.
- Prefer a known modernization or rollout pattern over an ad hoc sequence of steps.

## Typical Collaboration

- works closely with `enterprise-architect`, `solution-architect`, and `technology-architect`
- supports `chief-architect` and `architecture-governance-lead`
