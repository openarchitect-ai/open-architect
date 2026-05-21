# Role Skill Matrix

This matrix shows which skills are most relevant to each architecture role.

| Role | Primary skills | Supporting skills |
| --- | --- | --- |
| `chief-architect` | `project-bootstrapper`, `option-evaluator`, `change-coordinator`, `architecture-review` | `review-pack-builder`, `communication-packager`, `decision-recorder`, `transition-planner` |
| `business-analyst` | `stakeholder-objective-framer`, `baseline-discovery`, `requirement-normalizer`, `requirements-follow-up` | `communication-packager`, `evidence-curator`, `relationship-mapper` |
| `business-architect` | `stakeholder-objective-framer`, `baseline-discovery`, `option-evaluator`, `architecture-documenter` | `transition-planner`, `architecture-review`, `diagram-author` |
| `enterprise-architect` | `project-bootstrapper`, `option-evaluator`, `transition-planner`, `architecture-review` | `technology-environment-modeler`, `review-pack-builder`, `communication-packager` |
| `solution-architect` | `requirement-normalizer`, `requirements-follow-up`, `solution-modeler`, `decision-recorder`, `relationship-mapper` | `architecture-documenter`, `diagram-author`, `option-evaluator`, `transition-planner`, `architecture-review` |
| `data-architect` | `data-modeler`, `relationship-mapper`, `risk-compliance-assessor` | `solution-modeler`, `architecture-review`, `diagram-author` |
| `integration-architect` | `application-interface-modeler`, `relationship-mapper`, `solution-modeler` | `risk-compliance-assessor`, `architecture-review`, `diagram-author`, `delivery-handover-packager` |
| `domain-architect` | `baseline-discovery`, `solution-modeler`, `relationship-mapper` | `option-evaluator`, `architecture-review`, `architecture-documenter` |
| `security-architect` | `risk-compliance-assessor`, `technology-environment-modeler`, `architecture-review` | `decision-recorder`, `transition-planner`, `review-pack-builder` |
| `technology-architect` | `technology-environment-modeler`, `option-evaluator`, `transition-planner` | `risk-compliance-assessor`, `architecture-review`, `diagram-author`, `delivery-handover-packager` |
| `architecture-governance-lead` | `architecture-review`, `risk-compliance-assessor`, `decision-recorder`, `change-coordinator` | `review-pack-builder`, `communication-packager`, `transition-planner`, `requirements-follow-up`, `evidence-curator` |

## Notes

- Roles are viewpoints and responsibilities.
- Skills are reusable capabilities those role-based agents can apply.
- Patterns are normal working context for many of these role-skill combinations, especially in business framing, solution shaping, data governance, technology design, risk/compliance, review, and transition planning.
- A single project agent team will usually combine several roles and several skills.
- Future `flows/` should orchestrate these skills rather than duplicate them.
- Documentation, diagramming, and review outputs are treated as explicit skills so they can be coordinated and maintained rather than improvised.
