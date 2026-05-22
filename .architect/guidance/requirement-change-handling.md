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

## The four change types

| Type | Definition | Typical trigger |
|---|---|---|
| **new** | A requirement that didn't exist before | Stakeholder interview, regulatory discovery, customer feedback |
| **modified** | An existing requirement's content, scope, or acceptance criteria has materially changed | Sponsor change request, technical constraint surfaced during modeling |
| **removed** | An existing requirement is no longer in scope (deferred, out-of-scope, withdrawn) | Scope re-prioritization, budget cut, sponsor decision |
| **superseded** | An existing requirement is replaced by one or more new requirements with the same intent | Refactoring the requirement set; consolidation or split |

**Conflict is a trigger, not a type.** When a new fact makes two
existing requirements incompatible, the resolution produces one of
the four types above (typically `modified` or `superseded`).

## Procedure (8 steps)

When you observe a requirement change:

1. **Recognize and classify** the change as `new` / `modified` / `removed` / `superseded`.
2. **Capture the source** — where did the change come from (sponsor, regulator, technical, customer)?
3. **Run impact assessment.** For each downstream artifact category, list which are touched:
   - Solutions (`SOL-XXXX`) — does this change the bounded design?
   - Decisions (`DEC-XXXX`) — does any prior decision need re-review?
   - Interfaces (`IF-XXXX`) — does this break a contract or require a new one?
   - Transitions (`TA-XXXX`) — does this change the wave plan or cutover?
   - Risks (`RSK-XXXX`) — does this introduce a new risk or close an existing one?
   - Compliance assessments (`CA-XXXX`) — does this change the obligation scope?
   - Timeline / cost — rough magnitude (none / minor / material)
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
6. **Apply the change** to artifacts:
   - Update the `requirement` YAML (`spec.*`, `metadata.change_log`)
   - If a `decision` is required, draft it via [`decision-recorder`](../skills/decision-recorder.md)
   - Update affected downstream artifacts (solutions, interfaces, transitions, risks, compliance assessments)
   - Mark downstream `metadata.last_reviewed` to surface in `gap-radar` as needing re-review
7. **Add the change-register entry.** One row per change in `architect-work/change-register.md`, newest on top. Use the template entry shape.
8. **Add a working-log entry.** Plain-language narrative for the architect's chronological view; cross-references the change-register entry.

## What good looks like

- Every change in the register is traceable to a source.
- Every promoted-to-decision change links to its `DEC-XXXX`.
- Every `metadata.change_log` line on a requirement also appears in the register (the register aggregates per-requirement history at the sponsor level).
- The register entry's *impact assessment* fields are filled even when no downstream artifact is affected (record "none" rather than leaving blank).
- After a change lands post-baseline in `advisory` mode, the next review gate explicitly acknowledges the changes since baseline.

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
        -> Impact assessment (solutions, decisions, interfaces, transitions, risks, compliance, timeline)
            -> Threshold met? -> YES: draft decision
                              -> NO: change_log + register entry only
                -> Freeze gate (off / advisory / strict)
                    -> Apply to artifacts
                        -> Mark downstream last_reviewed
                            -> Add change-register entry
                                -> Add working-log entry
```
