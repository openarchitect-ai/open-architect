# Working With Open Architect

## Purpose

A short, user-facing guide for architects who are starting to use Open
Architect day-to-day. Open Architect is *AI-aware infrastructure* — it
gives your AI tool (Claude Code, Codex, Copilot, or another) a clear
contract about how to behave, but the architect drives the work via
conversation. This guide says what that actually looks like in
practice.

If you're a maintainer of the OA library itself rather than a user of
it, see [`capability-maintenance.md`](./capability-maintenance.md)
instead.

## The shape of an OA session

You don't run OA directly. You open your AI tool inside the project
folder, and the AI tool reads the workspace conventions before
responding. The architect describes what they want in plain language;
the AI proposes the work; the architect approves; the AI writes the
files.

There's no `architect run <skill>` command. There are no scripts that
execute skills. Skills are *protocols* — markdown files that tell the
AI how to do a piece of architecture work.

## Running a skill

To run a skill, ask your AI tool to run it.

```
(you) "Run the architecture-documenter skill to assemble an HLD pack
       for the solution-direction gate."
```

What the AI will then do:

1. Read [`.architect/skills/architecture-documenter.md`](../skills/architecture-documenter.md) — the procedure
2. Read [`AGENTS.md`](../../AGENTS.md) — the workspace's behavioral conventions
3. Read [`.architect/config/workspace-defaults.yaml`](../config/workspace-defaults.yaml) and the project's `project-config.yaml` — engagement context
4. Read the relevant architect-work files, source documents, and existing artifacts
5. Follow the skill's *Steps* section
6. Produce the outputs the skill's *Outputs* section names
7. Propose a `working-log.md` entry summarizing the run

