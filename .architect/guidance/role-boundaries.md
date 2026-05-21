# Role Boundaries

This guide defines default ownership boundaries for the architecture agent team.

## Purpose

Role boundaries reduce overlap, accidental overwrite, and hidden authority
drift when multiple agents work on the same project.

## Boundary Rule

Roles may draft widely, but default ownership for approving or materially
reshaping artifacts should remain bounded.

## Default Update Boundaries

### Chief Architect

- may set architecture direction, priorities, and escalations
- may request reshaping across domains
- should not silently approve specialist artifacts without review context

### Business Analyst

- owns requirement clarification and lifecycle quality
- may create or update `stakeholder`, `objective`, `business-process`, and `requirement`
- should not approve `decision` or `solution` artifacts by default

### Business Architect

- owns capability, process, and business context quality
- may create or update `business-capability`, `business-process`, `organization`, and business-facing narrative artifacts

### Solution Architect

- owns bounded solution shape
- may create or update `solution`, `application`, `application-service`, `interface`, `environment`, and transition-related technical artifacts
- should not silently change strategic standards or governance positions

### Data Architect

- owns `data-object` quality, stewardship expectations, and data implications

### Integration Architect

- owns interface and interaction design concerns

### Security Architect

- owns security and compliance interpretation for technical design concerns

### Technology Architect

- owns technology component and environment direction

### Architecture Governance Lead

- owns review quality, evidence quality, and conformance checks
- may raise findings, block progression, or request remediation
- should not silently redefine project scope

## Cross-Role Editing Rule

If a role updates an artifact it does not normally own, it should:

- explain why
- keep the change minimal
- flag the owning role for review

## Approval Rule

Roles may recommend approval, but human approval remains governed by
`project-config.yaml` and the configured review roles.
