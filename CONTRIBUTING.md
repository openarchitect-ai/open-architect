# Contributing to Open Architect

Thanks for considering a contribution. Open Architect is an AI-aware
architecture workspace; the contribution surface is mostly markdown
(skills, patterns, playbooks, guidance) plus typed YAML (templates),
with a small layer of PowerShell validators. No heavyweight build —
the bar for a first contribution is low.

This file covers: what to contribute, how to set up, how to verify
your change, how to write commits and PRs, and where different kinds
of work go.

For the operational walkthrough of *using* the workspace as an
architect, see
[`.architect/guidance/working-with-open-architect.md`](.architect/guidance/working-with-open-architect.md).
For the design philosophy and feature set, see
[`README.md`](README.md). For where the project is going, see
[`ROADMAP.md`](ROADMAP.md).

## What to contribute

Open Architect grows along several axes. The ones most open to
external contribution today:

- **New skills** — protocols an AI tool follows for a piece of
  architecture work (drafting an artifact, running a review, packaging
  a publication). Markdown, no code.
- **New patterns** — reusable architecture design approaches. The
  pattern library is at [`.architect/patterns/`](.architect/patterns/);
  the README there shows the existing taxonomy.
- **New playbooks** — engagement-shaped templates that bind skills,
  roles, templates, and review gates into a coherent loop. The
  playbook catalog is at
  [`.architect/playbooks/`](.architect/playbooks/).
- **New artifact templates** — typed YAML for a new architecture
  artifact kind. Adding a new template is a coordinated change — see
  [`.architect/guidance/capability-maintenance.md`](.architect/guidance/capability-maintenance.md)
  for the full checklist.
- **New vocabulary bridges** — mappings from established notations
  (TOGAF, ArchiMate, C4, DDD, etc.) to OA's metamodel. Catalog at
  [`.architect/guidance/vocabulary-bridges/`](.architect/guidance/vocabulary-bridges/).
- **Worked examples** — fully-modeled sample engagements under
  [`.architect/examples/`](.architect/examples/). High-leverage for
  adoption; see the README in that folder.
- **Bug fixes and clarifications** in existing skills, patterns,
  guidance, or validators.
- **Validator improvements** — the three PowerShell scripts under
  [`.architect/validation/`](.architect/validation/).

If you're not sure what category your idea fits, **open an issue
first** — naming the work before doing it saves rework.

## Setup

Open Architect has no compile step. To work on it locally:

1. Clone the repository.
2. Open the repo in your editor of choice (VS Code with the Markdown
   and YAML extensions is the most common setup).
3. The capability library lives entirely under `.architect/`. The
   `workspace/` folder at repo root is gitignored — it's where users
   put real engagement work; you won't touch it as a contributor.

That's the entire setup. There are no dependencies to install, no
build to run.

## Verifying your change

Open Architect ships three PowerShell validators that check the
capability library for structural integrity:

| Validator | What it checks |
|---|---|
| [`Validate-Templates.ps1`](.architect/validation/Validate-Templates.ps1) | Every template YAML under `.architect/templates/` parses and follows the expected `template:` / `spec:` shape. |
| [`Validate-Capability.ps1`](.architect/validation/Validate-Capability.ps1) | Markdown cross-references across `.architect/` (and `AGENTS.md` / `README.md` at repo root) resolve. Catches broken links and missing files. |
| [`Validate-ArchitectureArtifacts.ps1`](.architect/validation/Validate-ArchitectureArtifacts.ps1) | Project-side artifact YAMLs follow the artifact metamodel. Pointed at the worked example by default; can be pointed at any project. |

Run all three before opening a PR:

```powershell
.\.architect\validation\Validate-Capability.ps1
.\.architect\validation\Validate-Templates.ps1
.\.architect\validation\Validate-ArchitectureArtifacts.ps1
```

All three should report `passed` with zero errors. A change that adds
files but doesn't update the corresponding cross-references will fail
`Validate-Capability` — that's intentional.

CI to run these validators automatically on every PR is planned (see
[`ROADMAP.md`](ROADMAP.md)) but not yet in place. Until then,
contributors run validators locally and report the result in the PR
description.

## Where different kinds of contributions go

A quick orientation map. Each kind of contribution has a target
folder and (where applicable) a checklist in
[`capability-maintenance.md`](.architect/guidance/capability-maintenance.md).

