# Incident Reporting and Response Control Theme

Use this guide when regulation or sector scope expects explicit incident
handling, escalation, materiality assessment, reporting timelines, and recovery
coordination.

## Typical Regulation Drivers

- `NIS2`
- `DORA`
- `SEC Cyber Disclosure Rules`
- `Cyber Resilience Act`

## Architecture Questions

- Can the system detect, classify, and escalate significant incidents quickly?
- Are ownership, severity thresholds, and reporting dependencies explicit?
- Can operations distinguish service degradation, security breach, data-loss,
  and regulatory-reporting events?

## Architecture Responses

- Model monitoring, alerting, incident classification, escalation paths, and
  operational recovery assumptions.
- Make dependencies, blast radius, fallback modes, and containment paths
  visible.
- Record where reporting obligations depend on evidence, timestamps,
  materiality, or service criticality.

## Useful Patterns

- `../../patterns/technology/observability-by-design.md`
- `../../patterns/technology/graceful-degradation.md`
- `../../patterns/technology/active-active-vs-active-passive.md`
- `../../patterns/transition/cutover-command-center.md`
- `../../patterns/transition/rollback-readiness-gate.md`
- `../../patterns/transition/rollback-decision-thresholds.md`
