# Capability Maintenance

## Purpose

When you add, rename, move, or remove anything in `.architect/`,
several related files need to update so the workspace stays internally
consistent. This guide lists the ripple effects per change type so a
maintainer can keep the capability library coherent across changes.

Open Architect's strength comes from its internal consistency: skills
reference patterns, playbooks reference skills, the glossary defines
the vocabulary, the READMEs document structure. When one piece
changes, the others drift silently unless deliberately updated.

Pair this guide with:

- [`capability-radar`](../skills/capability-radar.md) — read-only scan that catches drift in `.architect/`
- [`Validate-Capability.ps1`](../validation/Validate-Capability.ps1) — mechanical link / reference checker

## Audience

Maintainers of the Open Architect capability library — i.e. the people
adding skills, patterns, playbooks, templates, compliance profiles, or
conventions. Project architects working under `workspace/` should rarely
need this file.

## The four "always update" docs

For any non-trivial change to `.architect/`:

1. **`CHANGELOG.md`** — add an entry under `[Unreleased]`, classified
   as **Added** / **Changed** / **Removed**.
2. **`guidance/current-state.md`** — append a Completed entry to the
   chronological log.
3. **`guidance/glossary.md`** — if the change introduces or renames a
   workspace-level term.
4. **The relevant README** — if the change affects structure visible
   in `README.md`, `.architect/README.md`, or the area's own README
   (e.g. `playbooks/README.md`, `patterns/README.md`).

These four cover ~80% of drift risk by themselves.

## Change types and their ripple effects

### Adding a new skill

When you add `.architect/skills/<new-skill>.md`:

- [ ] Update [`skills/README.md`](../skills/README.md) — add to the skill list
- [ ] Update [`skills/role-skill-matrix.md`](../skills/role-skill-matrix.md) — add the role → skill mappings
- [ ] If the skill introduces new vocabulary, add an entry to [`glossary.md`](./glossary.md)
- [ ] Identify playbooks where the skill belongs — update their *Recommended Skill Sequence*
- [ ] If the skill consumes patterns not previously referenced, the patterns' domain READMEs may want to mention it
- [ ] If the skill should propose `working-log.md` entries when it runs, note that in the Outputs / Output Checklist sections (see `project-recap`, `baseline-discovery`, `gap-radar` for the pattern)
- [ ] CHANGELOG entry under **Added**
- [ ] `current-state.md` Completed entry

### Adding a new pattern

When you add `.architect/patterns/<domain>/<new-pattern>.md`:

- [ ] Update [`patterns/<domain>/README.md`](../patterns/) — add to the pattern list with one-line description
- [ ] Update [`patterns/README.md`](../patterns/README.md) — only if pattern count or domain count changes
- [ ] Identify skills that should read this pattern — update their **Read First** lists
- [ ] If the pattern introduces new vocabulary, add to glossary
- [ ] CHANGELOG entry under **Added**
- [ ] `current-state.md` Completed entry

### Adding a new playbook

When you add `.architect/playbooks/<new-playbook>/`:

- [ ] Both `playbook.md` and `project-config.yaml` must exist
- [ ] Update [`playbooks/README.md`](../playbooks/README.md) — add to catalog table and family grouping
- [ ] Update root [`README.md`](../../README.md) — add to family table; the prose count may need updating ("Twenty-four pre-packaged engagement shapes …")
- [ ] Update [`.architect/README.md`](../README.md) — playbook count if mentioned in signature capabilities
- [ ] Update [`config/agent.config.md`](../config/agent.config.md) — playbook list under *Available values*
- [ ] CHANGELOG entry under **Added**
- [ ] `current-state.md` Completed entry

### Adding a new template kind

When you add `.architect/templates/<domain>/<new-kind>.yaml`:

