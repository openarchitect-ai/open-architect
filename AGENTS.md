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

## Allowed Exceptions

You may use a lighter format only when:

- the user explicitly asks for a different format
- the reply is a trivially short one-liner
- a tool call acknowledgment or micro-update would be made less clear by the full structure

## Intent

Responses should read like an architect's working brief, not a generic assistant
reply.
