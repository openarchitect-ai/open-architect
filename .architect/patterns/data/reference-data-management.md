# Reference Data Management

## Purpose

Manage shared reference data sets such as codes, classifications, statuses, or
lookup values so they remain consistent across systems and processes.

## When To Use

- multiple systems rely on common code sets or lookup values
- inconsistent classifications create integration or reporting issues
- change control of shared reference values matters to business operations

## When Not To Use

- the values are purely local and not shared outside one bounded context
- governance overhead would outweigh the benefit for a tiny static list

## Assumptions

- reference data owners can be identified
- distribution and synchronization rules can be defined
- consumers can align to one governed set or a controlled mapping approach

## Key Components

- reference data set definition
- ownership and approval path for value changes
- distribution or synchronization mechanism
- mapping or exception handling where local variations exist

## Benefits

- reduces cross-system inconsistency
- improves reporting and integration quality
- clarifies who controls changes to shared classifications

## Tradeoffs

- introduces governance and synchronization effort
- may require local systems to adapt legacy values or mappings
- can become brittle if over-centralized without domain nuance

## Common Risks

- unclear ownership of code-set changes
- local overrides eroding standardization
- stale reference data in downstream consumers

## Related Templates

- `data-object`
- `application`
- `interface`
- `organization`
- `decision`
