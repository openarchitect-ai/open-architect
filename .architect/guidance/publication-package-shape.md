# Publication Package Shape

## Purpose

Define what a **publication package** looks like in Open Architect, so
the four package-producing skills produce something consistent and
recognizable, and the boundary between OA and the org's documentation
system is clear.

## The boundary

Open Architect produces a clean, well-formed publication package as a
folder of composed documents, diagrams, a manifest, and provenance
metadata. **What happens to that package after it's assembled — upload
to Confluence, transform to Word for SharePoint, import into LeanIX or
Ardoq, post to a wiki, mail to stakeholders — is the architect's call
and follows the organization's documentation policy.** OA stops at the
workspace boundary.

This guide says what the package contains and where it lives. It does
*not* say where the package goes next.

## Where a package lives

```text
workspace/<project-name>/
  publications/
    2026-04-18-solution-direction/
    2026-05-22-decision-approval/
    2026-06-10-sponsor-briefing/
    ...
```

One folder per publication, named `<date>-<gate-or-purpose>`. The date
is when the package was assembled; the gate or purpose is the milestone
the package satisfies (one of the review gates in
[`agent.config.md`](../config/agent.config.md), or a free-form purpose
like `sponsor-briefing`, `audit-evidence`, `delivery-handover`).

## What a package contains

The exact set depends on which skill produced it, but the minimum shape is:

| File | Purpose | Produced by |
|---|---|---|
| `README.md` | Overview: what this package is, the gate or purpose, who it's for | All four skills |
| `manifest.yaml` | List of artifact IDs included in this package, with their versions / `metadata.last_reviewed` at publication time | All four skills |
| `provenance.yaml` | Project state at publication: OA capability version, project-config snapshot reference, who assembled, when | All four skills |
| Composed documents (`*.md`) | The actual narrative deliverables — review packet, ADR set, vision doc, transition plan, briefing memo, etc. | Skill-specific |
| `views/` | Diagrams referenced by the package, with sources (Mermaid / PlantUML) | If diagrams are included |

### `manifest.yaml` shape

```yaml
manifest:
  published_at: 2026-05-22
  gate_or_purpose: solution-direction
  artifacts:
    - id: SOL-1002
      kind: solution
      last_reviewed: 2026-05-20
      status: approved
    - id: DEC-1007
      kind: decision
      last_reviewed: 2026-05-21
      status: approved
    - id: IF-1003
      kind: interface
      last_reviewed: 2026-05-18
      status: approved
  diagrams:
    - title: Customer activation context
      source: views/context-customer-activation.md
```

### `provenance.yaml` shape

```yaml
provenance:
  oa_capability_version: 0.1.0
  project_state_at_publish:
    open_questions_count: 4
    pending_decisions_count: 1
    change_register_entries_since_last_publish: 3
  assembled_by:
    role: chief-architect
    note: <free-form attribution>
  assembled_via:
    skill: review-pack-builder
    invocation: review for solution-direction gate
```

## When is a publication actually created

**Publishing is always a deliberate act with explicit architect approval.**
It's never automatic — Open Architect does not auto-publish on artifact
approval, on `gap-radar` passing, on a change-register entry being
added, or on any other workspace event. Two paths get to the deliberate-act
result:

### Two paths to a publication

**Path A — Architect-initiated.** The architect directly runs one of
the four package-producing skills. Most common in
`operating_style: architect-assist` (the default), where the architect
is the primary driver.

**Path B — Coordinator-recommended, architect-approved.** A coordinating
role — typically `chief-architect` running the
[`architecture-coordinator`](../skills/architecture-coordinator.md)
skill, when enabled in the project's `governance.coordinator_role` —
recognizes that a review gate is approaching, that the pre-conditions
are met, and **recommends** running the appropriate package skill. The
architect reviews the recommendation and approves before the skill
actually runs.

The default project-config sets `governance.coordinator_auto_route:
false`, which means the coordinator never auto-runs a publication
skill on its own — every recommendation requires architect approval.
Even in coordinator-led mode (`coordinator_auto_route: true`),
publication is high-consequence enough that explicit approval is the
right discipline; it commits a snapshot to a sponsor-facing artifact
and is hard to take back once distributed.

Either way, the *deliberate act* — architect-initiated or
coordinator-recommended-and-approved — produces the package. There is
no third "the workspace published silently" path.

### Trigger 1 — Gate-anchored (the most common case)

A review gate from the playbook's `governance.review_checkpoints` is
approaching:

