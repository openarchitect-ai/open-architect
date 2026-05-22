# Open Architect

Architecture work doesn't start clean. You join projects in flight, requirements are partial, the estate is undocumented, the standard you're held to keeps moving — and you still need to deliver something defensible.

**Open Architect** is an open-source, AI-aware workspace built for that reality. It pairs a structured architecture metamodel with active scanning skills, pre-packaged engagement playbooks, and AI-era patterns — so the architect stays in control while AI catches what gets missed.

- **Architect-led.** AI assists; you decide.
- **Engagement-shaped.** Pick a playbook for the work you're actually doing, not a generic process.
- **Catches what you miss.** A built-in scanner surfaces gaps an experienced reviewer would catch on a fresh read.

---

## The architect's reality

Open Architect is built for the situations architects actually walk into:

- **You joined a project at month 18.** Three architects came before you. No one wrote down why.
- **You have unclear requirements** and stakeholders who change their mind weekly.
- **You're delivering to standards that didn't exist last year** — EU AI Act, DORA, NIS2, modern supply-chain integrity, zero-trust, observability-by-design.
- **You miss things under time pressure** — and reviewers find them at the worst moment.
- **You work across multiple AI tools** (Claude, Codex, Copilot, others) and need them to behave consistently inside your workspace.

---

## Signature capabilities

### Engagement playbooks

Twenty-four pre-packaged engagement shapes, each bundling a ready-to-clone `project-config.yaml`, recommended skill sequence, applicable review gates, anti-patterns, and a first-working-session script.

| Family | Playbooks |
|---|---|
| Discovery & decision | `inventory-only`, `portfolio-rationalization`, `vendor-evaluation-and-selection`, `capability-based-planning` |
| Solution / design | `quick-solution-design` |
| Modernization & transition | `migration-wave`, `tech-debt-remediation`, `cloud-migration`, `domain-driven-redesign`, `decommissioning-program` |
| Platform bootstrap | `ai-platform-bootstrap`, `platform-engineering-bootstrap`, `enterprise-integration-bootstrap`, `data-platform-modernization` |
| Enterprise cycle | `full-togaf-adm` |
| Driver-specific | `compliance-driven-modernization`, `security-uplift`, `post-incident-architecture-review`, `business-continuity-readiness` |
| M&A lifecycle | `acquisition-due-diligence`, `post-acquisition-integration`, `divestiture-separation` |
| Practice setup & operation | `architecture-team-bootstrap`, `steady-state-governance` |

Pick one. Clone its config. Follow the brief. Per-playbook descriptions and selection guidance live in the [catalog](.architect/playbooks/README.md).

### Gap Radar

A proactive scan skill that catches what experienced architects miss under time pressure: missing required content, cross-artifact contradictions, invented owners, governance hygiene issues, drift signals, and AI-era modernity gaps. Findings reference the applicable architecture pattern and carry severity markers.

Run it before any review gate, after a stretch of intensive modeling, or as routine cadence.

→ [.architect/skills/gap-radar.md](.architect/skills/gap-radar.md) · [.architect/guidance/gap-radar-checklists.md](.architect/guidance/gap-radar-checklists.md)

### Project Recap

Read-only orientation for an architect joining a project mid-stream or returning after time away. Walks the project state, surfaces what's confirmed, what's open, what's stale, what has drifted between recent source material and current artifacts, and what matters most right now.

Run this first when re-entering. Run Gap Radar afterwards.

→ [.architect/skills/project-recap.md](.architect/skills/project-recap.md)

### AI-era patterns

First-class architecture patterns for AI work: retrieval-augmented generation, prompt lifecycle management, continuous model evaluation, version promotion gates, layered guardrail stack, agentic bounded loops, embedding lifecycle management, and model vendor portability. Referenced by Gap Radar's AI Platform checks and the `ai-platform-bootstrap` playbook.

→ [.architect/patterns/ai/](.architect/patterns/ai/README.md)

### Foundation

The differentiators above sit on a substantial, opinionated foundation:

