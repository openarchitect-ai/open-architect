# Records Retention and Legal Hold Control Theme

Use this guide when the architecture must support formal retention schedules,
preservation requirements, legal hold, records evidence, or regulated deletion
and archiving behavior.

## Typical Regulation Drivers

- privacy obligations that still require defensible retention logic
- sector or public-record obligations
- litigation, audit, or investigation support requirements

## Architecture Questions

- Which records must be retained, for how long, and under which authority?
- Can the architecture distinguish routine retention from hold, preservation, or
  investigation scenarios?
- Are archive, restore, deletion, and audit-evidence paths visible enough to
  review?

## Architecture Responses

- Treat retention as structured architecture behavior, not just a policy note.
- Keep record classes, retention boundaries, archive paths, and hold exceptions
  explicit.
- Make sure deletion, purge, and evidentiary preservation do not conflict
  silently.

## Useful Patterns

- `../../patterns/data/archival-and-retention.md`
- `../../patterns/data/regulated-data-retention-and-legal-hold.md`
- `../../patterns/security/audit-and-tamper-evident-logging.md`
- `../../patterns/governance/architecture-assurance-evidence-trail.md`
