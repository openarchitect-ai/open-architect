# AI Patterns

This folder contains reusable architecture patterns for AI-era systems —
language models, retrieval-augmented generation, agentic workflows, model
lifecycle, eval, guardrails, and platform-level concerns.

These patterns apply broadly across engagements: a `quick-solution-design`
for an AI-using product, an `ai-platform-bootstrap` engagement, and parts
of `compliance-driven-modernization` (AI Act) all draw from this folder.

## When To Use AI Patterns

Use them when the system materially depends on a language model, an
embedding model, a multi-step agentic loop, or any architecture where
model behavior is the dominant concern. They are first-class working
context for solution modeling, decision recording, review, and
risk/compliance work.

## Pattern Set

| Pattern | When it applies |
|---|---|
| [retrieval-augmented-generation](./retrieval-augmented-generation.md) | the model answers from a specific corpus, with attribution |
| [prompt-lifecycle-management](./prompt-lifecycle-management.md) | prompts are versioned artifacts with eval, A/B, promote, rollback |
| [continuous-model-evaluation](./continuous-model-evaluation.md) | offline + online + drift eval as a continuous pipeline |
| [model-version-promotion-gate](./model-version-promotion-gate.md) | promotion behind eval threshold, red-team pass, sign-off |
| [ai-guardrail-stack](./ai-guardrail-stack.md) | layered defensive controls across input, retrieval, prompt, output |
| [agentic-system-bounded-loop](./agentic-system-bounded-loop.md) | termination conditions, scope constraints, hard stops |
| [embedding-lifecycle-management](./embedding-lifecycle-management.md) | corpus / model / schema changes managed across the index lifecycle |
| [model-vendor-portability](./model-vendor-portability.md) | continuity through deprecation, repricing, or unavailability |

## Planned (Tier 2)

Patterns intentionally deferred from v1 to keep scope tight. Add when real
project use exposes the need:

- `ai-inference-caching` — prompt / embedding / completion / semantic
  cache layers and their eviction model
- `inference-cost-budgeting` — FinOps signals and controls for AI workloads
- `ai-platform-tenant-isolation` — multi-tenancy boundaries on embeddings,
  retrieval indexes, prompt context, logs
- `ai-system-user-disclosure` — AI Act Article 50 and similar disclosure
  obligations
- `hallucination-detection-and-handling` — detection signals and graceful
  handling
- `model-red-teaming` — adversarial testing as a distinct discipline from
  eval
- `ai-human-in-the-loop-review` — review patterns sized to stakes

## How To Contribute

Follow the structure in [`../README.md`](../README.md): Purpose, When To
Use, When Not To Use, Assumptions, Key Components, Benefits, Tradeoffs,
Common Risks, Related Templates, Related Decisions.

Prefer adapting an existing AI pattern in place over creating near-duplicates.
