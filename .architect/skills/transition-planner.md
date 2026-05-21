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
- `.architect/patterns/transition/README.md`
- `.architect/patterns/transition/strangler-modernization.md`
- `.architect/patterns/transition/coexistence-data-migration.md`
- `.architect/patterns/transition/feature-toggle-rollout.md`
- `.architect/patterns/transition/parallel-run.md`
- `.architect/patterns/transition/phased-decommissioning.md`
- `.architect/patterns/transition/cutover-command-center.md`
- `.architect/patterns/transition/cutover-rehearsal.md`
- `.architect/patterns/transition/rollback-and-recovery.md`
- `.architect/patterns/transition/rollback-readiness-gate.md`
- `.architect/patterns/transition/rollback-decision-thresholds.md`
- `.architect/patterns/transition/pilot-then-scale.md`
- `.architect/patterns/transition/branch-by-abstraction.md`
- `.architect/patterns/transition/parallel-operations-closure.md`
- `.architect/patterns/transition/post-cutover-hypercare.md`
- `.architect/patterns/transition/transition-hypercare-exit-criteria.md`
- `.architect/patterns/transition/incremental-contract-migration.md`
- `.architect/patterns/transition/legacy-batch-sunset.md`
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
- use `legacy-batch-sunset` when obsolete batch paths should be retired deliberately after replacement or coexistence
- use `incremental-contract-migration` when interface or contract change must move through compatibility-preserving stages
- use `cutover-rehearsal` when the production transition is risky enough to justify practice before the real event
- use `cutover-command-center` when high-risk transition execution needs real-time coordination, authority, and escalation
- use `rollback-and-recovery` when recovery paths and decision points need to be explicit before transition risk is acceptable
- use `rollback-readiness-gate` when go-live should be blocked until rollback readiness is explicit and evidenced
- use `rollback-decision-thresholds` when continue, pause, or rollback decisions should follow agreed signals rather than ad hoc judgment
- use `pilot-then-scale` when limited-scope rollout should generate evidence before wider adoption
- use `branch-by-abstraction` when large internal replacement needs a stable migration seam
- use `post-cutover-hypercare` when intensified early-life support should be planned explicitly after transition
- use `transition-hypercare-exit-criteria` when the end of hypercare should be explicit rather than time-boxed only
- use `parallel-operations-closure` when temporary dual operations need explicit closure criteria and ownership handoff
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
- batch-sunset and contract-migration expectations are explicit where legacy integration retirement depends on them
- rehearsal expectations are explicit where cutover confidence depends on them
- rollback and forward-recovery expectations are explicit where transition risk depends on them
- rollback readiness, rollback thresholds, and command-center expectations are explicit where cutover risk depends on them
- pilot scope and scale-out expectations are explicit where staged adoption is the safer path
- abstraction-based migration, hypercare exit, and parallel-operations closure expectations are explicit where relevant

## Quality Checks

- Do not turn the roadmap into a generic delivery plan with no architecture meaning.
- Do not define transition states without exit criteria or rationale.
- Prefer a known modernization or rollout pattern over an ad hoc sequence of steps.

## Typical Collaboration

- works closely with `enterprise-architect`, `solution-architect`, and `technology-architect`
- supports `chief-architect` and `architecture-governance-lead`
