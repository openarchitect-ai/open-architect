# Architect Work Folder

Use a project-local `architect-work/` folder when you want one place for the
architect to capture the information that emerges after each working session.

## Purpose

This folder is for human-maintained follow-up material, not formal architecture
artifacts.

Use it to capture:

- open questions
- confirmed answers
- missing evidence
- architect task lists
- scope clarifications
- stakeholder follow-up notes

## Recommended Shape

```text
workspace/<project-name>/
  docs/
  architect-work/
    open-questions.md
    answers-and-confirmations.md
    evidence-requests.md
    architect-task-list.md
    working-log.md
    change-register.md
```

If you want a faster start, create the six files up front even if they are
mostly empty. That makes it easier for the assistant to suggest where new
information should go. The `architect new` CLI scaffolds all six from the
templates in [`cli/templates/architect-work/`](../cli/templates/architect-work/).

## Suggested File Roles

### `open-questions.md`

Keep short unanswered questions here, especially ones that could change:

- scope
- interface interpretation
- ownership
- build sequencing
- target-state understanding

### `answers-and-confirmations.md`

Capture the answers that come back from stakeholders or source material.

Good contents:

- confirmed interpretation of the project
- confirmed in-scope / out-of-scope items
- confirmed ownership or system-of-record boundaries
- clarified assumptions

### `evidence-requests.md`

Use this for things you still need to request.

Examples:

- API specs
- sample payloads
- file layouts
- error-handling behavior
- ownership or support contacts
- environment details

### `architect-task-list.md`

Use this as the running backlog of practical next tasks for the architect.

Good contents:

- stakeholder follow-ups
- evidence collection tasks
- review/preparation tasks
- validation tasks
- scoping and sequencing tasks

### `working-log.md`

Use this as the chronological, plain-language record of what happened on
the project — newest entry on top. While the four topical files above
organize by category (questions, answers, evidence, tasks), the working
log organizes by time so the project's story can be read linearly.

Add an entry when a skill runs, a scope or playbook change lands, a
sponsor or stakeholder decision is confirmed, or anything else worth
remembering. Skip routine edits — git history already captures those.

### `change-register.md`

Use this as the chronological log of requirement and scope changes —
newest entry on top. Sponsor-readable: someone reviewing this file
should be able to see what's changed and what the impact was without
reading every requirement YAML.

A change-register entry is opened when a requirement is added, modified,
removed, or superseded, or when a propagation-closure is recorded for a
prior change. See
[`../guidance/requirement-change-handling.md`](../guidance/requirement-change-handling.md)
for the procedure.

## Starter Templates

The four starter shapes below are kept here for quick reference. The
live, authoritative starter templates for all six files (including
`working-log.md` and `change-register.md`) are in
[`../cli/templates/architect-work/`](../cli/templates/architect-work/)
and are what `architect new` writes into a new project.

Use these as simple starter shapes.

### `open-questions.md`

```md
# Open Questions

## Scope

- ...

## Delivery

- ...

## Technical

- ...

## Update Log

## YYYY-MM-DD

Answered:
- ...

Still open:
- ...

New questions:
- ...
```

### `answers-and-confirmations.md`

```md
# Answers And Confirmations

## Confirmed

- ...

## Current Working Interpretation

- ...

## Still Provisional

- ...

## Update Log

## YYYY-MM-DD

Confirmed:
- ...

Clarified:
- ...

Still provisional:
- ...
```

### `evidence-requests.md`

```md
# Evidence Requests

## Requested

- ...

## Received

- ...

## Still Missing

- ...

## Update Log

## YYYY-MM-DD

Requested:
- ...

Received:
- ...

Still missing:
- ...
```

### `architect-task-list.md`

```md
# Architect Task List

## Immediate

- ...

## Waiting On Others

- ...

## Near Term

- ...

## Done

- ...

## Current Assessment

- ...

## Update Log

## YYYY-MM-DD

Completed:
- ...

Newly confirmed:
- ...

Now waiting on:
- ...

Next tasks:
- ...
```

## Operating Rule

The assistant can help identify follow-up material, but the architect is the
owner of what gets captured and confirmed in this folder.

That keeps:

- human judgment visible
- clarifications close to the project
- uncertain context separate from formal architecture artifacts

## Automation Rule

Recommended default:

- `architect_work_auto_capture: true`
- `architect_work_auto_update_mode: approval-before-write`
- `architect_work_auto_update_scope: architect-work-only`

This means:

- the assistant should notice follow-up material as part of normal work
- the assistant may suggest or prepare updates for the files in `architect-work/`
- the assistant should only write those updates after the architect confirms
- this behavior should not spill into formal architecture artifacts unless explicitly requested
