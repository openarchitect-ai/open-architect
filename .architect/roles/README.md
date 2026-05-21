# Roles

This folder contains role descriptions used by the architecture capability.

Use it to clarify responsibilities, accountabilities, and expected outputs for
roles such as:

- chief architect
- business analyst
- business architect
- enterprise architect
- solution architect
- data architect
- integration architect
- domain architect
- security architect
- technology architect
- architecture governance lead

Current role set:

- `chief-architect.md`
- `business-analyst.md`
- `business-architect.md`
- `enterprise-architect.md`
- `solution-architect.md`
- `data-architect.md`
- `integration-architect.md`
- `domain-architect.md`
- `security-architect.md`
- `technology-architect.md`
- `architecture-governance-lead.md`

## Levels

### Core

Most projects only need a small working role set:

- `chief-architect`
- `business-analyst`
- `solution-architect`
- `integration-architect`
- `security-architect`

### Optional

Bring these in when the project needs broader business, enterprise, or technical structure:

- `business-architect`
- `enterprise-architect`
- `data-architect`
- `technology-architect`
- `domain-architect`

### Advanced

Use these when the project needs stronger governance machinery or explicit runtime coordination:

- `architecture-governance-lead`
- any role being bound to a real agent profile under `agents/`

Use these role descriptions to:

- define who owns which architecture artifacts
- clarify collaboration between architecture disciplines
- give the architect clear specialist lenses to pull in on demand
- guide how methods, templates, and flows are applied in practice
- ground role behavior in the reusable pattern library when shaping, reviewing, or governing architecture work

Role descriptions are not, by themselves, executable agents.

In the normal `architect-assist` model:

- the architect remains the primary driver
- role files are perspective lenses, not workflow owners
- an agent may switch into one of these roles to help with a bounded task
- the workspace should not assume that role changes mean automatic process progression

For real multi-agent execution:

- keep `roles/` as the accountability layer
- use `skills/` as the procedure layer
- use `agents/` as the runtime execution layer
- use `runtime/` for queue, gate, and handoff state

Use [`.architect/guidance/role-boundaries.md`](../guidance/role-boundaries.md)
alongside these role files when operationalizing a multi-agent team.

Suggested role positioning:

- `chief-architect`: overall architecture capability, coherence, and delivery ownership
- `business-analyst`: stakeholder needs, business rules, requirement quality, and traceability
- `business-architect`: business strategy, capability, process, and operating model alignment
- `enterprise-architect`: target state, business alignment, standards, and roadmap direction
- `solution-architect`: bounded solution architecture and delivery alignment
- specialist architects: focused ownership for data, integration, domain, security, technology, and governance concerns
