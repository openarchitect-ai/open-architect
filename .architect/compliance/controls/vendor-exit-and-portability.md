# Vendor Exit and Portability Control Theme

Use this guide when the architecture depends on strategic vendors, managed
platforms, outsourced operations, or data-processing services where exit,
replacement, or portability matters for resilience or governance.

## Typical Regulation Drivers

- `DORA`
- outsourcing and third-party assurance expectations
- sovereignty, portability, or concentration-risk concerns

## Architecture Questions

- Can the organization move data, configuration, identity, and operational
  responsibility away from a vendor if needed?
- Are portability constraints hidden inside proprietary services, shared data
  models, or region-locked capabilities?
- Is vendor exit part of the design conversation or only a contract assumption?

## Architecture Responses

- Keep portability, data extractability, identity migration, and service
  dependency assumptions explicit.
- Record which services are hard to replace and why.
- Treat exit planning and contingency posture as architecture-relevant
  resilience controls.

## Useful Patterns

- `../../patterns/governance/reference-architecture-variance-management.md`
- `../../patterns/technology/platform-tenancy-isolation.md`
- `../../patterns/technology/shared-platform-guardrail-model.md`
- `../../patterns/technology/multi-region-failover.md`
