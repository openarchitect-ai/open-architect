# Gap Radar Checklists

These are the checks the `gap-radar` skill runs across a project. They exist as
guidance, not as code, so an architect can read, edit, and extend them without
touching tooling. Later, a validator can mechanically execute the same checks.

## Purpose

Catch the things an architect misses when working under time pressure, joining
a project late, or stewarding a large estate.

Each check answers one of three questions:

- is something **missing** that should exist?
- is something **inconsistent** between artifacts?
- is something **stale, drifted, or quietly dated**?

The intent is to behave like a senior peer reviewer who reads the project and
calls out what an experienced eye would catch.

## How To Read A Check

Each check has:

- **Signal** — the question being asked
- **Where to look** — the artifact field or location that supplies the answer
- **Why it matters** — the failure mode this prevents
- **Severity hint** — `info`, `warn`, or `block` (only a guide; context wins)

Findings should be reported with status labels:

- `BLOCKER` — must be addressed before the next responsible step
- `OPEN` — material gap that needs an architect decision
- `PROVISIONAL` — something assumed but not yet evidenced
- `ACTION` — concrete follow-up the architect should take
- `INFO` — useful pattern observation, no action required

## Output Shape

When the skill runs, group findings as:

1. `BLOCKERS` — anything that should pause the next step
2. `Missing Required Content` — completeness gaps per template kind
3. `Inconsistencies` — cross-artifact contradictions
4. `Present-Day Standards Gaps` — modernity / current-standard misses
5. `Ownership Truthfulness Risks` — invented or drifted ownership
6. `Governance Hygiene` — stale statuses, expired evidence, missed reviews
7. `Drift Signals` — artifact state vs. real-world signals
8. `AI Platform Gaps` — AI-specific platform, model, eval, and governance misses (only when AI is in scope)
9. `Architect Tasks` — grouped Ask / Confirm / Request / Decide

Always end with a `Bottom Line` that names the 1–3 highest-leverage findings.

The skill should also propose a `working-log.md` entry summarizing the
sweep in plain language (what was scanned, what was skipped, the
biggest signal, and the 1-3 highest-leverage findings). The working-log
is the project's chronological narrative; the radar report itself is
structured for review.

## 1. Completeness Checks (Per Template Kind)

### Application

- **Signal:** Does every application have an accountable owner that is not invented?
  **Where:** `spec.ownership` / accountability fields
  **Why:** Without a real owner, downstream change cannot be reviewed or approved.
  **Severity:** `warn` (block if status is approved)

- **Signal:** Does every application have at least one mapped capability or business process?
  **Where:** `relationships` of type `realizes-capability` or `supports-process`
  **Why:** Apps with no business link cannot be prioritized, retired, or rationalized.
  **Severity:** `warn`

- **Signal:** Does every application have at least one environment?
  **Where:** `relationships` to `environment`
  **Why:** No environment means no operability stance, no rollout target, no decommission plan.
  **Severity:** `warn`

- **Signal:** Are data classifications captured for applications handling personal, financial, or sensitive data?
  **Where:** related `data-object` classification fields
  **Why:** Classification gaps undermine compliance and security reviews.
  **Severity:** `block` when applicable jurisdiction has GDPR / HIPAA / similar regimes

### Interface

- **Signal:** Does every interface declare an owning application and consumer applications?
  **Where:** `relationships` to provider and consumer applications
  **Why:** Interfaces with no owner are how silent integrations rot.
  **Severity:** `warn`

- **Signal:** Does every interface declare an identity and authorization model?
  **Where:** security characteristics fields
  **Why:** Modern interfaces without explicit authn/authz are an audit and breach risk.
  **Severity:** `warn` (block for internet-facing or data-class-2+)

- **Signal:** Does every interface carrying classified data have an encryption-in-transit stance?
  **Where:** security characteristics or related `technology-standard`
  **Why:** Common control gap; flagged by most cyber frameworks.
  **Severity:** `block` for classified data