- [ ] File stem must match `template.kind`
- [ ] Update [`templates/README.md`](../templates/) — add to kind list (if a list exists)
- [ ] If applicable, add a schema under [`schemas/`](../schemas/)
- [ ] Identify skills that should reference this kind — update their output expectations
- [ ] Update glossary if the kind introduces a concept
- [ ] Update [`guidance/gap-radar-checklists.md`](./gap-radar-checklists.md) if the kind needs completeness checks
- [ ] CHANGELOG entry under **Added**
- [ ] `current-state.md` Completed entry

### Renaming or moving a file

- [ ] `grep -r` for the old path across `.architect/` and update all references
- [ ] Check **skills' Read First** lists, **playbooks' Recommended Skill Sequence**, **glossary** links, and **README** structure listings
- [ ] CHANGELOG entry under **Changed**
- [ ] `current-state.md` Completed entry
- [ ] Run `Validate-Capability.ps1` to catch any missed references

### Adding a new compliance profile

When you add `.architect/compliance/regulations/<new-reg>/`:

- [ ] Update [`compliance/README.md`](../compliance/README.md) — add to regulation list
- [ ] Update [`config/workspace-defaults.yaml`](../config/workspace-defaults.yaml) (workspace-level applicable defaults) and [`agent.config.md`](../config/agent.config.md) — if the regulation should be in the default `applicable_regulations` list
- [ ] If the regulation introduces concepts (Controller, DPIA, etc.), add to glossary
- [ ] CHANGELOG entry under **Added**

### Adding a new convention / workspace flag

- [ ] Update [`config/workspace-defaults.yaml`](../config/workspace-defaults.yaml) — add the flag with default value and inline comment
- [ ] Update [`config/agent.config.md`](../config/agent.config.md) — document the flag's behavior
- [ ] Update [`config/response-display.md`](../config/response-display.md) — if response-formatting related
- [ ] Update [`AGENTS.md`](../../AGENTS.md) — if response-formatting related
- [ ] CHANGELOG entry under **Added**

### Bumping the capability version

- [ ] Update `.architect/VERSION`
- [ ] In `CHANGELOG.md`, move all `[Unreleased]` entries to a new dated version section
- [ ] Add a fresh empty `[Unreleased]` section header above the new version
- [ ] If MAJOR or MINOR (i.e. contract change), note the change in `current-state.md`

### Adding a new vocabulary bridge

When you add `.architect/guidance/vocabulary-bridges/<new-bridge>.md`:

- [ ] Update [`vocabulary-bridges/README.md`](./vocabulary-bridges/README.md) — add to Available Bridges table
- [ ] Update root [`README.md`](../../README.md) — Foundation section bridge list, When-to-use row, and Contributing section
- [ ] Update [`.architect/README.md`](../README.md) — signature-capabilities bridge list
- [ ] Update glossary — extend the **Vocabulary Bridge** entry's list of bridged vocabularies
- [ ] CHANGELOG entry under **Added**
- [ ] `current-state.md` Completed entry

## When to run capability-radar

Routine: **before any capability version bump** is the strongest gate.
The radar surfaces inconsistencies that the bump would otherwise
freeze into the contract.

Also useful:

- **Before publishing major doc updates** (root README, capability
  README) — surfaces stale playbook counts, missing playbooks in
  catalog tables, etc.
- **After a rename / move** that touched several files — confirms no
  dangling references remain.
- **Monthly cadence** for actively-maintained workspaces — catches the
  slow drift no single change introduces but accumulates over time.

## When to run Validate-Capability.ps1

- **Before any commit** that renames or moves files in `.architect/`
- **In CI** (if you add one) — broken-link regressions caught
  automatically
- After running `capability-radar`'s **structural** section — the
  validator is the mechanical executor of those checks

## What this guide does *not* cover

- Project-level drift (handled by [`gap-radar`](../skills/gap-radar.md))
- Project re-entry (handled by [`project-recap`](../skills/project-recap.md))
- Template-level validation (handled by [`Validate-Templates.ps1`](../validation/Validate-Templates.ps1))
- Artifact-level validation (handled by [`Validate-ArchitectureArtifacts.ps1`](../validation/Validate-ArchitectureArtifacts.ps1))

This is strictly about keeping the capability library itself coherent.
