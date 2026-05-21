# Compliance

This folder contains compliance-aware reference material for Open Architect.

## Level

`compliance/` is usually `Optional`.

Use it when the project is:

- regulated
- cross-jurisdiction
- sector-sensitive
- handling sensitive data, payments, AI, or resilience obligations

For many projects, this folder can stay mostly untouched until scope or sector
evidence says it matters.

Use it to capture the external legal, regulatory, and standards obligations
that architecture work must account for, especially when projects cross
jurisdictions, operate in regulated sectors, or handle sensitive data and AI.

## Purpose

Use this folder for:

- regulation profiles and applicability notes
- jurisdiction and sector scoping guidance
- control-oriented architecture interpretation notes
- links between regulations, risks, controls, and architecture patterns

## Folder Structure

```text
compliance/
  jurisdictions/
  sectors/
  controls/
```

Use the root folder for regulation profiles.

Use `jurisdictions/` for geographic overlays such as `eu-eea`,
`united-states`, `california`, `united-kingdom`, and `canada`.

Use `sectors/` for industry overlays such as `financial-services`,
`healthcare`, `education`, `payments`, `public-sector`,
`critical-infrastructure`, `software-products`, `consumer-digital`, and
`life-sciences-and-pharma`.

Use `controls/` for control-oriented translation guides such as
`data-protection-and-privacy`, `identity-and-access`,
`incident-reporting-and-response`, `audit-and-evidence`,
`third-party-risk-and-outsourcing`, `data-residency-and-cross-border-transfer`,
`ai-governance-and-model-risk`, and
`business-continuity-and-operational-resilience`, plus related guides for
records, access review, disclosure governance, accessibility, model assurance,
change control, and vendor portability.

## How To Use

- use `project-config.yaml` to declare the jurisdictions, sectors, and
  applicable regulations for a project
- use these profiles during project bootstrap, risk/compliance assessment, data
  modeling, and technology/environment modeling
- use patterns and regulation profiles together: regulations explain
  obligations, patterns explain reusable solution responses

Recommended working order:

1. identify whether compliance is actually in scope
2. activate only the jurisdictions, sectors, and profiles that matter
3. keep the project config narrow instead of loading the full library by default

## Starter Regulation Set

This starter set includes:

- `GDPR`
- `UK GDPR`
- `EU AI Act`
- `European Accessibility Act`
- `NIS2`
- `DORA`
- `Cyber Resilience Act`
- `EU Data Act`
- `eIDAS / European Digital Identity Framework`
- `MiCA`
- `GLBA`
- `FedRAMP`
- `CMMC`
- `CJIS Security Policy`
- `HIPAA Security Rule`
- `FTC Safeguards Rule`
- `SEC Cyber Disclosure Rules`
- `PCI DSS`
- `CCPA/CPRA`
- `COPPA`
- `FERPA`
- `LGPD`

These files are architecture-oriented guidance notes, not legal advice.
