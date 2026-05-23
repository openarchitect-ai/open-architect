# Requirement Change Handling

## Purpose

Define the architect's procedure when a requirement on an engagement
changes. Requirements drift is one of the most common sources of
architectural rework; this guide says what to *do* about it.

Pair this guide with:

- the [`change-coordinator`](../skills/change-coordinator.md) skill — runnable procedure
- the [`requirement-change-protocol`](../patterns/governance/requirement-change-protocol.md) pattern — architectural shape
- `architect-work/change-register.md` in each project — the running log
- the `requirement` template's `metadata.change_log` field — per-requirement history

## Audience

The architect (or coordinating role) on a live engagement. Sponsors and
delivery teams should read the *change register* file in each project;
this file is the meta-guide that defines how the register stays
honest.

## The five change types

| Type | Definition | Typical trigger |
|---|---|---|
| **new** | A requirement that didn't exist before | Stakeholder interview, regulatory discovery, customer feedback |
| **modified** | An existing requirement's content, scope, or acceptance criteria has materially changed | Sponsor change request, technical constraint surfaced during modeling |
| **removed** | An existing requirement is no longer in scope (deferred, out-of-scope, withdrawn) | Scope re-prioritization, budget cut, sponsor decision |
| **superseded** | An existing requirement is replaced by one or more new requirements with the same intent | Refactoring the requirement set; consolidation or split |
| **propagation-closure** | A prior change (already a `new`/`modified`/`removed`/`superseded` entry) is being completed by updating a downstream or upstream artifact that the original entry's impact assessment missed | An `architecture-review` pass surfaces a stale artifact that should have been refreshed when the original CHG landed |

**Conflict is a trigger, not a type.** When a new fact makes two
existing requirements incompatible, the resolution produces one of
the first four types above (typically `modified` or `superseded`).

**Propagation-closure is for catch-up work, not new scope.** When you
find an artifact that should have been refreshed in a prior CHG's
impact-assessment but wasn't, record the fix as a
`propagation-closure` entry referencing the original CHG. This keeps
the register honest without inflating CHG numbers with non-events,
and preserves the audit trail to where the gap was discovered (e.g.
*"surfaced by `architecture-review` 2026-05-24"*). Distinct from a
*new* `modified` change because no fresh requirement-level change
occurred — the artifact is *catching up* to a change that already
landed.

## Procedure (8 steps)

When you observe a requirement change:

1. **Recognize and classify** the change as `new` / `modified` / `removed` / `superseded`.
2. **Capture the source** — where did the change come from (sponsor, regulator, technical, customer)?
3. **Run impact assessment.** For each artifact category, list what's touched. **Sweep upstream AND downstream** — restate-the-decision content lives in upstream artifacts too:

   *Upstream artifacts (often carry restate-the-decision text that goes stale silently):*
   - **Architecture vision (`VIS-XXXX`)** — does the vision's problem statement, future state, principles, in-scope, or out-of-scope reference the changing requirement? The vision is the artifact most quoted to sponsors and ARB; a stale vision is the most visible drift.
   - **Objectives (`OBJ-XXXX`)** — does any objective's success-measure number, rationale, or scope reference the changing requirement? A locked numeric target in a REQ that doesn't match the upstream OBJ is a coherence defect.
   - **Principles (`PRN-XXXX`)** (if `principle` template is enabled) — does any principle's statement or rationale need restating?

   *Downstream artifacts (the design surface the requirement constrains):*
   - **Solutions (`SOL-XXXX`)** — does this change the bounded design?
   - **Decisions (`DEC-XXXX`)** — does any prior decision need re-review or supersession?
   - **Applications / services / interfaces (`APP-*`, `AS-*`, `IF-*`)** — does this break a contract or require a new one?
   - **Data objects (`DO-XXXX`)** — does this add or remove a data-shape constraint?
   - **Transitions (`TA-XXXX`)** — does this change the wave plan or cutover?
   - **Risks (`RSK-XXXX`)** — does this introduce a new risk, close an existing one, or transition a risk's state (e.g. `mitigated` → `materialized`)?
   - **Compliance assessments (`CA-XXXX`)** — does this change the obligation scope?
   - **Technology components / environments (`TC-*`, `ENV-*`)** — does this require a stack or hosting change?
   - **Timeline / cost** — rough magnitude (none / minor / material)

   **Rule of thumb:** if an artifact's text *references* the changing requirement, decision, or scope by name or by number, it's in the impact list. Don't rely on relationship traversal alone — text drift is the most common silent miss.
4. **Evaluate the decision threshold.** Promote the change to a `decision` artifact when **any** of:
   - The change touches more than one `solution`
   - The change alters regulatory or compliance posture
   - The change materially affects timeline or cost
   - The change crosses a review gate (e.g., post `requirement-baseline`)
   - The sponsor explicitly asks for it on record

   If none apply: a `metadata.change_log` entry on the requirement plus
   a `change-register.md` row is sufficient.
