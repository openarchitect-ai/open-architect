# Transition View: Customer Onboarding Wave 1

## Purpose

Show the phased move from manual downstream activation to the governed
activation service and event-driven Wave 1 target state.

## Notation

This is a custom transition view represented with Mermaid because the main
question is phased change rather than formal UML behavior.

```mermaid
graph LR
    A[Baseline:\nPortal approval\nManual downstream activation] --> B[Wave 1 Build:\nOnboarding Service\nActivation Profile\nEvent Feed]
    B --> C[Wave 1 Go-Live:\nPolicy Administration consumes event\nTraceability dashboard live]
    C --> D[Target Direction:\nStandard activation path\nReusable downstream pattern]

    W[WP-1001 Deliver Customer Activation Event Flow] --> B
    D1[DEC-1001 Adopt Customer Activation Event API] --> B
    R1[RSK-1001 Delayed Downstream Event Adoption] -.monitored through.-> C
```

## Related Artifacts

- `TA-1001`
- `WP-1001`
- `DEC-1001`
- `RSK-1001`
