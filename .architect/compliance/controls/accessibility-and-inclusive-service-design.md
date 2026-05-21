# Accessibility and Inclusive Service Design Control Theme

Use this guide when the solution includes customer-facing or workforce-facing
digital channels that must remain usable, inclusive, and legally defensible for
people with different access needs.

## Typical Regulation Drivers

- accessibility obligations in the operating market
- public-sector or education accessibility expectations
- digital-product or consumer-service inclusion requirements

## Architecture Questions

- Are accessibility expectations treated as a design concern from the start or
  as a late UI-only checklist?
- Do identity, workflow, content, and document-generation features remain
  usable across different access needs?
- Are customer journeys dependent on inaccessible side channels or manual
  workarounds?

## Architecture Responses

- Treat accessibility as an end-to-end service concern, not only a presentation
  concern.
- Keep channel dependencies, content generation, identity steps, and fallback
  journeys visible.
- Expect public-facing, education, and public-sector services to face stronger
  scrutiny.

## Useful Patterns

- `../../patterns/application/backend-for-frontend.md`
- `../../patterns/application/api-facade.md`
- `../../patterns/technology/graceful-degradation.md`
