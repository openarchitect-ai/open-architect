# Context View: <Subject>

**Question:** *What is the system in scope, who interacts with it, and what does it depend on?*

**Audience:** *<e.g. solution review board, sponsor, new joiner>*

**Notation:** C4-style L1 context view in Mermaid.

```mermaid
graph LR
    STK([<Stakeholder display name><br/>STK-XXXX])
    SYS[<System in scope><br/>SOL-XXXX or APP-XXXX]
    EXT1[<External system 1><br/>APP-XXXX]
    EXT2[<External system 2><br/>APP-XXXX]
    DATA[(<Key data object><br/>DO-XXXX)]

    STK -->|sponsors / uses| SYS
    SYS -->|integrates with| EXT1
    SYS -->|publishes to| EXT2
    SYS -->|reads / writes| DATA

    classDef stk fill:#fde68a,stroke:#a16207,color:#000
    classDef sys fill:#bfdbfe,stroke:#1d4ed8,color:#000
    classDef ext fill:#e5e7eb,stroke:#374151,color:#000
    classDef dat fill:#bbf7d0,stroke:#166534,color:#000
    class STK stk
    class SYS sys
    class EXT1,EXT2 ext
    class DATA dat
```

## Related Artifacts

- `STK-XXXX` — stakeholder
- `SOL-XXXX` or `APP-XXXX` — system in scope
- `APP-XXXX` — each external system
- `DO-XXXX` — relevant data objects

## Tailoring

- Add actors only if they're relevant to the question this view answers.
- Keep at one level of abstraction — for internal structure use [`container-view.md`](./container-view.md).
- Use double-parentheses `(())` for stakeholders, square brackets `[]` for systems, cylinder `[()]` for data.
- If your team uses C4 vocabulary explicitly, see [`../vocabulary-bridges/c4.md`](../vocabulary-bridges/c4.md) for the OA↔C4 mapping.
