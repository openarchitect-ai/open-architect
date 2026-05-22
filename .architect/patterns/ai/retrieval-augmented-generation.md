# Retrieval-Augmented Generation

## Purpose

Ground language model outputs in retrieved context from a curated corpus,
so the model answers from authoritative content rather than from
training-data memory alone.

## When To Use

- the model needs to answer from a specific corpus (internal docs, product
  knowledge, regulations, customer data)
- the corpus changes faster than the model is retrained
- responses must be traceable to source material
- factual grounding is a stated quality requirement

## When Not To Use

- the use case does not depend on a specific corpus (pure language tasks
  like summarization, translation, or classification on the input)
- the model's training data already covers the corpus and freshness does
  not matter
- the corpus is small enough to fit in the context window without retrieval
- the latency budget cannot absorb retrieval overhead

## Assumptions

- a curated corpus exists or can be assembled
- the corpus can be chunked, embedded, and indexed
- a retrieval layer (vector store, search index, or hybrid) is available
- the model can be prompted to attribute and ground its responses

## Key Components

- corpus ingestion and preprocessing
- chunking strategy
- embedding model (often separate from generation model)
- retrieval index (vector, lexical, or hybrid)
- retrieval-time ranking and filtering (including tenant or classification scoping)
- prompt construction with retrieved context
- generation model with grounding instructions
- attribution and citation in output
- eval signal for retrieval quality (recall, precision) and grounding
  quality (factuality, attribution accuracy)

## Benefits

- responses ground in authoritative content
- corpus updates do not require model retraining
- attribution supports auditability and user trust
- reduces reliance on model memory for current facts

## Tradeoffs

- adds retrieval latency and cost per request
- introduces embedding lifecycle complexity (re-embed on corpus or model change)
- chunking and ranking quality become first-class concerns
- prompt context window becomes a constrained resource

## Common Risks

- stale or poorly chunked corpus silently degrades retrieval quality
- retrieval recall failures cause the model to answer from memory and hallucinate
- attribution that claims a source supports content the source does not actually support
- multi-tenant corpora leak across tenants if isolation is weak
- corpus updates without re-embedding leave the index inconsistent
- retrieval-time PII leakage when classification scoping is missing

## Related Templates

- solution
- application-service
- interface
- data-object
- technology-component
- requirement
- risk

## Related Decisions

- embedding model choice
- vector store or hybrid index choice
- chunking strategy
- retrieval ranking strategy
- attribution presentation in output
- tenant and classification scoping at retrieval time
