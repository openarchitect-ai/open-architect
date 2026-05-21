# Break-Glass Access

## Purpose

Provide tightly controlled emergency access for critical operational situations
without normal approval delays, while still preserving strong auditability and
post-event accountability.

## When To Use

- urgent operational recovery may require exceptional privileged access
- production stability or safety could be harmed by waiting for standard access
  flow
- emergency response must be possible without normal-role overprovisioning

## When Not To Use

- the pattern is being used to justify routine bypass of normal controls
- no meaningful emergency scenario exists for the system

## Assumptions

- emergency access conditions can be defined clearly
- all break-glass activity can be audited and reviewed afterward
- normal privileged access remains segregated and controlled

## Key Components

- emergency access trigger conditions
- tightly scoped break-glass mechanism
- mandatory audit and review trail
- post-event revocation and retrospective review

## Benefits

- supports rapid response in critical incidents
- avoids giving broad standing privilege to many users
- improves resilience of operational support

## Tradeoffs

- adds process and monitoring complexity
- can be abused if triggers and review are weak
- requires clear cultural discipline around exceptional use

## Common Risks

- break-glass used as a convenience path
- poor audit review after emergency use
- unclear ownership for enabling and revoking emergency access

## Related Templates

- `environment`
- `technology-component`
- `requirement`
- `risk`
- `compliance-assessment`
