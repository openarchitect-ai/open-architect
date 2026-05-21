# Identity Proofing And Joiner Mover Leaver

## Purpose

Control how identities are established, changed, and removed so access reflects
real people, valid roles, and current organizational status across the full
identity lifecycle.

## When To Use

- systems depend on workforce or partner identities with changing access needs
- role changes or departures create material security or compliance risk
- the architecture must support auditable identity governance

## When Not To Use

- the scope contains only short-lived technical identities with separate
  lifecycle controls
- identity proofing and lifecycle processes are entirely outside the solution
  boundary and have no architecture implications

## Assumptions

- trusted identity sources exist
- role and entitlement models can be linked to lifecycle events
- deprovisioning timeliness matters to risk control

## Key Components

- identity proofing process
- joiner, mover, and leaver event triggers
- role and entitlement assignment model
- recertification, deprovisioning, and audit controls

## Benefits

- reduces orphaned or inappropriate access
- improves auditability and compliance posture
- supports safer access changes as people move across roles

## Tradeoffs

- requires tight coordination across HR, identity, and application teams
- can add latency to access changes if processes are too manual
- demands clear ownership of entitlements and approvals

## Common Risks

- slow leaver processing leaving residual access
- poor role design creating entitlement sprawl
- weak proofing leading to bad identity quality upstream

## Related Templates

- `stakeholder`
- `application`
- `application-service`
- `risk`
- `compliance-assessment`
