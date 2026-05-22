# ArchiMate-Lite Bridge

## Purpose

Help teams who use ArchiMate (or a simplified subset of it) for enterprise
modeling adopt Open Architect templates as the working storage and
collaboration layer. Most ArchiMate concepts map 1:1 to Open Architect.

## When To Use This Bridge

- the team has an existing ArchiMate modeling practice
- enterprise governance uses ArchiMate diagrams
- the team wants Open Architect's lightweight artifact-per-file structure
  while staying compatible with ArchiMate vocabulary
- the team uses a tool (Archi, Sparx EA, BiZZdesign) that exports
  ArchiMate XML and wants Open Architect as a complementary source of
  truth in version control

## Concept Mapping

| ArchiMate concept | Open Architect equivalent | Notes |
|---|---|---|
| Business Actor | `stakeholder` or `organization` | Internal actor = `organization`; external actor or named role = `stakeholder` |
| Business Role | `stakeholder` (role variant) or `organization` | Either fits; pick consistently |
| Business Process | `business-process` | 1:1 |
| Business Function | `business-capability` | ArchiMate's function = a stable ability of the enterprise |
| Business Service | `business-capability` (with a service stance) | When a capability is exposed externally as a business service |
| Business Object | `data-object` (business-level) | Open Architect's `data-object` covers both business and information variants |
| Business Interface | `interface` (business-level) | Same template, different abstraction |
| Application Component | `application` | 1:1 |
| Application Collaboration | `solution` or a logical grouping in `solution` relationships | Loose-coupled collaborations are best modeled as `solution` boundaries |
| Application Function | `application-service` (internal) | The behavior of an application |
| Application Service | `application-service` (exposed) | 1:1 |
| Application Interface | `interface` | 1:1 |
| Application Process | `application-service` (with sequencing) | Process orchestration belongs as an application service with relationships |
| Data Object | `data-object` | 1:1 |
| Technology Service | `technology-component` (service stance) | Open Architect doesn't separate the technology service abstraction; use a `technology-component` |
| Node | `technology-component` (often with `environment` link) | Combines runtime + location |
| Device | `technology-component` | Hardware variant |
| System Software | `technology-component` | OS, runtime, container platform |
| Communication Network | `technology-component` (network type) or `environment` (when it represents a deployment zone) | Pick based on whether you care about the network as a thing or as a boundary |
| Goal | `objective` | 1:1 |
| Driver | `stakeholder` concerns or `objective` rationale | ArchiMate Drivers are usually captured in stakeholder concerns or objective rationale, not as separate artifacts |
| Assessment | `risk` or `architecture-vision` rationale | Where ArchiMate uses Assessment to describe gaps in current state, Open Architect uses `risk` (forward-looking) or `architecture-vision` (target framing) |
| Outcome | tied into `objective` via measurement field | Open Architect treats outcomes as objective measurements |
| Principle | `principle` | 1:1 |
| Requirement | `requirement` | 1:1 |
| Constraint | `requirement` (with constraint type) | Open Architect collapses constraint into requirement with type |
| Gap | `gap` | 1:1 |
| Work Package | `work-package` | 1:1 |
| Plateau | `transition-architecture` | 1:1 — a time-bounded interim state |
| Deliverable | `work-package` outputs | Captured as outputs of work packages, not a separate artifact |
| Implementation Event | not modeled directly | Captured via roadmap milestones or transition dates |

## What Doesn't Map Cleanly

- **ArchiMate's strict layering** (Strategy / Business / Application / Technology / Implementation & Migration / Motivation / Physical) is more rigid than Open Architect. Open Architect uses domain folders (`business/`, `application/`, `data/`, `technology/`, `governance/`, `change/`) — close but not identical.
- **ArchiMate has many relationship types** (Composition, Aggregation, Assignment, Realization, Used By, Serving, Access, Influence, Triggering, Flow, Specialization, Association). Open Architect uses typed relationships but fewer canonical types (`realizes-capability`, `depends-on`, `exposes-interface`, `targets`, `supersedes`, etc.). Use the closest match; do not invent new types per project without governance review.
- **ArchiMate Motivation extensions** (Driver, Assessment, Goal, Outcome, Principle, Requirement, Constraint, Meaning, Value) collapse partially into Open Architect — see the mapping above.
- **Tool interop**: ArchiMate XML import/export is not directly supported by Open Architect today. If interop matters, a project can write a small converter; treat the YAML artifacts as the source of truth.

## Recommended Usage Pattern

1. Use Open Architect templates as the working source of truth.
2. When ArchiMate diagrams are required (for enterprise governance, board reporting), generate or hand-draw them from the underlying YAML; reference artifact IDs in diagram annotations.
3. Where a team is migrating from an ArchiMate tool, treat the migration as an inventory engagement (`inventory-only` playbook) — extract elements into Open Architect templates, then maintain.
4. Use the ArchiMate vocabulary in conversation; use Open Architect templates as the persistent record.

## Common Confusions

- "Should Business Function be `business-capability` or `business-process`?" ArchiMate Function = stable ability = `business-capability`. ArchiMate Process = sequenced behavior = `business-process`.
- "Where do Drivers go?" Capture them in `stakeholder.concerns` or `objective.rationale` rather than a separate artifact. Driver-as-artifact is overkill for most projects.
- "ArchiMate's Application Service vs Application Function?" In Open Architect both are `application-service`. The exposed/internal distinction is captured in the service's classification or relationships, not in a separate template.
- "Where does Plateau go?" Plateau = `transition-architecture`. Open Architect's `transition-architecture` artifacts carry the same intent: a named, time-bounded interim state with explicit baseline-to-target movement.
