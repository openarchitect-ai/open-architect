# Prompt Lifecycle Management

## Purpose

Treat prompts as versioned artifacts with their own lifecycle (draft,
eval, A/B, promote, rollback, deprecate) so production prompt behavior is
reviewable, comparable, and reversible.

## When To Use

- prompts materially affect output quality, safety, or cost
- multiple prompts power production behavior and need version control
- prompt changes need to be testable and reversible
- the team needs to A/B prompts or compare variants under eval
- compliance, audit, or incident response expects prompt provenance

## When Not To Use

- prototyping at the very earliest stage where prompts are exploratory
- the use case is trivial enough that prompt change carries no real risk
- there is no eval mechanism to compare prompt variants — build that first
  (see [continuous-model-evaluation](./continuous-model-evaluation.md))

## Assumptions

- prompts can be stored, versioned, and addressed by ID and version
- eval can attribute output quality to a specific prompt version
- the runtime can route requests to a specific prompt version
- rollback can be executed without redeploying the calling application

## Key Components

- prompt registry (centralized, versioned, with addressable IDs)
- prompt metadata (purpose, owner, eval baseline, related model, deprecation date)
- eval pipeline runs against the prompt version (offline + online)
- A/B routing layer
- promotion gate (offline eval pass + online signal + sign-off)
- rollback mechanism (flip pointer, not redeploy)
- deprecation lifecycle with explicit removal date

## Benefits

- production prompts are reviewable and reversible
- A/B experimentation is bounded and measurable
- prompt incidents have a clear rollback path
- prompt provenance is auditable

## Tradeoffs

- adds infrastructure: registry, routing, eval attribution
- introduces a release cadence for prompts
- requires prompt-aware observability

## Common Risks

- prompts as inline code strings — version drift, no rollback
- prompts changed in production without eval comparison
- eval not attributing output to prompt version
- shadow prompts (different per region, tenant, or developer) without inventory
- silent prompt-change-by-import (upstream library bumps a prompt template)
- prompts retired without checking what still references them

## Related Templates

- application-service
- interface
- requirement
- decision
- technology-component
- risk

## Related Decisions

- prompt registry technology choice
- A/B routing approach
- promotion gate criteria
- rollback mechanism
- deprecation timeline policy