- **Signal:** Are SLA, throughput, and failure-mode expectations captured for interfaces in critical solutions?
  **Where:** non-functional fields
  **Why:** Critical interfaces with no NFRs cannot be operated or governed.
  **Severity:** `warn`

### Data Object

- **Signal:** Does every data object have a classification (e.g. public / internal / restricted / regulated)?
  **Where:** classification field
  **Why:** Classification drives most downstream controls.
  **Severity:** `block` for any data flow crossing trust boundaries

- **Signal:** Does every regulated data object name the residency disposition?
  **Where:** residency / location-of-record field
  **Why:** GDPR, DORA, sectoral rules all need this answer.
  **Severity:** `block` when EU / regulated jurisdiction applies

- **Signal:** Does every data object name its system of record?
  **Where:** `relationships` to authoritative application
  **Why:** Without an SoR, master data quality cannot be reasoned about.
  **Severity:** `warn`

### Solution

- **Signal:** Does every solution have a non-empty requirement set?
  **Where:** `relationships` to `requirement`
  **Why:** Solutions without requirements are decoration, not direction.
  **Severity:** `warn`

- **Signal:** Does every solution name participating applications, application-services, interfaces, and data objects?
  **Where:** `relationships`
  **Why:** Solutions defined without participants cannot be impact-analyzed.
  **Severity:** `warn`

- **Signal:** Does every solution name at least one environment in scope?
  **Where:** `relationships` to `environment`
  **Why:** Solutions with no environment cannot be deployed, tested, or operated.
  **Severity:** `warn`

- **Signal:** Does every solution declare an observability stance?
  **Where:** non-functional / operational fields, or a referenced technology-standard
  **Why:** Modern solutions without an explicit observability posture rot quickly.
  **Severity:** `warn`

### Decision

- **Signal:** Does every decision capture the options considered?
  **Where:** options or alternatives field
  **Why:** Decisions without options recorded cannot be reviewed or revisited.
  **Severity:** `warn`

- **Signal:** Does every decision capture rationale and consequences?
  **Where:** rationale and consequences fields
  **Why:** A decision with no rationale becomes folklore in 6 months.
  **Severity:** `block` for `accepted` status

- **Signal:** Does every decision name its impact set (applications, interfaces, data, transitions)?
  **Where:** `relationships`
  **Why:** Impact-less decisions cannot be traced or undone safely.
  **Severity:** `warn`

### Requirement

- **Signal:** Does every requirement trace to at least one solution, capability, or objective?
  **Where:** `relationships`
  **Why:** Untraced requirements get lost; traced requirements get delivered.
  **Severity:** `warn`

- **Signal:** Is the type (functional / non-functional / security / regulatory) explicit?
  **Where:** classification field
  **Why:** Type drives review process and evidence expectations.
  **Severity:** `info`

- **Signal:** Are acceptance / measurability criteria present for non-functional and regulatory requirements?
  **Where:** acceptance criteria field
  **Why:** Unmeasurable NFRs cause silent delivery failure.
  **Severity:** `warn`

### Transition Architecture

- **Signal:** Does every transition declare a rollback approach?
  **Where:** rollback / recovery field, or referenced pattern
  **Why:** Transitions without rollback are how outages happen.
  **Severity:** `block`

- **Signal:** Does every transition declare success criteria?
  **Where:** success criteria field
  **Why:** "Done" is undefined without it.
  **Severity:** `warn`

- **Signal:** Are dependencies on other transitions, work packages, or external programs visible?
  **Where:** `relationships`
  **Why:** Hidden dependencies destroy sequencing.
  **Severity:** `warn`

- **Signal:** Is a cutover rehearsal pattern referenced for non-trivial cutovers?
  **Where:** pattern reference
  **Why:** Unrehearsed cutovers are statistically high-risk.
  **Severity:** `warn`

### Initiative / Roadmap / Work Package / Gap

- **Signal:** Does every initiative trace to at least one objective?
  **Where:** `relationships`
  **Why:** Initiatives without objectives drift into vanity work.
  **Severity:** `warn`

