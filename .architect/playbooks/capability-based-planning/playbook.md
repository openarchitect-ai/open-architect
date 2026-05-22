# Capability-Based Planning Playbook

## Engagement Shape

- **Stance:** one-shot or recurring (often annual)
- **Default mode:** `analysis` (with explicit moves to `decision`)
- **Typical duration:** weeks to a few months
- **Output emphasis:** canonical business capability map, capability heatmap (maturity / health / strategic fit), investment direction per capability, roadmap, handoff to portfolio / delivery

## When To Use

Use this playbook when:

- defining or refreshing the business capability map
- driving investment planning from business capabilities (not from applications)
- assessing capability maturity across the enterprise
- aligning value streams to capabilities and capabilities to investment
- post-merger capability rationalization
- shifting from project-funding to capability-funding model

## When Not To Use

Do **not** use this playbook when:

- running a full enterprise architecture cycle (use `full-togaf-adm` — capability work is one phase of it)
- rationalizing applications rather than capabilities (use `portfolio-rationalization`)
- designing a specific solution (use `quick-solution-design`)
- executing modernization (use `migration-wave` or `cloud-migration`)
- the work is operational governance (use `steady-state-governance`)

## What Good Looks Like

- canonical capability map agreed at the right level (usually two levels deep; three for complex businesses)
- heatmap showing maturity, health, strategic fit per capability (multi-dimensional, not one number)
- value streams mapped to capabilities (every stream supported, every capability earns its place)
- investment direction per capability (invest / sustain / divest / rationalize)
- roadmap that sequences capability investment over time
- handoff to delivery / portfolio engagements is clean
- recurring cadence is on the calendar (if the engagement is meant to repeat)

## Stages

### Stage 1 — Frame The Planning

- **Entry signals:** sponsor exists (usually business-architect lead, COO, or CIO); strategic context is articulated
- **Key questions:** why capability planning now, what is the ambition (refresh existing map / build fresh / post-merger rationalization), what is the cadence (one-shot vs annual), what is the decision authority
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** planning charter, sponsor, ambition, cadence stance, decision authority
- **Exit signals:** the charter is reviewable by the sponsor

### Stage 2 — Baseline The Capability Map

- **Entry signals:** charter is in hand
- **Key questions:** does a capability map already exist, what level of decomposition is right, what is the canonical naming, which capabilities are obvious and which are contested
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** baseline capability map at the agreed level of decomposition (typically two levels), with explicit definitions
- **Exit signals:** the map is reviewable; stakeholders recognize their business in it
- **Review gate:** `requirement-baseline`

### Stage 3 — Assess Maturity Per Capability

- **Entry signals:** the map is in place
- **Key questions:** for each capability — what is its current maturity (people, process, technology, data, governance), what is its operational health, what is its strategic fit, what evidence supports each score
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`baseline-discovery`](../../skills/baseline-discovery.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** capability heatmap (capabilities × dimensions × score × evidence), gap signals per capability
- **Exit signals:** scoring is evidence-cited and defensible

### Stage 4 — Align Value Streams To Capabilities

- **Entry signals:** capability map and heatmap are in place
- **Key questions:** what value streams exist, which capabilities each stream depends on, where capability gaps block value, where capabilities exist without value-stream support
- **Recommended skills:** [`relationship-mapper`](../../skills/relationship-mapper.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** value-stream-to-capability mapping, capability gaps that block value, orphaned capabilities (exist but not in value-stream support)
- **Exit signals:** every value stream is supported, every capability earns its place

### Stage 5 — Decide Investment Direction Per Capability

- **Entry signals:** value-stream alignment is in place
- **Key questions:** per capability — invest (raise maturity), sustain (maintain), divest (let it go), rationalize (consolidate with another capability); what funding model applies, what is the dependency
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** investment direction per capability with rationale, funding-model alignment, dependencies between investments
- **Exit signals:** the chosen direction is decided
- **Review gate:** `decision-approval`

### Stage 6 — Build Roadmap

- **Entry signals:** investment direction is decided
- **Key questions:** what comes first (foundational capability uplift, quick wins, or strategic differentiators), what is the cadence, what dependencies sequence the investments
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** capability investment roadmap, sequencing rationale, dependencies, expected outcomes per horizon
- **Exit signals:** the roadmap is reviewable at executive level

### Stage 7 — Handoff To Delivery / Portfolio

- **Entry signals:** the roadmap is approved
- **Key positions:** what does the delivery / portfolio program need to act on these decisions, who owns each capability investment, what is the handover packet, what is the recurring review cadence
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md), [`communication-packager`](../../skills/communication-packager.md)
- **Expected outputs:** capability planning output packaged for delivery / portfolio (often inputs to `portfolio-rationalization` or `full-togaf-adm`), residual-risk register, named handoff owners
- **Exit signals:** the next engagement can start with capability investment as the strategic anchor

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md) — primary skill for this engagement
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`relationship-mapper`](../../skills/relationship-mapper.md)
5. [`option-evaluator`](../../skills/option-evaluator.md)
6. [`decision-recorder`](../../skills/decision-recorder.md)
7. [`evidence-curator`](../../skills/evidence-curator.md)
8. [`transition-planner`](../../skills/transition-planner.md)
9. [`gap-radar`](../../skills/gap-radar.md)
10. [`architecture-review`](../../skills/architecture-review.md)
11. [`architecture-documenter`](../../skills/architecture-documenter.md)
12. [`communication-packager`](../../skills/communication-packager.md)
13. [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)

