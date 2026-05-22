# Transition View: <Subject>

**Question:** *How does this transition move from baseline to target — what phases, what work packages, what dependencies, what risks?*

**Audience:** *<transformation sponsors, delivery PM, architecture review board>*

**Notation:** Mermaid flowchart. Custom transition view (not a UML form) because the question is phased change, not formal behavior.

```mermaid
graph LR
    BASE[Baseline:<br/>Current state described<br/>concisely.]
    P1[Wave 1 build:<br/>Key artifacts being created or changed]
    P2[Wave 1 go-live:<br/>What goes into production this wave]
    P3[Wave 2:<br/>What follows once Wave 1 is stable]
    TGT[Target direction:<br/>What the estate looks like<br/>at end of program]

    BASE --> P1
    P1 --> P2
    P2 --> P3
    P3 --> TGT

    WP1[WP-XXXX: <Work package title>] --> P1
    WP2[WP-XXXX: <Work package title>] --> P2
    DEC1[DEC-XXXX: <Key decision>] --> P1
    RSK1[RSK-XXXX: <Active risk>] -.monitored through.-> P2

    classDef phase fill:#bfdbfe,stroke:#1d4ed8,color:#000
    classDef start fill:#e5e7eb,stroke:#374151,color:#000
    classDef target fill:#bbf7d0,stroke:#166534,color:#000
    classDef wp fill:#fde68a,stroke:#a16207,color:#000
    classDef dec fill:#ddd6fe,stroke:#6d28d9,color:#000
    classDef rsk fill:#fecaca,stroke:#b91c1c,color:#000
    class BASE start
    class P1,P2,P3 phase
    class TGT target
    class WP1,WP2 wp
    class DEC1 dec
    class RSK1 rsk
```

## Related Artifacts

- `TA-XXXX` — the transition architecture this view illustrates
- `WP-XXXX` — each work package shown
- `DEC-XXXX` — decisions that gate or shape the transition
- `RSK-XXXX` — risks being monitored through the transition
- `INI-XXXX` — initiative this transition belongs to (if applicable)

## Tailoring

- Show baseline → target as the main spine; hang work packages, decisions, and risks off the relevant wave.
- Solid arrows for "delivers" or "enables"; dotted arrows (`-.text.->`) for "monitors", "constrains", "depends on indirectly".
- For roadmap-style views with calendar time, use a `gantt` chart instead.
- Keep wave labels short — phase names + 1-2 line context, not full descriptions.
