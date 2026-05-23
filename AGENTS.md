# AGENTS

This repository uses the Open Architect workspace conventions under `.architect/`.

## Mandatory Reads

Every AI agent operating in this workspace must read these files at session start, alongside `AGENTS.md` itself:

- [`.architect/config/workspace-defaults.yaml`](.architect/config/workspace-defaults.yaml) — defines every convention flag and its default value
- [`.architect/config/bindings.md`](.architect/config/bindings.md) — **the binding spec** that maps each flag to the AI behavior it governs. This is the single source of truth for what each flag does. Honor every binding here when running any skill.
- [`.architect/config/response-display.md`](.architect/config/response-display.md) — full display-contract spec

`AGENTS.md` is the lean trunk; `bindings.md` is the leaves. Together they tell the AI how to behave at every turn.

## Display Contract

Substantial responses must follow the architect-friendly display
contract defined in
[`.architect/config/response-display.md`](.architect/config/response-display.md).
That doc is the single source of truth for: section order, the
`Session` banner shape, the status-label emoji set, the
`Ask` / `Confirm` / `Request` / `Decide` task grouping, and when to
surface decisions via the host's structured-choice UI. Do not
restate the contract here — read it.

A lighter format is allowed only when:

- the user explicitly asks for a different format
- the reply is a trivially short one-liner
- a tool call acknowledgment or micro-update would be made less clear by the full structure

## Intent

Responses should read like an architect's working brief, not a generic assistant
reply.

## For human architects new to this workspace

See [`.architect/guidance/working-with-open-architect.md`](.architect/guidance/working-with-open-architect.md) for the user-facing guide on how to run skills, update architect-work files, and approve writes via your AI session. AGENTS.md is the *behavioral contract for AI agents*; that guide is the *operational walkthrough for the human architect*.
