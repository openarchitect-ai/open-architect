# Data Residency And Sovereignty

## Purpose

Design where data may be stored, processed, replicated, or accessed so
jurisdictional, contractual, and regulatory obligations are handled explicitly.

## When To Use

- data location or legal jurisdiction materially affects architecture choices
- cross-region or cross-country processing is in scope
- customers, regulators, or contracts impose residency or sovereignty rules

## When Not To Use

- no meaningful residency or sovereignty constraint exists
- the pattern would add speculative complexity without any actual requirement

## Assumptions

- residency obligations can be identified
- data movement and hosting choices can be constrained intentionally
- ownership of compliance interpretation is clear

## Key Components

- regulated or constrained data categories
- permitted storage and processing jurisdictions
- transfer, replication, and access rules
- review and evidence path for compliance assertions

## Benefits

- makes regulatory and contractual data constraints visible
- reduces accidental non-compliant data movement
- improves alignment between architecture and legal obligations

## Tradeoffs

- constrains hosting and replication options
- may increase cost or complexity of the target architecture
- requires careful coordination with security and legal guidance

## Common Risks

- data moves across boundaries through hidden operational paths
- residency assumptions made without evidence
- inconsistent handling between primary, backup, and analytics copies

## Related Templates

- `data-object`
- `environment`
- `requirement`
- `risk`
- `compliance-assessment`