- **Signal:** Does every gap have a closing work package?
  **Where:** `relationships`
  **Why:** Gaps with nothing closing them are not real plans.
  **Severity:** `warn`

- **Signal:** Are roadmap entries linked to either an initiative or a transition?
  **Where:** `relationships`
  **Why:** Disconnected roadmap items create false coherence.
  **Severity:** `warn`

### Risk / Compliance Assessment

- **Signal:** Does every active risk have a treatment plan and a due-date?
  **Where:** treatment / mitigation fields
  **Why:** Risks without treatment are not being managed.
  **Severity:** `warn`

- **Signal:** Does every compliance assessment name the framework, scope, and evidence dates?
  **Where:** framework, scope, evidence-dates fields
  **Why:** Assessments without frame and freshness do not stand up to audit.
  **Severity:** `warn`

## 2. Cross-Artifact Consistency Checks

- **Signal:** Do any decisions contradict an active principle or technology-standard?
  **Where:** decision rationale vs. principle / standard
  **Why:** Silent contradictions are how guardrails decay.
  **Severity:** `warn`

- **Signal:** Do solutions reference applications, interfaces, or data objects that are not in the architecture?
  **Where:** `relationships` targets
  **Why:** Broken references hide impact and misdirect change.
  **Severity:** `warn`

- **Signal:** Are there orphan artifacts (no inbound or outbound relationships)?
  **Where:** all artifacts
  **Why:** Orphans are either misnamed, misplaced, or dead.
  **Severity:** `info`

- **Signal:** Do any objectives have no measurable target?
  **Where:** measurement field
  **Why:** Unmeasurable objectives become slogans.
  **Severity:** `warn`

- **Signal:** Are there capabilities with no owning organization?
  **Where:** `relationships`
  **Why:** Capabilities with no owner cannot be operated or improved.
  **Severity:** `warn`

- **Signal:** Are there interfaces present in baseline that are missing in the target, with no explicit decommissioning decision?
  **Where:** baseline vs. target relationships, plus decisions
  **Why:** Silent disappearance suggests planning miss, not deliberate retirement.
  **Severity:** `warn`

- **Signal:** Are there patterns referenced informally but no decision recording the choice?
  **Where:** pattern mentions vs. decisions
  **Why:** Pattern adoption without a decision creates accountability gaps.
  **Severity:** `info`

## 3. Present-Day Standards Checks

These checks catch where a solution, decision, or transition feels stuck in
older assumptions and would not pass a present-day architecture review.

- **Signal:** Does every internet-facing or cross-trust-boundary interface assume zero-trust posture (mTLS, identity-aware, least-privilege)?
  **Why:** Implicit network trust is a present-day no-go.
  **Severity:** `warn`

- **Signal:** Do solutions handling personal, financial, or health data have a residency and cross-border-transfer disposition?
  **Why:** GDPR, DORA, HIPAA, LGPD all expect this on the record.
  **Severity:** `block` when applicable jurisdiction is in scope

- **Signal:** Do build / release decisions reference supply-chain integrity (signed artifacts, SBOM, provenance)?
  **Why:** Now a baseline expectation in regulated and public-sector contexts.
  **Severity:** `warn`

- **Signal:** Do critical solutions declare an observability stance (logs, metrics, traces, SLOs)?
  **Why:** Observability-by-design is now standard, not bonus.
  **Severity:** `warn`

- **Signal:** Do critical solutions declare a failure / DR / RTO-RPO posture?
  **Why:** DORA, NIS2, financial-resilience expectations require this stance.
  **Severity:** `warn`

- **Signal:** Are FinOps / cost signals present for cloud-heavy solutions (cost model, ownership, alerting)?
  **Why:** Cost is now a non-functional requirement in most modern reviews.
  **Severity:** `info`

