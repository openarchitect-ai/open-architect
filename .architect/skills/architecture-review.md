# Architecture Review

## Purpose

Review the architecture set for completeness, coherence, consistency,
traceability, governance readiness, and pattern fit.

## Use When

- a project has produced a first or updated architecture set
- quality checks are needed before governance review
- the team wants to find modeling gaps early

## Read First

- `.architect/project-config.yaml`
- `.architect/guidance/conventions.md`
- `.architect/guidance/evidence-and-quality.md`
- `.architect/guidance/governance-conventions.md`
- `.architect/guidance/diagram-conventions.md`
- `.architect/patterns/README.md`
- `.architect/patterns/governance/architecture-decision-lifecycle.md`
- `.architect/patterns/governance/standards-exception-management.md`
- `.architect/patterns/governance/governance-review-gate.md`
- `.architect/patterns/security/audit-and-tamper-evident-logging.md`
- `.architect/patterns/data/reference-data-management.md`
- `.architect/patterns/data/data-replication-and-cache-invalidation.md`
- `.architect/patterns/data/archival-and-retention.md`
- `.architect/patterns/technology/active-active-vs-active-passive.md`
- `.architect/patterns/technology/secrets-rotation.md`
- `.architect/patterns/technology/multi-region-failover.md`
- `.architect/patterns/transition/phased-decommissioning.md`
- `.architect/patterns/transition/cutover-rehearsal.md`
- `.architect/examples/customer-onboarding-modernization/README.md`

## Inputs

- the current architecture artifact set
- relevant requirements, decisions, standards, and transition items
- review expectations from governance

## Steps

1. Confirm the scope of the review.
   Decide whether this is a project checkpoint, a quality sweep, or a governance-prep review.
2. Check coverage.
   Are the critical business, solution, data, technology, and change concerns represented?
3. Check coherence.
   Do the artifacts tell one story, or are there contradictions?
4. Check traceability.
   Can you follow the path from stakeholder and objective through requirement, solution, decision, and delivery?
5. Check pattern fit.
   Are important solution, data, security, technology, and transition choices aligned to known patterns or justified deviations?
6. Check governance readiness.
   Are decisions, risks, exceptions, and review expectations visible?
7. Check views and documentation.
   Are the important diagrams and written outputs aligned to the model?
8. Publish findings in severity order and name the missing next actions.

## Outputs

- structured findings
- identified gaps in coverage, linkage, quality, consistency, or pattern fit
- prioritized follow-up actions

## Output Checklist

- findings are specific and anchored in artifacts
- missing links and missing evidence are called out
- unjustified pattern deviations are called out
- governance blockers are explicit
- the review leaves a clearer next action, not just a critique

## Typical Collaboration

- works closely with `architecture-governance-lead`
- supports every other role and every delivery skill

## Quality Checks

- Findings should prioritize risk and delivery impact over stylistic preference.
- A review should not stop at "missing document" if the underlying model gap is the real issue.
- If no findings exist, say so explicitly and mention residual risks or evidence gaps.
- Prefer reviewing whether patterns were applied thoughtfully over enforcing patterns mechanically.
