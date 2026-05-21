# Open Architect

Open Architect is an open source, AI-native architecture workspace for enterprise architects and solution architects.

It is designed to help teams capture architecture as structured, linked, machine-readable knowledge instead of disconnected documents, slide decks, and spreadsheets.

The core idea is simple:

- keep architecture guidance close to the project
- model architecture through reusable templates
- make relationships between artifacts explicit
- support both human architects and AI-assisted workflows

## Why Open Architect

Most architecture work is fragmented across documents, diagrams, wikis, and delivery boards. That makes it hard to:

- maintain a coherent target state
- trace requirements, decisions, and transition steps
- govern change over time
- reuse architecture knowledge across projects
- support AI agents with reliable architecture context

Open Architect treats architecture as a project-local capability with:

- a shared metamodel
- clear methods and roles
- reusable guidance
- real architecture instances
- a path toward executable or visual flows

## What Is In This Repository

This repository currently contains the `.architect` capability structure, including:

- architecture templates for business, application, data, technology, governance, and change
- project-local guidance and conventions
- role definitions for architects
- method and reference method content
- markdown flow definitions for architecture development and coordination, with room to evolve into richer visual or executable workflows
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
  schemas/
  validation/
  config/
  flows/
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
- `schemas/`: formal JSON Schema contracts for artifact document structure
- `validation/`: lightweight validators for templates and architecture artifact folders
- `flows/`: future visual or executable architecture workflows
- `config/`: configuration guidance for agent and workspace behavior
- `guidance/`: conventions, glossary, and local rules
- `method/`: the chosen project method and reference methods such as ADM
- `roles/`: role descriptions and responsibilities
- `skills/`: AI or reusable architecture playbooks
- `templates/`: the architecture metamodel and starter templates

## Who It Is For

Open Architect is intended for:

- enterprise architects shaping capability, target state, standards, and roadmap
- solution architects defining bounded solutions, interfaces, environments, and transition plans
- teams that want architecture to be versioned, reviewable, and automatable
- organizations exploring AI-assisted architecture practices

## Current Scope

The project already includes templates for:

- business capability, process, stakeholder, objective, organization, principle
- application, application service, interface, solution, requirement
- data object
- technology component, technology standard, environment
- decision, compliance assessment, risk, architecture vision
- initiative, roadmap, transition architecture, work package, gap

It also now includes a growing compliance layer for privacy, AI,
cybersecurity, financial resilience, health security, public-company cyber
disclosure, payment security, and consumer privacy obligations.

## Getting Started

1. Open [`.architect/README.md`](.architect/README.md).
2. Review the templates under [`.architect/templates`](.architect/templates).
3. Tailor the project method under [`.architect/method/project-method.md`](.architect/method/project-method.md).
4. Add local conventions in [`.architect/guidance/conventions.md`](.architect/guidance/conventions.md).
5. Start creating real architecture artifacts under [`.architect/architecture`](.architect/architecture).

If you want a minimal first slice, start with:

- one stakeholder
- one objective
- one business capability
- one application
- one data object
- one interface
- one solution
- one transition architecture

## Project Direction

Open Architect is intended to evolve toward:

- deeper schema precision and richer validator enforcement
- richer example architectures
- reusable reference patterns
- visual architecture flows
- AI-native architecture assistants and automation

## Contributing

Contributions are welcome.

Useful contribution areas include:

- improving templates and guidance
- adding or extending schemas and validation rules
- creating worked examples
- refining method and role descriptions
- designing flow definitions
- improving AI interoperability and automation support

## Status

This project is currently in an early framework stage.

The structure, templates, and operating model are in place, but the repository still needs:

- deeper schema precision and fuller schema-aware enforcement
- richer examples
- real-project proving of the expanded pattern and skill library
- contribution standards
- contribution and project-governance details

## License

This project is licensed under the Apache License 2.0.
See [LICENSE](LICENSE).
