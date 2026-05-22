# Portfolio Rationalization Playbook

## Engagement Shape

- **Stance:** one-shot, decision-focused
- **Default mode:** `analysis` (with explicit moves to `decision`)
- **Typical duration:** weeks to a small number of months
- **Output emphasis:** rationalization decisions per application — invest / tolerate / migrate / eliminate — with evidence and stakeholder validation

## When To Use

Use this playbook when:

- a portfolio review or rationalization study is needed before deciding migration / modernization direction
- duplication, cost, risk, or strategic misalignment in the estate motivates rationalization
- the deliverable is a set of decisions per application (or per business capability) about future investment
- the engagement *precedes* execution — a `migration-wave` may follow, but this playbook does not deliver migration
- a sponsor needs an evidence-backed argument for portfolio investment / divestment

## When Not To Use

Do **not** use this playbook when:

- executing the modernization (use `migration-wave`)
- bounded solution work for one initiative (use `quick-solution-design`)
- M&A integration where rationalization is one wave (use `post-acquisition-integration`)
- pure inventory with no decision intent (use `inventory-only`)
- enterprise architecture cycle with capability and target state (use `full-togaf-adm`)

## What Good Looks Like

- application-level rationalization classification per chosen framework (TIME, ITME, custom)
- evidence-backed decisions covering cost, risk, fit, strategic alignment, operational stance
- explicit handoff to delivery / migration program with named owners and timelines
- residual risks and rationalization debt named (what we chose not to address, why)
- stakeholders aligned and decisions defensible at executive level

## Stages

### Stage 1 — Frame The Rationalization

- **Entry signals:** sponsor exists; the strategic driver (cost, agility, risk, vendor consolidation, modernization) is clear
- **Key questions:** why are we rationalizing now, what success looks like, what scope of the estate is in/out, what framework will we use (TIME / ITME / custom), who decides
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** rationalization charter, scoring framework, stakeholders, scope, decision authority
- **Exit signals:** the framework and scope are accepted by the sponsor

### Stage 2 — Baseline The Portfolio

- **Entry signals:** scope is bounded
- **Key questions:** what applications exist in scope, who owns them, what do they cost (TCO), what do they support (capabilities, processes), what are their dependencies, what is their operational stance (health, risk, age)
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** portfolio baseline with applications, owners, costs, capabilities supported, dependencies, operational signals
- **Exit signals:** every in-scope application has enough evidence to score honestly

### Stage 3 — Score And Classify

- **Entry signals:** baseline is stable and evidence-backed
- **Key questions:** per application — what is the strategic fit, what is the operational health, what is the cost-to-value, what is the risk exposure, what is the migration cost; which TIME / ITME / custom bucket does it land in
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`relationship-mapper`](../../skills/relationship-mapper.md)
- **Expected outputs:** per-application scoring on the chosen framework's dimensions, candidate classification (invest / tolerate / migrate / eliminate)
- **Exit signals:** scoring is consistent, defensible, and evidence-cited

### Stage 4 — Decide Direction Per Application

- **Entry signals:** scoring is in place
- **Key questions:** what is the chosen direction per application, what are the trade-offs, who is the named approver per decision, what are the dependencies between decisions
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** decisions per application with rationale, options considered, dependencies, named approver
- **Exit signals:** the highest-impact decisions are on the record with approvers identified
- **Review gate:** `decision-approval`

### Stage 5 — Validate With Stakeholders

- **Entry signals:** decisions are drafted
- **Key questions:** what do business owners think, what do operations think, what do the impacted teams think, where is the political reality different from the evidence
- **Recommended skills:** [`architecture-review`](../../skills/architecture-review.md), [`gap-radar`](../../skills/gap-radar.md)
- **Expected outputs:** validated decisions, captured stakeholder concerns, revised classifications where evidence vs preference clashes were resolved
- **Exit signals:** decisions are reviewable at executive level

### Stage 6 — Hand Over To Delivery