## Review Gates That Apply

- `requirement-baseline` — confirm capability map and decomposition level
- `solution-direction` — confirm heatmap, value-stream alignment, investment ambition
- `decision-approval` — confirm investment direction per capability

`governance-review` and `transition-plan` are typically not in scope — they belong to the delivery engagement that follows.

## Patterns Likely To Apply

- **Business capability:**
  - [capability-based-planning](../../patterns/business/capability-based-planning.md)
  - [business-capability-roadmapping](../../patterns/business/business-capability-roadmapping.md)
  - [business-capability-heatmap](../../patterns/business/business-capability-heatmap.md)
  - [value-stream-to-capability-mapping](../../patterns/business/value-stream-to-capability-mapping.md)
  - [capability-funding-alignment](../../patterns/business/capability-funding-alignment.md)
  - [operating-model-segmentation](../../patterns/business/operating-model-segmentation.md)
  - [product-vs-platform-boundary](../../patterns/business/product-vs-platform-boundary.md)
  - [product-operating-model-alignment](../../patterns/business/product-operating-model-alignment.md)
  - [portfolio-rationalization](../../patterns/business/portfolio-rationalization.md)
  - [application-invest-tolerate-migrate-eliminate](../../patterns/business/application-invest-tolerate-migrate-eliminate.md)
- **Governance:**
  - [architecture-decision-lifecycle](../../patterns/governance/architecture-decision-lifecycle.md)
  - [decision-authority-matrix](../../patterns/governance/decision-authority-matrix.md)
  - [decision-evidence-packaging](../../patterns/governance/decision-evidence-packaging.md)

## Common Anti-Patterns

- **Capability map without strategy** — the map exists, but nothing about it informs investment.
- **Hundreds of leaf capabilities** — decomposed beyond decision-usefulness; the map becomes a taxonomy nobody uses.
- **Maturity scored without evidence** — gut-feel scores that don't survive scrutiny.
- **Heatmap nobody refreshes** — produced once, never updated, becomes stale folklore.
- **Investment direction set without funding reality** — "invest" decisions for capabilities that have no budget pathway.
- **Capability rename theatre** — renaming without re-architecting; old behavior with new labels.
- **Conflating capability with org-unit** — capability map mirrors the org chart, so it changes when reorgs happen; it should be more stable than the org.
- **Value-stream mapping done after capability decisions** — investment direction set without knowing which streams the capability supports.
- **Capability levels inconsistent** — some branches two levels deep, others four; comparison is impossible.
- **No canonical naming** — same capability named differently across business units; gaps look bigger than they are.
- **Strategic fit scored by sponsor** — the sponsor's pet capabilities score "high"; rubric becomes theatre.
- **Capability map maintained outside Open Architect** — drift between the strategic map and the architecture record.
- **Tolerated forever** — sustain decisions never expire; the portfolio never improves.
- **Recommendations without owners** — capability investments decided by architecture, executed by no one.

## Entry Criteria

- a sponsor with capability-planning authority (business architect lead, COO, CIO)
- the strategic context is at least articulated (vision, market position, near-term ambition)
- some baseline visibility into the business exists or can be gathered
- a scoring approach can be chosen (multi-dimensional maturity is recommended)
- there is appetite to act on investment decisions, not just produce a map

## Exit Criteria

- canonical capability map exists at the agreed level of decomposition
- heatmap is evidence-cited and defensible
- value-stream-to-capability mapping is in place
- investment direction per capability is decided with rationale and named approver
- roadmap is reviewable at executive level
- handoff to delivery / portfolio engagement is packaged
- recurring cadence is on the calendar (if the engagement is meant to repeat)

## Cycling Stance

This playbook can run as **one-shot** (single capability planning study) or **recurring** (annual cycle, often aligned with the planning calendar). Pick early.

If recurring:

- each cycle refreshes the map, heatmap, value-stream mapping, and investment direction
- decisions from the previous cycle are revisited (sustain → invest, invest → sustain, etc.)
- residual investments not delivered are re-baselined

If one-shot:

- the cycle closes at Stage 7 with handoff
- the next capability cycle is a fresh engagement when business case emerges

## What This Playbook Does Not Do

