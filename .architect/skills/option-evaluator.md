# Option Evaluator

## Purpose

Compare candidate architecture options and produce a clear recommendation with
tradeoffs and implications.

## Use When

- multiple solution directions are possible
- platform or design tradeoffs need structured comparison
- architecture leadership needs a recommendation before committing

## Inputs

- decision context
- candidate options
- constraints, standards, and success criteria
- relevant baseline and solution artifacts

## Outputs

- explicit option comparison
- recommended direction
- decision support inputs for `decision-recorder`
- identified implications for transition, risk, and governance

## When to invoke as a separate skill vs fold into a decision

The option evaluation can land in two shapes:

1. **As its own artifact** — invoke `option-evaluator` when the
   comparison itself is a deliverable: a sponsor-facing trade-off
   proposal for choice; a pre-decision RFC opened for comment; a
   stakeholder audience needing visibility into the option set before
   the decision lands. The output stands on its own.
2. **Folded into the DEC artifact** — when the comparison is internal
   reasoning that the decision artifact captures, the `decision.yaml`
   template's `options_considered` block carries the option
   evaluation inline. The DEC is the deliverable; the option evaluation
   is its rationale, not a separate output. `decision-recorder` covers
   this case.

If unsure, default to inline (folded into DEC). Promote to a
separate artifact only when an external audience needs to see the
comparison *before* the decision is made.

## Typical Collaboration

- works closely with `chief-architect`, `enterprise-architect`, and `solution-architect`
- supports `transition-planner` and `communication-packager`
