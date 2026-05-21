# Worked Example: Customer Onboarding Modernization

This worked example shows how Open Architect can model a small but connected
architecture project across business, application, data, technology,
governance, change, and visual views.

It lives under `examples/` so the sample stays separate from live project
artifacts in `architecture/`.

## Scenario

The project modernizes customer onboarding so a single onboarding flow creates a
governed customer profile, emits a standardized activation event, and updates a
downstream policy administration platform with less manual rework and better
traceability.

## Included Artifacts

### Business

- `business/stk-1001-head-of-customer-operations.yaml`
- `business/obj-1001-reduce-customer-activation-time.yaml`
- `business/bc-1001-customer-onboarding.yaml`
- `business/bp-1001-onboard-customer.yaml`

### Governance

- `governance/vis-1001-customer-onboarding-modernization.yaml`
- `governance/dec-1001-adopt-customer-activation-event-api.yaml`
- `governance/rsk-1001-delayed-downstream-event-adoption.yaml`

### Application

- `application/req-1001-customer-activation-reliability.yaml`
- `application/sol-1001-customer-onboarding-modernization-solution.yaml`
- `application/app-1001-customer-onboarding-portal.yaml`
- `application/app-1002-policy-administration.yaml`
- `application/as-1001-customer-onboarding-service.yaml`
- `application/if-1001-customer-activation-event-feed.yaml`

### Data

- `data/do-1001-customer-activation-profile.yaml`

### Technology

- `technology/tc-1001-integration-event-runtime.yaml`
- `technology/env-1001-production-eu-customer-integration.yaml`

### Change

- `change/ini-1001-customer-onboarding-modernization.yaml`
- `change/ta-1001-customer-onboarding-wave-1.yaml`
- `change/wp-1001-deliver-customer-activation-event-flow.yaml`

### Views

- `views/context-customer-onboarding-modernization.md`
- `views/sequence-customer-activation-sync.puml`
- `views/transition-customer-onboarding-wave-1.md`

## Why This Example Exists

Use this example to:

- understand how templates become real project artifacts
- see how relationships connect the architecture set
- test Wave 1 skills against a realistic but compact scenario
- anchor future flows, validation, and documentation patterns
