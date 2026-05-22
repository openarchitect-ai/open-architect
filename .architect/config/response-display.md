# Response Display

Use this guide when you want Open Architect responses to feel easier to scan and
reuse in real architecture work.

## Goal

Make responses feel like an architect's working brief, not a generic assistant
dump.

## Recommended Default

Use:

- `response_display_style: architect-friendly`
- `response_display_enforcement: strict`
- `response_session_banner: table`
- `response_status_labels: true`
- `response_task_grouping: ask-confirm-request-decide`
- `response_bottom_line: true`

This keeps the underlying output as Markdown/plain text, but nudges the
assistant toward a more consistent and readable structure.

## Display Contract

When the display contract is active, substantial responses must use:

1. `Session`
2. `Current Picture`
3. `Working Interpretation`
4. `What Matters`
5. `What Is Unclear`
6. `Architect Tasks`
7. `Bottom Line`

The user can still override this by explicitly asking for a different format.

## Recommended Structure

When the task is substantial, prefer this order:

1. active role and skill
2. current picture
3. working interpretation
4. what matters
5. what is unclear
6. architect tasks
7. bottom line

## Top Banner

When `response_session_banner: table`, start with:

```md
**Session**
| Field | Value |
|---|---|
| Mode | `Inventory` |
| Role | `Integration Architect` |
| Skill | `Baseline Discovery` |
| Confidence | `Medium` |
```

This should stay compact. It is for orientation, not narration.

## Status Labels

When `response_status_labels: true`, use status labels with their emoji prefixes
when they improve scanability:

- ✅ `CONFIRMED`
- 🟡 `PROVISIONAL`
- ❓ `OPEN`
- 🚫 `BLOCKER`
- 🔵 `ACTION`
- 📥 `REQUEST`
- 📌 `DECISION`

Two utility prefixes are also available for callouts:

- 💡 `RECOMMEND` / `TIP`
- ⚠️ `WARNING` / `CAUTION`

These are especially useful in:

- reviews
- decision outputs
- architecture working notes
- discovery summaries

## Architect Tasks

When `response_task_grouping: ask-confirm-request-decide`, group tasks as:

- `Ask`
- `Confirm`
- `Request`
- `Decide`

This makes follow-up actions much easier for architects to use in real work.

## Structured Choices

When the response confronts the user with a decision that has **2-4
discrete, mutually-exclusive options with non-trivial trade-offs**,
surface that decision via the host's structured-choice UI (e.g.
`AskUserQuestion` in Claude Code) in addition to the prose explanation.
The structured picker is much faster to scan and reply to than
"option A or B?" in prose.

Use it in these three situations:

1. **Immediate next-step choices** — when the response ends with a
   branching choice the user makes now ("commit or review first?",
   "approach A or B?"). The picker replaces the closing prose question;
   the explanation above it stays intact.
2. **`Decide` tasks with immediate options** — when an Architect Task
   in the `Decide` group is something the user can pick right now (not
   a decision deferred to an architecture board or stakeholder
   workshop). Surface it as a picker in addition to the task bullet.
3. **Option comparisons in the body** — when the response presents an
   options-comparison table (e.g. approaches A/B/C with trade-offs),
   add a picker right after the table so the user can select inline.

Skip the picker for:

- yes/no confirmations or "should I proceed?" prompts
- open-ended exploration ("what could we do about X?")
- scope-clarifying questions mid-task
- decisions the user can't make unilaterally (record those as
  `Ask` / `Confirm` / `Request` instead)

You can also ask **multiple structured questions at once** (typically
2-4 in one prompt) when a decision has multiple axes — e.g. "which
options?" and "in what order?" together.

Where the host has no structured-choice primitive (most non-Claude AI
tools today), fall back to prose options.

## Bottom Line

When `response_bottom_line: true`, end with a short takeaway when the response is longer than a quick answer.

Good examples:

- what the result means
- what the architect can safely do next
- what still blocks progress

## Tables

Prefer tables for:

- known / unknown / questions
- interface baselines
- scope / blocker matrices
- option comparisons
- delivery readiness summaries

## UI Styling Suggestions

Actual colors depend on the chat client or editor, but this is a good visual
mapping if the UI supports styling:

- mode: blue
- role: teal
- skill: purple
- confidence: green / amber / red depending on confidence level
- ✅ `CONFIRMED`: green
- 🟡 `PROVISIONAL`: slate or blue-gray
- ❓ `OPEN`: amber
- 🚫 `BLOCKER`: red
- 🔵 `ACTION`: blue
- 📥 `REQUEST`: violet
- 📌 `DECISION`: cyan

## Practical Rule

Use the display contract by default.

Use heavier formatting only when it helps the architect move faster.
