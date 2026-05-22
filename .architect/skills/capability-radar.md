# Capability Radar

## Purpose

Scan the `.architect/` capability library itself for drift,
inconsistencies, broken references, and stale documentation. Catches
the kind of slow rot that no single change introduces but that
accumulates across many changes to skills, patterns, playbooks,
templates, conventions, and documentation.

This is the analog of [`gap-radar`](./gap-radar.md) but pointed at the
capability library, not at project work under `workspace/`.

## Use When

- the maintainer is about to bump the capability version
- the maintainer has recently renamed or moved files in `.architect/`
- a major doc update (root README, capability README) is being prepared
- as a routine cadence (monthly is reasonable for an actively-maintained workspace)
- after a stretch of intensive contribution that touched many areas
- when someone reports "I can't find X" or "this link is broken"

## Read First

- [`.architect/guidance/capability-radar-checklists.md`](../guidance/capability-radar-checklists.md)
- [`.architect/guidance/capability-maintenance.md`](../guidance/capability-maintenance.md)
- [`.architect/CHANGELOG.md`](../CHANGELOG.md) (to scope what's recent)
- [`.architect/guidance/current-state.md`](../guidance/current-state.md) (the maintainer snapshot)

## Inputs

- the `.architect/` capability library (recursive)
- `git log` on `.architect/` (optional, for currency checks)
- optionally: the maintainer's stated focus (e.g. "scan only after the playbook batch")

## Scope Controls

- **Domain scope** — when the maintainer names a focus (skills, playbooks, patterns, compliance, vocabulary-bridges, validation), narrow the sweep to that area's checks
- **Severity floor** — when asked for "headline only," report `BLOCKER` and `OPEN` items, suppress `INFO`
- **Mechanical only** — when the maintainer just wants to know "is anything broken," run only the mechanical-subset checks (these are also what `Validate-Capability.ps1` runs)
- **Pre-release** — when run before a version bump, raise severity floor to `BLOCKER` only; smaller issues can wait

## Steps

1. **Confirm scan scope.**
   Announce: focus (full / domain), severity floor, and which check sections will run vs. be skipped (and why).

2. **Read the capability state.**
   Walk the `.architect/` tree and any cross-cutting files (`AGENTS.md`, root `README.md`). Note recent activity (`CHANGELOG.md` `[Unreleased]`, recent files).

3. **Run mechanical reference checks** (per [checklists §1](../guidance/capability-radar-checklists.md#1-mechanical-reference-checks))
   Walk markdown links, skill **Read First** lists, playbook **Recommended Skill Sequence**, pattern references. Flag any that don't resolve.

4. **Run concept completeness checks** (per [checklists §2](../guidance/capability-radar-checklists.md#2-concept-completeness-checks))
   Glossary coverage, skill in role-skill-matrix, pattern in domain README.

5. **Run currency checks** (per [checklists §3](../guidance/capability-radar-checklists.md#3-currency-checks))
   Compare CHANGELOG `[Unreleased]` to recent file changes. Check `current-state.md` for stale next-steps. Note items shipped but not logged.

6. **Run cross-document consistency checks** (per [checklists §4](../guidance/capability-radar-checklists.md#4-cross-document-consistency-checks))
   Counts and lists across multiple README / CHANGELOG / glossary locations.

7. **Run structural drift checks** (per [checklists §5](../guidance/capability-radar-checklists.md#5-structural-drift-checks))
   Old paths still referenced after known renames. Prose counts vs. reality.

8. **Run vocabulary drift checks** (per [checklists §6](../guidance/capability-radar-checklists.md#6-vocabulary-drift-checks))
   Terms in skills but not glossed; glossary paths that don't exist.

9. **Calibrate and prioritize.**
   Group findings; demote noise; surface the 1-3 highest-leverage items.

10. **Write the report.**
    Use the architect-friendly display contract. End with `Bottom Line`.

11. **Propose a working-log entry** in the capability maintainer's own log (if one is kept), or in `current-state.md` Completed log when the maintainer is ready to act.

## Outputs

A `Capability Radar Report` containing:

1. `Session` — role, skill `Capability Radar`, focus, severity floor, confidence
2. `Scan Scope` — what was scanned, what was skipped, why
3. `Mechanical Reference Failures` — broken links, missing files
4. `Concept Completeness Gaps` — new things not yet documented
5. `Currency Gaps` — CHANGELOG / current-state behind reality
6. `Cross-Document Consistency` — counts and lists that disagree
7. `Structural Drift` — old paths still referenced
8. `Vocabulary Drift` — terms missing from glossary
9. `Maintainer Tasks` grouped Ask / Confirm / Request / Decide
10. `Bottom Line` — the 1-3 highest-leverage findings

When a finding involves a specific file, include a clickable `file_path:line_number` reference.

## Output Checklist

- [ ] scope announced, including what was deliberately skipped
- [ ] every finding names the file (or location) it refers to
- [ ] every finding has a severity label and a why
- [ ] mechanical findings cite the exact path that doesn't resolve
- [ ] currency findings reference both the CHANGELOG state and the actual file change
- [ ] bottom line is short and ranks the 1-3 highest-leverage items
- [ ] no capability files are modified by this skill

## Boundaries

This skill does **not**:

- modify capability files (it's read-only on `.architect/`)
- fix the drift it finds — it surfaces findings for the maintainer to act on
- run project-level checks (use `gap-radar` for that)
- validate templates or artifacts (use the existing validators)

This skill **may**:

- propose `CHANGELOG.md` or `current-state.md` updates as suggestions, awaiting confirmation
- recommend running `Validate-Capability.ps1` for the mechanical subset
- recommend specific renames or file moves to resolve structural drift

## Typical Collaboration

- triggered before a capability version bump
- output feeds into [`Validate-Capability.ps1`](../validation/Validate-Capability.ps1) for re-checking after fixes
- pairs with [`capability-maintenance.md`](../guidance/capability-maintenance.md) — the radar finds the drift, the maintenance guide says what to update

## Quality Checks

- Do not produce findings for areas the maintainer scoped out.
- Do not invent severity. Use the severity hints in the checklists, calibrated by stated context.
- Do not promote `INFO` findings into the headline.
- Do not modify any files. This skill is read-only.
- If a finding depends on assumed context (e.g., "I think this was renamed from X"), mark it `PROVISIONAL`.

## Variations

- **Headline radar** — only `BLOCKER` and `OPEN` items, max one screen. Use before a version bump for a quick gate.
- **Mechanical radar** — only §1 mechanical reference checks. Equivalent to `Validate-Capability.ps1`. Fastest scan.
- **Currency radar** — only §3 currency checks. Useful when the question is specifically "has CHANGELOG kept up?"
- **Domain radar** — restrict to one area (skills / playbooks / patterns / compliance / vocabulary-bridges / templates).
- **Rename radar** — only §5 structural drift checks. Run after a rename / move spree.
- **Pre-release radar** — full sweep with severity floor at `BLOCKER` only.
