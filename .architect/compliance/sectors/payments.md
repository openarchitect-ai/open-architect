# Payments Sector Profile

Use this profile when the architecture handles cardholder data, payment
transactions, tokenization, gateway integration, payment-provider dependencies,
or fraud-sensitive financial flows.

## Why It Matters

Payments work often needs tighter control boundaries than broader financial
services because transaction integrity, card-data protection, third-party
provider trust, and incident impact all shape the architecture directly.

## Commonly Relevant Regulation Families

- `PCI DSS`
- `FTC Safeguards Rule` where broader financial data is involved
- `DORA` where payment operations are part of a regulated financial entity

## Architecture-Relevant Questions

- Does the solution store, process, or transmit cardholder data?
- Can payment scope be reduced through tokenization, segregation, or provider
  isolation?
- Are payment processors, gateways, vaults, and fraud services visible in the
  architecture as real control dependencies?
- Are availability, reconciliation, rollback, and dispute-handling paths clear?

## Architecture Implications

- Minimize payment-data footprint wherever possible.
- Treat tokenization, segmentation, key handling, provider trust, and audit
  trails as architecture decisions.
- Keep payment dependencies, fallback paths, and reconciliation behavior
  explicit.
- Expect more rigorous review around integration, logging, and third-party
  control assumptions.

## Related Control Themes

- `../controls/payment-security-and-card-data.md`
- `../controls/third-party-risk-and-outsourcing.md`
- `../controls/audit-and-evidence.md`
