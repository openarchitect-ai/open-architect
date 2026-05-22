# Project Recap Protocol

The `project-recap` skill produces a structured "where is this project right
now" briefing for an architect who is joining late, returning after time
away, or preparing to hand work over.

This guidance defines the **read order**, **recap structure**, **staleness
thresholds**, and **drift detection rules** the skill follows.

## Purpose

Help an architect reconstruct project state quickly and honestly so the next
working session starts from real ground, not assumed memory.

## Read Order

Read the project in this order. Stop only when a section yields no signal —
do not skip ahead.

1. **`notes.md`** at the project root, if present
   - intent, problem framing, known goal, known constraints

2. **`architect-work/architect-task-list.md`** if present
   - what the architect last said they would do
   - the most reliable signal of where the project actually was at last touch

3. **`architect-work/open-questions.md`** if present
   - what is unresolved
   - severity and age of each question

4. **`architect-work/answers-and-confirmations.md`** if present
   - what has been confirmed by stakeholders or delivery teams
   - cross-check against artifact state (drift check)

5. **`architect-work/evidence-requests.md`** if present
   - what evidence is still missing
   - what could not yet be modeled because of missing inputs

6. **`docs/`** source material
   - read newest files first (use file modification timestamps)
   - flag any docs that appear to contradict current artifacts

7. **`architecture/<project-name>/`** artifacts, in this order:
   - `stakeholder` and `objective`
   - `architecture-vision` if present
   - `business-capability` and `organization`
   - `application`, `application-service`, `interface`, `data-object`
   - `technology-component`, `environment`
   - `requirement`, `solution`
   - `decision`
   - `transition-architecture`, `work-package`, `gap`, `roadmap`
   - `compliance-assessment`, `risk`

8. **`project-config.yaml`**
   - confirm scope, jurisdictions, enabled templates, operating style
   - flag any drift between config scope and actual artifact content

## Signals To Capture

For each section read, capture:

- **Last touched date** — newest modification within the section
- **Confidence signal** — how much of the section appears `CONFIRMED` vs. `PROVISIONAL`
- **Open thread count** — items still requiring action or decision
- **Drift signal** — any contradictions with other sections

## Drift Detection Rules

A drift signal is any of:

1. **Answer drift** — an entry in `answers-and-confirmations.md` that has not
   been reflected in the architecture artifact it would change.

2. **Doc drift** — recent `docs/` material that contradicts a current artifact
   (new system name, changed ownership, new dependency, removed scope).

3. **Status drift** — an artifact marked `accepted` while related items it
   depends on remain `provisional` or `draft`.

4. **Date drift** — an artifact, transition window, or risk treatment past
   its target date with no status update.

5. **Tense drift** — baseline artifacts described in future tense, or target
   artifacts described as already realized.

6. **Scope drift** — `project-config.yaml` shows templates or roles that are
   no longer being used, or templates being used that are not enabled in
   config.

7. **Ownership drift** — confirmed owners named in recent source material that
   still show `tbd`, `unknown`, or `role-placeholder:` in artifacts.

8. **Question drift** — open questions older than the project's expected
   cadence with no progress note or related answer.

For each drift signal, capture:

- what the signal is
- the two sources that disagree
- which one looks more current
- proposed reconciliation (without applying it)

## Staleness Thresholds

These are advisory defaults. The project may override.

| Item | Stale after | Notes |
|---|---|---|
| Open question | 2 review cadences | Without a progress note, treat as drifting |
| Risk in `open` status | Treatment due-date + 1 cadence | Overdue risk is unmanaged risk |
| Compliance assessment | Framework's expected refresh window | GDPR-style: annual; sectoral: per framework |
| Decision in `proposed` | 1 review cadence | Lingering proposals block delivery |
| Transition past target window | immediately | Should be closed or rebaselined |
| Roadmap item past target | 1 cadence | Reflects to credibility |
| Architect task | 2 cadences | Surface in recap; do not delete |

The skill should report stale items but never silently mark them resolved.

## Recap Output Structure

The recap output must follow the standard architect-friendly display contract
and include these sections in this order:

1. **`Session`** — Mode (`Review`), Role (default `Chief Architect` or named focus), Skill (`Project Recap`), Confidence
2. **`Where The Project Is`** — current stage, last touched, primary mode
3. **`What Is Confirmed`** — durable facts grounded in evidence
4. **`What Is Open`** — unresolved questions ranked by leverage
5. **`What Is Stale`** — items past their cadence threshold
6. **`What Has Drifted`** — listed drift signals with proposed reconciliation
7. **`Who Is Involved`** — stakeholders, owners, teams, ownership truthfulness state
8. **`What Matters Most Now`** — 1–3 highest-leverage items
9. **`Architect Tasks`** — grouped Ask / Confirm / Request / Decide
10. **`Bottom Line`** — short orientation takeaway

## Output Conventions

- Use `CONFIRMED`, `PROVISIONAL`, `OPEN`, `BLOCKER`, `ACTION`, `REQUEST`, `DECISION` labels where they aid scanning.
- For every recap item, name its source (e.g. `architect-work/answers-and-confirmations.md` or `architecture/<project>/decisions/D-0007.yaml`).
- Use clickable `file_path:line_number` references.
- Do not propagate answers, close drift, or update artifacts. Recap is read-only.
- Surface proposed `architect-work/` updates as suggestions; write only after architect confirmation per `architect_work_auto_update_mode`.

## What The Recap Must Not Do

- It must not invent state to fill in gaps.
- It must not present `PROVISIONAL` items as `CONFIRMED`.
- It must not name owners not present in source material.
- It must not consolidate contradictory inputs into a single resolved view — drift must remain visible.
- It must not act as a substitute for `gap-radar` for completeness checks; it focuses on **state**, not **quality of artifacts**.

## Relation To Other Skills

- **`gap-radar`** answers *what is missing or wrong*. **`project-recap`** answers *where are we*. Run recap first when re-entering a project; run gap-radar before review gates.
- **`baseline-discovery`** answers *what is the current architecture*. Recap is broader — includes project state, governance, working notes, and drift.
- **`evidence-curator`** is the right follow-up when recap exposes weak provenance.
- **`option-evaluator`** is the right follow-up when recap exposes an undecided question with bounded options.

## Variations

- **Quick recap** — `Where`, `What Matters Most Now`, `Bottom Line` only. For starting a working session.
- **Handover recap** — adds an explicit `Open Threads For Successor` section.
- **Steering recap** — tuned to stakeholder communication; emphasizes `What Is Confirmed`, `What Matters`, and `What Is Open` only.
- **Drift-focused recap** — only `What Has Drifted` and proposed reconciliations.
