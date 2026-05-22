# Model Vendor Portability

## Purpose

Architect for the realistic possibility that the model vendor will change
behavior, deprecate the model, reprice, or become unavailable — so the
platform retains continuity without rebuild.

## When To Use

- the platform relies on a hosted model (vendor API, managed inference)
- vendor lock-in carries strategic, regulatory, or operational risk
- model deprecation, repricing, or availability disruption is a realistic concern
- multiple vendors offer competitive models for the use case (true for
  most LLM scenarios today)

## When Not To Use

- the platform runs only self-hosted, open-weight models with no vendor dependency
- the use case is so vendor-specific that portability is genuinely
  impractical — requires explicit acceptance and a documented stance

## Assumptions

- abstraction over vendor surfaces is possible (with effort)
- alternative models can be evaluated against the same gold sets
- prompts can be migrated, possibly with retuning
- portability has an explicit acceptance bar

## Key Components

- vendor abstraction layer (single SDK, gateway, or model router)
- portable prompt format (vendor-neutral where possible)
- portable eval pipeline (runs against alternative models)
- alternative model pre-validation (held warm for migration)
- deprecation response playbook (timeline, migration plan, eval
  re-baseline, communications)
- portable data formats where possible (prompts, embeddings, training
  data, fine-tune artifacts)
- contract and commercial position (exit clause, data export, model
  deprecation notice clause)
- portability test cadence (periodically verify the switch actually works)

## Benefits

- continuity if vendor deprecates, reprices, or fails
- negotiating leverage with vendor
- option value for future cost or capability shifts
- reduced architectural debt around lock-in

## Tradeoffs

- abstraction layer adds engineering effort
- vendor-specific features may be sacrificed
- prompts written for one model may need retuning on alternatives
- portability test cadence is its own operational cost

## Common Risks

- portability claimed but never tested
- abstraction layer leaks vendor specifics (subtly locking in via prompt patterns)
- alternative model never pre-validated — migration discovers gaps
- fine-tune or embedding lock-in (vendor-specific artifacts that do not port)
- contract terms missed (no exit clause, no data export, surprise repricing)
- single vendor for both embeddings and generation — concentrated point of failure
- prompts tested only on the primary vendor — alternative behavior unknown

## Related Templates

- decision
- application-service
- technology-component
- risk
- compliance-assessment

## Related Decisions

- portability bar (none / API parity / model parity / training data portability)
- abstraction layer scope
- alternative model pre-validation cadence
- contract terms required for vendor selection
- deprecation response triggers