- It does not deliver capability uplift — that is the delivery program
- It does not run the broader enterprise architecture cycle — use `full-togaf-adm`
- It does not rationalize applications — use `portfolio-rationalization`
- It does not design solutions — use `quick-solution-design`
- It does not own ongoing capability operations — partner with capability owners
- It does not produce strategic direction — the strategy is an input, not an output

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if any prior capability work exists.
2. Write a one-paragraph planning charter into `notes.md` — why now, sponsor, ambition (refresh / build fresh / post-merger), cadence (one-shot or annual).
3. Take an initial position on the decomposition depth (typically two levels; three for complex businesses). Provisional is fine.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the sponsor, what is the strategic anchor, what is the current capability map (if any), what is the planning cadence, who owns capabilities at the business-unit level, what is the funding model.
6. List the top 8–10 value streams that the capabilities should support.
7. Resist mapping anything until canonical naming is agreed at the top level.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — `enterprise` is the default for this playbook; rarely smaller (a single business unit, perhaps).
- **Compliance scope** — usually light; only set if the capability planning crosses regulated domains.
- **Roles** — keep `chief-architect`, `business-architect`, `enterprise-architect`, `business-analyst`; add `architecture-governance-lead` for decision authority work.
- **Templates** — keep `business-capability`, `business-process`, `organization`, `stakeholder`, `objective`, `architecture-vision`, `principle`, `decision`, `roadmap`; add `risk` for capability investment risk.
- **Default mode** — `analysis` is correct; explicit `decision` at Stage 5.
- **Coordinator** — `coordinator_auto_route: false`; capability decisions are high-stakes and need explicit routing.
- **Decomposition depth** — declare early. Two levels is most common; three for complex businesses; one is rarely useful.
- **Scoring dimensions** — at minimum maturity, health, strategic fit; often financial value, customer impact, risk. Multi-dimensional beats single-score.
- **Cadence** — declare one-shot or annual. Affects roadmap horizon and Stage 7 handoff shape.

## Decision Points

- **Decomposition depth** — two levels (most common) vs three (complex businesses). Inconsistency across branches is the failure mode.
- **Scoring framework** — multi-dimensional maturity + health + strategic fit is recommended; single-score maturity hides tradeoffs.
- **Value-stream emphasis** — define value streams before capabilities (top-down) vs after (bottom-up). Top-down is more common.
- **Funding model alignment** — project-funding (capability investments compete with projects) vs capability-funding (capabilities are funded; projects deliver against them). Capability-funding is more strategic but harder to operate.
- **Cadence** — one-shot vs annual. Annual is more common in mature orgs.
- **Capability ownership model** — single-owner per capability vs federated. Single-owner scales; federated respects matrix orgs.
- **Investment direction granularity** — flat (invest / sustain / divest / rationalize) vs nuanced (with magnitude and horizon). Flat is simpler; nuanced is more useful.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the sponsor with capability-planning authority?
- What is the strategic anchor this planning aligns to?
- Does a capability map already exist? At what decomposition level?
- What is the canonical naming convention for top-level capabilities?
- What value streams exist, and how are they currently supported?
- What is the funding model (project-funding vs capability-funding)?
- Who owns each capability at the business-unit level?
- What is the scoring framework (dimensions, evidence sources)?
- What is the recurring cadence (one-shot vs annual)?
- What is the handover shape (`portfolio-rationalization` input, `full-togaf-adm` input, executive deck)?
- What is the residual-investment acceptance authority (when a capability is "sustain" instead of "invest")?

## Recommended Diagrams

- Capability map (top-level boxes, second-level sub-capabilities under each)
- Capability heatmap (capabilities × dimensions × color-coded score)
- Value-stream-to-capability mapping (streams × supporting capabilities × dependency type)
- Investment direction matrix (capabilities × direction × magnitude × horizon)
- Investment roadmap (capabilities × time × dependencies × milestones)
- Capability funding flow (funding pool → capabilities → projects / products that deliver against them)
- Capability ownership map (capabilities × business-unit owner × architect owner × delivery owner)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name`. Declare cadence (one-shot or annual) and decomposition depth in `notes.md`.
4. Run [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md) before any capability mapping — strategic anchor must be in place.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Ownership Truthfulness Risks* (capability ownership claims) and *Inconsistencies* (decomposition depth varying across branches).

## Notes For Reviewers

When reviewing capability-based planning output:

- check that the capability map decomposition is consistent across branches
- check that capability naming is canonical (same name everywhere)
- check that every value stream is supported by some capability, and every capability supports some stream
- check that heatmap scores are evidence-cited, not gut-feel
- check that strategic fit is scored against an articulated strategic anchor, not implicit preferences
- check that investment direction has named approvers and (for sustain items) review triggers
- check that capability ownership is honest, not just aspirational
- check that the roadmap is reviewable at executive level (not buried in detail)
- check that the funding model alignment is explicit, not assumed
- check that the engagement did not silently expand into application rationalization or full enterprise architecture