- **Signal:** For solutions consuming or producing AI model output, are model risk, evaluation, and AI-Act / sector AI rules considered?
  **Why:** AI is now a regulated and reviewable concern.
  **Severity:** `block` when AI regulated use is in scope

- **Signal:** Are platform-engineering and developer-experience implications considered for solutions that affect many teams?
  **Why:** Modern architecture cannot ignore the path to production.
  **Severity:** `info`

- **Signal:** Are accessibility expectations declared for user-facing solutions in jurisdictions with accessibility regimes?
  **Why:** EAA / Section 508 / public-sector regimes require this.
  **Severity:** `warn` when applicable

- **Signal:** Are secrets and configuration handling explicit (rotation, vault, environment isolation) for solutions touching credentials?
  **Why:** Secrets management is a common silent gap.
  **Severity:** `warn`

- **Signal:** Are incident-response and tamper-evident logging expectations explicit for security-relevant solutions?
  **Why:** Audit defensibility now depends on this.
  **Severity:** `warn`

- **Signal:** Do solutions handling credentials, tokens, or API keys declare a rotation cadence and revocation path?
  **Where:** security characteristics, related technology-standards, secrets-management references
  **Why:** Rotation without cadence is rotation by accident. Modern reviews expect explicit rotation policy.
  **Severity:** `warn`

- **Signal:** Do critical solutions name a human owner for observability signals (who reads dashboards, who is on call, who triages alerts)?
  **Where:** non-functional fields, related `organization` references
  **Why:** Observability owned by nobody decays into noise. Ownership is the difference between a dashboard and a control.
  **Severity:** `warn`

- **Signal:** Do solutions touching personal data have a consent and lawful-basis stance recorded?
  **Where:** related `compliance-assessment`, `data-object` classification, requirement fields
  **Why:** GDPR / UK GDPR / similar regimes require this on the record per processing purpose, not just at the platform level.
  **Severity:** `block` when GDPR or similar applies

- **Signal:** Do internet-facing or partner-facing interfaces declare a rate-limiting, abuse-prevention, and quota stance?
  **Where:** non-functional fields, related `technology-standard`
  **Why:** Modern abuse models (scraping, credential stuffing, AI-driven probing) make this a baseline expectation.
  **Severity:** `warn`

- **Signal:** Do critical solutions name an explicit BCP / DR posture proportionate to their criticality tier?
  **Where:** non-functional fields, related `risk`, environment posture
  **Why:** Generic "we have backups" is not a BCP / DR posture. Criticality-tier-proportionate planning is the current bar.
  **Severity:** `warn` (block for DORA / NIS2 / critical-infrastructure scope)

## 4. Ownership Truthfulness Checks

- **Signal:** Are any ownership entries marked `confirmed:` without a source link, evidence note, or referenced approval?
  **Where:** `metadata.evidence`, references, and ownership fields
  **Why:** Plausible-sounding ownership is the #1 way AI-assisted artifacts become accidentally false.
  **Severity:** `block`

- **Signal:** Are there ownership entries that name a specific person where only a role was given by source evidence?
  **Where:** ownership fields vs. source notes
  **Why:** Silently inventing individuals erodes trust.
  **Severity:** `block`

- **Signal:** Are there long-stale `tbd` or `unknown` ownerships that should now be promoted or routed?
  **Where:** ownership fields with old dates
  **Why:** Stale unknowns become permanent unknowns.
  **Severity:** `warn`

- **Signal:** Are role-placeholder owners (`role-placeholder:<role>`) present where a confirmed owner was named in recent source material?
  **Where:** ownership fields vs. recent `docs/` or `architect-work/answers-and-confirmations.md`
  **Why:** Confirmed answers should overwrite placeholders.
  **Severity:** `warn`

## 5. Governance Hygiene Checks

- **Signal:** Are any decisions stuck in `draft` or `proposed` past the project's expected decision cadence?
  **Where:** decision status + dates
  **Why:** Undecided decisions silently block delivery.
  **Severity:** `warn`

