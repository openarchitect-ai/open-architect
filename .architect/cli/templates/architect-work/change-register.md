# Change Register

Chronological log of requirement and scope changes on this project,
newest entry on top. Sponsor-readable: someone reviewing this file should
be able to see what's changed and what the impact was without reading
every requirement YAML.

Distinct from the other architect-work files:

- `open-questions.md` — what's not yet decided
- `answers-and-confirmations.md` — what's been confirmed
- `evidence-requests.md` — what's needed to decide
- `architect-task-list.md` — what the architect is doing about it
- `working-log.md` — chronological narrative of project activity
- **this file** — chronological log of *scope-affecting changes* (requirement-level)

A change-register entry is opened when a requirement is added, modified,
removed, or superseded. See
[`.architect/guidance/requirement-change-handling.md`](../../../.architect/guidance/requirement-change-handling.md)
for the procedure.

## Entries

## YYYY-MM-DD — Change ID: short title

- **Type:** new | modified | removed | superseded
- **Requirements touched:** `REQ-XXXX` (and any superseding/superseded IDs)
- **Source:** sponsor request | regulatory discovery | technical constraint | customer feedback | other
- **Impact assessment:**
  - Solutions: `SOL-XXXX`
  - Decisions: `DEC-XXXX` (and whether each needs re-review)
  - Interfaces: `IF-XXXX`
  - Transitions: `TA-XXXX`
  - Risks: `RSK-XXXX`
  - Compliance: `CA-XXXX`
  - Timeline / cost: <rough magnitude or "none">
- **Decision threshold met?** yes | no — if yes, which signal(s): touches >1 solution / regulatory or compliance posture change / material timeline or cost / crosses a review gate / sponsor request
- **Decision artifact:** `DEC-XXXX` (if promoted) or "not required"
- **Freeze-gate status:** pre-baseline | post-baseline (advisory) | post-baseline (strict — re-opening required)
- **Reversibility:** one-way | reversible
- **Confirmed by:** <sponsor or role> on <date>, or "pending confirmation"
- **Notes:** <any additional context>
