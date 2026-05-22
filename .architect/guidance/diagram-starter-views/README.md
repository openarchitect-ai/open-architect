# Diagram Starter Views

Starter templates for architecture views. Copy from here into
`workspace/<project-name>/views/` (or `.architect/examples/<name>/views/`
for worked examples), then replace the placeholder artifact IDs with
real ones from your project.

These are starting points, not constraints. Tailor as the view demands.

## Available Starters

| File | Notation | Use for |
|---|---|---|
| [`context-view.md`](./context-view.md) | Mermaid flowchart | C4-style L1: system + actors + external dependencies |
| [`container-view.md`](./container-view.md) | Mermaid flowchart | C4-style L2: applications + application-services + technology components |
| [`sequence-view.puml`](./sequence-view.puml) | PlantUML | Runtime interaction; ordered messages, returns, async, notes |
| [`deployment-view.puml`](./deployment-view.puml) | PlantUML | Environments + nodes + technology placement |
| [`data-erd.md`](./data-erd.md) | Mermaid erDiagram | Data objects + relationships + cardinality |
| [`business-process-view.md`](./business-process-view.md) | Mermaid flowchart (swimlane-style) | Business process with role lanes and control points |
| [`transition-wave-view.md`](./transition-wave-view.md) | Mermaid flowchart | Transition phases + work packages + dependencies |
| [`capability-heatmap.md`](./capability-heatmap.md) | Mermaid + Markdown table | Capability map with priority / maturity / ownership |
| [`value-stream-view.md`](./value-stream-view.md) | Mermaid flowchart | Value-stream stages → capabilities + handoffs |

## Why two notations?

- **Mermaid** for everything renderable as a flowchart, ERD, or capability/transition view. Renders natively on GitHub, in most editors, and in many docs sites — zero tooling.
- **PlantUML** for full sequence diagrams (with notes, returns, async messages) and deployment diagrams (with nested nodes). Mermaid's support for those is too thin for production use.

Both are text-based, versionable, and AI-editable. No binary diagram tools required.

## Conventions

- Filename matches the pattern in [`../diagram-conventions.md`](../diagram-conventions.md#default-storage-pattern): `<type>-<subject>.<ext>`.
- Every diagram file lists the artifact IDs it references in a `## Related Artifacts` section at the bottom.
- Diagram-only entities (boxes with no backing artifact) are a code smell — every element should resolve to an existing artifact ID under `workspace/<project>/`.
- Update diagrams when underlying artifacts change. Views are derived, not parallel models.

## How to use a starter

1. Pick the starter that matches the question the view must answer (see the table above).
2. Copy to `workspace/<your-project>/views/` (or the worked-example equivalent) with a meaningful filename.
3. Replace placeholder IDs (`APP-XXXX`, `IF-XXXX`, etc.) with real artifact IDs from your project.
4. Replace placeholder display names with the actual `spec.display_name` values from the artifacts.
5. Keep the **Related Artifacts** section at the bottom — it's the audit trail back to the structured model.
6. Add a `metadata.references` entry on the relevant artifacts pointing to the new view file.

See [`diagram-conventions.md`](../diagram-conventions.md) for the broader authoring flow and
[`../../skills/diagram-author.md`](../../skills/diagram-author.md) for the skill-level procedure.

## Rendering

- **Mermaid:** GitHub, GitLab, most modern Markdown viewers, VS Code (with Markdown Preview Mermaid Support extension), and most IDE Mermaid previews render Mermaid natively.
- **PlantUML:** needs a renderer. Options:
  - Local PlantUML jar + Java (most reliable)
  - VS Code PlantUML extension
  - `https://www.plantuml.com/plantuml/` (public service — do not paste sensitive content)
  - IDE plugins (IntelliJ, JetBrains family includes PlantUML)

### Mermaid version compatibility

The starters use `graph` (not `flowchart`) as the diagram type
declaration. Both are valid in modern Mermaid and render identically,
but `flowchart` was only added in Mermaid 8.7+ and some renderers
(older VS Code extensions, some IDE previews) only recognize `graph`.
Using `graph` is the safest cross-renderer choice. If you prefer
`flowchart` for readability, switch only after confirming your team's
rendering targets support it.

### Using Mermaid Live Editor (mermaid.live)

If you want to render a diagram in the Mermaid Live Editor, copy only
the content **between** the Markdown fences — from the `graph TB` (or
`erDiagram`, etc.) line down to the last line before the closing fence.
**Do not include the opening `` ```mermaid `` line or the closing
`` ``` `` line.** The live editor expects raw Mermaid source; it will
fail with `UnknownDiagramError: No diagram type detected matching given
configuration for text:` if the fence is included, because the fence
becomes line 1 instead of the diagram-type declaration.

GitHub, GitLab, and Markdown-preview extensions strip the fence
automatically; only the Mermaid-only tools need this manual step.
