# Test The Workspace

Use this guide when you want a light, realistic retest of the workspace without
falling into premature modeling or orchestration.

## Recommended Test Path

1. Create a small project folder under `workspace/`
2. Add a `docs/` folder with the source material you actually have
3. Optionally add a short `notes.md` with:
   - the assignment or problem statement
   - known systems or domains
   - what you want help with first
4. Start in `inventory` mode
5. Move to `analysis` mode only after the extracted facts look right
6. Use `modeling` mode only if you explicitly want project artifacts

## Suggested Retest Flow

### Step 1: Inventory

Use a prompt like:

```text
Inventory mode.

Read the source files under `workspace/<project-name>/docs/`.
Extract the applications, interfaces, or other relevant facts for <topic>.
Do not create architecture artifacts.
Keep unknowns explicit.
Guide me as you go.
```

What to look for:

- did the response stay grounded in the source material?
- did it avoid inventing ownership, scope, or decisions?
- did the guidance help you decide what to inspect next?

### Step 2: Analysis

Use a prompt like:

```text
Analysis mode.

Use the extracted facts from `workspace/<project-name>/docs/`.
Group them into the most useful clusters for understanding the current state.
Keep unknowns explicit.
Do not create architecture artifacts.
Guide me as you go.
```

What to look for:

- did the clustering feel architecturally useful?
- did the analysis separate fact from interpretation?
- did the guidance help you choose the next cut, question, or scope?

### Step 3: Optional Modeling

Only do this when you explicitly want project assets.

Use a prompt like:

```text
Modeling mode.

Create only the minimum architecture artifacts needed to capture the agreed
scope for `workspace/<project-name>/`.
Keep unknowns explicit.
Guide me as you go.
```

What to look for:

- did the modeling stay bounded to what you asked for?
- did it avoid creating governance/process noise you did not request?
- did the guidance help you review what should be validated next?

## How To Judge The Test

The workspace is behaving well when:

- source-first extraction happens before architecture invention
- unknowns stay visible instead of being silently filled in
- guidance is useful without becoming pushy
- artifacts are only created when you explicitly ask for them
- runtime state stays neutral unless you intentionally enable orchestration

## If The Test Feels Off

Adjust one thing at a time:

- switch modes more explicitly
- narrow the prompt scope
- ask for a different output shape such as a table or shortlist
- stay in `inventory` or `analysis` longer
- only move to `modeling` after the baseline and scope feel right
