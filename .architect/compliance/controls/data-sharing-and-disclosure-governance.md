# Data Sharing and Disclosure Governance Control Theme

Use this guide when architecture choices determine how information is shared
across organizations, partners, platforms, public bodies, or internal domains
with different rights and obligations.

## Typical Regulation Drivers

- `GDPR`
- `CCPA/CPRA`
- `EU Data Act`
- education, healthcare, or public-sector disclosure constraints

## Architecture Questions

- Who can receive which data, for what purpose, and under what agreement?
- Are disclosure, onward sharing, analytics reuse, and public reporting flows
  distinguishable in the model?
- Can the system explain and evidence data-sharing decisions?

## Architecture Responses

- Treat sharing and disclosure as governed capabilities, not just integrations.
- Keep purpose, recipient type, data scope, and approval boundaries visible.
- Expect coordination between data, governance, security, and legal/compliance
  reviewers.

## Useful Patterns

- `../../patterns/data/data-sharing-agreement-governance.md`
- `../../patterns/data/data-domain-ownership.md`
- `../../patterns/data/data-lineage-and-provenance.md`
- `../../patterns/integration/anti-corruption-layer.md`
