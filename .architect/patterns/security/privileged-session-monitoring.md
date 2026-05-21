# Privileged Session Monitoring

## Purpose

Monitor privileged access sessions so high-impact administrative activity is
visible, reviewable, and better controlled.

## When To Use

- administrators or operators can perform sensitive actions
- misuse of privileged access would create material business or security impact
- auditability and deterrence are important for elevated access paths

## When Not To Use

- no meaningful privileged session model exists for the scope
- monitoring would add little value compared with stronger preventive controls

## Assumptions

- privileged actions and roles can be identified
- session activity can be captured lawfully and usefully
- monitoring outcomes will influence response or oversight

## Key Components

- privileged role scope
- session capture or observation mechanism
- alerting and review workflow
- retention and access control for session evidence

## Benefits

- increases visibility of high-risk operational actions
- supports investigation and accountability
- can deter misuse of elevated access

## Tradeoffs

- adds operational and privacy considerations
- monitoring volume can be high without clear review priorities
- requires secure handling of captured session data

## Common Risks

- privileged activity defined too narrowly
- captured evidence inaccessible or unreviewed when needed
- monitoring without clear escalation or response path

## Related Templates

- `application-service`
- `technology-component`
- `risk`
- `compliance-assessment`
- `decision`
