# Value Stream View: <Subject>

**Question:** *What are the stages of this value stream, which capabilities does each stage rely on, and where are the handoffs?*

**Audience:** *<business architects, sponsors, capability owners, process review>*

**Notation:** Mermaid flowchart. Value-stream stages run left-to-right; capabilities each stage uses are shown beneath the relevant stage; handoffs between stages are explicit.

```mermaid
flowchart LR
    S1["Stage 1:<br/><Stage name><br/>BP-XXXX"]
    S2["Stage 2:<br/><Stage name><br/>BP-XXXX"]
    S3["Stage 3:<br/><Stage name><br/>BP-XXXX"]
    S4["Stage 4:<br/><Stage name><br/>BP-XXXX"]

    S1 -->|handoff: <what passes between>| S2
    S2 -->|handoff: <what passes between>| S3
    S3 -->|handoff: <what passes between>| S4

    C1["BC-XXXX <Capability>"]
    C2["BC-XXXX <Capability>"]
    C3["BC-XXXX <Capability>"]
    C4["BC-XXXX <Capability>"]
    C5["BC-XXXX <Capability>"]

    S1 -.uses.-> C1
    S1 -.uses.-> C2
    S2 -.uses.-> C2
    S2 -.uses.-> C3
    S3 -.uses.-> C4
    S4 -.uses.-> C5

    classDef stage fill:#bfdbfe,stroke:#1d4ed8,color:#000
    classDef cap fill:#bbf7d0,stroke:#166534,color:#000
    class S1,S2,S3,S4 stage
    class C1,C2,C3,C4,C5 cap
```

## Related Artifacts

- `BP-XXXX` — each value-stream stage (modeled as a `business-process`)
- `BC-XXXX` — each capability the stages rely on
- `ORG-XXXX` — organizations that own each stage
- `APP-XXXX` — applications enabling each stage (if drawing application-aligned variant)
- `OBJ-XXXX` — objectives the stream contributes to

## Tailoring

- Solid arrows for stage transitions (the spine of the value stream); dotted arrows (`-.uses.->`) for capability dependencies (the supporting cast).
- Show the handoff content explicitly — what passes between stages is often where value leaks.
- For BIZBOK-style work, see the [`value-stream-to-capability-mapping`](../../patterns/business/value-stream-to-capability-mapping.md) pattern and the [BIZBOK bridge](../vocabulary-bridges/bizbok.md).
- For a heatmap of the supporting capabilities (which are strong vs weak), pair with [`capability-heatmap.md`](./capability-heatmap.md).
