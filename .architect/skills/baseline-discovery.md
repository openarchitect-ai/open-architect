# Baseline Discovery

## Purpose

Capture the current state of the architecture from existing evidence so change
work starts from explicit baseline facts.

## Use When

- the current landscape is not yet modeled
- source systems, interfaces, data objects, or environments need to be captured
- a transition plan depends on a clear baseline

## Read First

- `.architect/templates/application/application.yaml`
- `.architect/templates/application/interface.yaml`
- `.architect/templates/data/data-object.yaml`
- `.architect/templates/technology/environment.yaml`
- `.architect/examples/customer-onboarding-modernization/README.md`

## Inputs

- source documents, workshops, diagrams, and system inventories
- known applications, technologies, interfaces, and organizations

## Steps

1. Gather the best available evidence.
   Use source documents, diagrams, workshops, and system inventories.
2. Identify the architecture facts that are already true today.
   Capture current applications, interfaces, data objects, environments, and manual handoffs.
3. Separate confirmed baseline facts from assumptions and unknowns.
4. Create the smallest useful baseline artifacts.
   Do not wait for perfect completeness before modeling.
5. Link current-state relationships.
   Capture which applications support the process today, what data moves, and where the handoffs occur.
6. Record uncertainty explicitly in metadata or notes.

## Outputs

- baseline architecture artifacts across the relevant domains
- summaries of what is known, unknown, or uncertain
- a first set of traceable relationships between baseline objects

## Output Checklist

- baseline objects represent the current state, not the desired state
- key manual steps and operational dependencies are visible
- important uncertainties are explicit
- baseline objects are linked strongly enough to support later impact analysis

## Typical Collaboration

- works closely with `business-architect`, `solution-architect`, and specialist architects
- provides inputs to `option-evaluator` and `transition-planner`

## Quality Checks

- Do not mix target-state language into baseline artifacts.
- Do not rely on a single diagram as the only baseline evidence.
- Prefer traceable facts over long narrative summaries.
