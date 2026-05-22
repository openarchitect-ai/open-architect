# Quick Solution Design Playbook

## Engagement Shape

- **Stance:** one-shot
- **Default mode:** `modeling` (after a short inventory + analysis pass)
- **Typical duration:** weeks to a small number of months
- **Output emphasis:** one bounded, deliverable solution

## When To Use

Use this playbook when:

- one team or initiative needs a bounded solution design
- requirements are partially known and bounded enough to model
- the engagement is not enterprise-wide and does not need a cycle
- delivery is expected in weeks to a few months
- regulated context exists but is not the dominant force

## When Not To Use

Do **not** use this playbook when:

- the engagement is multi-program or enterprise-wide (use `full-togaf-adm`)
- the work is mostly transition / decommissioning / wave planning (use `migration-wave`)
- you do not yet know what the engagement actually is (use `inventory-only` first)
- the work is primarily standing up an AI platform (use `ai-platform-bootstrap`)

## What Good Looks Like

- a clear solution boundary with named participating applications, services, interfaces, data, and environments
- normalized requirements traced to the solution
- key decisions recorded with rationale and options
- explicit non-functional posture (security, observability, failure modes)
- a clean handover packet for delivery

## Stages

### Stage 1 — Frame

- **Entry signals:** sponsor exists, problem statement is roughly known, delivery team is identifiable
- **Key questions:** what is in scope, what is out of scope, who decides, what does "done" mean
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
- **Expected outputs:** named stakeholders and objectives, agreed problem statement, scope boundary
- **Exit signals:** scope is bounded enough to start modeling; sponsor accepts the framing

### Stage 2 — Baseline

- **Entry signals:** scope is bounded
- **Key questions:** what applications, interfaces, and data are relevant today, what is the operational reality, what constraints already exist
- **Recommended skills:** [`baseline-discovery`](../../skills/baseline-discovery.md)
- **Expected outputs:** baseline relevant to the solution boundary, explicit unknowns
- **Exit signals:** the baseline is good enough to start designing against; sparseness is acknowledged

### Stage 3 — Normalize Requirements

- **Entry signals:** baseline is in hand
- **Key questions:** what does the solution need to do, what does it need *not* to do, what are the non-functional expectations, what is measurable
- **Recommended skills:** [`requirement-normalizer`](../../skills/requirement-normalizer.md)
- **Expected outputs:** normalized requirement set with type, lifecycle, and traceability
- **Exit signals:** requirements are usable to drive design; ambiguities are explicit
- **Review gate:** `requirement-baseline`

### Stage 4 — Design

