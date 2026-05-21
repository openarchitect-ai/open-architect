# CJIS Security Policy

## Regulation

- FBI CJIS Security Policy v5.9.4:
  https://le.fbi.gov/file-repository/cjis_security_policy_v5-9-4_20231220.pdf/view

## Architecture Relevance

CJIS Security Policy matters when the project supports law-enforcement or
criminal-justice information environments where architecture choices affect
access control, auditability, encryption, remote access, physical/logical
protection, and contractor support boundaries.

## Typical Architecture Concerns

- criminal justice information handling and segregation
- strong identity, authentication, and remote-access control
- audit logging and evidence for access and operations
- contractor, vendor, and support access restrictions
- device, network, and physical/logical protection alignment

## Useful Patterns

- `zero-trust-network-segmentation`
- `break-glass-access`
- `privileged-session-monitoring`
- `audit-and-tamper-evident-logging`
- `policy-to-control-traceability`