In a project with a coordinator role enabled, the AI may also
*recommend* running a skill on its own (e.g. "review gate is
approaching, recommend running review-pack-builder, approve?"). You
approve before the skill runs. See
[`agent.config.md`](../config/agent.config.md) for coordinator routing.

## Updating architect-work files

The four topical files plus the working log and change register live
under `workspace/<project>/architect-work/`. They carry the project's
state across sessions.

You update them the same way you run a skill — in conversation.
Describe what changed; the AI proposes the writes; you approve.

### Example: a sponsor answers a question

```
(you) "Sponsor confirmed: German market, GDPR applies. Healthcare
       sector profile. They want a Q3 2026 go-live. Sponsor is
       <name>."

(AI)  "Proposed updates across these files — approve?

       open-questions.md
         - Close 4 questions answered today
       answers-and-confirmations.md
         - Add 4 confirmations
       project-config.yaml
         - compliance.jurisdictions: [eu-eea, germany]
         - compliance.applicable_regulations: [gdpr]
         - compliance.industry_sectors: [healthcare]
       architect-task-list.md
         - Move 4 Ask tasks to Done
       working-log.md
         - New entry: 'Sponsor confirmed scope and go-live'
       change-register.md
         - New entry: requirement-baseline scope established"

(you) "yes"

(AI)  writes the 6 files
```

### Example: you complete a task

```
(you) "I sent the Mulesoft inventory request to IT ops today."

(AI)  "Proposed updates — approve?

       architect-task-list.md
         - Move 'Request Mulesoft inventory' from Immediate to Waiting On Others
       evidence-requests.md
         - Update Requested with the date sent
       working-log.md
         - New entry: 'Mulesoft inventory request sent'"

(you) "yes"
```

### Example: a requirement changes

For requirement changes specifically, the dedicated
[`change-coordinator`](../skills/change-coordinator.md) skill runs the
full procedure — classify the change, assess impact, evaluate the
decision threshold, respect the freeze gate, populate the change
register. See [`requirement-change-handling.md`](./requirement-change-handling.md)
for the procedure.

## How approvals work

The default project-config sets:

- `conventions.architect_work_auto_capture: true` — the AI identifies follow-up material that belongs in architect-work files
- `conventions.architect_work_auto_update_mode: approval-before-write` — the AI may *prepare* updates but must not write them until the architect explicitly approves
- `conventions.architect_work_auto_update_scope: architect-work-only` — this automation only applies to the architect-work folder; never to architecture artifacts (solutions, decisions, etc.)
- `conventions.artifact_creation_requires_explicit_request: true` — architecture artifacts (SOL-*, DEC-*, etc.) are created only when the architect explicitly asks
- `conventions.allow_agent_auto_approval: false` — the AI cannot approve its own writes

This means: **nothing in your workspace changes without your approval.**
The AI proposes; you approve; it writes. If you don't approve, nothing
happens — the AI doesn't push back, doesn't "save the draft anyway,"
and doesn't try to be clever.

## Three things architects don't need to do (the AI handles them)

If you stay inside the conversational model:

- **You don't manually maintain working-log entries.** Skills propose them when they run.
- **You don't manually keep the architect-work files in sync.** Tell the AI what changed; it proposes updates across the relevant files.
- **You don't manually track what's been answered, what's been confirmed, what's still open.** That's what the four topical files are for, kept current by the conversational pattern above.

What you DO do:

- Drive the engagement (you decide what to investigate, what to model, what to commit to)
- Make decisions (the AI proposes; you accept or refuse)
- Approve writes (nothing happens without your say-so)
- Run skills (you say which one and when)
- Communicate with stakeholders (the AI doesn't talk to your sponsor; you do)

## Common patterns at the start and end of a session

### Starting a session

If you're returning to a project after time away, the first thing to
run is [`project-recap`](../skills/project-recap.md). It reads your
project state and gives you a structured briefing — what's confirmed,
what's open, what's stale, what's drifted, what matters most.

```
(you) "Run project-recap on smoke-test-2026-05-22."
```

### Ending a session

Before you stop for the day or week, propose to your AI that it adds a
working-log entry summarizing what happened. If you've done substantive
work, a working-log entry is the project's narrative — it carries the
session forward for next time.

```
(you) "Wrap up — add a working-log entry summarizing today's session."
```

## Sample conversation: a one-hour working session

```
(you) "I'm picking up smoke-test-2026-05-22. Run project-recap first."

(AI) ...produces a project-recap briefing showing 22 open questions,
     3 blockers, etc.

(you) "Now let's address the compliance scope. Sponsor confirmed
       Germany / GDPR / healthcare."

(AI) ...proposes architect-work updates and project-config.yaml
     updates...

(you) "yes"

(AI) ...writes them...

(you) "Now produce a sponsor briefing reflecting the new state."

(AI) ...assembles a publication package via communication-packager
     under workspace/<project>/publications/<date>-sponsor-briefing/...

(you) "Looks good. Add a working-log entry summarizing the session
       and we'll stop here."

(AI) ...proposes the entry, you approve, it writes it.
```

That's a full session: re-orient, answer a question, push the work
forward, package the update for the sponsor, capture the narrative.
Five exchanges; the architect drove the engagement; the AI handled
all the file maintenance with explicit approval at every write.

## Where to learn more

- [`.architect/skills/`](../skills/) — every skill is documented as a markdown file with Steps, Outputs, Quality Checks
- [`.architect/playbooks/`](../playbooks/) — engagement shapes with first-working-session scripts
- [`AGENTS.md`](../../AGENTS.md) — the workspace's display contract for AI responses
- [`agent.config.md`](../config/agent.config.md) — full reference for the conventions (advanced)
- [`publication-package-shape.md`](./publication-package-shape.md) — what a publication package looks like
- [`requirement-change-handling.md`](./requirement-change-handling.md) — the procedure when requirements change
- [`capability-maintenance.md`](./capability-maintenance.md) — maintainer-focused, for OA library contributors

## What this guide does NOT cover

- *Inside* the AI tools themselves — keyboard shortcuts, prompts, slash commands. Those are tool-specific.
- The conventions in deep detail — see [`agent.config.md`](../config/agent.config.md).
- How to write your own skills, patterns, or playbooks — see [`capability-maintenance.md`](./capability-maintenance.md).
- How to publish content to your organisation's documentation system — see [`publication-package-shape.md`](./publication-package-shape.md), specifically the boundary note that this is your org's documentation policy, not OA's.
