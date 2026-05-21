# Architecture Development Flow

This flow describes the default architecture delivery path for a project and
the human review gates that should keep agent work aligned with real approval.

## Flow Stages

1. identify stakeholders and objectives
2. define architecture vision
3. model baseline and target architecture
4. define roadmap and transition states
5. govern through compliance and risk review

## Human Review Gates

Use these checkpoints by default:

1. `project-bootstrap`
   Human confirms scope, active roles, enabled templates, and review ownership before broad modeling starts.
2. `requirement-baseline`
   Human confirms the first structured requirement set is usable enough to guide solution work.
3. `solution-direction`
   Human reviews the first coherent solution shape, key assumptions, and major traceability links.
4. `decision-approval`
   Human confirms major architecture decisions before they are treated as accepted direction.
5. `governance-review`
   Human reviews the package for compliance, risk, transition impact, and readiness for wider circulation.
6. `transition-plan`
   Human confirms roadmap, transition states, work packages, and delivery implications.

## Agent Expectations

At each gate, the agent should stop and provide:

- changed artifacts
- decisions proposed
- assumptions and open questions
- evidence and confidence notes
- requested approval or requested clarification

Agents should not move major artifacts to approved states without human review
at the relevant checkpoint.
