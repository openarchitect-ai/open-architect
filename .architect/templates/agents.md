# Template Authoring Guidelines

This folder contains template files for enterprise architecture metamodel elements.
Templates may be organized into domain subfolders such as `business`, `application`, `technology`, `governance`, `change`, and `data`.

## Naming Convention

Use the following convention for template files and `kind` values:

- Singular
- Lowercase
- `kebab-case`
- File name stem must match `template.kind`

Examples:

- `interface.yaml` -> `kind: interface`
- `data-object.yaml` -> `kind: data-object`
- `application.yaml` -> `kind: application`
- `business-capability.yaml` -> `kind: business-capability`
- `requirement.yaml` -> `kind: requirement`
- `solution.yaml` -> `kind: solution`
- `architecture-vision.yaml` -> `kind: architecture-vision`
- `compliance-assessment.yaml` -> `kind: compliance-assessment`

Use `PascalCase` for code types if needed, but use lowercase `kebab-case` for template artifacts and metamodel kinds.

## Standard YAML Shape

All templates should follow this structure:

```yaml
template:
  kind: data-object
  version: 1.1
  schema_version: 1.1
  description: Template description

spec:
  id: DO-0001
  name: customer
  display_name: Customer
  aliases:
    - Customer Record
  summary: One-sentence machine-friendly summary.
  description: >
    Human-readable description.
```

## AI-First Design Rules

Optimize templates for reasoning, linking, and validation, not only for human reading.

- Prefer explicit fields over implied meaning.
- Prefer enums over long prose where practical.
- Prefer typed relationships over loose identifier lists.
- Keep `summary` short and precise.
- Use `description` for fuller narrative context.
- Record uncertainty explicitly with `metadata.confidence`.
- Capture evidence and provenance through `metadata.source_of_truth` and `metadata.references`.
- Make every entry understandable on its own without requiring the agent to open five more files first.

## Common Metadata Contract

Every template should include the same `metadata` section:

```yaml
metadata:
  source_of_truth:
    system: Enterprise Repository
    record_locator: APP-0001
    owner: Owning Team
  last_reviewed: 2026-05-20
  review_owner: Owning Team
  confidence: high
  references:
    - type: confluence
      title: Supporting Document
      url: https://example.com/doc
  change_log:
    - date: 2026-05-20
      summary: Initial template created.
      author: Enterprise Architecture
```

Guidance:

- `source_of_truth.system`: system, repository, or catalog that should win in case of conflict
- `record_locator`: stable key, page id, CMDB id, or catalog id
- `confidence`: use `high`, `medium`, or `low`
- `references`: point to evidence, not just related reading
- `change_log`: keep entries short and factual

## Relationship Standard

Use a normalized `relationships` array in every template.

```yaml
relationships:
  - type: realizes-capability
    target_kind: business-capability
    target_id: BC-0001
    strength: primary
    confidence: high
```

Required fields:

- `type`
- `target_kind`
- `target_id`
- `strength`
- `confidence`

Guidance:

- `type` should describe the semantic relationship, not just `related-to`
- `target_kind` must match a valid template `kind`
- `target_id` should point to the stable identifier of the related object
- `strength` should use `primary`, `supporting`, or `informational`
- `confidence` should use `high`, `medium`, or `low`

## Enumerated Values

Use constrained values wherever possible so agents can compare entries reliably.

Recommended shared enums:

- `metadata.confidence`: `high`, `medium`, `low`
- `status.lifecycle` generic fallback: `proposed`, `active`, `in-flight`, `production`, `retired`, `archived`
- `classification.criticality`: `low`, `medium`, `high`, `mission-critical`
- `relationships.strength`: `primary`, `supporting`, `informational`

Use kind-specific enums for fields such as:

- `architecture_state`
- `deployment_model`
- `application_type`
- `process_type`
- `decision_state`
- `data_classification`
- `standard_position`

If a new enum is introduced, prefer extending the documentation here rather than inventing one-off values in a single file.

## Template-Specific Enum Guidance

Use template-specific values where they are documented in the template comments or below.

