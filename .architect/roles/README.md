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

Use these role descriptions to:

- define who owns which architecture artifacts
- clarify collaboration between architecture disciplines
- guide how methods, templates, and flows are applied in practice
- ground role behavior in the reusable pattern library when shaping, reviewing, or governing architecture work

Role descriptions are not, by themselves, executable agents.

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
