# Agent Config

This guide explains how Open Architect's two configuration files work
together: workspace-level defaults and per-project engagement config.

## The Two Files

| File | Scope | What lives here |
|---|---|---|
| `.architect/config/workspace-defaults.yaml` | Workspace-level | Cross-project defaults: workspace metadata, default method, `conventions:` (agent behavior defaults), default `runtime.execution_mode` |
| `workspace/<project-name>/project-config.yaml` | Per-engagement | The active playbook, applicable compliance scope, enabled roles/templates/skills, governance (review checkpoints, approval roles), and any project-specific overrides of the workspace defaults |

Engagement-specific decisions (compliance scope, roles enabled,
templates enabled, skills enabled, review checkpoints) only make sense
once a playbook has been picked, so they live exclusively in the
per-project file. The workspace itself isn't an engagement.

A project's `project-config.yaml` inherits defaults from
`workspace-defaults.yaml` and overrides individual fields as the
engagement requires.

## Purpose

`project-config.yaml` (per-engagement) defines which parts of the Open
Architect capability are active for that specific project and which
architecture context an agent should assume by default.

Use it to decide:

- which engagement playbook the project is using
- which roles are in scope
- which templates the project will use
- which skills are enabled
- which method and reference methods guide the work
- which governance expectations apply
- which execution model and runtime state the agents should use
- which operating style and work mode the user wants by default
- which workspace defaults (from `workspace-defaults.yaml`) to override

This prevents every project from inheriting the full architecture capability by
default.

## How To Use It

Recommended approach:

1. Pick the engagement playbook closest to your work from [`.architect/playbooks/`](../playbooks/README.md) and copy its `project-config.yaml` into your `workspace/<project-name>/` folder. (The `architect new <project> --playbook <name>` CLI does this for you.)
2. Set the project name and architecture scope.
3. Confirm or adjust the primary method and any reference methods.
4. Confirm or trim the enabled roles to those that will actually participate.
5. Confirm or trim the enabled templates to those needed for the project.
6. Add skills later as the project matures.
7. Confirm governance roles and review expectations.
8. Decide whether the project is `architect-assist` or `coordinator-led`.
9. Set a default work mode such as `inventory`, `analysis`, or `modeling`.
10. If you want one default orchestrating agent, set the coordinator role and skill.
11. Keep ownership truthful; do not let agents guess named owners to make artifacts look complete.
12. If the project will use real multi-agent execution, configure the runtime section and agent profiles explicitly.

## Field Guidance

