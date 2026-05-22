# Container View: <Subject>

**Question:** *Inside the system in scope, what are the deployable units, the services they expose, and the technology each runs on?*

**Audience:** *<e.g. delivery teams, solution review, integration architects>*

**Notation:** C4-style L2 container view in Mermaid. Use one box per application or runtime unit, with internal services and technology components nested or adjacent.

```mermaid
graph TB
    subgraph SYS["<System in scope> (SOL-XXXX)"]
        direction LR
        APP1[<Application 1><br/>APP-XXXX]
        APP2[<Application 2><br/>APP-XXXX]
        SVC1[/<Application service><br/>AS-XXXX/]
        SVC2[/<Application service><br/>AS-XXXX/]
        TC1[(<Technology component<br/>e.g. PostgreSQL><br/>TC-XXXX)]
        TC2[(<Technology component<br/>e.g. Event broker><br/>TC-XXXX)]
    end

    EXT[<External system><br/>APP-XXXX]

    APP1 -->|exposes| SVC1
    APP2 -->|exposes| SVC2
    SVC1 -->|reads / writes| TC1
    SVC2 -->|publishes to| TC2
    APP1 -->|calls| EXT

    classDef app fill:#bfdbfe,stroke:#1d4ed8,color:#000
    classDef svc fill:#ddd6fe,stroke:#6d28d9,color:#000
    classDef tc fill:#fde68a,stroke:#a16207,color:#000
    classDef ext fill:#e5e7eb,stroke:#374151,color:#000
    class APP1,APP2 app
    class SVC1,SVC2 svc
    class TC1,TC2 tc
    class EXT ext
```

## Related Artifacts

- `SOL-XXXX` — solution providing the system boundary
- `APP-XXXX` — applications inside the system
- `AS-XXXX` — application-services
- `TC-XXXX` — technology components
- `IF-XXXX` — if interfaces are explicit, list them too
- `APP-XXXX` — external systems referenced

## Tailoring

- One level deeper than the context view; one level shallower than implementation.
- Don't draw individual classes or functions — that's code-level, not architecture.
- For runtime ordering of calls, switch to [`sequence-view.puml`](./sequence-view.puml).
- For environment / deployment, switch to [`deployment-view.puml`](./deployment-view.puml).
