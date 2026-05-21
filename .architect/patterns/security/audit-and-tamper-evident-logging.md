# Audit And Tamper-Evident Logging

## Purpose

Capture security-relevant and governance-relevant events in a way that supports
traceability, forensic review, and strong resistance to silent alteration or
deletion.

## When To Use

- the solution processes sensitive, regulated, or high-impact actions
- auditability is required for compliance, security, or operational governance
- important administrative or data-change events must be reconstructable later

## When Not To Use

- the pattern is being used to justify indiscriminate logging of low-value noise
- audit requirements are negligible and the extra complexity adds no value

## Assumptions

- important auditable events can be identified clearly
- storage, retention, and access controls for audit data can be governed
- log integrity can be protected through platform or process controls

## Key Components

- auditable event taxonomy
- immutable or integrity-protected log storage
- controlled access and retention policy
- review, alerting, or forensic retrieval path

## Benefits

- improves traceability of critical actions
- strengthens security and compliance posture
- supports investigation and accountability

## Tradeoffs

- adds storage, access-control, and operational overhead
- requires disciplined event design to avoid noise
- may create privacy concerns if logging is overly broad

## Common Risks

- capturing too much low-signal data
- weak integrity protection despite audit claims
- unclear retention or reviewer ownership

## Related Templates

- `requirement`
- `risk`
- `compliance-assessment`
- `technology-component`
- `environment`
