# Third-Party Risk and Outsourcing Control Theme

Use this guide when regulation scope or sector context creates stronger
expectations around supplier dependency, outsourcing, service concentration,
contractual controls, or evidencing that critical vendors are managed safely.

## Typical Regulation Drivers

- `DORA`
- `NIS2`
- `FTC Safeguards Rule`
- `PCI DSS`

## Architecture Questions

- Which critical services rely on third-party platforms, processors, or SaaS
  vendors?
- Are suppliers part of identity, data, resilience, monitoring, or
  incident-response paths?
- Is concentration risk visible, especially where a small number of vendors
  hold major operational responsibility?
- Can the organization replace, isolate, or recover from supplier failure?

## Architecture Responses

- Keep vendor dependencies and trust boundaries visible in the model.
- Record which suppliers are operationally critical and why.
- Make fallback, exit, portability, and outage-handling assumptions explicit.
- Treat third-party onboarding and review as part of the architecture control
  model, not just procurement.

## Useful Patterns

- `../../patterns/technology/platform-tenancy-isolation.md`
- `../../patterns/technology/multi-region-failover.md`
- `../../patterns/technology/active-active-vs-active-passive.md`
- `../../patterns/governance/reference-architecture-conformance-review.md`
- `../../patterns/governance/control-objective-to-pattern-mapping.md`
