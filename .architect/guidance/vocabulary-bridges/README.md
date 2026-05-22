# Vocabulary Bridges

Not every team uses the same architecture vocabulary. Open Architect's
metamodel is TOGAF-adjacent and template-driven, but many teams think in
C4 (diagram-led), ArchiMate (enterprise-modeling-led), or DDD
(domain-driven design). These bridges show how each external vocabulary
maps to Open Architect concepts so a team can adopt the workspace without
abandoning the way they already think.

## Purpose

- let teams keep their existing vocabulary while gaining Open Architect's
  structure
- give a consistent translation for AI agents and reviewers so artifacts
  remain understandable across vocabularies
- avoid silent vocabulary drift, where the same concept means different
  things in different documents

## Available Bridges

| Bridge | Use when |
|---|---|
| [TOGAF](./togaf.md) | teams are TOGAF-certified or stakeholders expect ADM-phase deliverables; the cleanest 1:1 mapping since Open Architect's templates are deliberately TOGAF-adjacent |
| [ArchiMate-Lite](./archimate-lite.md) | teams use ArchiMate (or simplified ArchiMate) as their primary modeling vocabulary; close 1:1 match to Open Architect templates |
| [C4](./c4.md) | teams use C4 for visual architecture communication; useful as the visual face of Open Architect's structured backbone |
| [DDD](./ddd.md) | teams use Domain-Driven Design; bounded contexts, ubiquitous language, and tactical patterns map well to `solution` + `application-service` + `data-object` |
| [BIZBOK](./bizbok.md) | business architects use BIZBOK; capability maps, value streams, information maps, and organization maps lead the engagement |
| [Cloud Well-Architected](./cloud-well-architected.md) | teams run AWS / Azure / GCP Well-Architected reviews as a quality gate and want findings persisted as architecture artifacts |

## How To Use A Bridge

1. Pick the bridge closest to how your team actually talks.
2. Read its **Concept Mapping** table once at the start of an engagement
   so the team can translate consistently.
3. Read its **What Doesn't Map Cleanly** section to know where the
   vocabularies diverge.
4. Decide which vocabulary is the *primary* one for stakeholder
   communication and which is the *backbone* (Open Architect templates
   should be the backbone in most engagements).
5. Record the chosen primary vocabulary in the project's `notes.md` or in
   `architect-work/answers-and-confirmations.md`.

## Multiple Vocabularies In One Engagement

Many real engagements use more than one vocabulary at once. Common
combinations:

- **C4 + Open Architect**: C4 for diagrams shown to stakeholders, Open
  Architect templates as the structured backbone behind the diagrams
- **DDD + Open Architect**: DDD vocabulary in solution descriptions and
  ubiquitous-language notes, Open Architect templates as the persistent
  record
- **ArchiMate + Open Architect**: ArchiMate diagrams produced for
  enterprise governance, Open Architect templates as the working state

In all of these, Open Architect templates should be the source of truth
for the underlying state; external vocabularies are *presentations* of
that state, not separate truths.

## Contributing A Bridge

To add a bridge for another vocabulary (BIZBOK, UML deployment, AWS / Azure /
GCP architecture frameworks, etc.), follow the structure used by C4,
ArchiMate-Lite, and DDD:

1. Purpose
2. When To Use This Bridge
3. Concept Mapping (table)
4. What Doesn't Map Cleanly
5. Recommended Usage Pattern
6. Common Confusions
