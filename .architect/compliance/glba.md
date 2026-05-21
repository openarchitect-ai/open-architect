# Gramm-Leach-Bliley Act

## Regulation

- FTC GLBA overview: https://www.ftc.gov/privacy-and-security/gramm-leach-bliley-act
- FTC Privacy Rule guidance:
  https://www.ftc.gov/business-guidance/resources/how-comply-privacy-consumer-financial-information-rule-gramm-leach-bliley-act

## Architecture Relevance

GLBA matters when the project supports financial institutions or consumer
financial services where architecture choices affect financial privacy notices,
information sharing, opt-out support, safeguard design, and third-party use of
nonpublic personal information.

## Typical Architecture Concerns

- customer financial information protection
- privacy notice and opt-out support
- data sharing with nonaffiliated third parties
- safeguards and monitoring around financial data
- pretexting resistance and identity assurance
- auditability and service provider control

## Useful Patterns

- `data-sharing-agreement-governance`
- `identity-federation`
- `security-control-inheritance`
- `privileged-session-monitoring`
- `architecture-assurance-evidence-trail`
