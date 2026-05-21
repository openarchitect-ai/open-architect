# Standards Exception Management

## Purpose

Handle justified deviations from architecture standards through explicit
exception capture, review, risk treatment, and time-bounded follow-up.

## When To Use

- a solution cannot comply fully with an architecture standard
- business or technical constraints require a controlled deviation
- governance teams need visibility of non-standard positions

## When Not To Use

- the issue is actually a need to update the standard itself
- the deviation is insignificant enough that no real governance value is added

## Assumptions

- standards and decision authorities are defined
- exception ownership and review cadence can be assigned
- the risk of deviation can be described and monitored

## Key Components

- standard or principle being deviated from
- exception rationale and scope
- compensating controls or mitigations
- expiry, review, or remediation path

## Benefits

- prevents hidden non-standard architecture
- makes risk and remediation explicit
- supports more honest governance conversations

## Tradeoffs

- introduces governance process overhead
- can normalize exceptions if controls are weak
- requires follow-up to avoid permanent temporary states

## Common Risks

- exceptions granted without expiry or remediation intent
- weak linkage between exceptions and affected artifacts
- standards becoming meaningless because exceptions are unmanaged

## Related Templates

- `technology-standard`
- `principle`
- `decision`
- `risk`
- `compliance-assessment`
