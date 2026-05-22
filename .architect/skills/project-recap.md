# Project Recap

## Purpose

Reconstruct a project's current state quickly and honestly for an architect
who is joining late, returning after time away, or preparing a handover. The
recap describes **where the project is**, not **what is wrong with it**.

This is the right first skill to run when re-entering a project. Use
`gap-radar` afterwards to assess quality of artifacts.

## Use When

- the architect has just joined an in-flight project
- the architect is returning after time away (leave, rotation, vacation)
- a project is being handed over to a different architect
- a working session is starting and orientation is needed first
- a steering committee or stakeholder briefing requires a project-state summary

## Read First

- [`.architect/guidance/project-recap-protocol.md`](../guidance/project-recap-protocol.md)
- the project's `workspace/<project-name>/project-config.yaml`
- [`.architect/config/workspace-defaults.yaml`](../config/workspace-defaults.yaml) (workspace-level defaults)
- the project's `architect-work/` folder, if present
- [`.architect/guidance/evidence-and-quality.md`](../guidance/evidence-and-quality.md)
- [`.architect/guidance/lifecycle-and-dates.md`](../guidance/lifecycle-and-dates.md)

## Inputs

- the target project folder under `workspace/<project-name>/`
- `notes.md`, `docs/`, `architect-work/`, and architecture artifacts
- `project-config.yaml`
- optionally: the architect's stated purpose ("I'm preparing for steering", "I'm handing over", "I'm restarting after 3 months")

## Steps

1. **Confirm recap scope and purpose.**
   Announce: project name, purpose of the recap (re-entry / handover /
   steering / drift-focused), and the recap variation that will be used.

2. **Walk the read order.**
   Read sections in the order defined in
   [`project-recap-protocol.md`](../guidance/project-recap-protocol.md#read-order).
   Do not skip ahead.

3. **Capture signals as you go.**
   For each section: last touched date, confidence stance, open thread count,
   and any drift signals against earlier sections.

4. **Apply staleness thresholds.**
   Use the thresholds in the protocol. Mark items stale, do not silently
   close them.

5. **Run drift detection.**
   Apply all eight drift rules from the protocol. For each drift, name the two
   disagreeing sources, the one that looks more current, and the proposed
   reconciliation (without applying it).

6. **Identify what matters most now.**
   Rank the 1–3 highest-leverage items the architect should attend to first.
   "Highest leverage" means: unblocks the most downstream work, or carries the
   highest risk if left.

7. **Assemble the recap.**
   Use the recap output structure from the protocol. Maintain the standard
   architect-friendly display contract.

8. **Surface follow-ups, do not act.**
   Propose `architect-work/` updates (open-questions, evidence-requests,
   task-list, working-log) as suggestions only. Do not modify
   architecture artifacts.

9. **Propose a working-log entry.**
   Draft a chronological, plain-language entry for
   `architect-work/working-log.md` summarizing this recap: what was
   read, what was found, the biggest signal. Surface it as a proposed
   addition pending architect approval per `architect_work_auto_update_mode`.

## Outputs

A `Project Recap` document containing:

1. `Session` block — Mode `Review`, Role, Skill `Project Recap`, Confidence
2. `Where The Project Is`
3. `What Is Confirmed`
4. `What Is Open`
5. `What Is Stale`
6. `What Has Drifted` — with proposed reconciliations
7. `Who Is Involved`
8. `What Matters Most Now`
9. `Architect Tasks` grouped Ask / Confirm / Request / Decide
10. `Bottom Line`

When a recap entry references a specific artifact or note, use clickable
`file_path:line_number` form.

## Output Checklist

- [ ] recap purpose and variation announced at the start
- [ ] every entry names its source
- [ ] confirmed items are evidence-cited; provisional items are labeled
- [ ] drift signals show the two disagreeing sources and a proposed reconciliation
- [ ] staleness is reported using the protocol thresholds
- [ ] ownership entries reflect truthfulness state honestly (no invented owners)
- [ ] 1–3 highest-leverage items are named
- [ ] architect tasks are grouped Ask / Confirm / Request / Decide
- [ ] a proposed `working-log.md` entry is drafted
- [ ] no architecture artifacts are modified

## Boundaries

This skill does **not**:

- run completeness or quality checks (that is `gap-radar`)
- create or update architecture artifacts
- close or resolve drift
- reconcile contradictory inputs into a single answer
- name owners not grounded in source material

This skill **may**:

- propose `architect-work/` updates pending architect confirmation
- recommend running `gap-radar`, `option-evaluator`, `evidence-curator`, or `architecture-review` as the next sensible move
- recommend which review gate the project appears closest to

## Typical Collaboration

- triggered first when a session begins after a break or on a new project
- output often precedes `gap-radar`, `architecture-review`, or `option-evaluator`
- supports `architecture-coordinator` in routing the next sensible step
- pairs with `evidence-curator` when recap exposes weak provenance
- pairs with `requirements-follow-up` when recap exposes unresolved questions

## Quality Checks

- Do not infer state that is not in the source material.
- Do not present `PROVISIONAL` items as `CONFIRMED`.
- Do not consolidate contradictions into a tidy single view — keep drift visible.
- Do not over-recap — if a section yielded no signal, say so briefly.
- Do not modify artifacts. This skill is read-only on architecture content.

## Variations

- **Quick recap** — only `Where`, `What Matters Most Now`, and `Bottom Line`. Good when starting a focused working session.
- **Handover recap** — adds an explicit `Open Threads For Successor` section and emphasizes ownership and unresolved questions.
- **Steering recap** — tuned for stakeholder briefings; emphasizes `What Is Confirmed`, `What Matters`, `What Is Open`.
- **Drift-focused recap** — restricts output to `What Has Drifted` and proposed reconciliations.
- **Period recap** — covers what changed since a stated date or since the last recap.