- **Entry signals:** decisions are validated and accepted
- **Key positions:** what does the delivery / migration program need to act on these decisions, who owns each migration, what is the sequencing, what is the residual rationalization debt
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** rationalization decisions packaged for delivery (often inputs to `migration-wave`), residual-risk register, named handoff owners
- **Exit signals:** the next engagement (typically `migration-wave`) can start with the rationalization decisions as inputs

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`relationship-mapper`](../../skills/relationship-mapper.md)
5. [`option-evaluator`](../../skills/option-evaluator.md) — primary skill for this engagement
6. [`decision-recorder`](../../skills/decision-recorder.md) — primary skill for this engagement
7. [`evidence-curator`](../../skills/evidence-curator.md)
8. [`gap-radar`](../../skills/gap-radar.md)
9. [`architecture-review`](../../skills/architecture-review.md)
10. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline` — confirm scoring framework is usable
- `solution-direction` — confirm the rationalization framework and the scope of decisions
- `decision-approval` — confirm direction-per-application decisions

`governance-review` and `transition-plan` are typically *not* in scope for this playbook — they belong to the engagement that *executes* the decisions.

## Patterns Likely To Apply

- **Business:**
  - [portfolio-rationalization](../../patterns/business/portfolio-rationalization.md)
  - [application-invest-tolerate-migrate-eliminate](../../patterns/business/application-invest-tolerate-migrate-eliminate.md)
  - [business-capability-heatmap](../../patterns/business/business-capability-heatmap.md)
  - [value-stream-to-capability-mapping](../../patterns/business/value-stream-to-capability-mapping.md)
  - [operating-model-segmentation](../../patterns/business/operating-model-segmentation.md)
  - [capability-funding-alignment](../../patterns/business/capability-funding-alignment.md)
  - [capability-based-planning](../../patterns/business/capability-based-planning.md)
- **Governance:**
  - [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md)
  - [decision-authority-matrix](../../patterns/governance/decision-authority-matrix.md)
  - [decision-evidence-packaging](../../patterns/governance/decision-evidence-packaging.md)

## Common Anti-Patterns

- **Scoring without strategy** — applying TIME / ITME mechanically with no link to business strategy or capabilities.
- **Politics decide, evidence dresses up the decision** — the score is reverse-engineered from a predetermined outcome.
- **Eliminating "expensive" things without checking what they support** — and discovering at cutover what they actually carried.
- **Tolerate forever (no expiry)** — `tolerate` becomes the permanent answer; the portfolio never improves.
- **No handoff to delivery** — decisions made, never executed; the rationalization document gathers dust.
- **Vendor preferences override fit** — strategic vendor alignment overrules application-level evidence.
- **Single-dimension scoring** — only cost, only risk, only fit. Real decisions need multiple dimensions.
- **Hand-waving "strategic" classifications** — `invest` for applications nobody can articulate the strategic value of.
- **Rationalization without owner** — decisions made by architecture, executed by no one.
- **Vanity rationalization** — large counts of "eliminate" decisions that never materialize because the dependencies were never mapped.
- **Skipping stakeholder validation** — evidence-backed decisions that fail at the executive level because the political reality was ignored.

## Entry Criteria

- a sponsor exists with decision authority for the rationalization outcome
- the scope of the estate is at least roughly named
- baseline visibility into applications, costs, and ownership exists or can be gathered
- a scoring framework is chosen (TIME, ITME, custom) or can be selected
- there is appetite to act on rationalization decisions, not just produce them

## Exit Criteria

- every in-scope application has a classification decision with rationale
- decisions are reviewable, evidence-cited, and have named approvers
- residual rationalization debt is explicit (what we chose not to address, why)
- handover to delivery / migration is packaged
- the next engagement has clear inputs

## Cycling Stance

This playbook is **one-shot**. Portfolio rationalization is a discrete engagement that produces decisions; the *execution* of those decisions belongs to a different engagement (typically `migration-wave`).

If the portfolio needs ongoing rationalization (annual review, post-acquisition reassessment, post-strategy shift), run this playbook again as a fresh engagement — do not let it become a permanent rolling review.

## What This Playbook Does Not Do

- It does not execute migration, modernization, or decommissioning — use `migration-wave`
- It does not produce solution designs for the "invest" applications — use `quick-solution-design`
- It does not run the enterprise architecture cycle — use `full-togaf-adm`
- It does not own compliance posture across the estate — partner with the compliance engagement, if any
- It does not invent strategic direction — the strategy is an input, not an output

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior portfolio work exists.
2. Write a one-paragraph rationalization charter into `notes.md` — why, by when, what success looks like.
3. Decide the scoring framework (TIME / ITME / custom). Provisional is fine, but choose explicitly.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the sponsor with decision authority, what is the framework, what is the in-scope application list, who owns each application, what is the cost source of truth, what is the strategic anchor.
6. List the top 5–8 capabilities affected and a candidate application list per capability.
7. Resist scoring until baseline is honest.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — usually `enterprise`; reduce to `solution` only if rationalizing one product line.
- **Scoring framework** — TIME (Tolerate / Invest / Migrate / Eliminate), ITME (Invest / Tolerate / Migrate / Eliminate), Gartner-style, custom. Declare which.
- **Roles** — keep `enterprise-architect`, `business-architect`, `business-analyst`, `architecture-governance-lead`; add `chief-architect` for executive-level decision packaging.
- **Templates** — keep `application`, `business-capability`, `decision`, `risk`; add `organization` for ownership clarity.
- **Default mode** — `analysis` is correct; this playbook is mostly analysis with bursts of decision.
- **Coordinator** — `coordinator_auto_route: false`; rationalization is decision-heavy and needs explicit human routing.
- **Cost source of truth** — declare early. FinOps reports, CMDB, finance ledger, or estimated? Pick and document.
- **Strategic anchor** — what is the strategy this rationalization is aligned to? Without an anchor, scoring drifts.
- **Decision authority matrix** — name who decides for which classifications and dollar thresholds.

## Decision Points

- **Framework choice** — TIME / ITME / custom. Declare early.
- **Scoring dimensions** — at minimum cost, risk, strategic fit; often operational health, migration effort, vendor stance.
- **Granularity** — application level vs application-component vs capability-supporting cluster.
- **Cost basis** — TCO (run + change), run-only, change-only. Affects which applications look "expensive".
- **Decision authority** — per-classification (e.g. eliminate requires CFO) vs flat sponsor.
- **Handoff shape** — direct input to `migration-wave`, separate program planning, or shelf documentation. Decide before stage 6.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- What is the strategic anchor this rationalization aligns to?
- Which scoring framework will we use (TIME / ITME / custom)?
- What is the in-scope application list?
- Who owns each application, and who is the cost owner?
- What is the source of truth for TCO?
- What is the source of truth for application strategic value?
- What are the cross-application dependencies that could surprise us at decommissioning?
- What is the decision-authority matrix (who approves what)?
- What is the cadence — is this a one-shot study or an ongoing review?
- What is the handover shape (migration-wave input, program plan, executive deck)?
- What is the residual rationalization debt acceptance stance?

## Recommended Diagrams

- Portfolio scoring scatter plot (axes typically strategic fit × operational health, or TCO × value)
- Classification heatmap (applications × dimensions, color-coded by score)
- Capability heatmap (business capabilities × supporting applications, color-coded by health or fit)
- Dependency map (applications × interfaces × data flows, to expose hidden dependencies)
- Decision summary table (application × current classification × decision × approver × dependencies)
- Migration impact preview (per-decision: scope, timeline estimate, risk tier — as input to `migration-wave`)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`. Set the scoring framework you will use in `notes.md`.
4. Run [`baseline-discovery`](../../skills/baseline-discovery.md) on the portfolio before scoring anything.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Ownership Truthfulness Risks* (rationalization decisions hinge on honest ownership) and *Inconsistencies* (dependency claims that don't hold up).

## Notes For Reviewers

When reviewing portfolio rationalization output:

- check that every application has evidence supporting its score, not just a number
- check that decisions name an approver, not a generic "architecture board"
- check that `tolerate` classifications have an expiry or a defined re-review trigger
- check that cross-application dependencies are mapped before any `eliminate` classification
- check that the strategic anchor is referenced in decisions, not implicit
- check that residual rationalization debt is explicit, not hidden
- check that the handover shape is operable by the receiving engagement
- check that no decision was scored after the conclusion was reached
