# Environment Drift Detection

## Purpose

Detect unintended divergence between intended and actual environment state so
configuration, security, and operational consistency can be maintained.

## When To Use

- environments are provisioned repeatedly or expected to stay aligned over time
- manual changes create operational or compliance risk
- architecture depends on predictable environment behavior across stages

## When Not To Use

- the environment is intentionally ad hoc or short-lived without a stable target
  state
- drift detection would add little value because the environment is disposable
  and recreated constantly

## Assumptions

- intended state can be described or derived
- actual state can be observed reliably
- drift findings will lead to remediation or redesign

## Key Components

- baseline or declared target state
- comparison and detection mechanism
- alerting or reporting
- remediation and exception handling path

## Benefits

- improves environment consistency and trust
- helps identify risky manual or hidden changes
- supports auditability and operational hygiene

## Tradeoffs

- requires good baseline definition
- can produce noisy findings if tolerated variation is unclear
- remediation ownership must be explicit to avoid alert fatigue

## Common Risks

- false positives from poorly defined expected state
- accepted drift accumulating without formal exception handling
- detection without any practical remediation path

## Related Templates

- `environment`
- `technology-component`
- `technology-standard`
- `risk`
- `compliance-assessment`
