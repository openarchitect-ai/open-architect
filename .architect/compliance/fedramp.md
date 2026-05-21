# FedRAMP

## Regulation

- FedRAMP official site: https://www.fedramp.gov/
- FedRAMP 2026 public preview responsibilities:
  https://www.fedramp.gov/preview/2026/responsibilities/

## Architecture Relevance

FedRAMP matters when the solution is intended for U.S. federal cloud use or
must align with U.S. government cloud security, evidence, authorization, and
operational assurance expectations.

## Typical Architecture Concerns

- boundary definition for cloud services and shared responsibilities
- evidence of controls, monitoring, and operational discipline
- tenant isolation, logging, and incident handling
- change control, configuration management, and provider responsibility
- third-party dependency and authorization scope clarity

## Useful Patterns

- `platform-tenancy-isolation`
- `shared-platform-guardrail-model`
- `observability-by-design`
- `environment-drift-detection`
- `architecture-assurance-evidence-trail`
