# Data Quality Rule Governance

## Purpose

Govern data quality rules explicitly so validation logic, ownership, tolerance,
and remediation expectations remain visible and consistent across the estate.

## When To Use

- important data domains need defined quality thresholds
- data issues recur because rules are implicit or inconsistently applied
- architecture decisions depend on trust in shared operational or analytical
  data

## When Not To Use

- the data is temporary or low-value and formal governance would add little
  benefit
- teams need exploratory profiling first before setting durable rules

## Assumptions

- critical quality dimensions can be identified
- rule ownership and remediation paths can be assigned
- quality rules will influence design and operational behavior

## Key Components

- rule definitions and thresholds
- ownership and stewardship
- validation and monitoring points
- exception handling and remediation workflow

## Benefits

- improves consistency of data trust expectations
- supports clearer stewardship and remediation accountability
- helps prevent silent drift in shared data quality

## Tradeoffs

- requires maintenance as data and business rules evolve
- can create operational overhead if too many low-value rules are added
- depends on good ownership and escalation practices

## Common Risks

- rules defined but not enforced
- ownership unclear when violations occur
- quality metrics optimized locally without addressing business impact

## Related Templates

- `data-object`
- `application-service`
- `interface`
- `risk`
- `decision`
