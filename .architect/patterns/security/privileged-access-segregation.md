# Privileged Access Segregation

## Purpose

Separate privileged access paths, roles, and controls from normal user or
service access so high-impact administrative actions are more tightly governed
and auditable.

## When To Use

- administrators or operators can perform sensitive actions
- compliance or security posture requires stronger control over privileged use
- production or infrastructure access carries high operational impact

## When Not To Use

- there is no meaningful privileged access boundary to manage
- the pattern would duplicate simpler, already effective control mechanisms

## Assumptions

- privileged roles can be defined clearly
- approval, access, and audit controls can be enforced
- operational teams can work within segregated access constraints

## Key Components

- privileged roles or personas
- separate access path or control plane
- approval, monitoring, and audit controls
- break-glass or emergency handling where needed

## Benefits

- reduces misuse of broad admin power
- improves auditability of sensitive actions
- strengthens operational and security governance

## Tradeoffs

- adds friction for administrators
- requires clear role design and process discipline
- can slow urgent changes if emergency access is poorly designed

## Common Risks

- privileged access still shared informally
- audit controls weaker than the documented intent
- emergency access bypass becoming the norm

## Related Templates

- `environment`
- `technology-component`
- `requirement`
- `risk`
- `compliance-assessment`
