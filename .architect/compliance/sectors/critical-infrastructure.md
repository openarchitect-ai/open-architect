# Critical Infrastructure Profile

Use this profile when the architecture supports essential services, operational
technology dependencies, utilities, transport, communications, or other
services where disruption can create outsized safety, public-impact, or
regulatory consequences.

## Why It Matters

Critical-infrastructure architectures usually need stronger resilience,
supplier-control, incident-handling, and recovery design because extended
outages or compromised operations can have consequences beyond ordinary service
quality.

## Commonly Relevant Regulation Families

- `NIS2`
- sector-specific resilience or critical-service obligations
- incident-reporting and supervisory expectations in the operating jurisdiction

## Architecture-Relevant Questions

- Which capabilities are essential to service continuity or public safety?
- Are supplier concentration, shared platforms, or remote-access paths part of
  the operational risk picture?
- Can the service degrade safely, recover predictably, and be operated under
  disruption?

## Architecture Implications

- Model resilience, operational fallback, support access, and dependency chains
  explicitly.
- Treat trust boundaries, incident response, and supplier risk as architectural
  constraints.
- Expect closer scrutiny of failover, emergency access, and recovery
  assumptions.

## Related Control Themes

- `../controls/business-continuity-and-operational-resilience.md`
- `../controls/third-party-risk-and-outsourcing.md`
- `../controls/incident-reporting-and-response.md`
