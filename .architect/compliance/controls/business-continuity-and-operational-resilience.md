# Business Continuity and Operational Resilience Control Theme

Use this guide when the solution must remain reliable through disruption,
support regulated recovery expectations, or prove resilience across critical
services and dependencies.

## Typical Regulation Drivers

- `DORA`
- `NIS2`
- `SEC Cyber Disclosure Rules`
- critical-sector or financial-sector resilience obligations

## Architecture Questions

- Which capabilities are business-critical, and what continuity assumptions do
  they depend on?
- How does the solution degrade, fail over, recover, or operate in reduced
  mode?
- Are outage dependencies, manual fallback, and recovery thresholds explicit?
- Can the organization rehearse cutover, rollback, and post-incident recovery
  safely?

## Architecture Responses

- Treat continuity and resilience as first-class design decisions.
- Keep dependency chains, recovery paths, degraded modes, and operational
  thresholds explicit.
- Model human coordination needs, not only technical recovery mechanisms.
- Expect stronger evidence requirements around rehearsal, rollback, and
  hypercare for critical changes.

## Useful Patterns

- `../../patterns/technology/active-active-vs-active-passive.md`
- `../../patterns/technology/graceful-degradation.md`
- `../../patterns/technology/multi-region-failover.md`
- `../../patterns/transition/cutover-rehearsal.md`
- `../../patterns/transition/cutover-command-center.md`
- `../../patterns/transition/post-cutover-hypercare.md`
- `../../patterns/transition/rollback-readiness-gate.md`
