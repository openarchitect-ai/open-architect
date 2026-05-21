# Schemas

This folder contains formal JSON Schema contracts for Open Architect artifact
documents.

## Purpose

Use schemas to define the expected structure of architecture artifacts in a
machine-readable way.

Schemas complement the validators under `../validation/`:

- `schemas/` define the structural contract
- `validation/` enforce repo-aware and governance-aware rules

## Scope

The first schema pass focuses on artifact instance files, not the template
wrapper files under `../templates/`.

In other words:

- these schemas target documents created under `.architect/examples/` or
  `.architect/architecture/`
- they validate the top-level `spec` structure used by actual architecture
  artifacts
- template-library validation remains primarily handled by
  `../validation/Validate-Templates.ps1`

## Included

- `common-definitions.schema.json`
  Shared definitions for metadata, references, change log entries,
  relationships, tags, notes, and common enums.
- `requirement.schema.json`
  First-pass contract for `requirement` artifacts.
- `solution.schema.json`
  First-pass contract for `solution` artifacts.
- `decision.schema.json`
  First-pass contract for `decision` artifacts.
- Additional schema coverage for the current worked-example set:
  - `application.schema.json`
  - `application-service.schema.json`
  - `interface.schema.json`
  - `data-object.schema.json`
  - `environment.schema.json`
  - `technology-component.schema.json`
  - `stakeholder.schema.json`
  - `objective.schema.json`
  - `business-capability.schema.json`
  - `business-process.schema.json`
  - `architecture-vision.schema.json`
  - `initiative.schema.json`
  - `transition-architecture.schema.json`
  - `work-package.schema.json`
  - `risk.schema.json`
- Remaining core workspace coverage now added:
  - `organization.schema.json`
  - `principle.schema.json`
  - `technology-standard.schema.json`
  - `roadmap.schema.json`
  - `gap.schema.json`
  - `compliance-assessment.schema.json`

## Design Approach

These schemas intentionally focus on the stable shared structure first:

- required identity fields
- metadata and evidence structure
- relationship structure
- common lifecycle and enum patterns
- key kind-specific sections for the first three high-value artifact kinds

They are intentionally lighter than a full metamodel implementation so the
workspace can evolve without locking every field too early.

The schemas now also carry some deeper control rules where useful:

- kind-specific `spec.id` patterns
- stronger URL/reference patterns
- unique alias and tag arrays
- conditional approval/evidence expectations for several governed artifact kinds

## Current Limits

This schema layer does not yet:

- cover every template kind in the library with equally deep semantic constraints
- validate cross-file target resolution
- validate human approval gates
- replace the existing PowerShell validators
- enforce every template-specific semantic rule

## Next Integration Step

The next practical step is to let the validators consume these schemas when a
schema parser strategy is chosen, while keeping custom repo-level checks in
`../validation/`.