5. **Check freeze-gate status** against `project-config.conventions.requirement_freeze_enforcement`:
   - `off` — proceed normally
   - `advisory` (default) — apply the change but flag in the register that it landed post-baseline
   - `strict` — pause; the sponsor or coordinator must formally re-open the requirement set before the change applies
6. **Apply the change** to every artifact in the impact list:
   - Update the `requirement` YAML (`spec.*`, `metadata.change_log`)
   - If a `decision` is required, draft it via [`decision-recorder`](../skills/decision-recorder.md)
   - **Sweep upstream first** — refresh `VIS-*` / `OBJ-*` / `PRN-*` text that references the changing requirement. These are the artifacts most likely to be missed because they're not in the relationship-traversal path.
   - Update affected downstream artifacts (solutions, interfaces, applications, services, data objects, transitions, risks, compliance assessments, technology components, environments)
   - Mark every touched artifact's `metadata.last_reviewed` to today's date so `gap-radar` surfaces them
   - **Filename stability** — if a content rewrite changes an artifact's `display_name`, **keep the filename stable** and update the `aliases:` field with the prior name. The filename is a stable identifier; the display name is the human-readable label. Renaming the file forces every cross-reference to be tracked down and adds no value over the alias. (Rare exception: when the artifact's *ID* changes — e.g. supersession produces a new artifact — the new file gets a new filename.)
7. **Add the change-register entry.** One row per change in `architect-work/change-register.md`, newest on top. Use the template entry shape. For propagation-closure entries: reference the original CHG ID and the source of the finding (e.g. *"Surfaced by `architecture-review` 2026-05-24"*).
8. **Add a working-log entry.** Plain-language narrative for the architect's chronological view; cross-references the change-register entry.
9. **Run a post-change `architecture-review` pass** when the change promoted to a `decision` artifact OR touched more than three downstream artifacts. The review walks the cluster of touched artifacts to catch propagation misses *while the change is fresh*, before the next gate or a future review surfaces them as BLOCKERs. Findings from this pass either close out in the same engagement turn (small fixes) or open `propagation-closure` entries (substantive misses). This step is what prevents the two-step pattern: change lands → propagation gap discovered three turns later → BLOCKER + propagation-closure entry.

## What good looks like

- Every change in the register is traceable to a source.
- Every promoted-to-decision change links to its `DEC-XXXX`.
- Every `metadata.change_log` line on a requirement also appears in the register (the register aggregates per-requirement history at the sponsor level).
- The register entry's *impact assessment* fields are filled — both upstream (vision, objectives, principles) and downstream — even when no artifact is affected (record "none" rather than leaving blank).
- After a change lands post-baseline in `advisory` mode, the next review gate explicitly acknowledges the changes since baseline.
- When `architecture-review` or `gap-radar` discovers a propagation miss, the catch-up is recorded as a `propagation-closure` entry referencing the original CHG — not as a fresh `modified` entry.
- An artifact's filename does not change when its `display_name` is rewritten under change-coordinator; the prior name lives in `aliases:`.

## What this guide does *not* cover

- **Decision changes** — when an existing `decision` artifact is reversed, use `decision-recorder` and the decision's own `change_log` field. A decision reversal *may* trigger requirement re-evaluation; that's a separate flow.
- **Principle changes** — handled through the architecture-principle-lifecycle pattern; out of scope here.
- **Architectural pattern adoption** — patterns are adopted through decisions, not as requirement changes.

## Relationship to `requirements-follow-up`

[`requirements-follow-up`](../skills/requirements-follow-up.md) handles
*unresolved* requirements — open questions, missing acceptance criteria,
ambiguous owners. This guide handles *resolved* requirements that
*change after the fact*. The two skills feed each other:
unresolved-then-resolved becomes "new" or "modified" in the register;
modified-then-re-questioned can become an open question again.

## Compact cheat sheet

```text
Observe change
    -> Classify (new / modified / removed / superseded)
        -> Impact assessment — UPSTREAM (vision, objectives, principles)
                            + DOWNSTREAM (solutions, decisions, interfaces, apps, data, transitions, risks, compliance, tech, environments, timeline)
            -> Threshold met? -> YES: draft decision
                              -> NO: change_log + register entry only
                -> Freeze gate (off / advisory / strict)
                    -> Apply to artifacts (upstream first, then downstream)
                        -> Mark every touched last_reviewed
                            -> Filename stability: rewrite display_name, keep filename, update aliases
                                -> Add change-register entry
                                    -> Add working-log entry
                                        -> If threshold-met OR >3 artifacts touched:
                                            run post-change architecture-review pass
                                                -> Any miss found becomes a propagation-closure entry
```
