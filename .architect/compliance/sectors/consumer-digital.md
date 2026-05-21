# Consumer Digital Profile

Use this profile when the architecture supports customer-facing digital
products, online services, digital channels, personalized journeys, consumer
accounts, or large-scale analytics and consent handling.

## Why It Matters

Consumer-digital architectures often combine privacy, accessibility, identity,
personalization, AI-assisted features, marketing analytics, and third-party
platform dependencies in ways that create both regulatory and trust risk.

## Commonly Relevant Regulation Families

- `GDPR`
- `CCPA/CPRA`
- `COPPA` where minors are in scope
- accessibility and consumer-protection obligations relevant to the market

## Architecture-Relevant Questions

- Are consent, preference, identity, and rights-handling flows part of the core
  design?
- Do analytics, personalization, advertising, or AI features use personal data
  in ways that need stronger governance?
- Are customer and support journeys accessible, explainable, and resilient?
- Are third-party SDKs, identity providers, or data-sharing platforms visible
  as real control dependencies?

## Architecture Implications

- Treat privacy, consent, data-sharing, and accessibility as service-design
  concerns, not just policy notes.
- Keep customer identity, preference state, telemetry, and third-party
  dependencies visible.
- Expect closer coordination between application, data, security, and
  governance roles.

## Related Control Themes

- `../controls/data-protection-and-privacy.md`
- `../controls/accessibility-and-inclusive-service-design.md`
- `../controls/external-identity-and-partner-access.md`
- `../controls/customer-notification-and-regulatory-disclosure.md`
