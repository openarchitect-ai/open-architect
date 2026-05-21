# Branch By Abstraction

## Purpose

Introduce a stable abstraction layer so significant internal replacement or
migration can happen incrementally without forcing one large disruptive change.

## When To Use

- existing consumers should be insulated from deep internal change
- major replacement work needs to proceed gradually behind a stable seam
- direct big-bang replacement would carry too much coupling risk

## When Not To Use

- the system is simple enough that the abstraction adds needless complexity
- no stable seam can be introduced meaningfully

## Assumptions

- an abstraction boundary can be designed clearly
- old and new implementations can coexist temporarily behind the abstraction
- the abstraction will be retired or simplified once migration is complete

## Key Components

- stable abstraction or interface layer
- old and new implementation paths
- migration sequencing behind the abstraction
- eventual cleanup or simplification plan

## Benefits

- reduces risk of large internal replacement
- supports gradual migration behind a stable contract
- helps limit consumer disruption

## Tradeoffs

- adds temporary architectural complexity
- can prolong dual implementation cost
- requires discipline to remove migration scaffolding later

## Common Risks

- abstraction layer becomes permanent accidental complexity
- migration stalls with both implementations still live
- the abstraction is too leaky to protect consumers properly

## Related Templates

- `solution`
- `interface`
- `transition-architecture`
- `work-package`
- `decision`
