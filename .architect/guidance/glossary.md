# Glossary

This glossary defines the core terms used across the Open Architect workspace.
Use it to keep humans and agents aligned on the meaning of artifacts, skills,
flows, statuses, and evidence-related concepts.

## A

### Architecture Artifact

A concrete project output stored under `.architect/architecture/`, such as a
requirement, solution, decision, risk, or transition architecture entry.

### Architecture Vision

A high-level statement of the intended architecture direction, future state, and
value proposition for a change initiative.

### Application

An application or system in the estate that provides business or technical
capability and participates in the architecture model.

### Application Service

A logical service exposed by an application, usually representing a business or
technical capability boundary that other components consume.

### Assumption

A plausible working statement that is not yet confirmed. Assumptions should be
stored as assumptions, not presented as settled fact.

## B

### Baseline

The current-state architecture as it exists today. Baseline artifacts should
describe what is true now, not what is planned or desired later.

### Business Capability

A stable business ability the enterprise needs, independent of a particular
organization structure or implementation.

### Business Process

A flow of business work that realizes one or more business capabilities through
activities, handoffs, and control points.

## C

### Confidence

An explicit statement of how reliable an artifact field or relationship is,
usually captured through `metadata.confidence` or relationship-level
`confidence`.

### Compliance Assessment

An architecture governance artifact that records conformance findings,
exceptions, remediation expectations, and review outcomes.

### Controller

In privacy regulation, the party that determines the purposes and means of
processing personal data.

## D

### Decision

An intentional architecture choice with rationale, options considered, impacts,
and governance status. A decision is not the same thing as a requirement or an
assumption.

### Draft

A working status for content that is incomplete, exploratory, or not yet ready
for approval. Agents should usually create artifacts in draft form first.

### Data Object

A canonical business data object that is important enough to be modeled
explicitly across applications, interfaces, and governance concerns.

### Data Residency

A constraint or obligation that affects where data may be stored, processed, or
replicated geographically.

## E

### Environment

A runtime boundary such as development, test, production, region, or operational
segment used to describe where architecture elements run.

### Evidence

The source support behind an architecture statement, such as stakeholder input,
existing documentation, standards, diagrams, or other authoritative records.

### Example Project

A worked reference project stored under `.architect/examples/` to demonstrate
how templates become linked artifacts without mixing sample content into live
project work.

## F

### Flow

An orchestration pattern that describes how multiple skills and roles work
together across a sequence of architecture steps and review gates.

### Gap

A missing, weak, or insufficient architecture capability that must be addressed
through change, transition planning, or delivery work.

## G

### Governance Review

A formal or semi-formal checkpoint where architecture content is reviewed for
quality, risk, compliance, traceability, and decision readiness.

### High-Risk AI System

An AI system category under the EU AI Act that carries specific obligations and
stronger governance expectations.

## H

### Human Review Gate

A deliberate stop point where agent output must be reviewed by a human before
work can move into stronger approval or governance states.

## I

### Initiative

A transformation effort, program, or project that provides the change context
for architecture work.

### Interface

A concrete integration point or API contract through which applications or
services exchange information or invoke behavior.

## L

### Legal Hold

A requirement to preserve data and suspend normal deletion or disposal because
of investigation, dispute, or legal obligation.

## O

### Open Question

An unresolved point that still needs clarification before stronger modeling,
approval, or delivery decisions can be made.

### Objective

A measurable business or architecture outcome that helps define the purpose and
success criteria of the work.

### Organization

A team, function, operating unit, or other organizational entity that owns,
stewards, approves, or operates architecture elements.

## P

### Project Config

The project-level configuration file at `.architect/project-config.yaml` that
selects active roles, templates, skills, flows, and governance controls.

### Proposed

A status indicating that an artifact or change is sufficiently formed for
review, but not yet approved or accepted.

### Principle

A durable architecture rule or design guardrail that shapes solution and
technology choices over time.

### Processor

In privacy regulation, a party that processes personal data on behalf of a
controller.

## R

### Reference

A link to supporting evidence, such as a document, diagram, standard, or other
source recorded in `metadata.references`.

### Regulated Data

Data whose storage, access, transfer, retention, or use is materially affected
by legal, regulatory, contractual, or policy obligations.

### Regulation Profile

A workspace reference note under `.architect/compliance/` that summarizes why
an external law, regulation, or standard matters to architecture work.

### Relationship

A typed link between architecture artifacts that makes traceability explicit and
queryable, for example requirement to solution, decision to interface, or work
package to transition architecture.

### Role

A perspective and responsibility set assigned to an architecture participant or
agent, such as solution architect, data architect, or architecture governance
lead.

### Roadmap

A sequenced view of architecture change over time, usually connecting transition
states, work packages, dependencies, and delivery timing.

### Review Checkpoint

A named point in a flow where architecture work is expected to pause for human
review, clarification, or approval.

### Risk

An architecture or transition concern that could materially affect delivery,
operations, compliance, value, or governance outcomes.

## S

### Skill

A reusable capability or playbook that an agent or architect can apply to do a
specific kind of architecture work, such as baseline discovery, solution
modeling, relationship mapping, or decision recording.

### Solution

A bounded end-to-end architecture response to a defined business problem,
requirements, and constraints.

### Source Of Truth

The primary authoritative location or owner for an artifact, typically recorded
under `metadata.source_of_truth`.

### Source Priority

The relative authority level of a source or artifact, used to distinguish
informational content from preferred or authoritative content.

### Stakeholder

An internal or external person, group, or role with concerns, influence,
decision rights, or ownership interest in the architecture.

### Superseded

A status indicating that an artifact, decision, or requirement has been
replaced by a newer, more relevant item and should no longer be treated as
current guidance.

## T

### Target State

The intended future architecture state that the project is trying to reach.

### Template

A canonical starter shape for one kind of architecture object. Templates define
how a requirement, solution, decision, environment, or other artifact should be
structured.

### Technology Component

A runtime, platform, product, or technical building block that supports the
solution or wider architecture estate.

### Technology Standard

An approved, tolerated, or prohibited technology direction that guides
technology selection and governance decisions.

### Traceability

The ability to follow meaningful links across artifacts, such as from
stakeholder to objective to requirement to solution to delivery change.

### Transition Architecture

A time-bounded interim architecture state that bridges baseline and target
state, often representing a rollout wave, migration phase, or controlled
intermediate design.

## V

### Verified

A status indicating that a requirement, control, or expectation has supporting
verification evidence rather than only intention or design-time assertion.

## W

### Work Package

A delivery increment that realizes part of a transition architecture or closes
one or more architecture gaps.

## Working Rule

If a term is unclear during modeling, prefer:

1. looking for an explicit definition in this glossary
2. checking the related template or guidance file
3. recording an open question instead of silently choosing a meaning

## Status Guidance

Use status terms carefully:

- `draft`: still being shaped
- `proposed`: ready for review, not yet approved
- `accepted` or `approved`: explicitly confirmed by the right authority
- `verified`: supported by evidence of satisfaction or conformance
- `superseded`: replaced by a newer item
