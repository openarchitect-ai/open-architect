# Playbooks

Playbooks are pre-packaged answers to one question:

> What shape of engagement is this?

Architecture engagements vary widely. Sometimes you are running a full
enterprise cycle. Sometimes you are designing one bounded solution in a few
weeks. Sometimes you are just doing inventory and analysis on a portfolio
nobody has documented in years.

Each playbook bundles everything an architect needs to start one of those
engagement shapes cleanly — without picking through roles, templates,
skills, and gates one by one.

## What A Playbook Contains

Each playbook folder contains exactly two files:

- **`playbook.md`** — the engagement brief. When to use it, the engagement
  shape (one-shot or cyclic), recommended skill sequence, applicable
  review gates, entry and exit criteria, and what good output looks like.
- **`project-config.yaml`** — a ready-to-clone project configuration.
  Roles, templates, skills, conventions, and governance already tuned for
  this engagement.

To start a project from a playbook:

1. Read its `playbook.md` to confirm fit.
2. Copy its `project-config.yaml` to `.architect/project-config.yaml` (or
   create a new project folder under `.architect/architecture/` and put the
   config there).
3. Adjust `project.name` and any compliance scope to your real context.
4. Follow the playbook's recommended first steps.

## Available Playbooks

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

| Playbook | Shape | Use When |
|---|---|---|
| [inventory-only](./inventory-only/playbook.md) | one-shot, lightweight | you are asked to document and assess an estate without modeling target state |
| [quick-solution-design](./quick-solution-design/playbook.md) | one-shot, bounded | you are designing a single solution for a team or initiative, in weeks |
| [migration-wave](./migration-wave/playbook.md) | one-shot, transition-focused | you are planning modernization, decommissioning, or wave-based transition |
| [full-togaf-adm](./full-togaf-adm/playbook.md) | cyclic, enterprise-wide | you are running an enterprise architecture cycle with stakeholders, vision, capabilities, target state, and governance |
| [ai-platform-bootstrap](./ai-platform-bootstrap/playbook.md) | quasi-cyclic, modern AI engagement | you are standing up or rationalizing an AI platform with model lifecycle, RAG, eval, guardrails, and AI Act / sector AI governance |
| [compliance-driven-modernization](./compliance-driven-modernization/playbook.md) | one-shot with cyclic re-attestation | the dominant driver is a regulator (DORA, NIS2, AI Act, PCI DSS, HIPAA, FedRAMP, SEC cyber, etc.) and obligation-to-control-to-evidence chains are the deliverable |
| [post-acquisition-integration](./post-acquisition-integration/playbook.md) | one-shot bounded by TSA exit | M&A has happened and two estates must be integrated, rationalized, or absorbed within a TSA clock |
| [data-platform-modernization](./data-platform-modernization/playbook.md) | quasi-cyclic, data architecture | you are building or rationalizing a data platform (lake / lakehouse / mesh, data products, contracts) with domain ownership and governance |
| [platform-engineering-bootstrap](./platform-engineering-bootstrap/playbook.md) | quasi-cyclic, IDP | you are standing up an internal developer platform with golden paths, self-service, and platform-as-product operating model |
| [portfolio-rationalization](./portfolio-rationalization/playbook.md) | one-shot, decision-focused | you are running an invest / tolerate / migrate / eliminate analysis across an application estate, before any migration program executes |
| [security-uplift](./security-uplift/playbook.md) | quasi-cyclic, security-driven | the CISO or threat landscape is driving architectural change — zero-trust rollout, defense-in-depth uplift, identity strategy refresh |
| [post-incident-architecture-review](./post-incident-architecture-review/playbook.md) | one-shot, urgent with hypercare | a major outage / breach / data loss has happened and architecture must change to prevent the class of failure, not just this instance |
| [tech-debt-remediation](./tech-debt-remediation/playbook.md) | one-shot or recurring | improving quality of an existing estate without major reshape — security debt, observability debt, dependency debt, dead code, deprecated tech |
| [steady-state-governance](./steady-state-governance/playbook.md) | continuous practice | operating the architecture function — board cadence, decision lifecycle, principle and standard stewardship, exception process |
| [enterprise-integration-bootstrap](./enterprise-integration-bootstrap/playbook.md) | quasi-cyclic, integration platform | standing up an integration platform — iPaaS / event mesh / API gateway / service registry / B2B onboarding |
| [cloud-migration](./cloud-migration/playbook.md) | one-shot, cloud-focused | migrating to cloud — landing zone, 6Rs decisions per app, identity federation, FinOps from Day 1, exit posture |
| [vendor-evaluation-and-selection](./vendor-evaluation-and-selection/playbook.md) | one-shot, decision-focused | structured RFI / RFP / scoring / decision for selecting a major vendor with defensible rationale and contract terms input |
| [capability-based-planning](./capability-based-planning/playbook.md) | one-shot or recurring | business capability map, heatmap, value-stream alignment, investment direction per capability |
| [acquisition-due-diligence](./acquisition-due-diligence/playbook.md) | one-shot, time-bounded by deal | pre-deal technical diligence on a target company — risk register, integration cost estimate, crown-jewel inventory, deal-impact decisions |
| [divestiture-separation](./divestiture-separation/playbook.md) | one-shot, time-bounded by TSA forward | seller-side carve-out — boundary, TSA forward, identity / data separation, decommissioning of shared services, standalone architecture at TSA exit |
| [architecture-team-bootstrap](./architecture-team-bootstrap/playbook.md) | one-shot, with handoff to steady-state | creating an architecture function from zero — charter, founding principles, operating model, hiring plan, tooling, initial cadence |
| [business-continuity-readiness](./business-continuity-readiness/playbook.md) | quasi-cyclic, resilience-driven | proactive BCP / DR — criticality tiers, RTO/RPO targets, resilience architecture, recovery rehearsal cadence, evidence chain |
| [domain-driven-redesign](./domain-driven-redesign/playbook.md) | one-shot, scope-bounded | redesigning part of an estate using DDD — bounded contexts, context map, ubiquitous language, integration patterns between contexts |
| [decommissioning-program](./decommissioning-program/playbook.md) | one-shot, retirement-focused | focused legacy retirement — schedule, dependency closure, data archival, customer notice, contract termination, talent transition |

