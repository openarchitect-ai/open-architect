# Product Vs Platform Boundary

## Purpose

Define where product-specific responsibility ends and shared platform
responsibility begins so ownership, funding, standards, and delivery decisions
stay clear as solutions scale.

## When To Use

- multiple product teams depend on common capabilities or runtime services
- ownership confusion is slowing delivery or creating duplicated solutions
- platform investment needs clearer justification and boundary rules

## When Not To Use

- the solution is too small or isolated for a meaningful platform concern
- the distinction would add governance overhead without changing decisions

## Assumptions

- products and shared services can be identified clearly
- platform capabilities can be operated as reusable services
- ownership and funding decisions will follow the defined boundary

## Key Components

- product responsibility definition
- platform responsibility definition
- funding and ownership model
- service expectations and adoption rules

## Benefits

- reduces duplication across teams
- clarifies ownership and escalation paths
- supports healthier shared-platform investment decisions

## Tradeoffs

- requires negotiation across teams with different incentives
- can slow short-term delivery if the boundary is debated too late
- may expose gaps in platform readiness or product autonomy

## Common Risks

- platform scope growing into an unfocused shared backlog
- product teams bypassing the platform because boundaries are unclear
- shared capabilities being underfunded despite broad dependence

## Related Templates

- `application`
- `application-service`
- `technology-component`
- `initiative`
- `roadmap`
