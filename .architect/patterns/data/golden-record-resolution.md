# Golden Record Resolution

## Purpose

Resolve competing or duplicated representations of the same core entity into a
trusted golden record with clear survivorship, stewardship, and synchronization
rules.

## When To Use

- multiple systems hold overlapping master or key business data
- duplicate records or conflicting attributes undermine business decisions
- the architecture needs a trusted source for downstream consumers

## When Not To Use

- one authoritative source already exists and duplication is minimal
- the data domain is too local or short-lived to justify golden record logic

## Assumptions

- key entities and match criteria can be defined
- survivorship rules are agreed
- stewardship exists for dispute handling and data correction

## Key Components

- matching and deduplication logic
- survivorship and attribute precedence rules
- stewardship and exception handling
- synchronization or publication of the resolved record

## Benefits

- improves trust in shared business data
- reduces downstream inconsistency
- supports more reliable analytics, process automation, and integration

## Tradeoffs

- can be complex to implement and govern
- requires clear ownership and operational stewardship
- may introduce latency between source updates and resolved state

## Common Risks

- poor match rules merging the wrong entities
- unresolved ownership disputes over attribute precedence
- consumers bypassing the golden record and reintroducing inconsistency

## Related Templates

- `data-object`
- `application`
- `application-service`
- `interface`
- `decision`
