# AGENTS

This repository uses the Open Architect workspace conventions under `.architect/`.

## Default Response Format

Always use the standard architect-friendly response format described in:

- `.architect/config/workspace-defaults.yaml` (workspace-level convention flags)
- `.architect/config/response-display.md` (the display contract itself)

Unless the user explicitly asks for a different format, substantial responses
must follow that display contract.

## Required Display Contract

For substantial responses:

1. Start with a `Session` block.
2. Use a two-column table with `Field` and `Value` when showing the session banner.
3. Announce the active role and skill near the start of the response.
4. Use this section order:
   - `Current Picture`
   - `Working Interpretation`
   - `What Matters`
   - `What Is Unclear`
   - `Architect Tasks`
   - `Bottom Line`

## Status Labels

When scanability benefits from it, use these labels with their emoji prefixes:

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

## Architect Task Grouping

When presenting follow-up work, group tasks as:

- `Ask`
- `Confirm`
- `Request`
- `Decide`

## Structured Choices

When the response confronts the user with a decision that has **2-4
discrete, mutually-exclusive options with non-trivial trade-offs**,
surface that decision via the host's structured-choice UI (e.g. the
`AskUserQuestion` tool in Claude Code) in addition to the prose
explanation. Use it in these three situations:

1. **Immediate next-step choices** — when the response ends with a
   branching choice the user makes now ("commit or review first?",
   "approach A or B?"). Replace the closing prose question with the
   picker; keep the explanation above it intact.
2. **`Decide` tasks with immediate options** — when an Architect Task
   in the `Decide` group is something the user can pick right now (not
   a decision for a future architecture board). Surface it as a picker
   in addition to the task bullet. External-stakeholder decisions stay
   as bullets only.
3. **Option comparisons in the body** — when the response presents an
   options-comparison table (e.g. approaches A/B/C with trade-offs),
   add a picker right after the table.

Do **not** use the picker for:

- yes/no confirmations or "should I proceed?" prompts
- open-ended exploration ("what could we do about X?")
- scope-clarifying questions mid-task (stay in prose)
- recording an external/stakeholder decision the user can't pick
  unilaterally

Agents whose host has no structured-choice primitive should fall back
to prose options.

## Allowed Exceptions

You may use a lighter format only when:

- the user explicitly asks for a different format
- the reply is a trivially short one-liner
- a tool call acknowledgment or micro-update would be made less clear by the full structure

## Intent

Responses should read like an architect's working brief, not a generic assistant
reply.
