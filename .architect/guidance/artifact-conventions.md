# Artifact Conventions

## Purpose

When an architect runs Open Architect skills against a real engagement,
artifacts get written to `workspace/<project>/`. This file codifies
the conventions OA assumes for those artifacts — where they live, how
they're named, and how filenames behave under change-coordinator.

These conventions are deliberately small and stable. Three problems
they prevent:

- Inter-project drift (artifact IDs starting at `0001` in one project, `1001` in another, neither documented as the rule)
- File-tree confusion when multiple projects coexist (architects unsure which folder an `architecture-vision` artifact belongs in)
- Cross-reference rot when artifact content is rewritten but the filename changes

## Audience

The OA architect — whether the practicing architect using the workspace
or the AI tool running skills against it. Both should produce artifacts
that match these conventions on first write.

## Folder placement

OA artifacts live under `workspace/<project>/<folder>/<file>.yaml`. The
folder reflects the *engagement domain* the artifact belongs to, not
necessarily the OA template-library folder where the YAML template
lives. (See "Template folder vs artifact folder" below.)

### Project-side artifact folders

| Folder | Holds artifacts of kind | Mental model |
|---|---|---|
| `architect-work/` | The six categorical-state files (open-questions, answers-and-confirmations, evidence-requests, architect-task-list, working-log, change-register) | Living project state, not artifact instances |
| `business/` | `stakeholder` (STK-), `objective` (OBJ-), `architecture-vision` (VIS-), `business-capability` (BC-), `business-process` (BP-), `organization` (ORG-), `principle` (PRN-) | "Why" and "for whom" — the business framing layer |
| `application/` | `application` (APP-), `application-service` (AS-), `interface` (IF-), `requirement` (REQ-), `solution` (SOL-) | "What and how" — the application/service architecture layer |
| `data/` | `data-object` (DO-) | Data shape and ownership |
| `technology/` | `technology-component` (TC-), `technology-standard` (TS-), `environment` (ENV-) | Stack and hosting |
| `governance/` | `decision` (DEC-), `risk` (RSK-), `compliance-assessment` (CA-) | Decisions, risks, regulatory posture |
| `change/` | `transition-architecture` (TA-), `initiative` (INIT-), `roadmap` (RM-), `gap` (GAP-), `work-package` (WP-) | Movement from baseline to target |
| `views/` | Diagram source files (`.md` with Mermaid, `.puml` for PlantUML) | Renderable views — see [`diagram-conventions.md`](./diagram-conventions.md) |
| `publications/<date>-<gate>/` | Composed publication packages (see [`publication-package-shape.md`](./publication-package-shape.md)) | Sponsor-facing output |

### Template folder vs artifact folder

The OA capability library at `.architect/templates/<folder>/` organizes
the *YAML templates themselves* — and that folder structure does not
always match where the *project artifact* lives. The most prominent
case: `architecture-vision.yaml` lives in `.architect/templates/governance/`
(because vision is governance-adjacent at the capability-library level),
but project `VIS-*` artifacts go under `workspace/<project>/business/`
(because vision is a business-framing artifact at the engagement
level).

| Template kind | Template at | Project artifact at |
|---|---|---|
| `architecture-vision` | `.architect/templates/governance/` | `workspace/<project>/business/` |
| `principle` | `.architect/templates/business/` | `workspace/<project>/business/` |
| All others | Same folder name as project-side | Same folder name as template-side |

This is the only mismatch worth memorizing. When in doubt, look at
the "Holds artifacts of kind" column above.

## ID numbering

OA artifact IDs follow this shape:

```
<KIND-PREFIX>-<4-DIGIT-NUMBER>
```

Examples: `STK-1001`, `DEC-1001`, `SOL-1004`, `RSK-1002`.

### Numbering rules

- **Always 4 digits**, zero-padded. `STK-1001`, not `STK-1` or `STK-01`.
- **Start at `1001`** for new project artifacts. The worked example at `.architect/examples/customer-onboarding-modernization/` uses this convention.
- **Sequential per-kind, within a project.** Each kind has its own counter: `STK-1001`, `STK-1002`, …; `DEC-1001`, `DEC-1002`, …. The numbering doesn't have to be gap-free (deleted-during-draft artifacts leave a gap), but it should be monotonically increasing — never re-use a retired ID.
- **No cross-project ID reuse needed.** Each project gets its own `1001` counter per kind; `STK-1001` in project A is a different stakeholder from `STK-1001` in project B. IDs are project-scoped, not workspace-global.

### Why start at 1001 and not 0001?

