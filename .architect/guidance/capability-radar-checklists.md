# Capability Radar Checklists

These are the checks the [`capability-radar`](../skills/capability-radar.md)
skill runs across the `.architect/` capability library itself. They
exist as guidance, not as code, so a maintainer can read, edit, and
extend them without touching tooling. The mechanical subset is also
implemented in [`Validate-Capability.ps1`](../validation/Validate-Capability.ps1).

## Purpose

Catch drift inside the capability library that would otherwise
accumulate silently across many small changes — renamed files still
referenced from elsewhere, new concepts not in the glossary, the
CHANGELOG slipping behind reality, playbook counts inconsistent across
documents.

This is the analog of [`gap-radar-checklists.md`](./gap-radar-checklists.md)
but for `.architect/` itself, not for `workspace/<project>/` artifacts.

## How to read a check

Each check has:

- **Signal** — the question being asked
- **Where to look** — the file(s) or location the answer lives in
- **Why it matters** — the failure mode this prevents
- **Severity hint** — `info`, `warn`, or `block` (context wins)
- **Mechanical?** — `yes` means `Validate-Capability.ps1` can run it; `no` means it requires reading

Findings are reported with the same status labels as `gap-radar`:
`BLOCKER`, `OPEN`, `PROVISIONAL`, `ACTION`, `INFO`.

## Output Shape

When the skill runs, group findings as:

1. `Mechanical Reference Failures` — broken links, missing files
2. `Concept Completeness Gaps` — new things not yet documented
3. `Currency Gaps` — CHANGELOG / current-state.md behind reality
4. `Cross-Document Consistency` — counts and lists that disagree
5. `Structural Drift` — old paths still referenced after renames
6. `Vocabulary Drift` — terms in skills but not in glossary
7. `Convention Binding Gaps` — flags defined but not bound to behavior

End with a `Bottom Line` listing the 1-3 highest-leverage findings.

## 1. Mechanical Reference Checks

### Internal markdown links

- **Signal:** Does every relative markdown link `[text](path)` inside `.architect/*.md` resolve to a file that exists?
  **Where:** all `.md` files under `.architect/` (and `AGENTS.md`, root `README.md`)
  **Why:** Broken links are how renames leave silent debt across the workspace.
  **Severity:** `block` for skill / playbook / README files; `warn` for others
  **Mechanical:** yes

- **Signal:** Does every relative path to a `.yaml`, `.ps1`, `.sh`, `.json` file inside `.architect/*.md` resolve?
  **Where:** all `.md` files
  **Why:** Same as above but for non-markdown targets.
  **Severity:** `block`
  **Mechanical:** yes

### Skill "Read First" references

- **Signal:** Does every entry in a skill's **Read First** list point to a file that exists?
  **Where:** `.architect/skills/*.md`, lines under `## Read First`
  **Why:** A skill that tells an agent to read a non-existent file silently breaks the skill.
  **Severity:** `block`
  **Mechanical:** yes

### Playbook skill references

- **Signal:** Does every skill named in a playbook's **Recommended Skill Sequence** correspond to a file under `.architect/skills/`?
  **Where:** `.architect/playbooks/*/playbook.md`, sections that name skills
  **Why:** Playbooks promising skills that don't exist are not deliverable.
  **Severity:** `block`
  **Mechanical:** partial (the skill name extraction is heuristic)

### Pattern references in skills

- **Signal:** Does every pattern referenced from a skill (typically in **Read First** or in pattern-aware guidance) exist under `.architect/patterns/<domain>/`?
  **Where:** `.architect/skills/*.md`
  **Why:** Promises of patterns that don't exist.
  **Severity:** `warn`
  **Mechanical:** partial

## 2. Concept Completeness Checks

### Glossary coverage

- **Signal:** Does every skill introduce vocabulary that's already in the glossary, or has the new term been added?
  **Where:** new H1/H2 headings in skills vs. H3 entries in `glossary.md`
  **Why:** New concepts that aren't glossed drift in meaning across docs.
  **Severity:** `warn`
  **Mechanical:** no (semantic; needs reading)

### Skill in role-skill-matrix

- **Signal:** Does every skill under `.architect/skills/` appear in `skills/role-skill-matrix.md` mapped to at least one role?
  **Where:** `.architect/skills/*.md` vs. `.architect/skills/role-skill-matrix.md`
  **Why:** Skills without a role mapping have no obvious owner.
  **Severity:** `warn`
  **Mechanical:** yes (file-name presence check)

