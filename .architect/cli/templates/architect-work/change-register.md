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
removed, or superseded — OR when a propagation-closure is recorded for
a prior change. See
[`.architect/guidance/requirement-change-handling.md`](../../../.architect/guidance/requirement-change-handling.md)
for the procedure.

## Entries

## YYYY-MM-DD — Change ID: short title

- **Type:** new | modified | removed | superseded | propagation-closure
- **Requirements touched:** `REQ-XXXX` (and any superseding/superseded IDs); for `propagation-closure`, list the artifacts being refreshed instead
- **Source:** sponsor request | regulatory discovery | technical constraint | customer feedback | architecture-review finding | gap-radar finding | other
- **Original CHG (propagation-closure only):** `CHG-XXXX` — the prior entry this closure is completing
- **Impact assessment (sweep upstream and downstream):**
  - Vision: `VIS-XXXX` (and whether the future_state / scope / principles / risks need refreshing)
  - Objectives: `OBJ-XXXX` (and whether success measures or rationale need refreshing)
  - Principles: `PRN-XXXX` (if `principle` template is enabled)
  - Solutions: `SOL-XXXX`
  - Decisions: `DEC-XXXX` (and whether each needs re-review or supersession)
  - Applications / services / interfaces: `APP-XXXX` / `AS-XXXX` / `IF-XXXX`
  - Data objects: `DO-XXXX`
  - Transitions: `TA-XXXX`
  - Risks: `RSK-XXXX` (note any risk-state transitions, e.g. `mitigated` → `materialized`)
  - Compliance: `CA-XXXX`
  - Technology / environments: `TC-XXXX` / `ENV-XXXX`
  - Timeline / cost: <rough magnitude or "none">
- **Decision threshold met?** yes | no — if yes, which signal(s): touches >1 solution / regulatory or compliance posture change / material timeline or cost / crosses a review gate / sponsor request. (Not applicable for `propagation-closure` — that's catch-up work, not new scope.)
- **Decision artifact:** `DEC-XXXX` (if promoted) or "not required"
- **Freeze-gate status:** pre-baseline | post-baseline (advisory) | post-baseline (strict — re-opening required)
- **Reversibility:** one-way | reversible
- **Confirmed by:** <sponsor or role> on <date>, or "pending confirmation"
- **Post-change review:** ran | not-applicable | scheduled — if the change met the threshold OR touched >3 artifacts, an `architecture-review` pass should run while the change is fresh; record the outcome here
- **Notes:** <any additional context>