- The worked example sets the precedent (`SOL-1001-customer-onboarding-modernization-solution.yaml`, `DEC-1001-adopt-customer-activation-event-api.yaml`, etc.)
- `1001` avoids any visual confusion with year-prefixed IDs in some organizations (`2024-001`).
- `1001` leaves room for a hypothetical future "system/template" range under `0001-0999` if OA ever introduces capability-library-level artifact IDs.

### Kind-prefix reference

| Kind | Prefix |
|---|---|
| stakeholder | `STK-` |
| objective | `OBJ-` |
| architecture-vision | `VIS-` |
| business-capability | `BC-` |
| business-process | `BP-` |
| organization | `ORG-` |
| principle | `PRN-` |
| application | `APP-` |
| application-service | `AS-` |
| interface | `IF-` |
| requirement | `REQ-` |
| solution | `SOL-` |
| data-object | `DO-` |
| technology-component | `TC-` |
| technology-standard | `TS-` |
| environment | `ENV-` |
| decision | `DEC-` |
| risk | `RSK-` |
| compliance-assessment | `CA-` |
| transition-architecture | `TA-` |
| initiative | `INIT-` |
| roadmap | `RM-` |
| gap | `GAP-` |
| work-package | `WP-` |

## Filename convention

Each artifact YAML file is named:

```
<id>-<slugified-display-name>.yaml
```

Lowercase. Hyphens between words, no underscores or camelCase. Examples:

- `SOL-1001-customer-onboarding-modernization-solution.yaml`
- `DEC-1002-adopt-customer-activation-event-api.yaml`
- `STK-1001-markus-beck.yaml`

### Filename stability under change-coordinator

When a content rewrite under `change-coordinator` changes an
artifact's `display_name`, **keep the filename stable**. Update
`display_name` and the `aliases:` field instead.

See [`capability-maintenance.md`](./capability-maintenance.md)
§"Renaming a project artifact's display_name" for the full rule and
its rationale.

## `aliases:` convention

Every artifact template carries an `aliases:` list field. Use it for:

- Prior display names from change-coordinator content rewrites
- Synonyms the engagement uses informally (e.g. *"Customer Master"* aliased to *"Customer Entity"*)
- Common abbreviations stakeholders use in conversation

`aliases` is searchable; `display_name` is the canonical label. Keep
the display_name authoritative; keep aliases comprehensive.

## Template version field

Every template carries:

```yaml
template:
  kind: <kind>
  version: 1.0       # increment on substantive template changes
  schema_version: 1.0 # increment only on breaking schema changes
```

A project artifact **may** carry the same block at its top level.
Carrying it is **recommended** — it gives architects provenance
(which template version the artifact was created from) and lets
change-coordinator track template drift across substantive rewrites —
but is **not required**. The JSON Schema (`common-definitions.schema.json`
§ `artifactDocument`) requires only `spec`; the artifact validator
accepts both shapes. The worked example
(`customer-onboarding-modernization/`) omits the block; the smoke-test
project (`smoke-test-2026-05-22/`) carries it. Both validate.

When a project artifact *does* carry a `template:` block:

- At creation, copy the template's `version` and `schema_version`
  verbatim.
- When change-coordinator performs a substantive rewrite (more than a
  typo or metadata refresh), increment `version` (e.g. `1.0` → `1.1`)
  and add a `metadata.change_log` entry describing the change.
- Don't bump `schema_version` on the project side — it tracks
  breaking-shape changes to the template itself (capability-library
  work, not project-side).

## What this guide does *not* cover

- **Capability-library file naming** (templates, skills, patterns, playbooks under `.architect/`) — see [`capability-maintenance.md`](./capability-maintenance.md). Different rules apply because capability-library filenames are referenced by path throughout the library.
- **Diagram source-file naming** — see [`diagram-conventions.md`](./diagram-conventions.md).
- **Publication package naming** — see [`publication-package-shape.md`](./publication-package-shape.md).
- **Architect-work file naming** — fixed; the six files are scaffolded with predetermined names by `architect new`.

## See also

- [`capability-maintenance.md`](./capability-maintenance.md) — capability-library hygiene, including the filename-stability rule for project artifacts under change-coordinator
- [`requirement-change-handling.md`](./requirement-change-handling.md) — the change-coordinator procedure
- [`conventions.md`](./conventions.md) — the broader OA conventions entry point
- [`diagram-conventions.md`](./diagram-conventions.md) — diagram filename and notation conventions
- [`publication-package-shape.md`](./publication-package-shape.md) — sponsor-facing package structure