Contributions welcome — see *Contributing A Playbook* below.

## There Is No Default Playbook

Playbook selection is **per project**, not workspace-level. The
workspace-level `.architect/project-config.yaml` should leave `playbook`
empty. Each project under `.architect/architecture/<project-name>/` picks
its own playbook based on the engagement shape.

The architect is expected to **customize** the cloned config and the
playbook stance per engagement — playbooks are intentional starting points,
not constraints. Every playbook contains a `Customization Guide` for this.

## Why Playbooks Replace Flows And Presets

Earlier the workspace had two overlapping concepts:

- `flows/` — meant to describe engagement sequences but did not drive behavior
- `config/presets/` — config-only starting templates with no narrative or
  sequencing guidance

Playbooks unify both. One folder per engagement shape — the config and the
behavior live together. The result is fewer concepts, less duplication, and
a clearer entry point for new users.

## How To Choose A Playbook

| Signal | Likely playbook |
|---|---|
| "We need to document what we have" | `inventory-only` |
| "We have a known need and one team" | `quick-solution-design` |
| "We need to modernize, migrate, or decommission systems over time" | `migration-wave` |
| "We're shaping enterprise direction across multiple programs" | `full-togaf-adm` |
| "We're standing up or rationalizing an AI platform" | `ai-platform-bootstrap` |
| "A regulator is the reason for this work (DORA, NIS2, AI Act, PCI, HIPAA, SEC cyber, FedRAMP)" | `compliance-driven-modernization` |
| "We just acquired (or are about to acquire) another company and must integrate" | `post-acquisition-integration` |
| "We're building or rationalizing a data platform (lake / lakehouse / mesh, data products)" | `data-platform-modernization` |
| "We're standing up an internal developer platform with golden paths and self-service" | `platform-engineering-bootstrap` |
| "We need to decide what to invest / tolerate / migrate / eliminate across the portfolio" | `portfolio-rationalization` |
| "The CISO or threat landscape is driving architectural change (not a regulator)" | `security-uplift` |
| "Something just broke (outage, breach, data loss) and the architecture must change" | `post-incident-architecture-review` |
| "We need to improve quality of the existing estate without major reshape" | `tech-debt-remediation` |
| "The architecture function exists and needs to be operated as a continuous practice" | `steady-state-governance` |
| "We're standing up an integration platform (iPaaS / event mesh / API gateway / B2B)" | `enterprise-integration-bootstrap` |
| "We're migrating to cloud — landing zone, 6Rs decisions, FinOps from Day 1" | `cloud-migration` |
| "We need to select a major vendor with a structured RFI / RFP / scoring process" | `vendor-evaluation-and-selection` |
| "We're driving investment from business capabilities, not from applications" | `capability-based-planning` |
| "We're doing pre-deal technical diligence on a target company" | `acquisition-due-diligence` |
| "We're divesting a business unit and need to carve it out" | `divestiture-separation` |
| "We're creating an architecture function from zero" | `architecture-team-bootstrap` |
| "We need a proactive BCP / DR architecture program (RTO/RPO, rehearsals)" | `business-continuity-readiness` |
| "We're redesigning part of an estate using Domain-Driven Design" | `domain-driven-redesign` |
| "We're running a focused program to retire legacy systems" | `decommissioning-program` |
| "We don't know yet" | `inventory-only` first, then choose |