The fields below describe the schema used by both
`workspace-defaults.yaml` (workspace-level defaults) and per-project
`project-config.yaml`. As described in [The Two Files](#the-two-files)
at the top of this guide, workspace-defaults holds only `project`
metadata, `conventions`, and `runtime` defaults. Engagement-specific
blocks — `compliance`, `roles`, `templates`, `skills`, `governance`,
and `project.playbook` — live exclusively in the per-project file.
A project's `project-config.yaml` may also override individual
`conventions:` or `runtime:` fields when the engagement requires it.

### `project`

- `name`: project or workspace name
- `architecture_scope`: suggested values include `enterprise`, `solution`, or `enterprise-and-solution`
- `architecture_mode`: use `project-local` unless you later support shared or federated modes
- `operating_style`: suggested values:
  - `architect-assist`
  - `coordinator-led`
  - `external-orchestrated`
- `primary_method`: the method document the project follows
- `reference_methods`: supporting reference methods such as ADM or transition architecture guidance

Recommended default:

- `operating_style: architect-assist`

Use `architect-assist` when the architect remains the primary driver and agents
are meant to support bounded tasks rather than advance a workflow on their own.

### `roles.enabled`

List only the roles used by this project.

Examples:

- small solution-focused project:
  - `solution-architect`
  - `business-analyst`
  - `integration-architect`
  - `security-architect`
- broader transformation:
  - `chief-architect`
  - `business-architect`
  - `enterprise-architect`
  - `solution-architect`
  - specialist roles as needed

### `templates.enabled`

List only the template kinds in scope for the project.

Examples:

- integration-heavy project:
  - `application`
  - `application-service`
  - `interface`
  - `data-object`
  - `solution`
  - `transition-architecture`
- enterprise planning project:
  - `stakeholder`
  - `objective`
  - `business-capability`
  - `architecture-vision`
  - `roadmap`

### `skills.enabled`

This can start empty.

Populate it later when reusable architecture skills are defined in
`.architect/skills/`.

For an architect-assist project, start with a small set such as:

- `baseline-discovery`
- `requirement-normalizer`
- `solution-modeler`
- `architecture-review`

Add coordination-heavy or delivery-heavy skills only when you explicitly want
them.

### `project.playbook`

Name the engagement playbook this project is using. Playbooks live under
[`.architect/playbooks/`](../playbooks/README.md) and bundle a stage-by-stage
brief, recommended skill sequence, applicable review gates, anti-patterns,
customization guide, and a ready-to-clone `project-config.yaml`.

There is **no workspace-level default playbook.** The `playbook` field
is set per-project in `workspace/<project-name>/project-config.yaml`.
The workspace-level `.architect/config/workspace-defaults.yaml` does not
hold a `playbook` field at all — the workspace itself isn't an engagement.

Available values:

- `inventory-only`
- `quick-solution-design`
- `migration-wave`
- `full-togaf-adm`
- `ai-platform-bootstrap`
- `compliance-driven-modernization`
- `post-acquisition-integration`
- `data-platform-modernization`
- `platform-engineering-bootstrap`
- `portfolio-rationalization`
- `security-uplift`
- `post-incident-architecture-review`
- `tech-debt-remediation`
- `steady-state-governance`
- `enterprise-integration-bootstrap`
- `cloud-migration`
- `vendor-evaluation-and-selection`
- `capability-based-planning`
- `acquisition-due-diligence`
- `divestiture-separation`
- `architecture-team-bootstrap`
- `business-continuity-readiness`
- `domain-driven-redesign`
- `decommissioning-program`

Recommended approach:

1. Pick the closest playbook from [`../playbooks/`](../playbooks/README.md).
2. Read its `playbook.md` end-to-end before copying the config.
3. Copy its `project-config.yaml` into a new project folder under
   `workspace/<project-name>/project-config.yaml`.
4. Set `project.playbook` to the playbook name so future agents and human
   reviewers can see which engagement shape was intended.
5. Tune the rest per the playbook's Customization Guide.

If no playbook fits cleanly, fork the closest one. Playbooks are starting
points, not constraints.

### `conventions`

Use this section to declare project-wide expectations that may later be
validated automatically.

Suggested architect-assist conventions:

- `user_is_primary_driver: true`
- `default_work_mode: inventory`
- `guided_mode_support: true`
- `guided_mode_depth: standard`
- `clarify_operating_context_first: true`
- `include_architect_tasks_in_all_modes: true`
- `maximize_followup_task_capture: true`
- `announce_active_role_and_skill: true`
- `response_display_style: architect-friendly`
- `response_display_enforcement: strict`
- `response_session_banner: table`
- `response_status_labels: true`
- `response_task_grouping: ask-confirm-request-decide`
- `response_bottom_line: true`
- `response_structured_choices: true`
- `architect_work_auto_capture: true`
- `architect_work_auto_update_mode: approval-before-write`
- `architect_work_auto_update_scope: architect-work-only`
- `artifact_creation_requires_explicit_request: true`
- `next_step_recommendations_only: true`
- `auto_progression: false`
- `ask_before_scope_changes: true`
- `ask_before_status_changes: true`
- `ask_before_owner_creation: true`
- `allow_agent_auto_approval: false`
- `default_agent_output_status: draft`
- `stop_on_decision_changes: true`
- `stop_on_governance_status_changes: true`
- `evidence_required_for_approval: true`

Suggested ownership convention for live project artifacts:

- use `confirmed:<owner>` when ownership is actually confirmed
- use `role-placeholder:<role>` when only the responsibility shape is known
- use `tbd` or `unknown` when ownership is not yet known

This keeps architecture stewardship honest and prevents plausible-sounding but
invented ownership from becoming accidental truth.

Use context clarification as a first-class behavior, not as an afterthought.

Recommended convention:

- `clarify_operating_context_first: true`

Use this when the assistant should assume that the project or task context may
be incomplete until it has been made explicit. In practice, that means:

- state the current working interpretation of the task
- distinguish source facts from inferred context
- call out the minimum context questions that would materially change the work
- avoid silently acting as if the project goal, state, or scope is already known

You can also express how the agent should handle unresolved questions.

Recommended convention:

- `ask_user_on_blocking_open_questions: true`
- `allow_progress_on_non_blocking_open_questions: true`

Use this when the project wants the coordinator to ask the user directly when
an open question materially blocks safe progression, instead of only recording
that question in summaries or handoffs.

Use `allow_progress_on_non_blocking_open_questions: true` when the project
wants the coordinator and specialist agents to keep moving on bounded work as
long as the unresolved question does not make the next step unsafe or
misleading.

### Work Modes

Use a default work mode so the agent knows what kind of help is wanted before
it starts producing architecture outputs.

Recommended modes:

- `inventory`
  - extract and structure facts from source material
  - do not invent architecture conclusions
  - do not create architecture artifacts unless explicitly asked
- `analysis`
  - summarize, cluster, compare, or identify dependencies and risks
  - recommendations are allowed
  - architecture artifacts still require explicit request
- `modeling`
  - create or update architecture artifacts
  - use only when the user explicitly wants architecture assets
- `review`
  - critique an existing model, decision, or artifact set
- `decision`
  - compare options and recommend a choice

See [`.architect/guidance/work-modes.md`](../guidance/work-modes.md) for the
full behavior guidance.

When `guided_mode_support: true`, the agent should not just perform the task. It
should also help the architect move forward by making the current situation
clear.

Recommended guided output elements:

- active role and skill
  - which role lens and which skill or playbook are being used for this task
- what is known
- the current working interpretation
- what matters most
- what remains unclear
- what the result means
- the next sensible move
- architect tasks
  - the concrete things the architect should now do, ask, confirm, or review
- bottom line
  - a short closing takeaway or decision boundary

Use `guided_mode_depth` to tune how much of that guidance is included:

- `concise`
  - short orientation and next step
- `standard`
  - orientation, key gaps, and next-step guidance
- `detailed`
  - fuller coaching and explicit decision support

If `conventions.include_architect_tasks_in_all_modes` is `true`:

- every mode should leave the architect with concrete next actions
- those actions may include questions to ask, evidence to collect, people to
  confirm with, decisions to prepare, or artifacts to review
- the task list should stay mode-appropriate and should not force modeling or
  orchestration when the user did not ask for it

If `conventions.maximize_followup_task_capture` is `true`:

- do not stop at a single next step when several useful follow-ups are already
  visible
- capture the architect's likely next tasks in batches when the source supports
  it
- prefer short, practical task lists over repeated one-question-at-a-time
  follow-ups
- separate high-confidence tasks from lower-confidence suggestions when needed

If `conventions.announce_active_role_and_skill` is `true`:

- say which role lens is active for the current task
- say which skill or playbook is being used, if any
- do this near the start of the response so the architect can see the working stance
- if no named skill is being used, say that the assistant is working without an explicit skill

If `conventions.response_display_style` is `architect-friendly`:

- responses should follow the architect-friendly display contract by default

If `conventions.response_display_enforcement` is `strict`:

- responses must begin with a `Session` block unless the task is trivially short
- responses must use the standard section order unless the user explicitly asks for a different format
- responses must use grouped architect tasks when a task bundle is present
- responses must end with a short `Bottom Line` when the answer is more than a quick one-liner

If `conventions.response_session_banner` is `table`:

- the `Session` block should be rendered as a two-column table with `Field` and `Value`

If `conventions.response_status_labels` is `true`:

- use status labels such as `CONFIRMED`, `PROVISIONAL`, `OPEN`, `BLOCKER`, `ACTION`, `REQUEST`, and `DECISION` where they improve scanability

If `conventions.response_task_grouping` is `ask-confirm-request-decide`:

- group architect tasks as `Ask`, `Confirm`, `Request`, and `Decide` unless the task list is too small to benefit

If `conventions.response_bottom_line` is `true`:

- include a short `Bottom Line` takeaway at the end of substantial responses

If `conventions.response_structured_choices` is `true`:

- when a decision has **2-4 discrete, mutually-exclusive options with non-trivial trade-offs**, surface it via the host's structured-choice UI (e.g. `AskUserQuestion` in Claude Code) in addition to the prose explanation
- use it for: immediate next-step choices at end of response, `Decide` architect tasks with pickable options, and option-comparison tables in the body
- skip for: yes/no confirmations, open-ended exploration, scope-clarifying questions mid-task, decisions the user can't make unilaterally
- where the host has no structured-choice primitive (most non-Claude AI tools today), fall back to prose options
- see [`response-display.md`](./response-display.md) for the full convention

If `conventions.architect_work_auto_capture` is `true`:

- identify follow-up material that belongs in `architect-work/`
- classify it into the appropriate working files:
  - `open-questions.md` — unresolved questions, grouped by domain
  - `answers-and-confirmations.md` — confirmed facts and current working interpretation
  - `evidence-requests.md` — what's been received and what's still missing
  - `architect-task-list.md` — Ask / Confirm / Request / Decide tasks
  - `working-log.md` — chronological, plain-language narrative of what happened on the project (newest entry on top)
- surface those proposed updates as part of the response when useful
- when a skill runs (`project-recap`, `baseline-discovery`, `gap-radar`, `solution-modeler`, `decision-recorder`, etc.) it should propose a `working-log.md` entry summarizing the run in plain language so the project's story remains readable to someone joining cold

### Item formatting convention

Items inside `open-questions.md`, `answers-and-confirmations.md`,
`evidence-requests.md`, and `architect-task-list.md` are written as
**Markdown bullets** (`- ...`), matching the `- ...` placeholders in
the scaffolded templates. Status-label emoji and bold come *after* the
bullet marker, never instead of it:

- ✅ Correct: `- 🚫 **Existing Mulesoft inventory** — what's deployed today`
- ❌ Wrong: `🚫 **Existing Mulesoft inventory** — what's deployed today`

The bullet form is what `architect status` and any future validators
count. Paragraph or emoji-prefixed-only items will be invisible to
those tools.

The `working-log.md` file is the exception — its entries are dated H2
headings (`## YYYY-MM-DD — title`) followed by free-form prose under
`What I did:` / `What I found:` / `Biggest signal:` / `See also:`
labels, because the log is narrative, not categorical.

If `conventions.architect_work_auto_update_mode` is `approval-before-write`:

- the assistant may prepare `architect-work/` updates automatically
- it must not write those updates until the architect confirms
- confirmation may be explicit in the current exchange or via a clear user instruction to update the files

If `conventions.architect_work_auto_update_scope` is `architect-work-only`:

- apply this automation only to the project-local `architect-work/` folder
- do not extend the same writeback behavior to formal architecture artifacts unless the user asks for it

See [`.architect/config/response-display.md`](./response-display.md) for the display pattern.

### `governance`

Use this section to declare the roles that own architecture, requirements, and
review responsibility for the project.

Recommended coordinator fields:

- `coordinator_role`: the default coordinating role for the project
- `coordinator_skill`: the default orchestration skill used to route the next
  step
- `coordinator_auto_route`: when `true`, the coordinator should choose the next
  role or skill unless the user explicitly overrides it

Suggested coordinator-led default:

- `coordinator_role: chief-architect`
- `coordinator_skill: architecture-coordinator`
- `coordinator_auto_route: true`

Suggested architect-assist default:

- `coordinator_auto_route: false`

Use `false` when the architect wants next-step recommendations but does not want
the workspace to move itself through a process.

### `runtime`

Use this section when the project wants actual multi-agent execution rather than
only role-guided single-agent work.

Suggested fields:

- `execution_mode`
  - `single-agent-guided`
  - `coordinator-led-multi-agent`
  - `external-orchestrated`
- `coordinator_agent_profile`
  - path to the coordinating runtime profile under `agents/`
- `state_root`
  - path to the live runtime state folder
- `task_artifact`
  - standard task payload used for assignments
- `handoff_artifact`
  - standard handoff payload used between agents
- `allow_parallel_specialists`
  - whether multiple specialist agents may run at once
- `require_validation_before_handoff`
  - whether a specialist agent must validate before completing a handoff

Recommended architect-assist runtime:

- `execution_mode: single-agent-guided`
- `allow_parallel_specialists: false`

Recommended coordinator-led runtime:

- `execution_mode: coordinator-led-multi-agent`
- `coordinator_agent_profile: .architect/agents/chief-architect.md`
- `state_root: .architect/runtime`

Without this runtime layer, the workspace should be treated as single-agent work
that can switch among roles and skills without instantiating separate live
agents.

## Approval Threshold

In an architect-assist project, agents should default to:

- allowed without asking:
  - extract facts
  - summarize documents
  - cluster interfaces or applications
  - compare options
  - recommend next steps
- ask first:
  - create or update architecture artifacts
  - create review packets or runtime artifacts
  - change scope assumptions
  - change statuses or approvals
  - introduce owners or stakeholders not grounded in source evidence

If `conventions.clarify_operating_context_first` is `true`:

- assume the operating context may still need clarification
- make the current interpretation explicit before leaning into conclusions
- keep a visible boundary between source evidence and inferred framing
- surface the smallest context questions that would change the next step

## Open Question Behavior

If `conventions.ask_user_on_blocking_open_questions` is `true`:

- the coordinator should ask the user directly when an unresolved question
  materially blocks the next safe step
- specialist agents may record open questions, but should route blocking ones
  back through the coordinator
- non-blocking questions may still be tracked in notes, handoffs, or review
  packets without pausing the flow

If `conventions.allow_progress_on_non_blocking_open_questions` is `true`:

- unresolved but non-blocking questions should be classified explicitly as
  `non-blocking`
- agents may continue with the next safe bounded step
- those questions should still be carried forward in coordination summaries,
  handoffs, review packets, or `notes.open_questions`
- the presence of a non-blocking question should not be turned into a fake
  fact just to make the artifact look complete

## Suggested Defaults

If you are unsure, start with:

- the `inventory-only` playbook (lightest engagement shape)
- `architecture_scope: enterprise-and-solution`
- `architecture_mode: project-local`
- a small but realistic role set
- a reduced template set instead of the full library

## Good Practice

- keep the configuration small and intentional
- review it when the project scope changes
- align it to the chosen project method
- treat it as the control point for future automation and validation
- if one coordinating role should route the rest of the work, make that explicit
  in `governance` so agents do not guess differently
