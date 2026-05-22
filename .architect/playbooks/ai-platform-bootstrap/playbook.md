# AI Platform Bootstrap Playbook

## Engagement Shape

- **Stance:** quasi-cyclic — bootstrap is one-shot, but model lifecycle and eval are continuous
- **Default mode:** `analysis` (with disciplined moves to `modeling` per slice)
- **Typical duration:** weeks to a small number of months for bootstrap; ongoing thereafter
- **Output emphasis:** AI platform architecture grounded in model risk, eval, guardrails, and FinOps signals

## When To Use

Use this playbook when:

- the organization is standing up or rationalizing an AI platform (LLM-based, classical ML, multi-modal, or agentic)
- AI is becoming a first-class architectural concern, not a one-off use case
- RAG, fine-tune, prompt eval, and inference cost are material engineering concerns
- AI Act, sector AI rules, or model risk obligations apply
- multiple business use cases will share AI capabilities (retrieval, eval, model registry, guardrails)
- a Wave 1 use case needs to ship without locking the platform into the wrong shape

## When Not To Use

Do **not** use this playbook when:

- the engagement is one bounded business solution that *happens* to call an AI API (use `quick-solution-design`)
- the engagement is decommissioning a legacy ML platform (use `migration-wave`)
- the engagement is enterprise-wide architecture direction broader than AI (use `full-togaf-adm`)
- no real use case is in scope — without a use case the platform has no acceptance criteria

## What Good Looks Like

- a clear, opinionated AI platform shape with named layers (data, model, retrieval, inference, eval, guardrails, observability, governance)
- model risk and AI Act / sector AI obligations explicit per use case and per model
- evaluation pipeline that runs against gold sets, not just at deployment
- guardrails (PII, harmful content, prompt injection, jailbreak, hallucination handling) explicit and testable
- a Wave 1 use case deliverable end-to-end through the platform
- FinOps and inference cost as named non-functional requirements
- vendor exit and portability addressed before lock-in is real

## Stages

### Stage 1 — Use-Case Framing

- **Entry signals:** sponsor exists; at least one concrete use case is named
- **Key questions:** what is the use case, who is the user, what is the value, what is the failure cost, is this a regulated use under AI Act / sector AI rules, what does "good output" look like
- **Recommended skills:** [`project-recap`](../../skills/project-recap.md), [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md), [`requirement-normalizer`](../../skills/requirement-normalizer.md)
- **Expected outputs:** stakeholders, objectives, use-case description, AI Act classification, "good output" definition, failure-cost stance
- **Exit signals:** the use case is bounded enough to drive platform shape choices

### Stage 2 — Model Risk And Compliance Scoping

- **Entry signals:** use case is framed
- **Key questions:** what is the AI Act risk classification, what sector AI rules apply, what model-risk-management obligations exist, what evidence will be needed, what controls are required by classification
- **Recommended skills:** [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md)
- **Expected outputs:** AI Act classification per use case, applicable obligations, controls posture, residual model risk
- **Exit signals:** the compliance and model-risk posture is the constraint set for the platform — not an afterthought
- **Review gate:** `governance-review` (per use case)

### Stage 3 — Data Foundations

- **Entry signals:** compliance and risk posture is known
- **Key questions:** what data feeds the model (training, RAG, fine-tune, prompt context), where does it live, what is its classification and residency, who consents and how, what are the input-data quality signals, how is data lineage captured
- **Recommended skills:** [`data-modeler`](../../skills/data-modeler.md), [`baseline-discovery`](../../skills/baseline-discovery.md)
- **Expected outputs:** data flows for the AI platform, classification per data object, residency stance, lineage approach, consent model
- **Exit signals:** the platform knows what data it can and cannot use, and why

### Stage 4 — Model Strategy

