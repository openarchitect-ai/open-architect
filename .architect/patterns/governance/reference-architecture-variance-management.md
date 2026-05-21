# Reference Architecture Variance Management

## Purpose

Manage intentional deviations from reference architecture so exceptions are
understood, governed, time-bounded where needed, and reflected in downstream
decisions and remediation plans.

## When To Use

- a solution cannot fully conform to the reference architecture
- local constraints require a controlled variance from a standard pattern
- governance needs visibility of accepted divergence and remediation intent

## When Not To Use

- the issue can be resolved by applying the reference architecture as designed
- variance is being requested before the reference has been understood properly

## Assumptions

- a reference architecture exists
- variance criteria and approval routes can be defined
- remediation or review expectations can be tracked over time

## Key Components

- variance description and rationale
- impact assessment
- approval or waiver record
- review or remediation timeline

## Benefits

- keeps reference architecture relevant without forcing false compliance
- improves visibility of where and why divergence exists
- supports better long-term remediation and standard alignment

## Tradeoffs

- adds governance overhead
- can normalize excessive exception behavior if controls are weak
- requires follow-through after approval

## Common Risks

- variances granted without clear expiry or review
- poor traceability between variance and impacted artifacts
- reference architecture losing authority through unmanaged drift

## Related Templates

- `technology-standard`
- `principle`
- `decision`
- `compliance-assessment`
- `risk`
