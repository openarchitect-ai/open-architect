# Open Architect

Open Architect is an open source, AI-assisted workspace for enterprise
architects and solution architects.

It is designed to help practicing architects work from real project evidence,
capture architecture as structured knowledge when useful, and bring AI support
into architecture work without forcing heavy process or premature modeling.

The core idea is simple:

- keep architecture guidance close to the project
- start from source material and explicit questions
- move from inventory to analysis before modeling
- create architecture artifacts only when they are actually useful
- support both human architects and AI-assisted workflows

## Why Open Architect

Most architecture work is fragmented across documents, diagrams, wikis, and
delivery boards. That makes it hard to:

- understand the current estate clearly
- maintain a coherent target state
- trace requirements, decisions, and transition steps
- govern change over time
- reuse architecture knowledge across projects
- support AI agents with reliable architecture context

Open Architect treats architecture as a project-local capability with:

- lightweight project startup
- reusable templates and guidance
- explicit roles, skills, and working modes
- optional structured architecture artifacts
- optional advanced orchestration when a project actually needs it

## What Is In This Repository

This repository currently contains the `.architect` capability structure,
including:

- architecture templates for business, application, data, technology, governance, and change
- project-local guidance and conventions
- role definitions for architects
- method and reference method content
- prompt recipes, starter-project guidance, and lightweight presets
- markdown flow definitions for architecture development and coordination, with a path to richer visual or executable workflows when explicitly needed
- architecture instance folders for real project artifacts

The main workspace documentation is here:

- [`.architect/README.md`](.architect/README.md)

## Repository Structure

```text
.architect/
  architecture/
  examples/
  patterns/
  compliance/
  playbooks/
  schemas/
  validation/
  config/
  guidance/
  method/
  roles/
  skills/
  templates/
```

High-level intent:

- `architecture/`: real architecture artifacts created for a project
- `examples/`: worked examples and reference projects separated from live project artifacts
- `patterns/`: reusable architecture patterns and reference solution approaches
- `compliance/`: compliance-aware reference material for jurisdiction, sector, and control obligations
- `playbooks/`: pre-packaged engagement shapes (inventory-only, quick-solution-design, migration-wave, full-togaf-adm, ai-platform-bootstrap, compliance-driven-modernization, post-acquisition-integration) bundling a ready-to-clone `project-config.yaml`, recommended skill sequence, and applicable review gates
- `schemas/`: formal JSON Schema contracts for artifact document structure
- `validation/`: lightweight validators for templates and architecture artifact folders
- `config/`: configuration guidance for agent and workspace behavior
- `guidance/`: conventions, glossary, and local rules
- `method/`: the chosen project method and reference methods such as ADM
- `roles/`: role descriptions and responsibilities
- `skills/`: reusable architecture skills and procedures that agents apply
- `templates/`: the architecture metamodel and starter templates

The workspace is now best understood in three levels:

- `Core`
  - everyday architect-assist use
- `Optional`
  - additional structure for more formal projects
- `Advanced`
  - orchestration, runtime state, schemas, and deeper automation

## Who It Is For

Open Architect is intended for:

- enterprise architects shaping capability, target state, standards, and roadmap
- solution architects defining bounded solutions, interfaces, environments, and transition plans
- teams that want architecture to be versioned, reviewable, and automatable
- organizations exploring AI-assisted architecture practices

It works especially well when the architect wants to stay in control and use AI
as a specialist helper for extraction, analysis, review, and selective
modeling.

## Current Scope

The project already includes templates for:

- business capability, process, stakeholder, objective, organization, principle
- application, application service, interface, solution, requirement
- data object
- technology component, technology standard, environment
- decision, compliance assessment, risk, architecture vision
- initiative, roadmap, transition architecture, work package, gap

It also now includes a substantial compliance layer for privacy, AI,
cybersecurity, financial resilience, health security, public-company cyber
disclosure, payment security, public-sector and product obligations, and
consumer privacy concerns.

## Getting Started

The lightest useful way to start is:

1. Open [`.architect/playbooks/`](.architect/playbooks/) and pick the engagement shape that fits.
2. Copy the playbook's `project-config.yaml` to your project location.
3. Create a small project folder under [`.architect/architecture`](.architect/architecture).
4. Add a `docs/` folder with your source material.
5. Optionally add a short `notes.md` with your business goal and questions.
6. Follow the playbook's recommended first steps.

Best quick-start guides:

- [playbooks/README.md](.architect/playbooks/README.md) — pick an engagement shape
- [starter-project.md](.architect/config/starter-project.md)
- [prompt-recipes.md](.architect/config/prompt-recipes.md)
- [cheat-sheet.md](.architect/config/cheat-sheet.md)
- [agent.config.md](.architect/config/agent.config.md)

If you already know you want a more formal setup, then review:

- [`.architect/templates`](.architect/templates)
- [`.architect/project-config.yaml`](.architect/project-config.yaml)
- [`.architect/method/project-method.md`](.architect/method/project-method.md)

## Project Direction

Open Architect is intended to evolve toward:

- stronger architect-assist workflows and examples
- deeper schema precision and richer validator enforcement
- richer example architectures
- reusable reference patterns
- visual architecture flows where useful
- AI-native architecture assistants and automation where explicitly helpful

## Contributing

Contributions are welcome.

Useful contribution areas include:

- improving templates and guidance
- improving starter-project, prompt, and usability guidance
- adding or extending schemas and validation rules
- creating worked examples
- refining method and role descriptions
- designing flow definitions
- improving AI interoperability and automation support

## Status

This project is currently in a strong foundation stage.

The core workspace, templates, patterns, compliance layer, and architect-assist
operating model are in place. The main remaining work is now less about adding
structure and more about making the workspace easier to prove and use in real
projects.

The repository still needs:

- richer examples
- more real-project proving of the assistive workflows
- deeper schema precision and fuller schema-aware enforcement where useful
- contribution standards
- contribution and project-governance details

## License

This project is licensed under the Apache License 2.0.
See [LICENSE](LICENSE).
