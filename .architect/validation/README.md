# Validation

This folder contains lightweight validation support for the Open Architect
workspace.

## Purpose

Use validation to catch structural drift early, especially when templates,
examples, and agent-produced artifacts start to evolve independently.

The first validator focuses on the template library under `../templates/`.

## Severity Model

Validators now distinguish between:

- `error`
  A structural, referential, or enum issue that should block progression until fixed.
- `warning`
  A softer quality or evidence issue that should be reviewed, but may not need
  to block exploratory work.

By default:

- errors cause a non-zero exit code
- warnings are reported but do not fail the run

If you want warnings to fail the run too, use `-FailOnWarning`.

Both validators also emit a final machine-friendly summary line:

```text
VALIDATION_SUMMARY validator=<name> status=<status> checked=<n> errors=<n> warnings=<n>
```

## Included

- `Validate-Templates.ps1`
  Checks the template contract for the template library without requiring
  external dependencies.
- `Validate-ArchitectureArtifacts.ps1`
  Checks any architecture artifact folder for structural consistency, resolvable
  relationships, local references, and basic approval/evidence hygiene.
  It is intended for both reference projects under `.architect/examples/` and
  live project folders under `.architect/architecture/`.

## What The Template Validator Checks

- file stem matches `template.kind`
- `template` and `spec` sections exist
- required template keys exist:
  - `kind`
  - `version`
  - `schema_version`
  - `description`
- required spec keys exist:
  - `id`
  - `name`
  - `display_name`
  - `aliases`
  - `summary`
  - `description`
  - `metadata`
  - `relationships`
- required metadata keys exist:
  - `source_of_truth`
  - `last_reviewed`
  - `review_owner`
  - `confidence`
  - `references`
  - `change_log`
- relationship entries include:
  - `type`
  - `target_kind`
  - `target_id`
  - `strength`
  - `confidence`
- core enum values:
  - `metadata.confidence`
  - `relationships.strength`
  - `relationships.confidence`
- common date fields use `YYYY-MM-DD`

## What It Does Not Yet Check

- all template-specific enum values
- full YAML parsing and schema validation
- relationship target existence across live artifacts
- full artifact approval-state validation
- human-review gate enforcement

## How To Run

From the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .architect\validation\Validate-Templates.ps1
```

The script exits with a non-zero code if validation errors are found.

To make warnings fail too:

```powershell
powershell -ExecutionPolicy Bypass -File .architect\validation\Validate-Templates.ps1 -FailOnWarning
```

To validate a specific architecture artifact folder:

```powershell
powershell -ExecutionPolicy Bypass -File .architect\validation\Validate-ArchitectureArtifacts.ps1 -ArtifactRoot .architect\examples\customer-onboarding-modernization
```

You can pass a different relative or absolute folder path to reuse the same
validator for live project artifacts later.

To make warnings fail too:

```powershell
powershell -ExecutionPolicy Bypass -File .architect\validation\Validate-ArchitectureArtifacts.ps1 -ArtifactRoot .architect\architecture -FailOnWarning
```

## How Agents Should Use Validation

A good default agent pattern is:

1. draft or update artifacts
2. run the relevant validator
3. fix all `error` findings before continuing
4. surface `warning` findings in the review summary
5. keep artifacts in `draft` or `proposed` if warnings still matter to governance or evidence quality

In practice:

- structural failures should block agent progression
- warnings should trigger disclosure and human review
- `-FailOnWarning` is useful for stricter quality gates such as governance review or CI
- the `VALIDATION_SUMMARY` line gives agents a stable parse target for counts and overall status
