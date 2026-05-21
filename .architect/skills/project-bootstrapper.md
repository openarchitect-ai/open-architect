# Project Bootstrapper

## Purpose

Initialize a new architecture project so the workspace starts with the right
scope, roles, templates, conventions, and delivery expectations.

## Use When

- a new architecture initiative starts
- a project needs a smaller, intentional configuration
- the team needs to align roles, method, and template scope before modeling

## Read First

- `.architect/project-config.yaml`
- `.architect/config/agent.config.md`
- `.architect/compliance/README.md`
- `.architect/method/project-method.md`
- `.architect/guidance/conventions.md`
- `.architect/guidance/governance-conventions.md`
- `.architect/examples/customer-onboarding-modernization/README.md`

## Inputs

- project name and scope
- expected architecture concerns
- participating architecture roles
- delivery or governance context
- jurisdictions, industry context, and known regulatory obligations

## Steps

1. Confirm the project boundary.
   Record whether the project is mainly enterprise architecture, solution architecture, or both.
2. Select the minimum useful role set.
   Enable only the roles that will actively contribute.
3. Select the minimum useful template set.
   Prefer a narrow first slice rather than enabling the whole template library.
4. Confirm regulatory and jurisdiction context.
   Record the applicable jurisdictions, sectors, regulations, and control themes that should shape the architecture from the start.
5. Confirm method and governance expectations.
   Align review cadence, ownership, and architecture checkpoints with the chosen method.
6. Tailor `project-config.yaml`.
   Update active roles, enabled templates, enabled flows, governance ownership, and regulation applicability.
7. Recommend the first artifact sequence.
   Usually begin with stakeholders, objectives, vision, requirements, and the first solution boundary.
8. Point the team to the worked example if context is still abstract.
   Use the customer onboarding modernization example as a pattern, not a script.

## Outputs

- tailored `project-config.yaml`
- initial guidance on in-scope templates and roles
- recommended first artifacts and working order

## Output Checklist

- project scope is explicit
- enabled roles are intentional
- enabled templates match expected deliverables
- regulation applicability is explicit where the project is jurisdiction- or sector-sensitive
- governance ownership is clear
- first modeling sequence is known by the team

## Typical Collaboration

- works closely with `chief-architect`, `enterprise-architect`, and `solution-architect`
- hands off to `stakeholder-objective-framer` and `baseline-discovery`

## Quality Checks

- Avoid enabling templates with no likely use in the project.
- Avoid assigning ownership roles that are not enabled in the configuration.
- Make sure at least one review-owning role is active.
