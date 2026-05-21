# Data Classification And Handling

## Purpose

Classify data by sensitivity or control level and define handling expectations
so design, storage, access, and movement choices are aligned to risk and
obligation.

## When To Use

- the solution handles sensitive, regulated, or business-critical data
- different data sets require different protection or handling rules
- architecture choices depend on knowing what data needs stronger control

## When Not To Use

- the data has no meaningful differences in handling requirements
- classification labels would be created without any practical consequence

## Assumptions

- classification categories can be defined and understood
- handling expectations can influence architecture and operations
- ownership of classification decisions is clear

## Key Components

- classification levels or categories
- handling rules by class
- access, movement, storage, and retention implications
- review or change process when classification shifts

## Benefits

- makes data protection expectations explicit
- improves alignment between risk and technical controls
- supports more consistent compliance reasoning

## Tradeoffs

- adds governance and documentation effort
- can become bureaucratic if categories are too fine-grained
- requires shared understanding across teams

## Common Risks

- classification applied inconsistently
- labels created without downstream control changes
- overclassification making normal work harder without benefit

## Related Templates

- `data-object`
- `requirement`
- `risk`
- `compliance-assessment`
- `environment`
