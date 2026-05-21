# Flows

This folder contains the current flow definitions for architecture work and is
expected to evolve further into richer executable or visual workflows over time.

## Level

`flows/` is usually `Optional`.

Most architect-assist projects do not need explicit flows on day one.

Treat it as:

- `Optional` when you want guided playbooks or light workflow structure
- `Advanced` when flows start driving orchestration or automation

Use it for:

- current markdown flow definitions
- visual editor flow definitions
- architecture workflow automations
- guided architecture playbooks
- flow metadata and supporting assets

Recommended examples:

- `architecture-development.flow`
- `requirements-change-coordination.flow`
- `transition-architecture.flow`
- `solution-design.flow`

Current markdown flows should also reflect human review gates, handoff
expectations, and the reusable pattern library where those materially shape how
work proceeds.

In a light project setup, you can ignore this folder until the work benefits
from explicit sequencing.

Reference method content belongs in `../method/`.
Project-specific architecture instances belong in `../architecture/`.
