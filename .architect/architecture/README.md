# Architecture

This folder is reserved for actual architecture instances created from the
templates.

Recommended structure mirrors the template library:

```text
architecture/
  application/
  business/
  change/
  data/
  governance/
  technology/
  views/
```

Store concrete project architecture objects here rather than in `templates`.
Store project-specific diagram sources and visual views in `views/`.

Reference projects and worked examples live under `../examples/`.

For larger or parallel efforts, it is also acceptable to create a project
subfolder under `architecture/` and mirror the same category structure inside
that project folder.
