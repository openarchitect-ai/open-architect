# Cutover Command Center

## Purpose

Coordinate high-risk cutover activity through a defined command center so
decisions, communication, issue handling, and escalation stay organized during
the transition window.

## When To Use

- a cutover involves many teams, systems, or tightly sequenced actions
- failure or delay during transition would have material business impact
- real-time coordination is needed beyond normal team channels

## When Not To Use

- the release is small enough for standard team coordination to be sufficient
- a command center would add ceremony without improving execution control

## Assumptions

- cutover steps, dependencies, and decision roles can be defined
- relevant teams can participate during the cutover window
- escalation paths and rollback triggers are agreed in advance

## Key Components

- named command roles
- decision and communication channels
- real-time status tracking
- escalation and rollback coordination

## Benefits

- improves coordination during high-pressure transition windows
- reduces ambiguity about who decides and communicates
- supports faster issue triage and escalation

## Tradeoffs

- requires planning and role preparation
- can become noisy if channels and authority are unclear
- may be unnecessary for low-risk changes

## Common Risks

- command center created without real decision authority
- incomplete cutover visibility across teams
- poor logging of decisions and issues during the event

## Related Templates

- `transition-architecture`
- `work-package`
- `risk`
- `decision`
- `roadmap`
