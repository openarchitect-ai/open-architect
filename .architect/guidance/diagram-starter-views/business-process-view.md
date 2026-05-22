# Business Process View: <Subject>

**Question:** *What does this business process look like — who does what, in what order, with which handoffs and control points?*

**Audience:** *<business architects, sponsors, process owners>*

**Notation:** Mermaid flowchart with `subgraph` swimlanes. BPMN-ish but lighter — use a real BPMN tool for controlled process governance; this view is for architecture-level communication.

```mermaid
graph TB
    subgraph LANE_CUSTOMER["Customer"]
        C1([Submit request])
    end
    subgraph LANE_OPS["Operations team"]
        O1{{Triage request}}
        O2[Validate documents]
        O3[/Decision: approve?/]
    end
    subgraph LANE_SYSTEM["Underwriting application APP-XXXX"]
        S1[Run automated checks]
        S2[(Record outcome)]
    end
    subgraph LANE_DOWNSTREAM["Policy administration APP-XXXX"]
        D1[Activate policy]
    end

    C1 --> O1
    O1 --> O2
    O2 --> S1
    S1 --> O3
    O3 -->|Approved| S2
    O3 -->|Declined| S2
    S2 -->|If approved| D1

    classDef sys fill:#bfdbfe,stroke:#1d4ed8,color:#000
    classDef ops fill:#fde68a,stroke:#a16207,color:#000
    classDef cust fill:#bbf7d0,stroke:#166534,color:#000
    classDef ds fill:#ddd6fe,stroke:#6d28d9,color:#000
    class C1 cust
    class O1,O2,O3 ops
    class S1,S2 sys
    class D1 ds
```

## Related Artifacts

- `BP-XXXX` — business process being modeled
- `BC-XXXX` — business capability or capabilities this process realizes
- `ORG-XXXX` — each swimlane / organization
- `APP-XXXX` — applications shown as lanes
- `STK-XXXX` — primary actors

## Tailoring

- Each `subgraph LANE_*` is one swimlane (role, team, system, or organization).
- Shape conventions used above: rounded `([...])` for start/external trigger, diamond `{{...}}` for decisions or gateways, square `[...]` for activities, slashed `[/.../]` for inline decision points, cylinder `[(...)]` for data/record outcomes.
- For controlled / regulated process modeling (e.g. for an audit deliverable), produce a real BPMN file alongside this view — Mermaid flowcharts don't carry BPMN semantics.
- Don't model every alternate path; show the happy path plus the most consequential failure path.
