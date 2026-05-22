# Embedding Lifecycle Management

## Purpose

Manage embedding indexes across their full lifecycle — corpus changes,
model changes, schema changes — so retrieval quality stays consistent and
re-embedding is operationally tractable.

## When To Use

- retrieval-augmented systems use embedding indexes over a corpus
- the corpus changes over time
- the embedding model may change (vendor deprecation, new release,
  organization-driven change)
- retrieval quality is measurable and matters

## When Not To Use

- there is no embedding index (pure context-window or pure fine-tune approach)
- the corpus is static, small, and the embedding model is stable for the
  foreseeable lifetime of the system

## Assumptions

- embeddings can be versioned per document
- a re-embed pipeline can run incrementally and at scale
- retrieval quality can be measured before and after re-embed
- fallback retrieval is possible during re-embed, or downtime is acceptable

## Key Components

- per-document embedding version tracking (which embedding model, which
  embedding version, which corpus version)
- incremental re-embed pipeline for corpus changes
- full re-embed pipeline for embedding model changes
- index version tracking (embedding model version, corpus version, schema version)
- fallback or dual-read strategy during re-embed
- retrieval quality eval before, during, and after re-embed
- runbook for embedding model deprecation
- schema migration approach when chunking, metadata, or filters change

## Benefits

- retrieval quality stays consistent through corpus and model changes
- re-embed cost is predictable and incremental where possible
- vendor model deprecation has a known response
- retrieval quality regressions are caught before broad exposure

## Tradeoffs

- adds infrastructure: version tracking, dual-read, eval-around-re-embed
- requires operational maturity for batch processing
- full re-embed can be expensive (cost and time)

## Common Risks

- embeddings updated without index version tracking — silent inconsistency
- corpus changes propagated faster than re-embed completes — retrieval gaps
- embedding model deprecation as a surprise (no playbook)
- retrieval quality regressions only detected via user complaints
- multi-tenant indexes re-embedded together when they should be independent
- schema changes (chunking, metadata, filters) deployed without backfill

## Related Templates

- data-object
- technology-component
- application-service
- requirement
- risk

## Related Decisions

- embedding model choice and its deprecation likelihood
- per-document version tracking schema
- fallback strategy during re-embed
- re-embed cadence triggers (corpus change, model change, schema change)
- multi-tenant index boundary
