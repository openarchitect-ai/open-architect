# AI Governance and Model Risk Control Theme

Use this guide when the project includes AI-assisted features, model-driven
decisioning, automation with material impact, or regulatory concern about model
transparency, accountability, or risk.

## Typical Regulation Drivers

- `EU AI Act`
- sector-specific model-governance expectations
- internal AI governance, assurance, or risk policy

## Architecture Questions

- What AI capabilities exist, and what decisions or workflows do they affect?
- Does the solution use externally hosted models, internally trained models, or
  both?
- Are human oversight, fallback behavior, and escalation paths explicit?
- Can the architecture explain inputs, outputs, model dependencies, and
  evidence of review?

## Architecture Responses

- Model AI use separately from generic application logic when it affects user
  rights, safety, compliance, or material decisions.
- Keep prompts, model boundaries, orchestration, logging, and human review
  points visible.
- Treat model dependency, monitoring, and evidence capture as control concerns.
- Expect stronger governance review when AI drives customer, operational, or
  compliance-sensitive outcomes.

## Useful Patterns

- `../../patterns/governance/decision-evidence-packaging.md`
- `../../patterns/governance/architecture-assurance-evidence-trail.md`
- `../../patterns/governance/policy-to-control-traceability.md`
- `../../patterns/technology/observability-by-design.md`
