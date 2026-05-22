# Gap Radar

## Purpose

Actively scan a project for gaps, contradictions, ownership untruths, and
present-day-standards misses that an experienced architect would catch but
that are easy to overlook under time pressure or after joining late.

This is a **proactive** skill: it does not wait for the architect to ask
specific questions. It reads what is there and reports what is missing.

## Use When

- the architect wants a fresh-eyes sweep of the project
- the architect has just joined or returned to the project
- before a review gate (`solution-direction`, `decision-approval`, `governance-review`, `transition-plan`)
- after a stretch of intensive modeling, to catch what may have been missed
- when the project is preparing to share architecture externally
- as a routine cadence (e.g. weekly or per-iteration)

## Read First

- [`.architect/guidance/gap-radar-checklists.md`](../guidance/gap-radar-checklists.md)
- [`.architect/project-config.yaml`](../project-config.yaml)
- the project's `architecture/<project-name>/architect-work/` folder, if present
- [`.architect/guidance/traceability-rules.md`](../guidance/traceability-rules.md)
- [`.architect/guidance/governance-conventions.md`](../guidance/governance-conventions.md)
- [`.architect/guidance/evidence-and-quality.md`](../guidance/evidence-and-quality.md)

## Inputs

- the project's architecture artifacts under `.architect/architecture/<project-name>/`
- the project's `architect-work/` folder if present
- the project's `docs/` folder source material
- `project-config.yaml` — to scope checks to enabled templates, roles, jurisdictions, and frameworks
- optionally: the architect's stated focus (e.g. "scan only data and integration")

## Scope Controls

Honor these scope controls so the scan stays useful and bounded:

- **Template scope** — only run checks for template kinds listed in `templates.enabled`
- **Compliance scope** — only fire jurisdiction-specific checks when the relevant entry is in `compliance.applicable_regulations`
- **Focus scope** — when the architect names a focus (domain, solution, transition), narrow the sweep
- **Severity floor** — when asked for "headline only," report `BLOCKER` and `OPEN` items, suppress `INFO`

## Steps

1. **Confirm scan scope.**
   Announce: project name, focus (full / domain / artifact), severity floor,
   and which check categories will run vs. be skipped (and why).

2. **Read the project state.**
   Walk the architecture artifacts and `architect-work/` files. Note dates,
   statuses, and ownership entries.

3. **Run completeness checks** (per [checklists §1](../guidance/gap-radar-checklists.md#1-completeness-checks-per-template-kind))
   For each enabled template kind, check for the missing required content
   listed in the checklist guidance. Skip kinds not in `templates.enabled`.

4. **Run consistency checks** (per [checklists §2](../guidance/gap-radar-checklists.md#2-cross-artifact-consistency-checks))
   Cross-walk relationships, statuses, and references. Flag broken or
   contradictory links and orphans.

5. **Run present-day standards checks** (per [checklists §3](../guidance/gap-radar-checklists.md#3-present-day-standards-checks))
   Test each in-scope solution / decision / transition against the
   modernity checklist. Gate jurisdiction-specific checks on
   `project-config.yaml`.

6. **Run ownership truthfulness checks** (per [checklists §4](../guidance/gap-radar-checklists.md#4-ownership-truthfulness-checks))
   Be conservative — false positives here are corrosive. Only flag entries
   that materially fail the truthfulness convention.

7. **Run governance hygiene checks** (per [checklists §5](../guidance/gap-radar-checklists.md#5-governance-hygiene-checks))
   Look for stale statuses, phantom approvals, premature `accepted` states,
   and overdue treatments.

8. **Run drift checks** (per [checklists §6](../guidance/gap-radar-checklists.md#6-drift-signal-checks))
   Compare newest source material against current artifacts. Compare
   `answers-and-confirmations.md` against artifact state.

9. **Calibrate and prioritize.**
   Group findings, demote noise, surface the 1–3 highest-leverage items.

10. **Write the report.**
    Use the standard architect-friendly display contract. End with grouped
    Ask / Confirm / Request / Decide tasks and a `Bottom Line`.

## Outputs

A `Gap Radar Report` that contains:

1. `Session` block with role, skill, focus, and confidence
2. `Scan Scope` — what was scanned, what was skipped, why
3. `Blockers` — items that should pause the next responsible step
4. `Missing Required Content` — completeness gaps grouped by template kind
5. `Inconsistencies` — cross-artifact contradictions and orphans
6. `Present-Day Standards Gaps` — modernity misses
7. `Ownership Truthfulness Risks` — invented or drifted ownership
8. `Governance Hygiene` — stale, phantom, premature, or overdue governance state
9. `Drift Signals` — artifact vs. real-world state divergence
10. `Architect Tasks` grouped Ask / Confirm / Request / Decide
11. `Bottom Line` — the 1–3 highest-leverage findings

The report should be readable as a working brief, not a raw list. When a
finding involves a specific artifact, include a clickable reference using
`file_path:line_number` form so the architect can jump directly.

## Output Checklist

- [ ] scope is announced clearly, including what was deliberately skipped
- [ ] every finding names the artifact (or location) it refers to
- [ ] every finding has a severity label and a why
- [ ] ownership truthfulness findings are evidence-cited, not speculative
- [ ] modernity findings reference an applicable pattern, standard, or principle if one exists in the workspace
- [ ] the bottom line is short and ranks the highest-leverage 1–3 items
- [ ] proposed `architect-work/` updates are surfaced but not written, unless the architect has confirmed
- [ ] no architecture artifacts are modified by this skill

## Boundaries

This skill does **not**:

- create or update architecture artifacts
- change statuses, ownerships, or approvals
- add invented findings to make the report look more thorough
- act on findings — it surfaces them for the architect to act on

This skill **may**:

- propose `architect-work/` updates (open-questions, evidence-requests, task-list) as suggestions, awaiting architect confirmation per `architect_work_auto_update_mode`
- recommend which review gate to convene next
- recommend a follow-up skill (`option-evaluator`, `architecture-review`, `risk-compliance-assessor`, etc.)

## Typical Collaboration

- triggered by `chief-architect` or `architecture-coordinator` before review gates
- output feeds into `architecture-review`, `risk-compliance-assessor`, and `review-pack-builder`
- works alongside `evidence-curator` when ownership / evidence gaps dominate
- works alongside `project-recap` when the architect is re-entering after time away

## Quality Checks

- Do not produce findings for templates that are not in scope per `project-config.yaml`.
- Do not invent severity. Use the severity hints in the checklists, calibrated by stated project context.
- Do not promote `INFO` findings into the headline.
- Do not modify artifacts. This skill is read-only on architecture content.
- If a finding depends on assumed context, mark it `PROVISIONAL` and add the assumption.

## Variations

- **Headline radar** — only `BLOCKER` and `OPEN` items, max one screen. Use for time-pressured pre-meeting scans.
- **Domain radar** — restrict to one architecture domain (data, integration, security, transition).
- **Artifact radar** — focused scan of one solution / transition / decision and everything it touches.
- **Gate radar** — checks tuned to the next imminent review gate.
- **Modernity radar** — only Present-Day Standards checks. Useful when the project predates current expectations.
- **AI platform radar** — only AI Platform Checks (Section 7 of the checklists). Useful for `ai-platform-bootstrap` engagements or any project where AI is in scope. Gated on `ai_regulated_use: true`, on the EU AI Act or sector AI rules being applicable, or on the project using language / embedding / agentic capabilities.