- **Entry signals:** data foundations are clear
- **Key questions:** foundation model vs fine-tune vs build, hosted vs self-hosted, single model vs model router, eval approach, version lifecycle for models and prompts, vendor portability stance
- **Patterns to apply:** [continuous-model-evaluation](../../patterns/ai/continuous-model-evaluation.md), [model-version-promotion-gate](../../patterns/ai/model-version-promotion-gate.md), [prompt-lifecycle-management](../../patterns/ai/prompt-lifecycle-management.md), [model-vendor-portability](../../patterns/ai/model-vendor-portability.md)
- **Recommended skills:** [`option-evaluator`](../../skills/option-evaluator.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** model strategy decision, eval pipeline shape, model and prompt version lifecycle, vendor portability stance
- **Exit signals:** the model and prompt strategy are decided and defensible
- **Review gate:** `decision-approval`

### Stage 5 — Platform Architecture

- **Entry signals:** model strategy is decided
- **Key questions:** what are the layers (data, retrieval, inference, eval, guardrails, observability, governance), how do they integrate, what are the platform-level interfaces, inference cost model, latency budget, multi-tenancy isolation, embedding lifecycle
- **Patterns to apply:** [retrieval-augmented-generation](../../patterns/ai/retrieval-augmented-generation.md), [embedding-lifecycle-management](../../patterns/ai/embedding-lifecycle-management.md), [observability-by-design](../../patterns/technology/observability-by-design.md), [platform-tenancy-isolation](../../patterns/technology/platform-tenancy-isolation.md)
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`application-interface-modeler`](../../skills/application-interface-modeler.md), [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
- **Expected outputs:** platform architecture with layer-by-layer shape, interface contracts, inference cost model, latency budget, observability stance, multi-tenancy isolation, embedding lifecycle approach
- **Exit signals:** the platform shape is reviewable
- **Review gate:** `solution-direction`

### Stage 6 — Eval, Guardrails, And Operations

- **Entry signals:** platform shape is reviewable
- **Key questions:** what does the eval pipeline test (offline, online, drift), what guardrails apply, what is red-teaming cadence (distinct from eval), what is the user disclosure stance (AI Act Article 50), what is the incident response model, what is the human-in-the-loop pattern, what are the bounds on any agentic loops, what is the rollback approach for bad model or prompt versions
- **Patterns to apply:** [continuous-model-evaluation](../../patterns/ai/continuous-model-evaluation.md), [ai-guardrail-stack](../../patterns/ai/ai-guardrail-stack.md), [agentic-system-bounded-loop](../../patterns/ai/agentic-system-bounded-loop.md), [model-version-promotion-gate](../../patterns/ai/model-version-promotion-gate.md), [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`decision-recorder`](../../skills/decision-recorder.md)
- **Expected outputs:** eval pipeline design, guardrail set with testability, red-teaming plan, user-disclosure design, incident-response runbook, human-in-the-loop pattern, model and prompt rollback approach, agentic termination conditions
- **Exit signals:** the platform can run safely; operations team has what it needs

### Stage 7 — Wave 1 Use Case Slice

- **Entry signals:** platform shape and operations are reviewable
- **Key questions:** what is the smallest end-to-end use case that proves the platform, what is its eval gold set, what is its FinOps profile, what is its rollback approach
- **Recommended skills:** [`solution-modeler`](../../skills/solution-modeler.md), [`transition-planner`](../../skills/transition-planner.md), [`gap-radar`](../../skills/gap-radar.md), [`architecture-review`](../../skills/architecture-review.md), [`delivery-handover-packager`](../../skills/delivery-handover-packager.md)
- **Expected outputs:** Wave 1 use case end-to-end, eval gold set, FinOps profile, rollback approach, delivery handover packet
- **Exit signals:** Wave 1 is delivered and the platform has proven its shape
- **Review gate:** `transition-plan`

### Stage 8 — Lifecycle Operation (Ongoing)

- **Entry signals:** Wave 1 is live
- **Key questions:** how is model drift detected, how is the eval gold set maintained, how are new use cases onboarded, how are model versions promoted and rolled back, how is FinOps actually tracked, how often is the AI-Act / model-risk posture re-confirmed
- **Recommended skills:** [`requirements-follow-up`](../../skills/requirements-follow-up.md), [`change-coordinator`](../../skills/change-coordinator.md), [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md), [`gap-radar`](../../skills/gap-radar.md) (modernity variation), [`project-recap`](../../skills/project-recap.md)
- **Expected outputs:** ongoing lifecycle artifacts (drift dashboards, eval cadence, FinOps reports, posture re-confirmations, onboarding runbook)
- **Exit signals:** the platform is operating as a continuous capability, not a one-time delivery

## Recommended Skill Sequence (Bootstrap)

1. [`project-recap`](../../skills/project-recap.md) — if any prior AI work exists
2. [`stakeholder-objective-framer`](../../skills/stakeholder-objective-framer.md)
3. [`requirement-normalizer`](../../skills/requirement-normalizer.md)
4. [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) — AI Act and model risk early
5. [`data-modeler`](../../skills/data-modeler.md)
6. [`option-evaluator`](../../skills/option-evaluator.md)
7. [`decision-recorder`](../../skills/decision-recorder.md)
8. [`solution-modeler`](../../skills/solution-modeler.md)
9. [`application-interface-modeler`](../../skills/application-interface-modeler.md)
10. [`technology-environment-modeler`](../../skills/technology-environment-modeler.md)
11. [`transition-planner`](../../skills/transition-planner.md) — for Wave 1
12. [`gap-radar`](../../skills/gap-radar.md) — sweep before each gate, with modernity emphasis
13. [`architecture-review`](../../skills/architecture-review.md)

## Review Gates That Apply

- `requirement-baseline` — confirm use case and obligations are usable
- `solution-direction` — confirm platform shape
- `decision-approval` — confirm model strategy, vendor stance, eval approach
- `governance-review` — confirm AI Act / model risk / sector AI posture (per use case)
- `transition-plan` — confirm Wave 1 use case shape

## Patterns Likely To Apply

- **AI architecture and lifecycle (`patterns/ai/`):**
  - [retrieval-augmented-generation](../../patterns/ai/retrieval-augmented-generation.md)
  - [prompt-lifecycle-management](../../patterns/ai/prompt-lifecycle-management.md)
  - [continuous-model-evaluation](../../patterns/ai/continuous-model-evaluation.md)
  - [model-version-promotion-gate](../../patterns/ai/model-version-promotion-gate.md)
  - [ai-guardrail-stack](../../patterns/ai/ai-guardrail-stack.md)
  - [agentic-system-bounded-loop](../../patterns/ai/agentic-system-bounded-loop.md)
  - [embedding-lifecycle-management](../../patterns/ai/embedding-lifecycle-management.md)
  - [model-vendor-portability](../../patterns/ai/model-vendor-portability.md)
- **Data:**
  - [data-classification-and-handling](../../patterns/data/data-classification-and-handling.md)
  - [canonical-data-ownership](../../patterns/data/canonical-data-ownership.md)
  - [data-residency-and-cross-border-transfer (compliance control)](../../compliance/controls/data-residency-and-cross-border-transfer.md)
  - [data-replication-and-cache-invalidation](../../patterns/data/data-replication-and-cache-invalidation.md)
  - [archival-and-retention](../../patterns/data/archival-and-retention.md)
- **Integration:**
  - [api-facade](../../patterns/application/api-facade.md)
  - [anti-corruption-layer](../../patterns/integration/anti-corruption-layer.md)
  - [request-response-integration](../../patterns/integration/request-response-integration.md)
  - [event-driven-integration](../../patterns/integration/event-driven-integration.md)
- **Security:**
  - [zero-trust-network-segmentation](../../patterns/security/zero-trust-network-segmentation.md)
  - [service-to-service-identity](../../patterns/security/service-to-service-identity.md)
  - [identity-federation](../../patterns/security/identity-federation.md)
  - [audit-and-tamper-evident-logging](../../patterns/security/audit-and-tamper-evident-logging.md)
  - [privileged-access-segregation](../../patterns/security/privileged-access-segregation.md)
- **Technology / runtime:**
  - [observability-by-design](../../patterns/technology/observability-by-design.md)
  - [secrets-and-configuration-management](../../patterns/technology/secrets-and-configuration-management.md)
  - [secrets-rotation](../../patterns/technology/secrets-rotation.md)
  - [graceful-degradation](../../patterns/technology/graceful-degradation.md)
  - [environment-promotion](../../patterns/technology/environment-promotion.md)
- **Transition (for Wave 1 and version promotion):**
  - [feature-toggle-rollout](../../patterns/transition/feature-toggle-rollout.md)
  - [pilot-then-scale](../../patterns/transition/pilot-then-scale.md)
  - [rollback-and-recovery](../../patterns/transition/rollback-and-recovery.md)
- **Governance:**
  - [ai-governance-and-model-risk (compliance control)](../../compliance/controls/ai-governance-and-model-risk.md)
  - [model-validation-and-ai-assurance (compliance control)](../../compliance/controls/model-validation-and-ai-assurance.md)
  - [waiver-expiry-and-remediation](../../patterns/governance/waiver-expiry-and-remediation.md)

## Common Anti-Patterns

Engagement-shape anti-patterns specific to this playbook. For
pattern-specific failure modes (prompt versioning, eval, guardrails,
agentic loops, embeddings, vendor portability), see the corresponding
patterns under [`../../patterns/ai/`](../../patterns/ai/README.md).

- **Platform before use case** — building a platform with no concrete use case produces an over-architected, unused capability.
- **AI Act classification deferred** — classification determines obligations and shapes platform constraints. Defer it and rework the architecture.
- **PII through prompts** — every prompt that includes user input is a potential data flow. Apply classification and residency from day one.
- **Hallucination as a "user education" problem** — hallucination is an architectural and operational concern, not a UX message.
- **No inference cost model** — token spend can scale faster than user growth. FinOps must be a Day 1 non-functional requirement, not Day 90.
- **Human-in-the-loop missing where stakes are real** — for high-stakes outputs, the architecture must allow human review and capture the feedback loop.
- **Agentic-everything** — turning every workflow into an agentic loop without bounded scope, eval, or fallback. Agentic systems need stricter eval, not looser.

## Entry Criteria

- sponsor exists and is funding the platform
- at least one concrete use case is in scope
- AI Act / sector AI scope can be confirmed (even if classification is provisional)
- data sources for the platform are at least roughly known
- a sense of constraint (latency, cost, accuracy, regulatory) is known

## Exit Criteria (Bootstrap)

- the platform shape is decided, decided, and decided again with rationale
- model risk and AI Act posture are explicit
- eval pipeline runs against gold sets, with cadence
- guardrails are in place, tested, and operable
- Wave 1 use case has shipped end-to-end through the platform
- FinOps and inference cost signals are live
- vendor exit / portability is documented and rehearsed (or at least scoped)

## Cycling Stance

This playbook is **quasi-cyclic.** The bootstrap stage is one-shot — once
the platform exists, Stages 1–7 do not repeat in the same form. But the
platform itself is a continuous capability:

- **per use case:** Stages 1–2 (use-case framing + compliance scoping) cycle for every new use case onboarded.
- **per model version:** eval and guardrail stages cycle.
- **per quarter (recommended):** [`project-recap`](../../skills/project-recap.md) + [`gap-radar`](../../skills/gap-radar.md) modernity sweep to re-confirm posture against current standards.

## What This Playbook Does Not Do

- It does not design the AI feature for a single product (use `quick-solution-design`)
- It does not migrate a legacy ML estate (use `migration-wave`)
- It does not own ongoing data-platform engineering (out of scope; partner with the data platform team)
- It does not specify the model — it specifies the *platform* around the model

## First Working Session

In the first session:

1. Confirm the **first use case**. Be specific. "Help support agents draft replies" is OK; "do AI" is not.
2. Write a one-paragraph use-case description into `notes.md`. Include: user, value, "good output" definition, failure cost.
3. Take an *initial* AI Act classification stance (provisional is fine). If high-risk, the platform constraints change materially.
4. Create `architect-work/open-questions.md`, `evidence-requests.md`, `architect-task-list.md`.
5. Pre-load `open-questions.md` with: what data feeds this, what is its classification and residency, what model or vendor is currently in play, what eval gold set exists, what does failure look like, what does success look like, what is the inference cost budget, what is the latency budget, what is the vendor exit stance.
6. Resist any modeling. Stay in `analysis` until at least the data and model strategy are clearer.
7. Close with architect tasks grouped Ask / Confirm / Request / Decide.

## Customization Guide

Tune the playbook per engagement:

- **Set `ai_regulated_use: true`** if the use case falls under AI Act high-risk or any sector AI regime. This shifts gate behavior across the workspace.
- **Compliance scope** — `eu-ai-act` is the most common; add sector AI rules (financial services, healthcare, hiring, etc.) per use case.
- **Roles** — keep `data-architect`, `security-architect`, `integration-architect`, and `architecture-governance-lead`; add `domain-architect` for DDD-aligned platforms.
- **Templates** — keep `decision`, `compliance-assessment`, `risk` enabled; they carry most of the AI-specific obligations.
- **Default mode** — `analysis` is safer than `modeling` for AI work. Switch only per slice.
- **Coordinator** — `coordinator_auto_route: false` for any high-risk use case.
- **Eval cadence** — define before launch. Per-deploy + drift-triggered is the safer default.
- **FinOps signals** — set the inference cost budget per use case. Treat overrun as a `BLOCKER`, not an `INFO`.

## Decision Points

Engagement-level decisions to make explicit. Several of these are deepened
in the corresponding patterns under [`../../patterns/ai/`](../../patterns/ai/README.md).

- **Foundation model vs fine-tune vs build** — most platforms land on foundation + retrieval; some need fine-tune; almost none need build-from-scratch.
- **Hosted vs self-hosted inference** — depends on residency, cost, latency, vendor strategy. Decide before scaling.
- **Single model vs model router** — single is simpler; router gives portability at the cost of complexity. Decide when the platform actually has multiple use cases.
- **RAG vs context-window vs fine-tune** — see [retrieval-augmented-generation](../../patterns/ai/retrieval-augmented-generation.md). Most platforms land on RAG + grounded prompts.
- **Agentic vs procedural orchestration** — agentic loops need stricter eval and bounded scope. See [agentic-system-bounded-loop](../../patterns/ai/agentic-system-bounded-loop.md).
- **Human-in-the-loop scope** — full review vs sampled review vs feedback capture only. Choose per use case based on stakes.
- **Vendor portability bar** — see [model-vendor-portability](../../patterns/ai/model-vendor-portability.md). None / API parity / model parity / training data portability. Higher bars cost more upfront and save more later.

## Sample Backlog Of Open Questions

Pre-load `architect-work/open-questions.md` with these:

- What is the AI Act classification of each in-scope use case?
- What sector AI rules apply (financial services, healthcare, hiring, public sector)?
- What data is the model allowed to be trained on, fine-tuned on, or retrieved over?
- What is the data residency stance for prompts, completions, retrievals, embeddings, logs?
- What does the eval gold set look like, who owns it, how is it refreshed?
- What is the inference cost budget per use case per month?
- What is the latency budget per use case (P50, P95, P99)?
- What is the rollback approach for a bad model version?
- What is the human-in-the-loop scope for high-stakes outputs?
- What is the vendor exit strategy (API parity? model parity? data portability?)?
- What is the guardrail stack for PII, harmful content, prompt injection, jailbreak, hallucination?
- What is the audit and tamper-evident logging stance for prompts and completions?
- What is the incident-response runbook for AI-specific failures (hallucination at scale, prompt injection, model degradation)?
- What is the model registry approach and who curates it?
- What is the version-promotion gate (offline eval threshold, online eval threshold, manual sign-off)?

## Recommended Diagrams

- Use-case sequence diagram per Wave 1 use case (user → app → AI service → retrieval → model → guardrails → response)
- Data-flow diagram for prompts, completions, embeddings, retrieval indexes, logs (annotated with classification and residency)
- Platform layer diagram (data → retrieval → inference → eval → guardrails → observability)
- Model lifecycle diagram (eval gold set → offline eval → deploy → online eval → drift detection → rollback / promote)
- Vendor exit / portability view (current vendor surfaces vs portable surfaces vs lock-in surfaces)

## Getting Started

1. Read this playbook.
2. Copy `project-config.yaml` from this folder to your project location.
3. Set `ai_regulated_use: true` if any high-risk use case is in scope.
4. Adjust `project.name`, compliance jurisdictions, and the role and template enablement to fit the engagement.
5. Run [`risk-compliance-assessor`](../../skills/risk-compliance-assessor.md) **before** [`solution-modeler`](../../skills/solution-modeler.md) — for AI platforms the compliance shape is the constraint, not a finale.
6. Run [`gap-radar`](../../skills/gap-radar.md) before each gate, with the modernity variation surfaced explicitly.

## Notes For Reviewers

When reviewing AI platform bootstrap output:

- check that the AI Act classification is on the record per use case
- check that prompts, completions, embeddings, and retrieval are treated as data flows with classification and residency
- check that eval is continuous, not launch-day-only
- check that guardrails are testable and have measurable signal
- check that inference cost and latency are explicit non-functional requirements
- check that model version lifecycle and rollback are defined
- check that vendor exit / portability is documented, even if minimal
- check that human-in-the-loop scope is appropriate for stakes
- check that no architecture artifact silently treats hallucination as a UX concern
- check that the platform shape is opinionated — vague AI platforms become unused AI platforms
