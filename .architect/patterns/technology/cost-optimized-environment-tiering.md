# Cost-Optimized Environment Tiering

## Purpose

Shape environment types and operational depth deliberately so cost is aligned
to the value and risk of each environment rather than treating all tiers as if
they need production-grade spend.

## When To Use

- environment cost is material
- different tiers have meaningfully different purpose and risk
- platform design should balance control, fidelity, and spend

## When Not To Use

- the platform is too small for tiering choices to matter
- cost optimization would undermine essential quality or control

## Assumptions

- environment purposes are well defined
- acceptable variation between tiers can be stated
- cost, fidelity, and governance tradeoffs can be reviewed intentionally

## Key Components

- environment tier definitions
- fidelity versus cost expectations per tier
- controls that must remain consistent across tiers
- review of spend, usage, and lifecycle

## Benefits

- reduces unnecessary platform spend
- clarifies why environments differ
- supports more intentional balance between realism and cost

## Tradeoffs

- lower-fidelity tiers can hide issues
- requires discipline about what can safely vary
- may create friction if teams expect production-like behavior everywhere

## Common Risks

- over-optimizing cost and losing confidence in pre-production environments
- environment drift on controls that should stay consistent
- unclear ownership of environment-spend decisions

## Related Templates

- `environment`
- `technology-component`
- `requirement`
- `risk`
- `work-package`