- **Architecture metamodel — 25 template kinds.** Every architecture object (application, interface, capability, decision, transition, requirement, risk, …) has a typed YAML shape with provenance, ownership, lifecycle, governance, and typed relationships. This is what makes the workspace queryable and AI-friendly rather than a pile of documents. → [`.architect/templates/`](.architect/templates/)
- **Pattern library — 100+ patterns across 8 domains** (business, application, integration, data, security, technology, transition, governance). Reusable architectural approaches with intent, applicability, consequences, and links back to templates. Skills read patterns as normal working context, not as a side reference. → [`.architect/patterns/`](.architect/patterns/)
- **Skill library — ~25 reusable procedures.** Bounded operational skills that an architect (or an agent) can invoke: `project-bootstrapper`, `stakeholder-objective-framer`, `baseline-discovery`, `requirement-normalizer`, `solution-modeler`, `decision-recorder`, `architecture-review`, `transition-planner`, `risk-compliance-assessor`, `option-evaluator`, `evidence-curator`, `architecture-coordinator`, and more. Each skill has a clear input, output, and read-first context. → [`.architect/skills/`](.architect/skills/)
- **Role library — 11 architecture roles** with explicit boundaries (chief architect, enterprise architect, solution architect, business architect, data architect, integration architect, domain architect, security architect, technology architect, architecture governance lead, business analyst). Roles describe perspective and accountability; skills describe what they do. → [`.architect/roles/`](.architect/roles/)
- **Compliance layer.** Jurisdiction (EU/EEA, UK, US, California, Canada), sector (financial services, healthcare, education, payments, public sector, critical infrastructure, software products, life sciences & pharma, consumer digital), and regulation profiles (GDPR, UK GDPR, EU AI Act, NIS2, DORA, Cyber Resilience Act, EU Data Act, HIPAA Security Rule, FTC Safeguards, SEC cyber disclosure, PCI DSS, CCPA/CPRA, FedRAMP, CMMC, and more), wired into modeling skills. → [`.architect/compliance/`](.architect/compliance/)
- **Vocabulary bridges** for teams that think in C4, ArchiMate-Lite, or DDD — concept maps to the Open Architect templates and patterns. → [`.architect/guidance/vocabulary-bridges/`](.architect/guidance/vocabulary-bridges/)

---

## When to use it

| If you're... | Run / use |
|---|---|
| Joining a project mid-stream or returning after time away | `project-recap` |
| Preparing for a review gate or after a stretch of intensive modeling | `gap-radar` |
| Starting a new engagement | pick a playbook from the [catalog](.architect/playbooks/README.md) |
| Standing up AI capability inside an engagement | the [AI patterns](.architect/patterns/ai/README.md) (referenced by `ai-platform-bootstrap` and gap-radar) |
| Using C4 / ArchiMate-Lite / DDD vocabulary | [`guidance/vocabulary-bridges/`](.architect/guidance/vocabulary-bridges/) |
| Not sure which playbook fits | `./architect.sh list-playbooks` then `./architect.sh playbook <name>` |

---

## What a session looks like

A `gap-radar` pass before a `solution-direction` review gate:

```
Mode: Review · Role: Chief Architect · Confidence: High

## Blockers
🚫 sol-1002-payment-orchestration is marked `accepted` but related
   decisions D-0007 and D-0008 are still `proposed`
🚫 int-1003 carries PII but declares no encryption-in-transit stance

## Missing Required Content
- 3 applications without an accountable owner (app-1002, app-1004, app-1009)
- 2 transitions without rollback approach declared (ta-2002, ta-2003)

## Present-Day Standards Gaps
- sol-1002 has no observability ownership named (who reads the dashboards?)
- 4 services with credentials in scope have no secret rotation cadence
- No BCP/DR posture stated for the 2 critical solutions

## Bottom Line
The two blockers are fixable today. The 3-without-owner and missing
observability ownership are the real risks before the gate.

Your move: pick a finding to address, or ask for the full list.
```

This is the kind of report Open Architect produces — scannable, severity-marked, pattern-referenced, and oriented around what the architect should do next.

---

## Getting Started

The fastest path is the `architect` CLI:

```bash
# PowerShell
./architect.ps1 new my-project -Playbook quick-solution-design

# Bash
./architect.sh new my-project --playbook quick-solution-design
```

