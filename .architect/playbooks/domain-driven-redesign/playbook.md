# Domain-Driven Redesign Playbook

## Engagement Shape

- **Stance:** one-shot, scope-bounded
- **Default mode:** `analysis` (with explicit moves to `modeling`)
- **Typical duration:** months
- **Output emphasis:** bounded contexts, context map, ubiquitous language per context, integration patterns between contexts, tactical-design handoff to delivery

## When To Use

Use this playbook when:

- redesigning part of an estate using Domain-Driven Design (DDD) strategic patterns
- shifting from data-model-driven design to domain-driven design
- pre-microservices decomposition — you need bounded contexts *before* splitting services
- complex business domain needs explicit modeling discipline
- multiple teams contend over the same data and the conflict is really a missing context boundary
- a "shared model" is becoming a productivity tax across teams

## When Not To Use

Do **not** use this playbook when:

- general modernization without a DDD frame (use `migration-wave`)
- specific solution design within an established domain (use `quick-solution-design`)
- data platform engagement (use `data-platform-modernization`)
- the team isn't ready for DDD discipline (start with `quick-solution-design`; DDD without discipline is overhead with no benefit)
- the goal is microservices count, not domain clarity (skip this; you'll regret it)

## What Good Looks Like

- explicit bounded contexts with their own ubiquitous language
- context map showing relationships (customer-supplier, partnership, conformist, anti-corruption layer, separate ways, etc.)
- ubiquitous language per context documented and *used* in code, schemas, and conversations
- integration patterns between contexts (published languages, anti-corruption layers, domain events)
- migration plan from current shape to the redesigned shape (often hands off to `migration-wave`)
- tactical-design handoff to delivery teams (aggregates, entities, value objects as their concern, not the engagement's)

## Stages

### Stage 1 — Frame The Redesign

- **Entry signals:** sponsor exists; scope is at least roughly bounded (which domain or subdomain); the symptom is named (shared-model pain, team conflict, microservices-readiness, complexity)
- **Key questions:** why DDD now, what is the scope of the redesign, what is the success measure, what is the team's DDD maturity, who is the decision authority, who are the domain experts available
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** redesign charter, sponsor, scope, domain experts available, success measure (often: team autonomy, integration clarity, microservices viability)
- **Exit signals:** the charter is reviewable; domain experts are committed to participating

### Stage 2 — Baseline The Current Domain

- **Entry signals:** charter is in hand
- **Key questions:** what is the current language used by teams (formal documentation, conversations, code), what data models exist, what is the current responsibility split between teams, where does language change (boundary signal), where does authority change (another boundary signal), where is the shared-model pain
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`data-modeler`](../../skills/data-modeler.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** current-state domain map, current responsibility split, language inventory (terms × meaning per context), shared-model pain points
- **Exit signals:** the baseline reflects honest current pain, not abstract domain model
- **Review gate:** `requirement-baseline`

### Stage 3 — Discover Bounded Contexts

- **Entry signals:** baseline is in hand; domain experts are available
- **Key questions:** where does the language change meaningfully (the strongest signal of a boundary), where does authority and decision-making change, what subdomains are *core* (your business advantage), *supporting* (your business needs but isn't differentiating), *generic* (could be bought / outsourced), what is the right granularity per context
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`relationship-mapper`](../../skills/relationship-mapper.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** bounded context candidates with boundary rationale, subdomain classification (core / supporting / generic), context size estimate
- **Exit signals:** context candidates are defensible and reflect language reality, not org-chart preference

### Stage 4 — Map Contexts

- **Entry signals:** context candidates are in place
- **Key questions:** what relationship exists between each pair of contexts (customer-supplier, partnership, conformist, anti-corruption layer, separate ways, open host service, published language, shared kernel), where is the power asymmetry, where are the integration risks
- **Recommended skills:** [`relationship-mapper`](../../skills/relationship-mapper.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`decision-recorder`](../../skills/decision-recorder.md), [`option-evaluator`](../../skills/option-evaluator.md)
- **Expected outputs:** context map with relationship type per pair, rationale per relationship, power dynamics surfaced
- **Exit signals:** the context map is reviewable; integration patterns per pair are decided
- **Review gate:** `solution-direction`

### Stage 5 — Define Ubiquitous Language Per Context

- **Entry signals:** context map is in place
- **Key questions:** per context — what are the canonical terms, what do they mean *in this context*, what are the differences from how those terms are used elsewhere (a `Customer` in Sales is not a `Customer` in Billing), how is the language enforced (code, schemas, conversations, docs)
- **Recommended skills:** [`data-modeler`](../../skills/data-modeler.md), [`solution-modeler`](../../skills/solution-modeler.md), [`evidence-curator`](../../skills/evidence-curator.md)
- **Expected outputs:** ubiquitous language definition per context (terms + meaning + boundary), cross-context glossary (same term, different meaning)
- **Exit signals:** the language is reviewable; domain experts recognize their domain in it

### Stage 6 — Design Integration Between Contexts

- **Entry signals:** language and context map are in place
- **Key questions:** per context-pair — published language schema, anti-corruption layer shape (if power asymmetry), domain event contracts, what crosses the boundary and what doesn't, what is consumer-driven vs producer-driven
- **Recommended skills:** [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`solution-modeler`](../../skills/solution-modeler.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** integration design per context pair (published language, anti-corruption layer, event contracts), contract governance approach
- **Exit signals:** integration design is reviewable; consumers and producers can read the same contract
- **Review gate:** `decision-approval`

### Stage 7 — Plan Migration

- **Entry signals:** integration design is in place
- **Key questions:** how does the current shape transform to the redesigned shape — strangler? branch-by-abstraction? big rewrite (rarely a good idea)? what is the migration order, what is the rollback approach, what is the success measure per wave
- **Recommended skills:** [`transition-planner`](../../skills/transition-planner.md), [`solution-modeler`](../../skills/solution-modeler.md)
- **Expected outputs:** migration approach decisions, wave plan, rollback approach, success measure per wave
- **Exit signals:** the migration plan is reviewable

### Stage 8 — Handoff To Delivery

- **Entry signals:** migration plan is in place
- **Key positions:** what does the delivery program need to start executing, where does this engagement's responsibility end and where does delivery's begin, what tactical-design guidance (aggregates, entities, value objects) is left to delivery vs prescribed here, what is the recurring review cadence
- **Recommended skills:** [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md), [`communication-packager`](../../skills/communication-packager.md)
- **Expected outputs:** handoff packet (context map, language per context, integration design, migration approach) typically inputs to `migration-wave` or `quick-solution-design` per context
- **Exit signals:** delivery has what it needs; the engagement closes cleanly

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md)
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`baseline-discovery`](../../skills/baseline-discovery.md)
4. [`relationship-mapper`](../../skills/relationship-mapper.md) — primary skill for this engagement
5. [`data-modeler`](../../skills/data-modeler.md) — for language and entity work
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`solution-modeler`](../../skills/solution-modeler.md) — primary skill for context modeling
9. [`application-interface-modeler`](../../skills/application-interface-modeler.md)
10. [`transition-planner`](../../skills/transition-planner.md)
11. [`gap-radar`](../../skills/gap-radar.md)
12. [`architecture-review`](../../skills/architecture-review.md)
13. [`architecture-documenter`](../../skills/architecture-documenter.md)
14. [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)

## Review Gates That Apply

- `requirement-baseline` — confirm the redesign scope and domain expert availability
- `solution-direction` — confirm bounded contexts and context map
- `decision-approval` — confirm integration patterns per context pair

`governance-review` and `transition-plan` are typically not in scope — they belong to delivery engagements that follow.

## Patterns Likely To Apply

- **Integration:**
  - [anti-corruption-layer](../../patterns/integration/anti-corruption-layer.md)
  - [event-driven-integration](../../patterns/integration/event-driven-integration.md)
  - [request-response-integration](../../patterns/integration/request-response-integration.md)
  - [outbox-pattern](../../patterns/integration/outbox-pattern.md)
- **Application / API:**
  - [api-facade](../../patterns/application/api-facade.md)
  - [backend-for-frontend](../../patterns/application/backend-for-frontend.md)
- **Data:**
  - [canonical-data-ownership](../../patterns/data/canonical-data-ownership.md)
  - [data-domain-ownership](../../patterns/data/data-domain-ownership.md)
  - [master-data-stewardship](../../patterns/data/master-data-stewardship.md)
  - [event-carried-state-transfer](../../patterns/data/event-carried-state-transfer.md)
  - [event-schema-evolution](../../patterns/data/event-schema-evolution.md)
  - [data-contract-governance](../../patterns/data/data-contract-governance.md)
- **Transition:**
  - [strangler-modernization](../../patterns/transition/strangler-modernization.md)
  - [branch-by-abstraction](../../patterns/transition/branch-by-abstraction.md)
  - [incremental-contract-migration](../../patterns/transition/incremental-contract-migration.md)

The [DDD vocabulary bridge](../../guidance/vocabulary-bridges/ddd.md) explains how DDD concepts map to Open Architect templates.

## Common Anti-Patterns

- **Bounded contexts modeled around teams, not language** — Conway's law sneaking in; the redesign reproduces the org chart.
- **Microservices declared before bounded contexts found** — the count is the goal, the clarity isn't.
- **Shared kernel everywhere** — defeats the purpose; just keeps the shared-model pain in a different folder.
- **Domain experts not in the room** — architects model what they think the domain is; experts later say "no, that's not how it works."
- **Ubiquitous language as glossary** — documented, never enforced; code and schemas don't match the language.
- **Big-bang redesign** — rewrite-from-scratch usually fails; strangler / branch-by-abstraction is safer.
- **Refactor without behavior change** — internal rearrangement labeled as DDD; nothing about the integration actually improves.
- **Premature DDD** — applied to teams without DDD experience; overhead with no payoff.
- **Anti-corruption layer becomes the new shared model** — what was meant to insulate becomes the new coupling.
- **Conformist relationship when partnership is needed** — accepting the upstream's model when both teams should align on contracts.
- **No way to verify the language is used** — design-time discipline, runtime free-for-all.
- **Tactical patterns prescribed centrally** — aggregates and entities specified by architecture; delivery teams resent it; you get the cargo cult.
- **Open host service exposing internal model** — what was meant to abstract leaks domain detail to consumers.
- **DDD as silver bullet** — the redesign doesn't fix the underlying problem (team conflict, capacity, leadership).

## Entry Criteria

- a sponsor exists for the redesign outcome
- the scope is at least roughly bounded (which subdomain, which applications)
- domain experts are available and committed to participate (this is a deal-breaker without them)
- the team has DDD literacy or is willing to learn it
- there is appetite for a redesign, not just a refactor

## Exit Criteria

- bounded contexts are defined and defensible
- context map is in place with relationship rationale per pair
- ubiquitous language is documented per context, with cross-context glossary
- integration design between contexts is recorded
- migration approach is decided
- handoff to delivery engagement is packaged

## Cycling Stance

This playbook is **one-shot per redesign**. Each domain or subdomain redesign is its own engagement.

If multiple subdomains need DDD work, run them as separate engagements — overlapping them risks language collisions and integration confusion.

After the engagement, ongoing context refinement happens during delivery; if the language drifts significantly, run a focused redesign engagement again.

## What This Playbook Does Not Do

- It does not execute the migration — that is `migration-wave` or `quick-solution-design` per context
- It does not deliver tactical DDD patterns (aggregates, entities, value objects, repositories) — those are delivery's concern; this engagement establishes the strategic frame
- It does not own the team's DDD literacy — partner with engineering coaches if the team needs upskilling
- It does not handle data platform work — use `data-platform-modernization` (which can use DDD vocabulary via the [DDD bridge](../../guidance/vocabulary-bridges/ddd.md))
- It does not specify microservices — bounded contexts are *not* the same as microservices; the decomposition into services is a delivery choice

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if prior DDD or domain work exists.
2. Write a one-paragraph redesign charter into `notes.md` — why DDD, what is the scope, what is the symptom (shared model, team conflict, microservices readiness).
3. Read the [DDD vocabulary bridge](../../guidance/vocabulary-bridges/ddd.md) for how DDD concepts map to Open Architect templates.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: who is the sponsor, who are the available domain experts, what is the team's DDD maturity, where is the shared-model pain, what subdomains are core vs supporting vs generic, what is the target deliverable shape.
6. List the top 5 places where language is ambiguous or contested today. These are your candidate context boundaries.
7. Resist drawing context boundaries before domain experts have spoken.
8. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Architecture scope** — usually `solution` (single subdomain) or `enterprise-and-solution` (cross-cutting redesign).
- **Compliance scope** — light unless the domain has regulatory framing.
- **Roles** — keep `chief-architect`, `business-analyst` (domain analysis), `solution-architect`, `data-architect`; add `integration-architect` for inter-context design.
- **Templates** — keep `solution`, `application-service`, `interface`, `data-object`, `decision`; map DDD concepts to these per the bridge.
- **Default mode** — `analysis` is correct; switch to `modeling` only when contexts and language are stable.
- **Coordinator** — `coordinator_auto_route: false`; DDD decisions require explicit human routing because they're strategic.
- **Tactical-design prescriptiveness** — declare early. Strategic DDD only (boundaries, contexts, language) vs strategic + tactical (aggregates, entities, value objects also). Strategic-only is the safer default; let delivery own tactical.
- **Domain expert engagement model** — embedded (heaviest, best quality) vs scheduled (lighter, faster but noisier) vs interviewed (lightest, lossy). Pick based on availability.

## Decision Points

- **Context granularity** — fewer, larger contexts (simpler, more shared model) vs more, smaller contexts (cleaner boundaries, more integration). Most engagements land in the middle.
- **Strategic-only vs strategic + tactical** — strategic-only keeps the engagement focused; tactical inclusion produces more prescriptive guidance but risks central-architecture friction with delivery teams.
- **Domain expert engagement model** — embedded, scheduled, interviewed.
- **Anti-corruption layer placement** — per-pair (more code, more isolation) vs per-context-cluster (less code, less isolation).
- **Subdomain classification approach** — core / supporting / generic, or a more nuanced model (Wardley-influenced, sequential maturity, custom).
- **Migration approach** — strangler (most common, safest), branch-by-abstraction (lower risk for in-app refactors), big rewrite (rarely advisable).
- **Event-driven vs request-response between contexts** — events for autonomy and asynchrony; request-response for clarity and synchrony. Often a mix.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the sponsor with redesign authority?
- Who are the available domain experts? What is their participation commitment?
- What is the team's DDD literacy?
- Where is the shared-model pain most acute today?
- Which subdomains are core, supporting, generic?
- What is the prescriptiveness scope (strategic only vs strategic + tactical)?
- What is the domain expert engagement model (embedded, scheduled, interviewed)?
- What is the target deliverable shape (handoff to migration-wave, executable per-context designs, etc.)?
- What is the migration approach appetite (strangler, branch-by-abstraction, big rewrite)?
- What is the event-driven vs request-response posture between contexts?
- What is the residual-debt acceptance (which legacy shape stays for which contexts)?

## Recommended Diagrams

- Current-state domain map (current language and responsibility split, often messy)
- Bounded context candidate map (proposed contexts, subdomain classification per context)
- Context map (contexts × pair relationships: customer-supplier, partnership, conformist, anti-corruption layer, separate ways, open host service, published language)
- Ubiquitous language glossary (per context × terms × meaning × differences from other contexts)
- Integration design per pair (published language schema, anti-corruption layer shape, event contracts)
- Migration shape per context (current → target, with approach and waves)
- Power dynamics map (which contexts dictate to which, and why)

## Getting Started

1. Read this playbook.
2. Read the [DDD vocabulary bridge](../../guidance/vocabulary-bridges/ddd.md) to understand how DDD maps to Open Architect concepts.
3. Copy `project-config.yaml` from this folder to your project location.
4. Adjust `project.name`. Declare the prescriptiveness scope (strategic-only vs strategic + tactical) in `notes.md`.
5. Confirm domain expert availability *before* designing anything.
6. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with particular attention to *Inconsistencies* (language drift across contexts) and *Cross-Artifact Consistency Checks* (entity names that mean different things in different places).

## Notes For Reviewers

When reviewing domain-driven redesign output:

- check that context boundaries follow language changes, not team boundaries
- check that the ubiquitous language is actually different per context (otherwise the boundary isn't real)
- check that domain experts were in the room and recognize the model
- check that context relationships are explicit (customer-supplier, partnership, conformist, etc.), not just lines on a diagram
- check that the anti-corruption layer's purpose is insulation, not new shared model
- check that the engagement didn't drift into prescribing tactical patterns (aggregates) that delivery teams should own
- check that the migration approach is safer than big-bang rewrite
- check that "microservices count" did not become the goal
- check that core / supporting / generic classification has business rationale
- check that integration patterns reflect the power dynamics honestly
