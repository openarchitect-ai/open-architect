# Project Method

Use this file to describe the architecture method chosen for this project.

Before tailoring the method, align it with the project's
`workspace/<project-name>/project-config.yaml` (and the workspace-level
defaults at `.architect/config/workspace-defaults.yaml`) so the selected
method, roles, templates, playbook, and governance expectations are
explicit for the project.

Suggested coverage:

- project scope and selected architecture capability configuration
- preliminary setup and scope
- stakeholder and objective definition
- architecture vision
- business, application, data, and technology modeling
- opportunities, migration, and roadmap planning
- implementation governance
- change management and continuous improvement
- tailoring of reference methods such as ADM
- phase entry and exit criteria (often inherited from the chosen playbook)

Recommended template mapping:

- Phase A style work: `stakeholder`, `objective`, `architecture-vision`
- Business architecture: `business-capability`, `business-process`, `organization`
- Information systems architecture: `application`, `application-service`, `interface`, `data-object`, `solution`, `requirement`
- Technology architecture: `technology-component`, `technology-standard`, `environment`
- Migration and delivery: `initiative`, `roadmap`, `transition-architecture`, `gap`, `work-package`
- Governance and change: `decision`, `compliance-assessment`, `risk`