| Contribution | Path | Companion checklist |
|---|---|---|
| New skill | `.architect/skills/<skill-name>.md` | capability-maintenance §"Adding a new skill" |
| New pattern | `.architect/patterns/<domain>/<pattern-name>.md` | capability-maintenance §"Adding a new pattern" |
| New playbook | `.architect/playbooks/<playbook-name>/` (folder with `playbook.md` + `project-config.yaml`) | capability-maintenance §"Adding a new playbook" |
| New artifact template | `.architect/templates/<domain>/<kind>.yaml` + matching JSON Schema under `.architect/schemas/` | capability-maintenance §"Adding a new artifact template kind" |
| New vocabulary bridge | `.architect/guidance/vocabulary-bridges/<name>.md` | (no checklist; follow existing bridge shape) |
| New worked example | `.architect/examples/<example-name>/` | (folder mirrors a real engagement layout) |
| Convention or guidance refinement | `.architect/guidance/<file>.md` | (none; cross-reference check via Validate-Capability) |
| Validator improvement | `.architect/validation/Validate-*.ps1` | (none; run all three after edit) |

The `.architect/guidance/artifact-conventions.md` doc covers the
project-side artifact conventions (folder placement, ID numbering,
filename pattern, etc.) — read it before authoring any artifact-shaped
content.

## Commit conventions

Commit messages should describe the change on its own terms, in
language that a contributor with no other context can follow.

- **Title:** imperative mood, lowercase after the type marker if you
  use one, under 72 characters. Examples that work:
  - `Move requirement to requirements/ folder`
  - `Add data-object v1.2 excluded_attributes primitive`
  - `Tighten change-coordinator propagation pattern`
- **Body:** explain *why*, not *what*. The diff shows what; the body
  should explain the reasoning, alternatives considered, and any
  migration cost for users of the affected component.
- **Reference files and sections** specifically (path + section name)
  rather than vague descriptions.
- **Do not reference internal testing or synthetic engagement data**
  in commit messages. If a change was surfaced by an internal test,
  describe the capability gap on its own terms — what was wrong or
  missing — rather than as follow-up to a private test surface.
- **Validators clean** is a precondition for merge. State the
  validator result in the PR description, not the commit body.

A representative recent commit body:

> *"Two small additions to the diagram-author flow.*
>
> *1. Negative-space documentation entities are a legitimate diagram
> pattern but weren't codified. They surface structural exclusions
> (a field/relationship/component that a decision, constraint, or
> regulation prohibits) as a visual documentation device. Adds a
> 'Negative-Space Documentation Entities' section to
> guidance/diagram-conventions.md defining when the exception is
> legitimate..."*

The good shape: the change is explained as a capability gap and its
fix, with the affected files and sections named.

## Pull request shape

A PR description should answer four questions:

1. **What changed?** A bulleted list of the substantive edits. Path
   + section is good; "various" is not.
2. **Why?** The capability gap or defect this addresses. If the change
   touches a convention, cite which one and how it shifts.
3. **What was considered and rejected?** Optional but valuable for
   non-trivial changes. Names alternatives that someone reading later
   might re-propose.
4. **Validators result.** Output of the three validators, or a note
   that the change doesn't affect what they check.

PRs that touch a convention (anything under `.architect/guidance/` or
`.architect/config/`) should also explain the migration cost for
users with existing artifacts following the previous convention.

## Definition of done

A contribution is ready to merge when:

- All three validators report `passed` with zero errors locally.
- Any cross-references the change introduces resolve (e.g. if you add
  a skill, the skill's "Read first" list points to existing files).
- The PR description answers the four questions above.
- If the change adds a new file type (skill, pattern, playbook,
  template), the corresponding `README.md` or index in that folder is
  updated to list it.

## Code of conduct

Contribution to Open Architect requires adherence to the project's
Code of Conduct (`CODE_OF_CONDUCT.md` at repo root). In short:
discuss substance, not people; assume good faith; be honest about
trade-offs.

## License

Open Architect is released under the license at [`LICENSE`](LICENSE).
By contributing, you agree your contributions are licensed under the
same terms.

## Questions?

For substantive design questions, open an issue with the
`design-question` label. For "how do I…" questions about using OA as
an architect (not as a contributor), see
[`working-with-open-architect.md`](.architect/guidance/working-with-open-architect.md)
first.
