# Conventions

This file is the entry point for the Open Architect guidance set. It keeps the
top-level principles short and points people and agents to the more focused
rules they need for a specific task.

## Core Rule

Do not invent architecture facts to make a template look complete.

If the information is not known, not evidenced, or not yet agreed, record that
state explicitly instead of filling the gap with plausible-sounding detail.

By default, the originating role is responsible for recording the uncertainty
honestly, the `architecture-governance-lead` is responsible for reviewing that
the gap is explicit and not overstated, and the `chief-architect` is the
escalation point if the ambiguity materially affects scope or direction.

## Guidance Map

Use these files as the detailed rule set:

- [`modeling-conventions.md`](modeling-conventions.md): facts, assumptions, open questions, partial artifacts, and relationship rules
- [`evidence-and-quality.md`](evidence-and-quality.md): references, confidence, anti-hallucination discipline, and minimum quality checks
- [`governance-conventions.md`](governance-conventions.md): human-in-the-loop, approval gates, escalation triggers, and review summaries
- [`lifecycle-and-dates.md`](lifecycle-and-dates.md): status rules, date policy, and update expectations
- [`diagram-conventions.md`](diagram-conventions.md): notation selection and diagram authoring rules
- [`glossary.md`](glossary.md): shared workspace vocabulary

## Quick Principles

- Prefer progressive elaboration over forced completeness.
- Keep facts, assumptions, decisions, and open questions distinct.
- Treat references, confidence, and dates as part of the evidence model.
- Default agent output to `draft` or `proposed` until human review confirms stronger states.
- Prefer a smaller number of strong, meaningful relationships over decorative linkage.

## Project-Specific Extensions

Document local project conventions as needed, including:

- naming conventions
- ID patterns
- environment naming
- relationship patterns
- approved terminology

When a task depends on detailed rules, reference the focused guidance files
above instead of relying on this summary alone.
