# Regulated Data Access Approval

## Purpose

Control approval for access to regulated or sensitive data so use remains
explicit, justified, and auditable.

## When To Use

- access to data requires legal, regulatory, contractual, or policy oversight
- sensitive datasets are consumed by multiple roles or teams
- architecture must support controlled approval and periodic review

## When Not To Use

- the data is not materially sensitive and normal access processes are
  sufficient
- approval is outside the architecture scope and has no system design impact

## Assumptions

- regulated datasets can be identified and classified
- approvers and decision criteria can be defined
- approval outcomes can be reflected in access design and operations

## Key Components

- data classification and eligibility criteria
- approval workflow and authority
- access grant, review, and revocation controls
- audit trail and exception handling

## Benefits

- improves control over sensitive data access
- supports stronger compliance and accountability
- reduces ambiguity around who may access what and why

## Tradeoffs

- adds approval overhead
- can slow access to data if workflows are poorly designed
- requires close alignment between governance and technical enforcement

## Common Risks

- approvals granted without sufficient justification
- access lingering after need has changed
- approval records not matching real permissions in systems

## Related Templates

- `data-object`
- `application-service`
- `compliance-assessment`
- `risk`
- `decision`