- **Signal:** Are any risks past their treatment due-date with status still open?
  **Where:** risk treatment fields
  **Why:** Overdue risk is unmanaged risk.
  **Severity:** `warn`

- **Signal:** Are any compliance assessments older than their applicable framework's expected refresh window?
  **Where:** evidence-dates
  **Why:** Stale assessments fail audit.
  **Severity:** `warn`

- **Signal:** Are scheduled review-gate checkpoints (`project-bootstrap`, `requirement-baseline`, etc.) recorded as passed without evidence?
  **Where:** governance / review records
  **Why:** Phantom approvals are how governance becomes theatre.
  **Severity:** `block`

- **Signal:** Are there approvals marked `accepted` while underlying evidence is still `provisional`?
  **Where:** approval status vs. metadata.confidence
  **Why:** Premature acceptance creates false ground truth.
  **Severity:** `block`

## 6. Drift Signal Checks

- **Signal:** Are there baseline applications described in target-state language, or vice versa?
  **Where:** descriptions and statuses
  **Why:** Mixed tense in baseline/target is how baselines silently turn into wishlists.
  **Severity:** `warn`

- **Signal:** Are any transitions past their target window with status not closed?
  **Where:** transition dates
  **Why:** Stale transitions distort roadmap reality.
  **Severity:** `warn`

- **Signal:** Are any roadmap items past target date with no status update?
  **Where:** roadmap dates
  **Why:** Roadmap drift erodes credibility.
  **Severity:** `warn`

- **Signal:** Does recent source material (newest files under `docs/`) contradict any current architecture artifact?
  **Where:** date-ordered source content vs. artifact content
  **Why:** Architecture rots fastest at the boundary with new evidence.
  **Severity:** `warn`

- **Signal:** Are there answers in `architect-work/answers-and-confirmations.md` that have not been propagated into the artifacts they would change?
  **Where:** answers file vs. relevant artifacts
  **Why:** Confirmed answers must reach the artifact, not just the working notes.
  **Severity:** `warn`

