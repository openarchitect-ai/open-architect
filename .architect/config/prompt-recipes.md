# Prompt Recipes

These recipes are designed for the `architect-assist` model.

Use them to keep the agent aligned to the kind of help you actually want.

If you want the agent to guide you within the mode, add language like:

```text
Guide me as you go.
Tell me your current working interpretation, what matters, what is still unclear, what the next sensible move is, and what tasks I now have as the architect. Capture as many useful follow-up tasks as you safely can.
Tell me what role and skill you are using.
Use the standard architect-friendly response format.
```

If you want the follow-up tasks grouped in a practical way, add:

```text
Group my tasks as ask / confirm / request / decide.
```

If you want the assistant to prepare `architect-work/` updates but wait for your approval, add:

```text
Suggest updates for the `architect-work/` folder, but do not write them until I confirm.
```

## Project Recap

Use when you are joining a project late, returning after time away, preparing
a handover, or simply starting a working session and need orientation first.

```text
Project Recap.

Run the `project-recap` skill against `.architect/architecture/<project-name>/`.
Walk the read order in `.architect/guidance/project-recap-protocol.md`.

Tell me:
- where the project is
- what is confirmed
- what is open
- what is stale
- what has drifted (with proposed reconciliations)
- who is involved
- the 1-3 things that matter most now
- my architect tasks grouped as ask / confirm / request / decide

Do not modify any architecture artifacts.
Surface proposed `architect-work/` updates as suggestions only, awaiting my confirmation.
Use the standard architect-friendly response format.
```

Variations to add when needed:

```text
Use the quick recap variation. Only give me where the project is, what matters most now, and the bottom line.
```

```text
Use the handover recap variation. Include an explicit "Open Threads For Successor" section.
```

```text
Use the drift-focused recap variation. Only report what has drifted and proposed reconciliations.
```

## Gap Radar

Use when you want an active sweep for missing content, contradictions,
ownership untruths, governance hygiene issues, drift, and present-day
standards gaps. Best before review gates or when re-entering after recap.

```text
Gap Radar.

Run the `gap-radar` skill against `.architect/architecture/<project-name>/`.
Use the checklists in `.architect/guidance/gap-radar-checklists.md`.

Honor the scope controls:
- only run checks for template kinds in `templates.enabled`
- only fire jurisdiction-specific checks for entries in `compliance.applicable_regulations`

Give me a `Gap Radar Report` with:
- the scan scope (what was scanned, what was skipped, why)
- blockers
- missing required content
- inconsistencies
- present-day standards gaps
- ownership truthfulness risks
- governance hygiene
- drift signals
- my architect tasks grouped as ask / confirm / request / decide
- a bottom line naming the 1-3 highest-leverage findings

Do not modify any architecture artifacts.
Surface proposed `architect-work/` updates as suggestions only, awaiting my confirmation.
Use the standard architect-friendly response format.
```

Variations to add when needed:

```text
Use the headline radar variation. Only `BLOCKER` and `OPEN` items. One screen.
```

```text
Use the domain radar variation. Restrict to <data | integration | security | transition | application>.
```

```text
Use the artifact radar variation. Focus on <solution / transition / decision name> and everything it touches.
```

```text
Use the gate radar variation. Tune the checks to the next imminent review gate (<gate-name>).
```

```text
Use the modernity radar variation. Only run the present-day standards checks.
```

## Inventory Mode

Use when you want source-first extraction only.

```text
Inventory mode.

Read the source files under `.architect/architecture/<project-name>/docs/`.
Extract the applications and interfaces relevant to <topic>.
Do not create architecture artifacts.
Keep unknowns explicit.
Guide me as you go.
```

## Analysis Mode

Use when you want clustering, patterns, or recommendations.

```text
Analysis mode.

Using the extracted baseline, group the interfaces into meaningful clusters for <goal>.
Recommend 3 candidate scope cuts.
Do not create architecture artifacts yet.
Guide me as you go.
```

## Review Mode

Use when you want critique.

```text
Review mode.

Challenge this proposed scope / transition approach / architecture direction.
Focus on gaps, hidden dependencies, and risks.
Do not rewrite the project unless I ask.
Guide me as you go and tell me which findings matter most.
```

## Decision Mode

Use when you want a recommendation among options.

```text
Decision mode.

Compare these options for Wave 1:
- <option 1>
- <option 2>
- <option 3>

State tradeoffs and recommend one.
Do not create architecture artifacts yet.
Guide me as you go.
```

## Modeling Mode

Use when you explicitly want project assets.

```text
Modeling mode.

Using the agreed scope and source evidence, create the minimum architecture artifacts needed for this slice.
Keep assumptions explicit.
Do not invent owners or approvals.
Guide me as you go and tell me what should be reviewed next.
```

## Transition Scope Recipe

Good for migration work.

```text
Analysis mode.

Using the current-state source material, identify the interfaces and applications relevant to <migration goal>.
Recommend a bounded Wave 1 scope.
Do not create project artifacts yet.
Guide me as you go.
```

## Compliance Support Recipe

Good when you want architecture implications without over-formalizing too early.

```text
Analysis mode.

Given this scope, identify the likely compliance and control concerns that an architect should account for.
Keep it practical and architecture-focused.
Do not create compliance artifacts unless I ask.
Guide me as you go.
```

## Convert To Artifacts Recipe

Use when you are ready to preserve the result.

```text
Modeling mode.

Turn the agreed baseline and scope into project artifacts under `.architect/architecture/<project-name>/`.
Create only the minimum useful set.
Keep all unresolved questions visible.
Guide me as you go.
```

## Discovery Call Preparation

Good when you need to turn source material into a first stakeholder call.

```text
Analysis mode.

Using the source material under `.architect/architecture/<project-name>/docs/`, prepare me for a first discovery call.
Give me:
- a short working interpretation
- the most important unknowns
- the key risks or assumptions
- my architect tasks grouped as ask / confirm / request / decide

Do not create architecture artifacts.
Guide me as you go.
```

## Stakeholder Summary

Good when you need a concise briefing note for others.

```text
Analysis mode.

Summarize this project slice for stakeholders.
Give me:
- what we know
- what is still unclear
- what matters most
- what needs confirmation next

Keep it practical and brief.
Do not create architecture artifacts.
Guide me as you go.
```

## Workshop Agenda

Good when you want to run a structured clarification session.

```text
Analysis mode.

Prepare a workshop agenda from this source material.
Focus on:
- target-state understanding
- scope clarification
- interface confirmation
- build blockers

Give me my architect tasks grouped as ask / confirm / request / decide.
Do not create architecture artifacts.
Guide me as you go.
```

## Follow-Up Mail Outline

Good when you want a practical follow-up message after discovery.

```text
Analysis mode.

Based on this project slice, draft a follow-up mail outline for stakeholders.
Include:
- confirmed understanding
- open questions
- evidence we need
- next actions

Keep it concise and practical.
Do not create architecture artifacts.
Guide me as you go.
```
