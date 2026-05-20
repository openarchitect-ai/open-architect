# Project Configuration

This guide explains how to use `.architect/project-config.yaml`.

## Purpose

`project-config.yaml` defines which parts of the Open Architect capability are
active for a specific project.

Use it to decide:

- which roles are in scope
- which templates the project will use
- which skills are enabled
- which flows are active
- which method and reference methods guide the work
- which governance expectations apply

This prevents every project from inheriting the full architecture capability by
default.

## How To Use It

Recommended approach:

1. Set the project name and architecture scope.
2. Select the primary method and any reference methods.
3. Enable only the roles that will actually participate.
4. Enable only the templates needed for the project.
5. Enable flows that match the chosen method.
6. Add skills later as the project matures.
7. Confirm governance roles and review expectations.

## Field Guidance

### `project`

- `name`: project or workspace name
- `architecture_scope`: suggested values include `enterprise`, `solution`, or `enterprise-and-solution`
- `architecture_mode`: use `project-local` unless you later support shared or federated modes
- `primary_method`: the method document the project follows
- `reference_methods`: supporting reference methods such as ADM or transition architecture guidance

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

### `flows.enabled`

Enable only the flows the project intends to use.

Examples:

- `architecture-development`
- `transition-architecture`

### `conventions`

Use this section to declare project-wide expectations that may later be
validated automatically.

### `governance`

Use this section to declare the roles that own architecture, requirements, and
review responsibility for the project.

## Suggested Defaults

If you are unsure, start with:

- `architecture_scope: enterprise-and-solution`
- `architecture_mode: project-local`
- a small but realistic role set
- a reduced template set instead of the full library
- one or two flows

## Good Practice

- keep the configuration small and intentional
- review it when the project scope changes
- align it to the chosen project method
- treat it as the control point for future automation and validation
