# Handoff Contracts

This guide defines the minimum contract that one agent or role should satisfy
before handing work to another.

## Purpose

Use handoff contracts to reduce ambiguity, duplicate work, and silent
assumptions between role-based agents.

Every handoff should make five things clear:

- what was received
- what was produced
- what remains unresolved
- what was validated
- what the next role is expected to do

## Minimum Handoff Structure

Every handoff should include:

- `handoff_from`: originating role or skill
- `handoff_to`: receiving role or skill
- `scope`: the bounded concern or work item being passed
- `inputs_used`: key artifacts, references, and assumptions used
- `outputs_created_or_updated`: artifact paths or IDs changed
- `validation_run`: validator name and summary result
- `open_questions`: unresolved items that still need clarification
- `approval_needed`: whether human review is required before continuation
- `next_expected_action`: the concrete next step for the receiving role

## Required Quality Before Handoff

Before handing work off, the originating agent should:

- keep facts, assumptions, and decisions separate
- update the primary artifacts, not only side notes
- run the relevant validator if one exists
- surface any warnings that still matter
- stop if a human review gate has been reached

## Recommended Default Contracts

### Bootstrap To Framing

- `from`: `project-bootstrapper`
- `to`: `stakeholder-objective-framer`
- required outputs:
  - scoped project configuration
  - active roles
  - enabled templates and skills
  - initial source set

### Framing To Requirements

- `from`: `stakeholder-objective-framer`
- `to`: `requirement-normalizer`
- required outputs:
  - stakeholder artifacts
  - objective artifacts
  - architecture vision draft
  - open business questions

### Requirements To Solution Modeling

- `from`: `requirement-normalizer`
- `to`: `solution-modeler`
- required outputs:
  - normalized requirement set
  - traceable requirement status
  - assumptions and unresolved ambiguities

### Solution Modeling To Review

- `from`: `solution-modeler`
- `to`: `architecture-review`
- required outputs:
  - updated solution and linked artifacts
  - relationships and decision dependencies
  - validation summary
  - review focus areas

### Review To Governance

- `from`: `architecture-review`
- `to`: `architecture-governance-lead`
- required outputs:
  - findings by severity
  - evidence gaps
  - approval blockers
  - recommended next actions

## Stop Conditions

Do not hand off as if work is ready when:

- critical required artifacts are still missing
- the validator returned `error`
- the work crossed a human review gate
- the next receiving role cannot act without clarification

In those cases, publish a blocked handoff instead of a normal one.
