# Agentic System Bounded Loop

## Purpose

Bound agentic AI systems with explicit termination conditions, scope
constraints, and hard stops so loops cannot run away in steps, cost,
time, or tool-use damage.

## When To Use

- the system uses a model in a multi-step loop (plan-execute-observe,
  tool-use loops, agentic workflows)
- the loop calls external tools or systems with real-world effects
- runaway behavior carries cost, safety, or reputation consequences
- the loop's success and failure modes can be defined

## When Not To Use

- the system is procedural with a fixed number of model calls (not agentic)
- the loop is exploratory at a stage where bounds would prevent learning
  (early prototype only — still set generous bounds)

## Assumptions

- the loop has a definable scope (allowed tools, allowed data, allowed actions)
- the loop's success condition can be expressed
- termination conditions are enforceable from outside the model
- escalation or graceful exit is possible on termination

## Key Components

- max step count
- max wall-clock time
- max cost (token spend, tool-use cost)
- success criteria (loop exits on success)
- hard-stop conditions (tool failure, policy violation, escalation trigger)
- tool allow-list with per-tool rate or scope limits
- data scope (what the loop is allowed to read, write, retrieve)
- escalation handler on termination
- audit trail of loop steps, tool calls, decisions

## Benefits

- runaway behavior is bounded by architecture, not by hope
- cost and time are predictable
- audit trail enables incident analysis
- safety properties are testable

## Tradeoffs

- adds enforcement layer between the model and tools
- requires tuning per use case (too tight = task incomplete; too loose = unbounded)
- requires runbooks for termination handling

## Common Risks

- bounds set in prompt-only — the model can ignore them
- success criteria expressed only in natural language — cannot be enforced
- termination behaves as crash rather than graceful exit
- tool allow-list bypassed via prompt injection
- audit trail absent — incident analysis impossible
- bounds set once at design time and never re-tuned with usage data
- escalation handler not exercised — fails when needed

## Related Templates

- solution
- application-service
- interface
- requirement
- risk
- technology-component

## Related Decisions

- termination condition values (max steps, max cost, max time)
- success criteria expression and enforcement mechanism
- tool allow-list scope
- escalation handler design
- audit trail storage and access
- post-incident tuning cadence
