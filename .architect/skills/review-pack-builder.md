# Review Pack Builder

## Purpose

Assemble governance-ready review packs that bring together architecture scope,
decisions, risks, standards alignment, open issues, and requested approvals.

## Use When

- an architecture board or governance checkpoint is approaching
- the team needs a coherent pack for review rather than scattered artifacts
- decision-makers need a concise but evidence-backed review set

## Inputs

- current architecture artifacts
- decisions, risks, compliance assessments, and transition items
- governance objectives and review expectations

## Outputs

- a governance review **publication package** under `workspace/<project>/publications/<date>-<gate>/` in the standard shape defined in [`publication-package-shape.md`](../guidance/publication-package-shape.md): `README.md`, `manifest.yaml`, `provenance.yaml`, composed review documents, and any referenced diagrams under `views/`
- a concise review summary inside the package with referenced evidence
- clear approval requests, findings, and follow-up items
- a `working-log.md` entry in the project recording that a package was assembled, when, and for which gate

## Boundaries

This skill **produces** the publication package. **What your organization does with the package after that — upload to Confluence, transform to Microsoft Word for SharePoint, import into LeanIX or Ardoq, route through the EA tool's approval workflow — is your org's documentation policy and lives outside Open Architect's scope.** OA stops at the workspace boundary. See [`publication-package-shape.md`](../guidance/publication-package-shape.md) for the full boundary description.

## Typical Collaboration

- works closely with `architecture-governance-lead` and `chief-architect`
- complements `risk-compliance-assessor`, `decision-recorder`, and `communication-packager`
- run [`gap-radar`](./gap-radar.md) before assembling the pack; publishing artifacts with unresolved blockers is the most common way a review pack fails
