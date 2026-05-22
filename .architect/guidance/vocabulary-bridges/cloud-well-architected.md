# Cloud Well-Architected Bridge

## Purpose

Help teams who follow a cloud vendor's Well-Architected framework
([AWS](https://aws.amazon.com/architecture/well-architected/),
[Azure](https://learn.microsoft.com/azure/well-architected/),
[GCP](https://cloud.google.com/architecture/framework)) connect those
pillars and review questions to Open Architect's structured artifacts,
so review findings, gaps, and decisions become persistent and queryable
rather than living only in vendor tooling.

## When To Use This Bridge

- the team has standardized on AWS, Azure, or GCP Well-Architected
  reviews as a quality gate
- review findings need a persistent home so they can be tracked,
  re-reviewed, and traced to remediation
- the team wants a vendor-neutral architectural backbone underneath
  vendor-specific pillar questions

## The Combined Pillar Set

The three frameworks overlap heavily. This bridge treats them as a single
combined pillar set:

- **Operational excellence** (AWS, Azure, GCP)
- **Security** (AWS, Azure, GCP)
- **Reliability** (AWS, Azure, GCP)
- **Performance efficiency / optimization** (AWS, Azure, GCP)
- **Cost optimization** (AWS, Azure, GCP)
- **Sustainability** (AWS)
- **System design** (GCP — covers cross-cutting design considerations)

Pillar questions vary by vendor but the structural mapping below is
identical for all three.

## Concept Mapping

| Well-Architected concept | Open Architect equivalent | Notes |
|---|---|---|
| Pillar (e.g. "Security") | `principle` (one per pillar, with `category: cloud-well-architected`) | Each pillar becomes a parent principle the project commits to; finer principles can be children |
| Pillar best practice | `technology-standard` or `principle` (child) | A best practice is either a "do this" standard or a narrower principle |
| Review question | a check in the `architecture-review` skill or an entry in `gap-radar` checklists | Questions are reviewer prompts, not artifacts; the answer becomes evidence or a gap |
| Review finding (issue) | `gap` (if a missing capability) or `risk` (if a residual concern) | Findings need a persistent home — `gap` for "we're missing X", `risk` for "X could go wrong" |
| Improvement plan item | `work-package` (linked to `gap` or `transition-architecture`) | Improvements are delivery work |
| Decision recorded during the review | `decision` (ADR-style) with `metadata.references` pointing to the review | Captures the trade-off rationale |
| Lens (serverless, ML, SaaS, IoT, HPC, FSI, …) | the relevant Open Architect playbook + pattern subset | E.g. AWS ML Lens → `ai-platform-bootstrap` playbook + `patterns/ai/`; SaaS Lens → multi-tenant + tenancy-isolation patterns |
| AWS Trusted Advisor / Azure Advisor / GCP Recommender output | `gap` (for missing controls) or `risk` (for residual exposure) | Findings should be filed in the architecture record, not just left in the cloud console |
| Compliance pack / control mapping | `compliance-assessment` linked to the relevant `compliance/` profile | Vendor compliance packs (HIPAA, PCI, FedRAMP, etc.) align to the existing compliance layer |
| Sustainability metric (carbon intensity, region efficiency) | a field on `environment` or a `decision` rationale | Open Architect doesn't model carbon directly; record the choice and rationale |

## What Doesn't Map Cleanly

- **Pillar review questions are vendor-specific.** AWS, Azure, and GCP phrase them differently, and some questions reference vendor services (AWS Config, Azure Policy, GCP Asset Inventory). The structural mapping is identical; the question text isn't portable. Use the questions as reviewer prompts and capture answers via Open Architect artifacts.
- **Lenses are vendor-specific.** AWS ML Lens, Azure Mission-Critical, GCP Application Design — each is a specialized view. Map each lens to the closest Open Architect playbook plus pattern subset rather than trying to model the lens itself.
- **Tooling-generated findings** (Trusted Advisor, Azure Advisor, GCP Recommender) are continuous; Open Architect artifacts are point-in-time. File **significant** findings as `gap` or `risk`; let tooling carry the rest.
- **Sustainability** is most mature in AWS Well-Architected. Open Architect treats sustainability findings as decisions and environment-level metadata; full carbon modeling is out of scope.

## Recommended Usage Pattern

1. Create one `principle` per pillar the project commits to (`category: cloud-well-architected`). Reference the chosen vendor framework version in `metadata.references`.
2. For each significant best practice the team adopts, create a `technology-standard` or a child `principle`.
3. When running a Well-Architected review, use the [`architecture-review`](../../skills/architecture-review.md) skill; record findings as `gap` (missing) or `risk` (residual) artifacts.
4. For improvement work, create `work-package` artifacts linked to the relevant `gap` or `transition-architecture`.
5. When following a specialized lens, also adopt the matching Open Architect playbook (e.g. `ai-platform-bootstrap` for ML; `enterprise-integration-bootstrap` for API/integration-heavy work).
6. For regulated workloads, link the relevant `compliance-assessment` to both the vendor compliance pack and the Open Architect `compliance/` profile.

## Common Confusions

- "Do I need three principles per pillar, one for each cloud?" No. The pillars are conceptually identical across AWS, Azure, and GCP. Pick one `principle` per pillar; reference the framework version your team uses in `metadata.references`.
- "Where do the dozens of pillar questions live?" They're reviewer prompts, not artifacts. Use them inside the `architecture-review` skill; capture only the answers (as evidence, gaps, risks, or decisions).
- "How do I track that a Trusted Advisor finding has been fixed?" Open the finding as a `gap` or `risk`. Close it when a `decision` and (if needed) a `work-package` resolve it. Don't rely on the cloud console as the only record.
- "We use AWS Well-Architected but operate on Azure too. Do we pick one framework?" Pick the one matching the workload's primary cloud. The Open Architect structure underneath is vendor-neutral; you can switch frameworks per workload without changing the artifact model.
- "Is sustainability really architectural?" Yes — region choice, tenancy density, idle resource handling, and workload scheduling all affect carbon footprint. Record significant sustainability decisions in `decision` artifacts.
