# Open Architect — Roadmap

**Status:** Capability version 0.1.0. The capability library is
complete enough to run real engagements end-to-end. The current
focus is **adoption-readiness** — making the project as easy to pick
up as it is to use.

This file is mutable: items move buckets, get reprioritized, or get
dropped as the project evolves. For per-release detail, see
[`.architect/CHANGELOG.md`](.architect/CHANGELOG.md). For maintainer-
level narrative on what's been built and why, see
[`.architect/guidance/current-state.md`](.architect/guidance/current-state.md).

---

## Now (active focus)

These are being worked on or queued for the immediate next cycle.
Expect movement within weeks.

- **Worked examples #2 and #3.** Only one worked example
  (`customer-onboarding-modernization`) exists today, and a single
  example doesn't show the range of engagement shapes OA supports.
  Two complementary additions in scope: an AI-platform-bootstrap
  example and a regulated quick-solution-design example covering
  post-baseline change handling, integration-against-decommissioning
  legacy, and DPIA / Betriebsrat-style compliance preconditions.
  **The single highest-leverage adoption-friction reducer.**
- **OSS scaffolding completion.** `CONTRIBUTING.md` (this file's
  sibling), this `ROADMAP.md`, a `CODE_OF_CONDUCT.md`, a
  `SECURITY.md`, GitHub issue templates, and a PR template. Several
  of these are landing as a single contributor-readiness pass.
- **CI via GitHub Actions** running the three validators
  (`Validate-Templates`, `Validate-Capability`,
  `Validate-ArchitectureArtifacts`) on every PR. Closes the manual-
  validation gap for community contributions.

## Next (planned, near-term)

Queued work, expected to start when the *Now* cycle clears.

- **AI patterns Tier 2.** The current AI pattern library covers the
  foundational set (lifecycle, evaluation, guardrails, agentic
  bounds). Tier 2 adds inference-caching, inference-cost-budgeting,
  ai-platform-tenant-isolation, AI Act Article 50 disclosure
  patterns, hallucination-detection, model-red-teaming, and
  human-in-the-loop review.
- **Mechanical gap-radar.** The gap-radar checklists are currently
  human-readable markdown. Making them runnable validators (closer in
  shape to `Validate-Capability.ps1`) would let gap-radar run in CI
  and surface checklist findings mechanically.
- **Tool integration scaffolds.** OA mentions Claude Code, Codex, and
  Copilot as supported AI tools but only ships convention files for
  the Claude / Codex shape (`AGENTS.md`). A
  `.github/copilot-instructions.md` would close the GitHub Copilot
  parity gap. Doc clarifying the M365 Copilot boundary fit (sits on
  the publication-package side, not the workspace side) is also
  outstanding.
- **Additional vocabulary bridges.** Six bridges exist today (TOGAF,
  ArchiMate-Lite, C4, DDD, BIZBOK, Cloud Well-Architected). Next-
  most-requested: Wardley Mapping, ISO/IEC/IEEE 42010, Zachman.
- **ADR practice for OA's own design decisions.** Architecture
  Decision Records under a `decisions/` folder, capturing the
  rationale for non-obvious choices in the capability library
  (folder placement, convention bindings, etc.) — so contributors
  reading a convention can also read the reasoning that produced it.

## Later (direction-setting, not committed)

Strategic bets that would change what OA does. Not on a schedule;
listed here so contributors and users can see the longer-term shape.

- **Reverse-engineering brownfield architectures into OA artifact
  sets.** Point OA at an existing undocumented enterprise system —
  Confluence + ADO + GitHub repos + Slack history + tribal knowledge
  — and propose the OA artifact set that describes what's there. Would
  reframe OA from *"tool for new architecture design"* to *"the way
  you finally know what your enterprise architecture actually is."*
  Substantial undertaking; high asymmetry on hallucination risk.
- **Live agentic background runner.** A daemon that watches the
  workspace and runs gap-radar, change-coordinator, capability-radar
  proactively as the architect works — surfacing concerns in real
  time rather than waiting for the architect to invoke skills
  manually. Turns OA from reactive tool to watchful conscience.
- **One-prompt engagement bootstrap.** Sponsor email + attached docs
  in, scaffolded engagement out — picks the right playbook, drafts
  initial stakeholder / objective / vision artifacts, populates
  open-questions, proposes a session-1 plan. Zero-to-engagement
  drops from ~2 hours to ~5 minutes.
- **Portfolio-level cross-project view.** Aggregator across all
  `workspace/<project>/` folders: which projects have which review
  gates passed, who owes you what across engagements, which
  stakeholders span multiple projects, where evidence gaps cluster.
  High leverage for architects running multiple engagements
  concurrently.

## Considered but not committed

Ideas that are interesting but haven't earned a commitment bucket
yet. These are visible here mostly so contributors with related ideas
know where the existing thinking lives.

- **Executable agent payloads.** OA's multi-agent execution scaffold
  exists structurally but no skill has been bound to an agent profile
  and run against a real engagement. Tests the multi-agent thesis.
- **Compliance-to-control traceability.** Linking compliance profiles
  to artifacts, assessments, and validator behavior more tightly than
  today's flag-based gating.
- **Slash-command shims** for Claude Code (`.claude/commands/`) and
  Codex equivalent — exposing skills as discoverable slash commands
  in addition to plain-language invocation.
- **Formal Copilot Studio custom-agent recipe.** For organizations
  that want M365 Copilot to drive OA-style work directly via a
  custom-grounded agent. Enterprise-IT shape, not a clean repo-level
  integration.

---

## How to read this roadmap

- **Now** items are committed and active.
- **Next** items are queued and expected.
- **Later** items are direction, not schedule — they will happen but
  not soon, and not all of them.
- **Considered** items are inputs to future cycle planning; some
  will graduate to *Later* or *Next*, some will drop.

If you want to contribute toward any of these, or propose adjusting
the priority, open an issue. See
[`CONTRIBUTING.md`](CONTRIBUTING.md) for the contribution path.

## Cadence

This roadmap is reviewed at the close of each capability-library
cycle. Items don't sit in *Now* indefinitely — they move to *Next*
or get re-shaped if they're not converging.

Last reviewed: 2026-05-24.
