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

**By engagement family:**

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

**Detail:**


| Playbook | Use when |
|---|---|
| [`inventory-only`](.architect/playbooks/inventory-only/) | document and assess an estate without modeling target state |
| [`quick-solution-design`](.architect/playbooks/quick-solution-design/) | bounded solution for one team, in weeks |
| [`migration-wave`](.architect/playbooks/migration-wave/) | modernization, decommissioning, or wave-based transition |
| [`full-togaf-adm`](.architect/playbooks/full-togaf-adm/) | enterprise architecture cycle with stakeholders, vision, capabilities, governance |
| [`ai-platform-bootstrap`](.architect/playbooks/ai-platform-bootstrap/) | standing up or rationalizing an AI platform with model lifecycle, RAG, eval, guardrails |
| [`compliance-driven-modernization`](.architect/playbooks/compliance-driven-modernization/) | the regulator (DORA, NIS2, AI Act, PCI DSS, HIPAA, FedRAMP, SEC cyber) is the driver |
| [`post-acquisition-integration`](.architect/playbooks/post-acquisition-integration/) | M&A has happened and two estates must be integrated within a TSA clock |
| [`data-platform-modernization`](.architect/playbooks/data-platform-modernization/) | building or rationalizing a data platform — lake / lakehouse / mesh, data products, contracts |
| [`platform-engineering-bootstrap`](.architect/playbooks/platform-engineering-bootstrap/) | standing up an internal developer platform with golden paths and self-service |
| [`portfolio-rationalization`](.architect/playbooks/portfolio-rationalization/) | invest / tolerate / migrate / eliminate analysis before any migration program executes |
| [`security-uplift`](.architect/playbooks/security-uplift/) | CISO or threat landscape is driving architectural change — zero-trust, defense-in-depth, identity strategy |
| [`post-incident-architecture-review`](.architect/playbooks/post-incident-architecture-review/) | major incident has happened and architecture must change to prevent the class of failure |
| [`tech-debt-remediation`](.architect/playbooks/tech-debt-remediation/) | improving quality of an existing estate without major reshape — debt inventory, scoring, prevention practice |
| [`steady-state-governance`](.architect/playbooks/steady-state-governance/) | operating the architecture function — board cadence, decision lifecycle, principle stewardship, exception process |
| [`enterprise-integration-bootstrap`](.architect/playbooks/enterprise-integration-bootstrap/) | standing up an integration platform — iPaaS / event mesh / API gateway / service registry / B2B onboarding |
| [`cloud-migration`](.architect/playbooks/cloud-migration/) | migrating to cloud — landing zone, 6Rs decisions per app, identity federation, FinOps from Day 1, exit posture |
| [`vendor-evaluation-and-selection`](.architect/playbooks/vendor-evaluation-and-selection/) | structured RFI / RFP / scoring / decision for selecting a major vendor with defensible rationale |
| [`capability-based-planning`](.architect/playbooks/capability-based-planning/) | business capability map, heatmap, value-stream alignment, investment direction per capability |
| [`acquisition-due-diligence`](.architect/playbooks/acquisition-due-diligence/) | pre-deal technical diligence — risk register, integration cost estimate, crown-jewel inventory, deal-impact decisions |
| [`divestiture-separation`](.architect/playbooks/divestiture-separation/) | seller-side carve-out — TSA forward, identity / data separation, decommissioning, standalone architecture at TSA exit |
| [`architecture-team-bootstrap`](.architect/playbooks/architecture-team-bootstrap/) | creating an architecture function from zero — charter, founding principles, operating model, hiring plan, tooling, initial cadence |
| [`business-continuity-readiness`](.architect/playbooks/business-continuity-readiness/) | proactive BCP / DR — criticality tiers, RTO/RPO targets, resilience architecture, recovery rehearsal cadence |
| [`domain-driven-redesign`](.architect/playbooks/domain-driven-redesign/) | DDD-led redesign of part of an estate — bounded contexts, context map, ubiquitous language, integration patterns |
| [`decommissioning-program`](.architect/playbooks/decommissioning-program/) | focused legacy retirement — schedule, dependency closure, data archival, customer notice, contract termination |

Pick one. Clone its config. Follow the brief.

→ [.architect/playbooks/README.md](.architect/playbooks/README.md)

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

### Plus

- **Substantial compliance layer** — GDPR, UK GDPR, EU AI Act, NIS2, DORA, Cyber Resilience Act, EU Data Act, HIPAA Security Rule, FTC Safeguards, SEC cyber disclosure, PCI DSS, CCPA/CPRA, FedRAMP, CMMC, and more
- **TOGAF-adjacent template library** across business, application, data, technology, governance, change
- **Vocabulary bridges** for teams that think in C4, ArchiMate-Lite, or DDD
- **Deep pattern library** across application, integration, data, security, technology, transition, governance, business

---

## When to use it

| If you're... | Run / use |
|---|---|
| Joining a project mid-stream or returning after time away | `project-recap` |
| Preparing for a review gate | `gap-radar` |
| Starting a new engagement | pick a [playbook](.architect/playbooks/) |
| Standing up an AI platform | `ai-platform-bootstrap` + [`patterns/ai/`](.architect/patterns/ai/) |
| Driven by a regulator | `compliance-driven-modernization` |
| Integrating an acquired company | `post-acquisition-integration` |
| Using C4 / ArchiMate / DDD vocabulary | [`guidance/vocabulary-bridges/`](.architect/guidance/vocabulary-bridges/) |

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

1. **Pick a playbook** from [.architect/playbooks/](.architect/playbooks/) — pick the engagement shape closest to your work.
2. **Copy its `project-config.yaml`** to your project location under `.architect/architecture/<your-project>/`.
3. **Follow the playbook's first-working-session script.**

That's it. Don't pick templates or skills one by one — the playbook has chosen them for you. Tune from there as the engagement evolves.

**Quick-start guides:**

- [Playbooks overview](.architect/playbooks/README.md) — pick an engagement shape
- [Starter project guide](.architect/config/starter-project.md) — minimum useful setup
- [Prompt recipes](.architect/config/prompt-recipes.md) — practical prompts for inventory, analysis, review, decision, and modeling
- [Cheat sheet](.architect/config/cheat-sheet.md) — fast reference

---

## What's in the workspace

```text
.architect/
  playbooks/      ← engagement shapes (start here)
  patterns/       ← reusable architecture patterns (incl. patterns/ai/)
  templates/      ← the metamodel — what each artifact kind looks like
  skills/         ← reusable procedures (incl. gap-radar, project-recap)
  roles/          ← role descriptions and accountabilities
  method/         ← chosen project method + ADM and transition references
  guidance/       ← conventions, glossary, vocabulary-bridges/
  compliance/     ← jurisdiction, sector, and control obligations
  architecture/   ← real project artifacts go here
  examples/       ← worked reference projects
  agents/         ← runtime profiles for multi-agent execution (advanced)
  runtime/        ← live queue / gate state (advanced)
  schemas/        ← formal JSON Schema contracts (advanced)
  validation/     ← validators for templates and artifacts (advanced)
  config/         ← workspace and agent configuration guides
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
- New playbooks (e.g. data-platform modernization, post-incident architecture review, capability-based planning)

Issues and pull requests welcome.

---

## License

Apache License 2.0. See [LICENSE](LICENSE).