### Pattern in domain README

- **Signal:** Does every pattern file under `.architect/patterns/<domain>/` appear in that domain's `README.md`?
  **Where:** files vs. README listings
  **Why:** Patterns not listed in their domain README are invisible during pattern selection.
  **Severity:** `warn`
  **Mechanical:** yes

## 3. Currency Checks

### CHANGELOG covers recent changes

- **Signal:** Are files in `.architect/` modified after the last CHANGELOG version's date reflected in `[Unreleased]`?
  **Where:** `git log` of `.architect/` vs. `CHANGELOG.md` `[Unreleased]` section
  **Why:** Quietly-shipped changes mean adopters don't know what changed.
  **Severity:** `warn`
  **Mechanical:** partial (git log + heuristic match)

### current-state.md Completed log

- **Signal:** Are major additions (new skill / pattern / playbook / template) reflected in the Completed log of `current-state.md`?
  **Where:** `guidance/current-state.md` vs. actual filesystem additions
  **Why:** The maintainer snapshot drifts from reality; new contributors get a misleading view.
  **Severity:** `warn`
  **Mechanical:** partial

### Stale next-steps

- **Signal:** Does `current-state.md` list "Recommended Next Steps" that have already been done?
  **Where:** `guidance/current-state.md`
  **Why:** Stale next-steps are how the doc loses credibility.
  **Severity:** `info`
  **Mechanical:** no

## 4. Cross-Document Consistency Checks

### Playbook count consistency

- **Signal:** Does the playbook count in `root README.md`, `.architect/README.md`, and `CHANGELOG.md` match the actual count of folders under `.architect/playbooks/`?
  **Where:** README files vs. filesystem
  **Why:** Embarrassing front-door inconsistency for any reader.
  **Severity:** `warn`
  **Mechanical:** yes

### Family list consistency

- **Signal:** Does the family list in `root README.md` match the family grouping in `.architect/playbooks/README.md`?
  **Where:** two README files
  **Why:** Catalog tables disagreeing is a common drift after adding playbooks.
  **Severity:** `warn`
  **Mechanical:** partial

### Workspace-defaults flags vs documentation

- **Signal:** Does every flag in `config/workspace-defaults.yaml` `conventions:` block have documentation in `config/agent.config.md`?
  **Where:** YAML keys vs. `## ...` headings in agent.config
  **Why:** Undocumented flags drift in meaning.
  **Severity:** `warn`
  **Mechanical:** yes

### Vocabulary-bridges count

- **Signal:** Does the bridge list in `vocabulary-bridges/README.md`, `root README.md`, `.architect/README.md`, and the glossary's **Vocabulary Bridge** entry all match?
  **Where:** four locations
  **Why:** Adding a bridge requires updating all four; easy to miss one.
  **Severity:** `warn`
  **Mechanical:** yes (presence in each list)

## 5. Structural Drift Checks

### Old path references after renames

- **Signal:** Are any references to known-renamed paths still present? (e.g. `.architect/project-config.yaml` after the rename to `config/workspace-defaults.yaml`.)
  **Where:** all `.md`, `.yaml`, `.ps1`, `.sh` files
  **Why:** Renames are the #1 source of mechanical drift.
  **Severity:** `block`
  **Mechanical:** yes (maintain a list of renamed-from → renamed-to paths)

### "N standard files" counts

- **Signal:** Do prose counts of files / kinds / playbooks / patterns match reality? (e.g. "five standard files" in `architect-work/`, "25 template kinds" in CHANGELOG.)
  **Where:** scattered across docs
  **Why:** Counts drift as the catalog grows.
  **Severity:** `info`
  **Mechanical:** partial (regex for known count phrases)

## 6. Vocabulary Drift Checks

### Terms used but not glossed

- **Signal:** Are there capitalized multi-word terms used consistently across skills that lack a glossary entry?
  **Where:** skills, patterns, playbooks vs. glossary
  **Why:** Implicit vocabulary becomes inconsistent over time.
  **Severity:** `info`
  **Mechanical:** no (heuristic and noisy)

### Glossary entries pointing to non-existent paths

- **Signal:** Do glossary entries that reference paths (e.g. `.architect/patterns/ai/`) point to existing locations?
  **Where:** `guidance/glossary.md`
  **Why:** Glossary pointing to phantom paths is worse than no pointer.
  **Severity:** `block`
  **Mechanical:** yes