When the engagement does not match any playbook cleanly, fork the closest
one and tune it. Playbooks are starting points, not constraints.

## Cycling Vs One-Shot

Playbooks declare an engagement shape:

- **One-shot** — the engagement runs through its stages once and ends.
  Examples: `inventory-only`, `quick-solution-design`, `migration-wave`.
- **Cyclic** — the engagement runs through stages repeatedly as the
  enterprise direction evolves. Example: `full-togaf-adm`.

This distinction matters because it changes how review gates and
re-baselining should be treated. Cyclic playbooks expect periodic
revisitation; one-shot playbooks expect a clean exit.

## Playbook Structure (Required Sections)

Every playbook follows the same structure so an architect can scan
unfamiliar playbooks quickly and contributors know where to add depth.
Sections in order:

1. **Engagement Shape** — cyclic / one-shot, default mode, typical duration, output emphasis
2. **When To Use / Do Not Use** — engagement-fit signals
3. **What Good Looks Like** — outcome description
4. **Stages** — per-stage breakdown: entry signals → key questions → recommended skills → expected outputs → exit signals
5. **Recommended Skill Sequence** — the high-level skill chain
6. **Review Gates That Apply** — only the gates that materially apply
7. **Patterns Likely To Apply** — pre-curated pattern references for this engagement
8. **Common Anti-Patterns** — what typically goes wrong in this engagement
9. **Entry Criteria** — preconditions for starting
10. **Exit Criteria** — what "done" looks like
11. **Cycling Stance** — one-shot vs cyclic implications
12. **What This Playbook Does Not Do** — explicit non-goals
13. **First Working Session** — practical kickoff steps for the first hours
14. **Customization Guide** — what an architect should tune per engagement
15. **Getting Started** — how to adopt the playbook into a project
16. **Notes For Reviewers** — what reviewers should check in output produced under this playbook

Heavy / opinionated playbooks may also include:

- **Decision Points** — branches the engagement may take
- **Recommended Diagrams** — view types likely to be useful
- **Sample Backlog Of Open Questions** — common questions worth pre-loading into `architect-work/open-questions.md`

## Contributing A Playbook

A playbook should:

- describe one clear engagement shape — not a catalogue of options
- declare cyclic-or-one-shot stance explicitly
- include all required sections above
- recommend the *minimum* useful role, template, and skill set, not the
  whole library
- name only the review gates that materially apply
- include a Customization Guide so the architect knows what to tune
- include a First Working Session so the architect can start immediately
- include the ready-to-clone `project-config.yaml` file

Avoid creating a playbook that is mostly a copy of an existing one with one
field changed. Prefer adapting an existing playbook in-context.

## Relation To Other Workspace Concepts

- **Skills** — playbooks recommend a skill sequence; skills do the work
- **Roles** — playbooks enable a role set; roles describe accountability
- **Templates** — playbooks scope which templates are in play
- **Method** — playbooks reference and tailor the chosen project method
- **Patterns** — playbooks may recommend specific patterns but do not own them
- **Coordinator skill** — when a coordinator is active, it follows the
  playbook's recommended sequence and gates
