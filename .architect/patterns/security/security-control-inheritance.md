# Security Control Inheritance

## Purpose

Reuse security controls provided by shared platforms or services so solutions do
not reimplement the same controls unnecessarily while still understanding their
responsibilities and residual risks.

## When To Use

- workloads depend on platforms that already provide baseline security controls
- security architecture needs to distinguish shared controls from local ones
- assurance work must show where control responsibility sits

## When Not To Use

- the platform does not provide dependable shared controls
- control inheritance would be assumed without verifying actual platform
  coverage

## Assumptions

- shared controls can be described and evidenced clearly
- local teams understand which controls are inherited versus locally owned
- residual gaps can be identified and addressed

## Key Components

- control catalog
- inheritance boundary
- local control responsibilities
- evidence and assurance model

## Benefits

- reduces duplicate control implementation effort
- improves clarity of shared versus local responsibility
- supports more scalable assurance across many workloads

## Tradeoffs

- requires strong platform documentation and trust
- can create blind spots if teams assume inheritance too broadly
- evidence collection still needs coordination

## Common Risks

- inherited controls overstated or misunderstood
- local gaps left unresolved because ownership is unclear
- platform changes reducing control coverage without downstream awareness

## Related Templates

- `technology-standard`
- `technology-component`
- `compliance-assessment`
- `risk`
- `decision`