- `stakeholder.status.lifecycle`: `identified`, `active`, `inactive`, `retired`, `archived`
- `stakeholder.classification.influence_level`: `low`, `medium`, `high`
- `stakeholder.status.engagement_status`: `not-engaged`, `engaged`, `consulted`, `blocked`
- `stakeholder.status.decision_authority`: `low`, `medium`, `high`
- `objective.status.lifecycle`: `proposed`, `active`, `achieved`, `retired`, `archived`
- `objective.status.approval_status`: `draft`, `proposed`, `approved`, `rejected`, `superseded`
- `objective.status.progress_status`: `not-started`, `in-progress`, `at-risk`, `achieved`, `blocked`
- `architecture-vision.classification.architecture_state`: `baseline`, `transition`, `target`
- `architecture-vision.status.lifecycle`: `draft`, `active`, `retired`, `archived`
- `architecture-vision.status.approval_status`: `draft`, `proposed`, `approved`, `rejected`, `superseded`
- `architecture-vision.status.communication_status`: `draft`, `published`, `withdrawn`, `superseded`
- `roadmap.status.lifecycle`: `draft`, `active`, `retired`, `archived`
- `roadmap.status.approval_status`: `draft`, `proposed`, `approved`, `rejected`, `superseded`
- `roadmap.status.progress_status`: `not-started`, `in-progress`, `at-risk`, `complete`, `blocked`
- `application.status.operational_status`: `active`, `degraded`, `sunsetting`, `retired`
- `application.status.investment_status`: `invest`, `tolerate`, `migrate`, `eliminate`
- `application-service.status.operational_status`: `active`, `degraded`, `sunsetting`, `retired`
- `interface.status.operational_status`: `active`, `degraded`, `sunsetting`, `retired`
- `business-capability.status.maturity`: `initial`, `emerging`, `defined`, `managed`, `optimized`
- `business-capability.strategy.target_maturity`: `initial`, `emerging`, `defined`, `managed`, `optimized`
- `solution.status.architecture_status`: `draft`, `proposed`, `approved`, `rejected`, `superseded`
- `solution.status.delivery_status`: `green`, `amber`, `red`, `complete`, `on-hold`
- `solution.classification.architecture_state`: `baseline`, `transition`, `target`
- `environment.status.operational_status`: `planned`, `live`, `degraded`, `retired`
- `environment.status.compliance_status`: `compliant`, `conditional`, `non-compliant`
- `transition-architecture.classification.architecture_state`: `baseline`, `transition`, `target`
- `transition-architecture.status.lifecycle`: `planned`, `in-flight`, `completed`, `retired`, `archived`
- `transition-architecture.status.planning_status`: `draft`, `proposed`, `approved`, `rejected`, `superseded`
- `transition-architecture.status.delivery_status`: `green`, `amber`, `red`, `complete`, `on-hold`
- `work-package.classification.architecture_state`: `baseline`, `transition`, `target`
- `work-package.classification.priority`: `low`, `medium`, `high`, `critical`
- `work-package.status.lifecycle`: `planned`, `in-flight`, `completed`, `cancelled`, `archived`
- `work-package.status.delivery_status`: `green`, `amber`, `red`, `complete`, `on-hold`
- `work-package.status.readiness_status`: `identified`, `planned`, `ready-for-build`, `in-build`, `ready-for-release`, `done`
- `gap.classification.architecture_state`: `baseline`, `transition`, `target`
- `gap.classification.severity`: `low`, `medium`, `high`, `critical`
- `gap.status.lifecycle`: `identified`, `active`, `resolved`, `retired`, `archived`
- `gap.status.remediation_status`: `identified`, `planned`, `in-progress`, `blocked`, `complete`
- `gap.status.urgency`: `low`, `medium`, `high`, `critical`
- `compliance-assessment.status.lifecycle`: `planned`, `active`, `closed`, `archived`
- `compliance-assessment.classification.severity`: `low`, `medium`, `high`, `critical`
- `compliance-assessment.status.assessment_status`: `planned`, `open`, `in-review`, `closed`
- `compliance-assessment.status.conformance_status`: `pass`, `conditional-pass`, `fail`, `waived`
- `risk.status.lifecycle`: `identified`, `active`, `retired`, `archived`
- `risk.classification.impact_level`: `low`, `medium`, `high`, `critical`
- `risk.status.treatment_status`: `identified`, `mitigation-planned`, `mitigation-in-progress`, `accepted`, `closed`
- `risk.status.trend`: `decreasing`, `stable`, `increasing`
- `initiative.classification.priority`: `low`, `medium`, `high`, `critical`
- `initiative.status.lifecycle`: `proposed`, `in-flight`, `completed`, `on-hold`, `cancelled`, `archived`
- `initiative.status.delivery_status`: `green`, `amber`, `red`, `complete`, `on-hold`
- `initiative.status.architecture_status`: `draft`, `proposed`, `approved`, `rejected`, `superseded`
- `decision.status.lifecycle`: `draft`, `proposed`, `approved`, `rejected`, `superseded`, `retired`
- `technology-component.status.support_status`: `active`, `limited-support`, `end-of-life`, `retired`
- `requirement.status.lifecycle`: `proposed`, `active`, `satisfied`, `retired`, `archived`
- `requirement.classification.priority`: `low`, `medium`, `high`, `critical`
- `requirement.status.verification_status`: `not-planned`, `planned`, `in-progress`, `verified`, `failed`
- `requirement.governance.source_priority`: `informational`, `preferred`, `authoritative`
- `principle.classification.priority`: `low`, `medium`, `high`, `critical`
- `principle.status.lifecycle`: `draft`, `active`, `retired`, `archived`
- `principle.status.enforcement_status`: `advisory`, `guided`, `enforced`
- `technology-standard.classification.standard_position`: `strategic`, `tactical`, `contain`, `retire`
- `technology-standard.status.lifecycle`: `draft`, `active`, `retired`, `archived`
- `technology-standard.status.enforcement_status`: `advisory`, `guided`, `enforced`

## Identity Rules

Each object should be easy for an agent to resolve from multiple names.

- `id` must be stable and unique
- `name` should be canonical and machine-friendly
- `display_name` should be human-friendly
- `aliases` should include abbreviations, alternative labels, and common platform names

Example:

- `name: customer-relationship-management`
- `display_name: Customer Relationship Management`
- `aliases: [CRM, Salesforce CRM]`

## Writing Guidance

When authoring content:

- Use short, concrete sentences
- Avoid vague wording such as `handles stuff` or `various systems`
- Separate business meaning from implementation detail
- Put evidence in `references`, not in free-form notes
- Put uncertainty in `notes.assumptions`, `notes.risks`, or `metadata.confidence`

## Default Rule

Unless there is a strong reason otherwise:

- File name: singular lowercase `kebab-case`
- `kind`: singular lowercase `kebab-case`
- File stem and `kind` must match exactly
- Every template includes `aliases`, `summary`, `metadata`, and `relationships`
