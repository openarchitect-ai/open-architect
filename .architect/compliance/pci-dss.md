# PCI DSS

## Standard

- PCI DSS overview: https://www.pcisecuritystandards.org/standards/pci-dss

## Architecture Relevance

PCI DSS matters when the project stores, processes, or transmits payment card
data or materially affects systems in scope for cardholder-data protection.

## Typical Architecture Concerns

- network segmentation and scope control
- logging and monitoring
- access control and privileged operations
- secure configuration and secret handling
- supplier and service-provider boundaries

## Useful Patterns

- `zero-trust-network-segmentation`
- `audit-and-tamper-evident-logging`
- `privileged-session-monitoring`
- `secrets-and-configuration-management`
- `runtime-policy-enforcement`
