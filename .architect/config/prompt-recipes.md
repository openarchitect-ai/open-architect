# Prompt Recipes

These recipes are designed for the `architect-assist` model.

Use them to keep the agent aligned to the kind of help you actually want.

## Inventory Mode

Use when you want source-first extraction only.

```text
Inventory mode.

Read the source files under `.architect/architecture/<project-name>/docs/`.
Extract the applications and interfaces relevant to <topic>.
Do not create architecture artifacts.
Keep unknowns explicit.
```

## Analysis Mode

Use when you want clustering, patterns, or recommendations.

```text
Analysis mode.

Using the extracted baseline, group the interfaces into meaningful clusters for <goal>.
Recommend 3 candidate scope cuts.
Do not create architecture artifacts yet.
```

## Review Mode

Use when you want critique.

```text
Review mode.

Challenge this proposed scope / transition approach / architecture direction.
Focus on gaps, hidden dependencies, and risks.
Do not rewrite the project unless I ask.
```

## Decision Mode

Use when you want a recommendation among options.

```text
Decision mode.

Compare these options for Wave 1:
- <option 1>
- <option 2>
- <option 3>

State tradeoffs and recommend one.
Do not create architecture artifacts yet.
```

## Modeling Mode

Use when you explicitly want project assets.

```text
Modeling mode.

Using the agreed scope and source evidence, create the minimum architecture artifacts needed for this slice.
Keep assumptions explicit.
Do not invent owners or approvals.
```

## Transition Scope Recipe

Good for migration work.

```text
Analysis mode.

Using the current-state source material, identify the interfaces and applications relevant to <migration goal>.
Recommend a bounded Wave 1 scope.
Do not create project artifacts yet.
```

## Compliance Support Recipe

Good when you want architecture implications without over-formalizing too early.

```text
Analysis mode.

Given this scope, identify the likely compliance and control concerns that an architect should account for.
Keep it practical and architecture-focused.
Do not create compliance artifacts unless I ask.
```

## Convert To Artifacts Recipe

Use when you are ready to preserve the result.

```text
Modeling mode.

Turn the agreed baseline and scope into project artifacts under `.architect/architecture/<project-name>/`.
Create only the minimum useful set.
Keep all unresolved questions visible.
```
