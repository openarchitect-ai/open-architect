# Continuous Model Evaluation

## Purpose

Treat model evaluation as a continuous pipeline — offline, online, and
drift — so quality, safety, and cost remain measurable across the model
and prompt lifecycle.

## When To Use

- production model behavior materially affects business or user outcomes
- model or prompt versions are promoted on a cadence
- drift, regression, or degradation must be detectable
- regulatory or audit expectations require ongoing evaluation evidence

## When Not To Use

- the use case is so low-stakes that launch-day testing is sufficient
- no gold sets, no labels, no ground truth, and no proxy signals exist —
  build those first before claiming continuous evaluation
- evaluation is conflated with red-teaming — they are complementary, not
  substitutes

## Assumptions

- a gold set or proxy ground truth exists for the use case
- eval can be automated where possible
- eval signals can be attributed to specific model and prompt versions
- the runtime can capture online eval signals (user feedback, downstream
  outcomes, escalations)

## Key Components

- gold sets per use case (curated, refreshed on a cadence, owned)
- offline eval pipeline (versioned, reproducible)
- online eval signal capture (user feedback, outcome attribution,
  sample-based human review)
- drift detection (input distribution, output distribution, score drift)
- eval attribution to model version, prompt version, retrieval state
- eval cadence (per-deploy, scheduled, drift-triggered)
- eval result storage and trend reporting
- runbook for failing eval thresholds

## Benefits

- quality and safety are measurable, not anecdotal
- drift is detected before user complaints
- model and prompt promotion gates have evidence
- audit and regulator expectations are met with continuous evidence

## Tradeoffs

- adds engineering effort for eval pipeline, gold set curation, attribution
- introduces eval cost (compute, human review time)
- gold set maintenance is its own discipline

## Common Risks

- eval as launch-day-only — misses drift
- offline eval only — misses production reality
- gold set stale or unrepresentative of real traffic
- eval not attributed to specific versions — cannot isolate cause
- false sense of safety from eval that does not exercise adversarial
  inputs (this is what red-teaming covers, separately)
- gold set known to the team optimizing the model — measurement becomes optimization target

## Related Templates

- solution
- application-service
- technology-component
- requirement
- risk
- compliance-assessment

## Related Decisions

- gold set ownership and refresh cadence
- offline vs online eval scope
- drift detection signals and thresholds
- eval result storage and access
- eval cadence per use case
