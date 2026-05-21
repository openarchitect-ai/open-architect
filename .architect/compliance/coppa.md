# COPPA

## Regulation

- COPPA Rule overview: https://www.ftc.gov/legal-library/browse/rules/childrens-online-privacy-protection-rule-coppa

## Architecture Relevance

COPPA matters when an online service is directed to children under 13 or has
actual knowledge it collects personal information from children under 13.

## Typical Architecture Concerns

- age-related data collection boundaries
- parental consent flows and evidence
- retention and deletion controls
- sharing restrictions and third-party dependencies
- privacy-by-design for child-directed experiences

## Useful Patterns

- `regulated-data-access-approval`
- `regulated-data-retention-and-legal-hold`
- `data-sharing-agreement-governance`
- `data-classification-and-handling`
- `architecture-assurance-evidence-trail`
