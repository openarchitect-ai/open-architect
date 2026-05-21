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
.architect/architecture/<project-name>/
  docs/
  architect-work/
    open-questions.md
    answers-and-confirmations.md
    evidence-requests.md
    architect-task-list.md
```

If you want a faster start, create the four files up front even if they are
mostly empty. That makes it easier for the assistant to suggest where new
information should go.

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

## Starter Templates

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
