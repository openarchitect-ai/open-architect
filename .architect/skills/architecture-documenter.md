# Architecture Documenter

## Purpose

Produce architecture documents from the structured model so project teams have
clear written outputs such as solution overviews, HLD-style packs, option
papers, and transition summaries.

## Use When

- a project needs narrative architecture documentation in addition to structured artifacts
- stakeholders expect a formal architecture document or design pack
- architecture content must be packaged in a human-friendly written form

## Inputs

- architecture artifacts across the relevant domains
- requirements, decisions, risks, and transition context
- audience and expected document type

## Outputs

- an architecture-document **publication package** under `workspace/<project>/publications/<date>-<purpose>/` (purposes vary: `solution-overview`, `hld-pack`, `option-paper`, `transition-summary`, etc.) in the standard shape defined in [`publication-package-shape.md`](../guidance/publication-package-shape.md): `README.md`, `manifest.yaml`, `provenance.yaml`, the composed document(s) as Markdown, and referenced diagrams under `views/`
- document sections that stay traceable to the underlying artifacts (every section names its source artifact IDs)
- a `working-log.md` entry in the project recording that the document package was assembled

## Boundaries

This skill **produces** the document package in Markdown. **What your organization does with it — render to PDF, transform to Microsoft Word, post to Confluence, format for the company template — is your org's documentation policy and outside Open Architect's scope.** See [`publication-package-shape.md`](../guidance/publication-package-shape.md) for the boundary statement.

## Typical Collaboration

- works closely with `solution-architect`, `business-architect`, and `chief-architect`
- complements `diagram-author`, `review-pack-builder`, and `communication-packager`
