# Requirements And Change Coordination Flow

This flow coordinates requirement follow-up and architecture change across the
project lifecycle, with explicit human checkpoints for ambiguity, approval, and
impact.

## Flow Stages

1. capture new or changed requirement input
2. normalize and classify the requirement change
3. assign follow-up ownership and clarify open questions
4. assess impact on solution, interfaces, data, technology, and transition state
5. record or update architecture decisions
6. update relationships so traceability remains explicit
7. update gaps, transition architectures, and work packages where needed
8. review risk, compliance, and delivery readiness implications
9. publish follow-up actions and governance status

## Human Review Gates

Pause for human review when:

1. a changed requirement materially alters scope, architecture direction, or delivery commitments
2. a decision needs to be created, changed, or superseded
3. risk or compliance exposure increases materially
4. a transition plan or work package set must be re-baselined
5. ambiguity remains that would change downstream design choices

## Agent Expectations

When a pause is triggered, the agent should provide:

- the changed requirement or change input
- impacted artifacts and relationships
- decisions affected
- assumptions and unresolved questions
- recommended options
- explicit approval needed from the human reviewer

## Default Outcome Rule

Requirement or change follow-up may continue in draft form, but approvals,
accepted decisions, and material governance status updates should remain human
controlled.
