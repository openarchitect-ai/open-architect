# Lifecycle And Dates

This guide defines how statuses and dates should be used in Open Architect
artifacts.

## Status Rules

Use lifecycle and approval fields to reflect certainty honestly:

- early or partial artifacts should normally remain `draft`, `proposed`, or equivalent
- do not mark architecture content as `approved` unless the relevant authority has actually approved it
- do not mark requirements as `verified` unless verification evidence exists

Status must reflect reality, not intent.

## Date Rules

Artifacts should carry dates, but only the dates that are meaningful for that
artifact type.

Use dates to express:

- stewardship and review timing
- decision effectiveness
- planned delivery timing
- target verification or resolution timing

Do not add dates only for symmetry if the date has no real architectural
meaning.

## Dates Expected On Most Artifacts

Most artifacts should include:

- `metadata.last_reviewed`
- one or more `metadata.change_log.date` entries

These support stewardship, auditability, and recency checks.

## Dates Used Selectively By Artifact Type

Use additional dates where they matter:

- `effective_date` for decisions or standards that become active at a known point
- `review_date` for decisions, standards, or assessments that require later reconsideration
- `start_date` and `target_end_date` for initiatives and work packages
- `target_resolution_date` for gaps
- `target_verification_date` for requirements
- milestone or target dates inside roadmaps where sequencing matters

## Date Quality Rules

- Dates should reflect real review, approval, or planning intent.
- Do not present guessed dates as committed dates.
- If a date is provisional, keep the surrounding status consistent with that uncertainty.
- If an artifact changes materially, update `metadata.last_reviewed` and add a change log entry.
- If a review or approval date is no longer trustworthy, revise or remove it rather than leaving stale metadata behind.

## Human And Agent Expectations

When creating or updating artifacts:

- agents should preserve valid historical dates unless the change really supersedes them
- agents should not fabricate approval, review, or delivery dates
- humans should confirm important planning or approval dates at review gates

Dates are part of the evidence model. They should help explain when something
was reviewed, decided, planned, or verified, not create false precision.
