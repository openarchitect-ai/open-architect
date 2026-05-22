# Inventory-Only Playbook

## Engagement Shape

- **Stance:** one-shot
- **Default mode:** `inventory`
- **Typical duration:** days to a few weeks
- **Output emphasis:** facts, not direction

## When To Use

Use this playbook when:

- you are asked to document and assess an estate that has not been modeled
- a portfolio review or rationalization study is needed before deciding direction
- a new architect is joining an unfamiliar landscape and needs to surface what is actually there
- another team needs reliable baseline facts before they can plan

## When Not To Use

Do **not** use this playbook when:

- the engagement expects target-state design or solution direction
- decisions or transitions need to be recorded
- delivery teams expect architecture artifacts to drive their work

## What Good Looks Like

- a clear baseline picture of applications, interfaces, data, and environments
- explicit separation of confirmed facts from assumptions and unknowns
- a candidate list of follow-up directions (analysis, modernization, rationalization)
- no invented owners, no premature target state, no decisions

## Stages

### Stage 1 — Source Gathering

- **Entry signals:** project folder exists; source material has been collected or pointed to
- **Key questions:** what evidence do we have, what does it actually cover, what is provably missing
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** organized `docs/`, an `evidence-requests.md` for missing inputs
- **Exit signals:** source set is stable enough to extract from, gaps in evidence are named

### Stage 2 — Extraction

- **Entry signals:** source set is stable
- **Key questions:** what applications, interfaces, data objects, and environments are present, who appears to own them, what classifications are visible
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md)
- **Expected outputs:** baseline facts grouped by domain, with confidence labels
- **Exit signals:** extracted facts cover the in-scope domains; provisional items are explicitly marked

### Stage 3 — Curation And Quality Check

- **Entry signals:** baseline facts exist
- **Key questions:** which facts are confirmed, which are provisional, where is uncertainty material, are owners truthful
- **Recommended skills:** [`evidence-curator`](../../skills/evidence-curator.md), [`gap-radar`](../../skills/gap-radar.md) (headline variation)
- **Expected outputs:** curated baseline with explicit confidence labels, ownership truthfulness check
- **Exit signals:** quality is reviewable; weak items are flagged, not hidden

### Stage 4 — Handover

- **Entry signals:** curated baseline is stable
- **Key questions:** what should the next engagement be (analysis, modernization, rationalization, nothing), what evidence is still needed, who receives this
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md)
- **Expected outputs:** baseline-state briefing, recommended follow-up engagement shape, residual unknowns
- **Exit signals:** the receiving party has what they need; the engagement closes cleanly

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md) — orient if joining an existing project
2. [`baseline-discovery`](../../skills/baseline-discovery.md) — extract architecture facts from source material
3. [`evidence-curator`](../../skills/evidence-curator.md) — strengthen provenance for what you found
4. [`gap-radar`](../../skills/gap-radar.md) — surface what is missing or inconsistent before handover
5. [`architecture-documenter`](../../skills/architecture-documenter.md) — produce a baseline-state briefing if a written deliverable is expected

## Review Gates That Apply

This playbook deliberately runs without formal review gates. Inventory work
should be light, fast, and reviewable on its own merits.

Optional gate:

- `project-bootstrap` — only if the scope question is genuinely contested

## Patterns Likely To Apply

Most inventory engagements do not need pattern-driven design choices. If
the inventory reveals patterns implicitly in use, name them and reference
them — do not adopt them as part of this engagement. Likely candidates the
inventory may expose:

- [data-classification-and-handling](../../patterns/data/data-classification-and-handling.md)
- [canonical-data-ownership](../../patterns/data/canonical-data-ownership.md)
- [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)

## Common Anti-Patterns

- **Silent drift into target state** — describing what *should be* under the guise of describing what *is*. Keep tense honest.
- **Invented owners** — naming individuals where only roles or unknowns were in source material. Use `tbd` or `role-placeholder:<role>`.
- **Inflated confidence** — marking provisional facts as confirmed because the artifact felt too sparse. Sparse is fine; lying is not.
- **Over-extraction** — capturing every minor interface or sub-component when only the material ones matter. Inventory should be useful, not exhaustive.
- **Premature recommendation** — sneaking target-state recommendations into an inventory deliverable. The recommendation step is its own engagement.
- **Treating diagrams as evidence** — a vendor diagram is one source, not ground truth.

## Entry Criteria

- a project folder exists under `workspace/<project-name>/`
- there is at least some source material in `docs/`
- the stakeholder is clear that this is **inventory**, not solution design

## Exit Criteria

- baseline facts are captured with explicit confidence labels
- unknowns and assumptions are visible
- the next engagement shape (if any) has been recommended
- no target-state or decision artifacts have been created

## Cycling Stance

This playbook is **one-shot**. If the estate needs ongoing inventory
refresh, run the playbook again as a discrete engagement — do not let it
become an open-ended baseline-maintenance loop. For continuous baseline
upkeep, the project has moved beyond inventory-only.

## What This Playbook Does Not Do

- It does not produce target-state architecture
- It does not record architecture decisions
- It does not produce transition or roadmap content
- It does not promote ownership beyond what evidence supports

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if any prior work exists in the project folder.
2. Inventory `docs/` — list each source, its date, and what it appears to cover.
3. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
4. Identify the smallest useful domain to extract first (often: applications).
5. Run [`baseline-discovery`](../../skills/baseline-discovery.md) on that domain only.
6. End the session by writing 3–5 architect tasks under Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Scope of domains** — the default is application, interface, data, environment. Drop or add domains based on the question being asked.
- **Compliance scope** — usually empty for inventory, but set jurisdictions if the inventory will feed a regulated engagement.
- **Roles** — drop `integration-architect` if no integration content is in scope; add `data-architect` if data is the dominant question.
- **Severity floor for `gap-radar`** — use the headline variation to keep output scannable.
- **Deliverable shape** — written briefing vs. structured artifacts only vs. workshop deck. Decide before extraction starts.
- **Exit recommendation** — name the candidate follow-up engagements but do not commit; let the sponsor choose.

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location
   (`workspace/<project-name>/project-config.yaml`).
3. Adjust `project.name`. Confirm jurisdictions if any apply.
4. Run [`project-recap`](../../skills/project-recap.md) if the project
   already has content; otherwise begin with
   [`baseline-discovery`](../../skills/baseline-discovery.md).
5. Stay in `inventory` mode. Do not switch to modeling until a separate engagement says so.

## Notes For Reviewers

When reviewing inventory-only output:

- check that unknowns are explicit, not hidden
- check that confidence labels are honest
- check that the work does not silently drift into target-state language
- check that ownership entries reflect evidence, not template defaults
- accept short and sparse over long and inferred