- **Entry signals:** requirement-baseline gate passed
- **Key questions:** what is the solution shape, which participating components and interfaces are involved, which patterns apply, what are the non-functional commitments
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`option-evaluator`](../../skills/option-evaluator.md) (when more than one direction exists), [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`data-modeler`](../../skills/data-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** solution artifact, participating components, interface contracts at the right level, decision drafts
- **Exit signals:** solution shape is coherent and defensible; major decisions are drafted
- **Review gate:** `solution-direction`

### Stage 5 — Decide

- **Entry signals:** solution shape is reviewable
- **Key questions:** what choices were made, what alternatives were considered, why, what are the consequences
- **Recommended skills:** [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** decisions with rationale, options, and consequences
- **Exit signals:** decisions are reviewable on their own
- **Review gate:** `decision-approval`

### Stage 6 — Review And Handover

- **Entry signals:** design and decisions are in place
- **Key questions:** what is missing, what would surprise a reviewer, what is the handover packet, what residual risks remain
- **Recommended skills:** [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`architecture-documenter`](../../skills/architecture-documenter.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** review packet, handover document, residual-risk register
- **Exit signals:** the delivery team accepts the design; residual risks are owned

## Recommended Skill Sequence

1. [`project-recap`](../../skills/project-recap.md) — only if the project already exists
2. [`baseline-discovery`](../../skills/baseline-discovery.md)
3. [`requirement-normalizer`](../../skills/requirement-normalizer.md)
4. [`solution-modeler`](../../skills/solution-modeler.md)
5. [`option-evaluator`](../../skills/option-evaluator.md) — when more than one viable direction exists
6. [`decision-recorder`](../../skills/decision-recorder.md)
7. [`gap-radar`](../../skills/gap-radar.md) — sweep before review gates
8. [`architecture-review`](../../skills/architecture-review.md)
9. [`architecture-documenter`](../../skills/architecture-documenter.md)

## Review Gates That Apply

- `requirement-baseline`
- `solution-direction`
- `decision-approval`

Skip broader enterprise gates (`governance-review`, `transition-plan`) unless the engagement explicitly needs them.

## Patterns Likely To Apply

Pull from the pattern library when shaping the solution:

- [api-facade](../../patterns/application/api-facade.md)
- [backend-for-frontend](../../patterns/application/backend-for-frontend.md)
- [request-response-integration](../../patterns/integration/request-response-integration.md)
- [event-driven-integration](../../patterns/integration/event-driven-integration.md)
- [anti-corruption-layer](../../patterns/integration/anti-corruption-layer.md)
- [outbox-pattern](../../patterns/integration/outbox-pattern.md)
- [observability-by-design](../../patterns/technology/observability-by-design.md)
- [service-to-service-identity](../../patterns/security/service-to-service-identity.md)
- [identity-federation](../../patterns/security/identity-federation.md)
- [canonical-data-ownership](../../patterns/data/canonical-data-ownership.md)
- [secrets-and-configuration-management](../../patterns/technology/secrets-and-configuration-management.md)

**If the solution uses AI** (calls a language model, runs retrieval-augmented
generation, includes any agentic loop, or generates content for users),
also consider:

- [retrieval-augmented-generation](../../patterns/ai/retrieval-augmented-generation.md)
- [prompt-lifecycle-management](../../patterns/ai/prompt-lifecycle-management.md)
- [continuous-model-evaluation](../../patterns/ai/continuous-model-evaluation.md)
- [model-version-promotion-gate](../../patterns/ai/model-version-promotion-gate.md)
- [ai-guardrail-stack](../../patterns/ai/ai-guardrail-stack.md)
- [agentic-system-bounded-loop](../../patterns/ai/agentic-system-bounded-loop.md)
- [embedding-lifecycle-management](../../patterns/ai/embedding-lifecycle-management.md)
- [model-vendor-portability](../../patterns/ai/model-vendor-portability.md)

If AI is the *dominant* concern (not a feature inside a bounded solution),
switch to the [`ai-platform-bootstrap`](../ai-platform-bootstrap/playbook.md)
playbook instead. Also run [`gap-radar`](../../skills/gap-radar.md) with
the **AI platform radar** variation before review gates.

## Common Anti-Patterns

- **Skipping stage 1** — modeling without an agreed scope leads to design drift and rework.
- **Pretending requirements are firm** — bake provisional requirements into the solution and rebuild later.
- **One-option decisions** — recording a decision without alternatives considered. Strip the rationale of value.
- **Hidden non-functional commitments** — leaving observability, identity, failure mode posture implicit. They become someone else's problem at the worst time.
- **Phantom approvals** — marking decisions `accepted` before the `decision-approval` gate.
- **Pattern-by-fashion** — picking event-driven (or any pattern) because it's the current fashion rather than because the requirements drive it.
- **Skipping `gap-radar` before review** — review gates catch fewer real things when the architect has not done a sweep first.

## Entry Criteria

- the solution boundary is at least roughly known
- a stakeholder owns the outcome
- a delivery team or sponsor exists to receive the design
- the engagement scope is not actually enterprise-wide in disguise

## Exit Criteria

- one solution artifact is complete with traceable requirements, decisions, and participating components
- ownership entries are honest (no invented owners)
- a handover packet has been produced or is ready to produce
- residual risks and unresolved questions are explicit

## Cycling Stance

This playbook is **one-shot**. If the same solution needs ongoing change
work after delivery, run the
[`requirements-follow-up`](../../skills/requirements-follow-up.md) skill
repeatedly rather than re-running the playbook from the top.

## What This Playbook Does Not Do

- It does not produce enterprise capability or principle artifacts
- It does not own roadmap or multi-wave transition planning
- It does not run cyclic architecture management
- It does not act as a substitute for governance over multiple solutions

## First Working Session

In the first session:

1. Run [`project-recap`](../../skills/project-recap.md) if any prior work exists.
2. Write a one-paragraph problem statement and one-paragraph scope statement into `notes.md`. Get sponsor reaction before any modeling.
3. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
4. List the 5 most material stakeholders and the 1–3 highest-leverage objectives.
5. Identify the 3–5 most relevant source documents and queue them for `baseline-discovery`.
6. Decide what the *minimum useful* solution slice looks like (resist the urge to scope big).
7. Close the session with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Roles** — keep `solution-architect` and `business-analyst`; drop `data-architect` if data is trivial; drop `security-architect` only if security is genuinely out of scope (rare).
- **Templates** — add `principle` and `technology-standard` only if the project actually intersects with enterprise standards.
- **Compliance scope** — fill `jurisdictions`, `applicable_regulations`, and `control_frameworks` if any apply. Set `incident_reporting_requirements: true` for regulated contexts.
- **Default mode** — leave as `modeling`, but start the engagement in `inventory` and explicitly switch.
- **Coordinator** — leave `coordinator_auto_route: false` unless the engagement is long enough to justify auto-routing.
- **Review gates** — drop `decision-approval` only for trivial designs where no material decision exists (rare).
- **Patterns** — pre-select 3–5 likely patterns; do not bring the whole library into scope.
- **Deliverable shape** — written design doc, HLD pack, ADR set, or all three? Decide before stage 4.
- **AI use within the solution** — if the bounded solution includes any AI behavior (LLM calls, RAG, agentic loops, generation), enable the AI-specific patterns above, set `ai_regulated_use: true` if applicable, add `eu-ai-act` to `applicable_regulations` if EU users are in scope, and run `gap-radar` with the AI platform variation before gates.

## Decision Points

- **Single-option vs option-evaluator** — when the solution shape is genuinely contested, run `option-evaluator` before `decision-recorder`. When there is one viable direction, document why alternatives were not viable.
- **NFR depth** — heavyweight NFR analysis vs lightweight posture statement. Choose explicitly based on regulatory and operational stakes.
- **Diagram-first vs artifact-first** — if stakeholders think visually, run `diagram-author` early; if they think structurally, run it last.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- Who is the named sponsor for this solution and what is their decision authority?
- What is the bounded scope — which team, which system, which user-facing problem?
- What is the go-live commitment (date, milestone, or pegged to another delivery)?
- What does measurable success look like — what changes that we can observe?
- What existing solutions, patterns, or standards must this fit alongside?
- What are the material NFRs (performance, availability, security, observability, compliance, accessibility)?
- What is the data classification of any data flowing through the solution?
- What is the regulatory / compliance scope (any applicable regulations, sector profile)?
- What is the operational stance — who runs it, who is on-call, who triages alerts?
- What is the rollback approach if the solution proves wrong in production?
- What scope is explicitly out for this iteration (will become anti-scope statements)?
- What is the human-review / governance expectation for decisions made during design?
- Does the solution touch AI behavior (LLM calls, embeddings, agentic loops)? If yes, [`patterns/ai/`](../../patterns/ai/) becomes relevant.

## Recommended Diagrams

- **Context view** — system in scope + primary actors + external systems it integrates with. See [`context-view.md`](../../guidance/diagram-starter-views/context-view.md).
- **Container view** — the internal structure of the bounded solution (applications, services, technology components). See [`container-view.md`](../../guidance/diagram-starter-views/container-view.md).
- **Sequence view** — the primary runtime interaction (happy path; one or two key error paths). See [`sequence-view.puml`](../../guidance/diagram-starter-views/sequence-view.puml).
- **Data model** (if data is material) — entities and relationships. See [`data-erd.md`](../../guidance/diagram-starter-views/data-erd.md).
- **Decision-options comparison view** — when `option-evaluator` runs, a comparison table or diagram capturing the alternatives considered.

Keep the view set small. A quick-solution-design engagement typically needs 2-3 diagrams, not 6.

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Adjust `project.name` and the compliance section.
4. Start in `inventory` mode briefly, then move to `analysis`, then `modeling`. Stay disciplined about that order.
5. Run [`gap-radar`](../../skills/gap-radar.md) before each review gate.

## Notes For Reviewers

When reviewing solution-design output:

- check that requirements are normalized, not just listed
- check that decisions have options considered and rationale
- check that non-functional posture is explicit (security, observability, failure modes)
- check that participating components are explicit and traced
- check that no review-gate status was marked passed without evidence
- accept honest unknowns over plausible inventions