| Gate | Skill | Package purpose |
|---|---|---|
| `project-bootstrap` | [`architecture-documenter`](../skills/architecture-documenter.md) | Engagement orientation for the sponsor |
| `requirement-baseline` | [`architecture-documenter`](../skills/architecture-documenter.md) | Requirement set for sponsor sign-off |
| `solution-direction` | [`review-pack-builder`](../skills/review-pack-builder.md) | Review pack for the architecture board |
| `decision-approval` | [`review-pack-builder`](../skills/review-pack-builder.md) | Decision pack (ADRs + rationale + impact) |
| `governance-review` | [`review-pack-builder`](../skills/review-pack-builder.md) + [`communication-packager`](../skills/communication-packager.md) | Governance package: compliance + risk + decision posture |
| `transition-plan` | [`delivery-handover-packager`](../skills/delivery-handover-packager.md) | Transition + delivery handover |

**Pre-conditions before assembling a gate package:**

- [`gap-radar`](../skills/gap-radar.md) has run recently and findings have either been addressed or accepted as known limitations recorded in the package's `README.md`
- The artifacts to be included are in `approved` / `accepted` status — provisional or draft artifacts don't belong in a gate package
- The [`change-register.md`](requirement-change-handling.md) is current (any post-baseline changes are reflected; nothing is pending without an entry)

The package is assembled **before** the gate convenes — the gate's purpose is to *review and sign off* the package, not to wait for it.

### Trigger 2 — Sponsor or stakeholder briefing (ad-hoc)

Outside of formal gates: a sponsor wants a status briefing, a steering
committee asks for an update, an audit request lands, a new joiner needs
orientation. The architect runs
[`communication-packager`](../skills/communication-packager.md) for an
informal briefing or [`architecture-documenter`](../skills/architecture-documenter.md)
for a formal document.

Pre-conditions are looser than gate packages — provisional content is
acceptable as long as it's labeled honestly. The package's `README.md`
should state explicitly when content is still provisional or open.

### Trigger 3 — Delivery handover (per-wave or end-of-engagement)

A wave is going into delivery, or the engagement is closing. The
architect runs [`delivery-handover-packager`](../skills/delivery-handover-packager.md).

Pre-conditions: the relevant `transition-architecture` and `work-package`
artifacts are in `approved` status; rollback approach is declared; the
cutover-rehearsal posture is on record.

### What is NOT a trigger

To be unambiguous about what does **not** create a publication:

- An artifact moving to `approved` status does not auto-create a package
- A `change-register.md` entry does not auto-create a package
- A passing `gap-radar` does not auto-create a package
- A review gate's scheduled date does not auto-create a package
- A new working-log entry does not auto-create a package

Publishing is always a deliberate act, never a side effect.

### Position in the workflow loop

In the workflow loop on the root README, publishing sits at the end of
the **Review** phase: `gap-radar` runs → findings close → artifacts
move to `approved` → the architect runs the package-producing skill →
the gate convenes against the package. Then the loop continues into
**Handle change** for whatever the gate surfaces.

## What OA does

OA does, via the four package-producing skills:

- [`review-pack-builder`](../skills/review-pack-builder.md) — assembles governance review packs (board review, decision approval)
- [`delivery-handover-packager`](../skills/delivery-handover-packager.md) — assembles delivery handover packs (wave-by-wave, work-package-aligned)
- [`architecture-documenter`](../skills/architecture-documenter.md) — assembles formal architecture documents (HLD packs, solution overviews, option papers)
- [`communication-packager`](../skills/communication-packager.md) — assembles stakeholder-ready summaries and briefings

Each skill produces a package in this shape under
`workspace/<project>/publications/`.

## What OA does NOT do

- Publish to Confluence, SharePoint, LeanIX, Ardoq, ServiceNow, Wiki.js, GitBook, or any other system
- Transform the package into Confluence wiki markup, Microsoft Word, OpenDocument, PDF, slide deck, or any other downstream format
- Run the organization's approval workflow inside its CMS
- Sync content back from the enterprise system into OA (manual import only, by explicit architect action)

Those are the architect's responsibility, governed by the org's
documentation policy.

## Logging publications

Each publication is recorded in the project's
[`working-log.md`](../cli/templates/architect-work/working-log.md) as
an entry — the working log is the chronological narrative and a
publication is a meaningful project event. The publication folder
itself (`publications/<date>-<gate>/`) is the artifact; the working-log
entry is the narrative reference.

No separate `publications-log.md` file is needed; the dated publication
folders are self-organizing.

## Diagram rendering note

If the package goes to a system that renders Mermaid natively (GitHub,
GitLab, many wiki platforms), the Markdown views render directly. If
the target system doesn't render Mermaid, the architect renders to PNG
or SVG as part of the publication step outside OA. The source `.md` /
`.puml` files stay in the package so the diagrams remain editable.

## Relationship to `gap-radar`

Before assembling a publication package, run
[`gap-radar`](../skills/gap-radar.md). Publishing artifacts with
unresolved BLOCKER findings, missing required content, or active drift
is the most common way an architecture package fails the next review.
The radar's findings should either close before publication or appear
as known limitations inside the package's `README.md`.