## 7. Convention Binding Checks

The audit target for these checks is
[`convention-enforcement-matrix.md`](./convention-enforcement-matrix.md),
which indexes every flag's binding location, and
[`config/bindings.md`](../config/bindings.md),
which is the canonical binding spec for nearly every flag (response-shape
flags bind in `AGENTS.md` directly).

### Unbound convention flags

- **Signal:** For every flag in `config/workspace-defaults.yaml`'s `conventions:` block, does the flag-name appear in `config/bindings.md` *or* in `AGENTS.md` / `config/response-display.md` (for response-shape flags)?
  **Where:** `config/workspace-defaults.yaml` (flag list) vs. grep of the flag-name across `config/bindings.md`, `AGENTS.md`, and `config/response-display.md`
  **Why:** A flag defined in workspace-defaults and documented in `agent.config.md` but never referenced in the binding spec is a decorative config knob — the AI can only honor it by happenstance. The 2026-05-22 audit found 16 such flags; 8 were retired and 8 are now bound.
  **Severity:** `warn` (the failure is silent drift, not breakage)
  **Mechanical:** yes — grep each flag name across the binding-spec file set; zero hits = finding

### Documentation-or-duplicate bindings in agent.config.md (anti-pattern)

- **Signal:** Are there any `If conventions.X is true: ...` (or similarly phrased) behavioral spec blocks in `config/agent.config.md`?
  **Where:** grep `config/agent.config.md` for the pattern `^If \`?conventions\.` and equivalents
  **Why:** `agent.config.md` is the docs file for human maintainers — it documents purpose, allowed values, and per-section guidance. `AGENTS.md` does NOT mandate reading it during skill execution, so a behavioral spec there fires only by happenstance. Two failure modes both warrant the finding:
    - *Documentation-only binding* — the flag's behavioral text lives ONLY in `agent.config.md` and not in `bindings.md` (binding doesn't fire reliably).
    - *Duplicate binding* — the same behavioral text appears in BOTH `agent.config.md` and `bindings.md` (maintenance burden; one will drift behind the other). The 2026-05-22 audit found 14 such duplicates and removed them.
  **Severity:** `warn`
  **Mechanical:** yes — any matching block is a finding regardless of whether `bindings.md` also covers the flag. `agent.config.md` should hold only documentation (purpose, allowed values, when-to-use guidance), not behavioral `If X then Y` blocks.

### Distributed-binding anti-pattern

- **Signal:** Are there `When conventions.X is true:` (or similar) behavioral spec blocks in thematic guidance files (`guidance/work-modes.md`, `guidance/evidence-and-quality.md`, `guidance/governance-conventions.md`, `guidance/working-with-open-architect.md`) that duplicate bindings already in `config/bindings.md`?
  **Where:** thematic guidance files vs. `config/bindings.md`
  **Why:** Distributing binding text across multiple files creates the maintenance burden the consolidation was designed to fix. Narrative principles belong in thematic guidance; behavioral bindings belong in `bindings.md`. Re-distribution should be a deliberate exception (e.g. requirement-freeze, which is interwoven with its procedure), not a default.
  **Severity:** `warn`
  **Mechanical:** partial — grep for the pattern; review required to decide whether the duplication is a deliberate exception

### Retired flags re-introduced

- **Signal:** Does any flag listed in `agent.config.md`'s "Retired conventions" section appear in `workspace-defaults.yaml`, any playbook's `project-config.yaml`, or `bindings.md`?
  **Where:** retired-flag list vs. the file set above
  **Why:** A flag was retired because it was redundant with a canonical flag. Re-introducing it by reflex re-creates the redundancy.
  **Severity:** `block` (re-adding a retired flag should require an explicit unretire decision)
  **Mechanical:** yes

## Calibration Notes

- Like `gap-radar`, these are **guidance, not hard rules**. Context wins. A check that fires but is genuinely not relevant should be acknowledged and dismissed in the response, not silently skipped.
- The mechanical subset (`Validate-Capability.ps1`) should be run before commits; the full radar before version bumps.
- When a check is too noisy in practice (false-positive heavy), prefer demoting its severity rather than removing it.

## Extension Points

When adding checks, prefer:

- one check per signal, not bundled checks
- explicit **Where to look** so the check is mechanically reproducible
- a clear failure mode so the maintainer understands why it's worth flagging
- a severity hint, even if advisory
- mark **Mechanical** clearly so the validator team knows what's automatable
