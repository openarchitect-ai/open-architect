# Domain-Driven Design (DDD) Bridge

## Purpose

Help teams who model with Domain-Driven Design (DDD) use Open Architect
as the persistent architecture record without giving up DDD's strategic
and tactical vocabulary.

## When To Use This Bridge

- the team uses DDD for solution modeling and shared language
- bounded contexts are a primary unit of design thinking
- ubiquitous language is part of the working culture
- the team wants Open Architect's structured artifacts to anchor the
  domain model in something more durable than developer chat

## Concept Mapping

| DDD concept | Open Architect equivalent | Notes |
|---|---|---|
| Bounded Context | `solution` (when authoring a bounded design) or a logical grouping of `application` + `application-service` + `data-object` | A bounded context with its own model and language is most naturally a `solution` in Open Architect terms |
| Ubiquitous Language | `architect-work/answers-and-confirmations.md` + template `aliases` + `description` fields | The language lives in artifacts and is reinforced in working notes |
| Context Map | a view diagram + the set of `solution` + `interface` artifacts with relationships annotated | Open Architect doesn't have a single "context map" artifact; the equivalent is the network of solutions and the relationships between them |
| Aggregate | not modeled (implementation detail) | Aggregates are tactical; they live in code, not in the architecture metamodel |
| Entity | `data-object` (canonical entity) | Canonical business entities are `data-object` artifacts; finer-grained entities are code-level |
| Value Object | not modeled (implementation detail) | Value objects are tactical; capture only when they materially shape a contract or storage choice |
| Domain Service | `application-service` (domain-aligned) | A domain service in the DDD sense is an `application-service` whose responsibility is a domain operation |
| Application Service (DDD) | `application-service` (application-aligned) | Same template; the layering distinction is internal to the service |
| Repository | not modeled (implementation detail) | Repositories are tactical |
| Factory | not modeled (implementation detail) | Same |
| Domain Event | captured via [event-driven-integration](../../patterns/integration/event-driven-integration.md) + `interface` artifacts | Domain events that cross context boundaries become `interface` artifacts |
| Integration Event | `interface` (event variant) | Same idea — name the event contract as an `interface` |
| Anti-Corruption Layer | [anti-corruption-layer pattern](../../patterns/integration/anti-corruption-layer.md) | Direct mapping |
| Open Host Service | `application-service` (exposed) + [api-facade pattern](../../patterns/application/api-facade.md) | When a context exposes a stable open service to others |
| Published Language | `interface` schema + `data-object` shared model | The shape that crosses the boundary |
| Shared Kernel | a shared `data-object` set + governance rules in `principle` / `decision` | Use carefully — DDD warns against shared kernels for a reason |
| Customer-Supplier | relationship between two `solution` artifacts with directional dependency | Captured via typed `relationships` |
| Conformist | relationship-level note plus a `decision` artifact explaining the conformist stance | Conformist is a choice, not a structure — record the choice |
| Partnership | relationship between two `solution` artifacts plus `decision` confirming the partnership stance | Same — a choice, recorded as a decision |
| Big Ball of Mud | `application` with `risk` artifacts naming the entanglement | The honest way to model this |

## What Doesn't Map Cleanly

- **DDD tactical patterns** (Aggregate, Value Object, Entity below the canonical level, Repository, Factory) live at the **implementation level** — below Open Architect's metamodel. Open Architect models the architecture; DDD models within the architecture's bounded contexts.
- **Ubiquitous Language** is a *cultural practice* more than an artifact. Open Architect supports it through template `aliases`, `description`, and `architect-work/answers-and-confirmations.md`, but the discipline itself is human.
- **Context Map** is more visual than structural in DDD. Open Architect provides the structured backbone (`solution`, `interface`, `relationships`); the visual context map is a view generated from that backbone.
- **DDD does not model**: stakeholders, objectives, principles, technology standards, transitions, governance, risk, compliance. Use Open Architect templates for these.

## Recommended Usage Pattern

1. Use Open Architect templates as the persistent record.
2. Use DDD vocabulary in `solution.description`, `application-service.description`, `data-object.description`, and in `architect-work/answers-and-confirmations.md` to capture the ubiquitous language.
3. Use [anti-corruption-layer](../../patterns/integration/anti-corruption-layer.md), [event-driven-integration](../../patterns/integration/event-driven-integration.md), and [outbox-pattern](../../patterns/integration/outbox-pattern.md) when integrating across bounded contexts.
4. Treat tactical patterns (Aggregate, Value Object, Repository) as implementation concerns — out of scope for the architecture metamodel, in scope for code documentation.
5. When a bounded context spans multiple applications, use a `solution` artifact to represent the context boundary, with relationships to the participating applications and application-services.

## Common Confusions

- "Is a Bounded Context a `solution` or an `application`?" A bounded context is a *design boundary*; `solution` is the closest match because it represents an authored, bounded architecture. `application` represents a system in the estate. Sometimes one application = one bounded context; sometimes a bounded context spans multiple applications.
- "Where do Aggregates live in Open Architect?" They don't. Aggregates are below the architecture metamodel. Capture them in code documentation or implementation notes.
- "How do I model Ubiquitous Language?" Use template `aliases` for synonyms, `description` for definitions, and the `architect-work/answers-and-confirmations.md` file to record clarifications as they emerge.
- "Should a Domain Event be an `interface`?" If the event crosses a bounded context boundary, yes — model it as an `interface` (event variant). If it's internal to one context, it's an implementation detail.
- "What about Context Map?" The structured equivalent is the set of `solution` + `interface` + `relationships` between contexts. Visualize it as a diagram, but the structured backbone is the network of artifacts.
- "Where do strategic patterns (Conformist, Customer-Supplier, Partnership) live?" These are *choices*, not structures. Record them as `decision` artifacts with rationale.