That scaffolds `workspace/my-project/` with `project-config.yaml`,
`notes.md`, `architect-work/`, and `docs/` ready to use.

Then **follow the playbook's First Working Session steps** (in
`.architect/playbooks/<playbook>/playbook.md`).

To see available playbooks: `./architect.sh list-playbooks` (or check
the [catalog](.architect/playbooks/README.md)).

**Quick-start guides:**

- [Playbooks overview](.architect/playbooks/README.md) — pick an engagement shape
- [`architect` CLI](.architect/cli/README.md) — init and project scaffolding commands
- [Starter project guide](.architect/config/starter-project.md) — minimum useful setup
- [Prompt recipes](.architect/config/prompt-recipes.md) — practical prompts for inventory, analysis, review, decision, and modeling
- [Cheat sheet](.architect/config/cheat-sheet.md) — fast reference

---

## What's in the repo

```text
architect.ps1 / architect.sh   ← CLI delegators (call from repo root)

.architect/            ← capability library (the tool)
  cli/            ← `architect` CLI source + templates
  playbooks/      ← engagement shapes (start here)
  patterns/       ← reusable architecture patterns (incl. patterns/ai/)
  templates/      ← the metamodel — what each artifact kind looks like
  skills/         ← reusable procedures (incl. gap-radar, project-recap)
  roles/          ← role descriptions and accountabilities
  method/         ← chosen project method + ADM and transition references
  guidance/       ← conventions, glossary, vocabulary-bridges/
  compliance/     ← jurisdiction, sector, and control obligations
  examples/       ← worked reference projects (use the same project shape as workspace/)
  agents/         ← runtime profiles for multi-agent execution (advanced)
  runtime/        ← live queue / gate state (advanced)
  schemas/        ← formal JSON Schema contracts (advanced)
  validation/     ← validators for templates and artifacts (advanced)
  config/         ← workspace and agent configuration guides

workspace/             ← where your project work lives (one folder per project)
  <project-name>/
    project-config.yaml
    notes.md
    architect-work/
    docs/
    business/  application/  data/  technology/  governance/  change/  views/
```

Three levels:

- **Core** — everyday architect-assist use
- **Optional** — additional structure for more formal projects
- **Advanced** — multi-agent orchestration, schemas, runtime state

Detailed workspace docs: [.architect/README.md](.architect/README.md)

---

## How AI agents are guided

[`AGENTS.md`](AGENTS.md) in the repo root tells AI agents (Claude Code, Codex, others) how to respond inside this workspace. It defines the display contract, status labels, and behavioral guardrails — including ownership truthfulness rules to prevent agents from inventing facts to make artifacts look complete.

Edit it once for your team; any AI tool that respects the convention picks it up.

---

## Project status

Open Architect is in a **strong foundation stage**:

- ✅ Templates, patterns (incl. AI), compliance, playbooks, scanning skills are in place
- ✅ Architect-assist operating model defined
- ✅ Display contract, vocabulary bridges, glossary aligned
- 🟡 Real-project proving in progress
- 🟡 Worked examples are still thin — currently one (customer onboarding modernization)
- 🟡 Validators exist but don't yet execute the Gap Radar checklists mechanically

---

## Contributing

Useful contribution areas:

- Worked examples across industries (finance, healthcare, public sector, AI platforms, manufacturing OT/IT)
- Tier 2 AI patterns (inference caching, FinOps, tenant isolation, AI Act Article 50 disclosure, hallucination handling, red-teaming, human-in-the-loop review)
- Additional vocabulary bridges (BIZBOK, Wardley Mapping, AWS Well-Architected, Google Cloud Architecture Framework)
- Schema precision and runnable validators (especially Gap Radar checks as executable validation)
- Method tailoring guides (TOGAF tailoring, DDD-aligned engagement, lean architecture, lightweight RACI)
- New playbooks for engagement shapes not yet in the catalog (the [current 24](.architect/playbooks/README.md) cover discovery, solution/design, modernization, platform bootstrap, enterprise cycle, driver-specific, M&A, and practice setup — gaps include hybrid/edge, OT/IT convergence, sustainability-driven architecture, AI red-team programs)

Issues and pull requests welcome.

---

## License

Apache License 2.0. See [LICENSE](LICENSE).
