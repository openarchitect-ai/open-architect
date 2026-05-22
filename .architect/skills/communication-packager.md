# Communication Packager

## Purpose

Translate the structured architecture set into stakeholder-ready narratives and
executive-friendly summaries without losing traceability back to the source artifacts.

## Use When

- executives, sponsors, or broad stakeholder groups need digestible outputs
- the architecture set is strong but too detailed for the target audience
- concise summaries or communications need to be prepared quickly

## Inputs

- architecture artifacts
- audience type and communication objective
- key decisions, risks, and transition messages

## Outputs

- a stakeholder-communication **publication package** under `workspace/<project>/publications/<date>-<purpose>/` (purposes vary: `sponsor-briefing`, `steering-update`, `exec-summary`, etc.) in the standard shape defined in [`publication-package-shape.md`](../guidance/publication-package-shape.md): `README.md`, `manifest.yaml`, `provenance.yaml`, the composed summary(s), and any referenced diagrams under `views/`
- audience-specific framing rooted in the source model (every claim traces back to artifact IDs)
- a `working-log.md` entry in the project recording the briefing-package assembly

## Boundaries

This skill **produces** the stakeholder summary package. **What your organization does with it — turn it into a slide deck, email it as a memo, brief from it in a meeting, post to an internal channel — is your communication and delivery culture, not Open Architect's scope.** See [`publication-package-shape.md`](../guidance/publication-package-shape.md) for the boundary statement.

## Typical Collaboration

- works closely with `chief-architect`, `business-architect`, and `architecture-governance-lead`
- complements `architecture-documenter` and `review-pack-builder` rather than replacing them
