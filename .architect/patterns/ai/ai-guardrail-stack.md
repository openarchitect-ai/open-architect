# AI Guardrail Stack

## Purpose

Layer multiple defensive controls between user input and AI output
(input filtering, retrieval scoping, prompt isolation, output filtering,
post-generation validation) so AI failure modes are bounded by
architecture, not by hope.

## When To Use

- the system accepts user input that reaches a generative model
- the system generates content that reaches users or downstream systems
- the use case has real safety, regulatory, or reputation risk
- prompt injection, PII leakage, harmful content, or hallucination are
  realistic failure modes

## When Not To Use

- the system runs in a fully bounded, internal-only sandbox with trusted
  input and trusted output channels (rare)
- the guardrails being considered are bolt-on after-the-fact with no
  architecture support — design it as architecture instead

## Assumptions

- failure modes can be enumerated for the use case
- guardrails have measurable signal (not opaque)
- runbooks exist for guardrail trips (escalation, fallback, user message)
- guardrail coverage is testable with synthetic and real adversarial inputs

## Key Components

- input filtering (PII detection, harmful-content detection,
  prompt-injection detection, content moderation)
- retrieval scoping (tenant boundaries, classification, redaction)
- prompt isolation (separating system, instruction, user, and retrieved
  content; resisting prompt injection)
- output filtering (harmful content, PII leakage, off-topic refusal,
  hallucination signal)
- post-generation validation (factuality check, policy check, claim
  verification, citation check)
- escalation paths (human review, refusal, graceful fallback)
- guardrail-trip observability and incident response
- continuous testing of guardrail coverage with synthetic adversarial inputs

## Benefits

- failure modes are bounded by architecture
- failures are observable, not silent
- guardrail effectiveness is measurable
- regulatory and reputation risk is reduced

## Tradeoffs

- adds latency
- adds cost (per-request guardrail evaluation)
- false positives reduce user experience
- false negatives still possible — defense in depth, not perfect protection

## Common Risks

- guardrails as a wrapper around the model rather than woven into the architecture
- guardrail coverage assumed but never tested
- prompt isolation broken by string concatenation or context reordering
- output filter trained on stale failure modes
- user input reaching retrieval boundaries without scoping
- alert fatigue suppressing real guardrail trips
- guardrails relying solely on the model to self-police

## Related Templates

- solution
- application-service
- interface
- requirement
- risk
- compliance-assessment

## Related Decisions

- which layers apply per use case
- which failure modes have hard refusals vs soft warnings
- escalation paths per trip type
- continuous testing approach for guardrail coverage
- guardrail observability and alerting thresholds