- **Signal:** Are there open questions in `architect-work/open-questions.md` older than two cadences (or the project's defined cadence) with no progress note?
  **Where:** open-questions file
  **Why:** Long-stale questions are how decisions never get made.
  **Severity:** `info`

- **Signal (requirement drift):** Are there `requirement` artifacts with a `metadata.change_log` entry newer than the `metadata.last_reviewed` date on any realizing `solution` / `decision` / `interface` / `transition-architecture`?
  **Where:** requirement change_log vs. downstream artifact last_reviewed
  **Why:** Requirement changed but downstream wasn't re-reviewed — the change landed in the requirement YAML but its impact wasn't worked through. This is exactly what the `change-coordinator` skill is supposed to prevent; the radar catches the cases where it didn't run.
  **Severity:** `warn` (block when freeze-gate enforcement is `strict` and the change is post-baseline)

- **Signal (register drift):** Are there `requirement.metadata.change_log` entries with no matching row in `architect-work/change-register.md`?
  **Where:** requirement change_log vs. change register
  **Why:** The per-requirement history and the aggregated register must agree, or sponsors lose visibility into scope drift.
  **Severity:** `warn`

## 7. AI Platform Checks

These checks apply when AI is in scope. Gate them on any of:

- `compliance.ai_regulated_use: true`
- `eu-ai-act` (or sector AI rule) in `applicable_regulations`
- the project's playbook is `ai-platform-bootstrap`
- the architecture uses language models, embedding models, retrieval-augmented
  generation, or agentic loops

Each check references a pattern under [`../patterns/ai/`](../patterns/ai/README.md)
where applicable.

### Model And Use-Case Governance

- **Signal:** Does every AI use case have an AI Act (or applicable sector AI rule) classification on the record?
  **Where:** related `compliance-assessment`, `requirement` classification
  **Why:** Classification determines obligations and shapes platform constraints. Missing classification leads to architectural rework later.
  **Severity:** `block` when EU AI Act or sector AI rule applies

- **Signal:** Do high-risk AI use cases (per AI Act or sector) have explicit human-in-the-loop scope and a measurable signal for review escalation?
  **Where:** solution non-functional fields, related `risk`, related `compliance-assessment`
  **Why:** High-risk AI without HITL is a regulatory and operational failure mode.
  **Severity:** `block` for high-risk

- **Signal:** Does every public-facing or user-facing AI surface have a disclosure stance (AI Act Article 50 — informing users they are interacting with AI / AI-generated content)?
  **Where:** related `requirement`, `compliance-assessment`, solution interface fields
  **Why:** Article 50 is a specific obligation easily overlooked. Disclosure is a per-surface design choice.
  **Severity:** `warn` (block when EU AI Act applies and the use case is in scope)

### Model And Prompt Lifecycle

- **Signal:** Do solutions using language models declare a model version lifecycle (versioned models, eval gate for promotion, rollback path)?
  **Pattern:** [model-version-promotion-gate](../patterns/ai/model-version-promotion-gate.md)
  **Where:** related `decision`, `technology-component`, non-functional fields
  **Why:** Promoting model versions without versioning, gates, and rollback creates production incidents that are hard to diagnose.
  **Severity:** `block` for production AI use

- **Signal:** Do solutions using prompts treat prompts as versioned artifacts (registry, A/B, promote, rollback) rather than inline string literals?
  **Pattern:** [prompt-lifecycle-management](../patterns/ai/prompt-lifecycle-management.md)
  **Where:** related `application-service`, `decision`, `technology-component`
  **Why:** Prompts have lifecycle. Treating them as inline strings creates silent production debt.
  **Severity:** `warn` (block for production AI with material stakes)

- **Signal:** Does the platform have a continuous evaluation pipeline (offline + online + drift), distinct from one-shot launch-day testing?
  **Pattern:** [continuous-model-evaluation](../patterns/ai/continuous-model-evaluation.md)
  **Where:** related `solution`, `application-service`, non-functional fields
  **Why:** Launch-day-only eval misses drift, regressions, and degradation.
  **Severity:** `warn` (block for high-risk AI use)

- **Signal:** Is red-teaming / adversarial evaluation defined as a distinct discipline from regular eval, with its own cadence?
  **Where:** related `solution`, `risk`, non-functional fields
  **Why:** Eval tests expected behavior; red-teaming tests adversarial behavior. Both are needed.
  **Severity:** `warn` (block when use case has real safety or reputation risk)

### Retrieval, Embeddings, And Data Flows

- **Signal:** For retrieval-augmented systems, is the embedding lifecycle defined (re-embed triggers, version-per-document, fallback during re-embed)?
  **Pattern:** [embedding-lifecycle-management](../patterns/ai/embedding-lifecycle-management.md)
  **Where:** related `data-object`, `technology-component`, `solution`
  **Why:** Stale or inconsistent embeddings silently degrade retrieval. No lifecycle plan means silent degradation.
  **Severity:** `warn`

- **Signal:** Are prompts, completions, embeddings, retrieval indexes, and logs treated as data flows with classification and residency?
  **Where:** related `data-object` classification, residency fields, compliance assessments
  **Why:** Every user prompt is a data flow. Most platforms miss this until audit.
  **Severity:** `block` when personal, financial, health, or regulated data is in scope

- **Signal:** For multi-tenant AI platforms, is tenant isolation declared at embeddings, retrieval indexes, prompt context, and logs?
  **Where:** related `solution`, `technology-component`, non-functional fields
  **Why:** Late-stage tenant separation is painful. Multi-tenancy boundaries should be Day 1.
  **Severity:** `warn` (block when multiple tenants share the platform)

### Guardrails And Safety

- **Signal:** Do AI surfaces have a guardrail stack (input filtering, retrieval scoping, prompt isolation, output filtering, post-generation validation)?
  **Pattern:** [ai-guardrail-stack](../patterns/ai/ai-guardrail-stack.md)
  **Where:** related `solution`, `application-service`, `risk`, `technology-component`
  **Why:** Bolt-on guardrails fail. Guardrails must be part of the architecture.
  **Severity:** `block` for user-facing or externally-influenced AI

- **Signal:** Is hallucination treated as an architectural and operational concern (detection signal, graceful handling) rather than a UX message?
  **Where:** related `solution`, `risk`, non-functional fields
  **Why:** Hallucination handling cannot live in user-facing copy alone.
  **Severity:** `warn`

### Agentic Systems

- **Signal:** Do agentic systems declare explicit termination conditions (max steps, max cost, max wall time, success criteria, hard-stop conditions)?
  **Pattern:** [agentic-system-bounded-loop](../patterns/ai/agentic-system-bounded-loop.md)
  **Where:** related `solution`, `application-service`, `risk`, non-functional fields
  **Why:** Unbounded agentic loops become runaway loops. Termination is an architectural decision.
  **Severity:** `block` for production agentic systems

- **Signal:** Do agentic systems declare a tool allow-list with per-tool rate or scope limits?
  **Where:** related `solution`, `application-service`, security fields
  **Why:** Tool access without scope is how agentic systems cause real-world damage.
  **Severity:** `block` for production agentic systems

### Cost, Operations, And Vendor

- **Signal:** Are inference cost (per use case per period) and latency budgets (P50, P95, P99) explicit non-functional requirements?
  **Where:** non-functional fields, related `requirement`, `risk`
  **Why:** Token spend can scale faster than user growth. FinOps must be Day 1.
  **Severity:** `warn` (block when budget overrun is a material concern)

- **Signal:** Is there a model-deprecation response playbook for hosted models (vendor deprecates the model in use)?
  **Pattern:** [model-vendor-portability](../patterns/ai/model-vendor-portability.md)
  **Where:** related `decision`, `risk`, non-functional fields
  **Why:** Vendor deprecation is a question of when, not if. Platforms without a playbook scramble.
  **Severity:** `warn`

- **Signal:** Is vendor portability declared (abstraction layer, alternative model pre-validated, contract terms, periodic switch test)?
  **Pattern:** [model-vendor-portability](../patterns/ai/model-vendor-portability.md)
  **Where:** related `decision`, `risk`, `compliance-assessment`
  **Why:** Lock-in masquerades as managed convenience. Have an exit plan.
  **Severity:** `info` (warn when concentration risk is material)

## Calibration Notes

- These checks are **guidance**, not hard rules. Context wins. A check that
  fires but is genuinely not relevant should be acknowledged and dismissed in
  the response, not silently skipped.
- Severity hints assume the project actually uses the relevant template kinds.
  If a kind is not in scope per `project-config.yaml`, its checks are skipped.
- For jurisdiction-specific checks, use the `compliance` section of
  `project-config.yaml` to gate which obligations fire.
- The skill should explicitly say which checks were **skipped because not in
  scope** so the architect can see the boundary of the scan.
- **Distinguish "missing because deferred" from "missing because of drift".**
  Some artifacts are not yet present because their stage hasn't run — e.g.
  views named textually in `SOL.views_recommended` but the `views/` folder
  is empty because `diagram-author` hasn't been invoked yet; APP/AS/IF
  artifacts named conceptually in `SOL` but not yet modeled because the
  structural-artifact sprint hasn't run. Those are **not drift findings**.
  Drift means the artifact should exist now *and* something changed upstream
  or downstream without follow-through. When reporting completeness gaps,
  prefer:
  - **`deferred`** — stage-not-yet-run miss; downgrade severity to `info` and note the expected stage
  - **`drift`** — change-coordinator or update missed propagating; full severity per the check
  - **`missing`** — neither applies; genuine completeness gap, full severity

## Extension Points

When adding checks, prefer:

- one check per signal, not bundled checks
- explicit `Where to look` so the check is mechanically reproducible later
- a clear failure mode so the architect understands why this is worth flagging
- a severity hint, even if it stays advisory
