# Worked Examples

These examples show the intended lightweight usage model.

## Example 1: LeanIX Or Inventory Export

Goal:

- understand the current estate before doing any modeling

Prompt:

```text
Inventory mode.

Read the source files under `workspace/<project-name>/docs/`.
Extract the applications and interfaces relevant to ERP migration.
Give me a table and a top-10 list.
Do not create architecture artifacts.
```

Expected result:

- extracted applications
- extracted interfaces
- counts and clusters
- no runtime state
- no YAML artifacts

## Example 2: Wave 1 Scope Recommendation

Goal:

- find a migration starting point without over-modeling

Prompt:

```text
Analysis mode.

Using the extracted baseline, group the interfaces into migration clusters.
Recommend 3 candidate Wave 1 scope cuts with tradeoffs.
Do not create project artifacts yet.
```

Expected result:

- 3 candidate scope cuts
- recommended first wave
- key risks and dependencies
- still no YAML artifacts unless requested

## Example 3: Turn Agreed Scope Into Assets

Goal:

- preserve a chosen scope as architecture assets

Prompt:

```text
Modeling mode.

Using the agreed scope and source evidence, create the minimum architecture artifacts needed for this slice.
Keep assumptions explicit.
Do not invent owners or approvals.
```

Expected result:

- a small, bounded artifact set
- explicit assumptions and open questions
- no fake governance state
