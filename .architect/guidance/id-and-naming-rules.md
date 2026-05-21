# ID And Naming Rules

This guide defines how IDs, filenames, and names should be created so multiple
agents can work safely in the same workspace.

## Purpose

Deterministic naming reduces collisions, duplicate artifacts, and ambiguous
references.

## ID Rules

Use stable IDs with the template-aligned prefix:

- `STK-` stakeholder
- `OBJ-` objective
- `BC-` business-capability
- `BP-` business-process
- `ORG-` organization
- `VIS-` architecture-vision
- `PRN-` principle
- `APP-` application
- `AS-` application-service
- `IF-` interface
- `DO-` data-object
- `TC-` technology-component
- `TS-` technology-standard
- `ENV-` environment
- `REQ-` requirement
- `SOL-` solution
- `INI-` initiative
- `RMP-` roadmap
- `TA-` transition-architecture
- `WP-` work-package
- `GAP-` gap
- `DEC-` decision
- `CMP-` compliance-assessment
- `RSK-` risk

## ID Generation Rules

- keep IDs stable once assigned
- never recycle an ID for a different artifact
- increment numerically within the artifact kind
- do not renumber existing artifacts to make sequences look tidy
- preserve linked IDs even if filenames or titles change

## Filename Rules

Use:

- lowercase
- `kebab-case`
- a leading stable ID
- a short descriptive suffix

Pattern:

```text
<id-lowercase>-<short-description>.yaml
```

Examples:

- `req-1001-customer-activation-reliability.yaml`
- `dec-1001-adopt-customer-activation-event-api.yaml`
- `ta-1001-customer-onboarding-wave-1.yaml`

## Name Rules

- `name` should be canonical and machine-friendly
- `display_name` should be human-readable and presentation-friendly
- `aliases` should include common abbreviations or alternate labels when useful

## Agent Rule

Before creating a new artifact, an agent should:

1. check whether an artifact already exists for the same concern
2. choose the correct prefix for the kind
3. assign the next stable numeric ID within that kind
4. use a descriptive but concise filename suffix

If uniqueness cannot be determined safely, the agent should stop and ask for
review instead of guessing.
