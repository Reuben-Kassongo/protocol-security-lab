# Methodology — Invariant → Failure → Impact

This lab documents vulnerabilities using a single, repeatable reasoning model.
It is designed to mirror how protocol engineers and auditors actually reason about risk.

---

## Merge Recall (Global Pattern)

**Spike happens early → corruption slips in → events confirm state → systems trust it → lie locks permanently.**

Translation:
- a truth is consumed too early,
- a transition can be repeated, reordered, reentered, or used stale,
- the system emits a signal others trust,
- the failure becomes irreversible (loss, authority abuse, mispricing).

This pattern is invariant across protocols.

---

## Threat Model (How targets are chosen)

This lab focuses on **truth-critical moments**, not random surfaces.

Targets are selected where:
- a value is committed (money, authority, price, time),
- that value can be consumed before finality,
- downstream systems trust the result.

If a contract commits state before it is safe,
the exploit is rarely local — it propagates across edges.

This is why each vulnerability maps to a spike:
- Supply
- Authority
- Accrual
- Reserves
- Solvency

Depth matters more than coverage.

---

## Vulnerability Write-Up Template

Every vulnerability in this lab follows the same structure.

### 1) Spike
What truth is consumed too early?
(e.g. Supply, Authority, Accrual, Reserves, Solvency)

### 2) Invariant
What must always be true for safety?

Examples:
- balances update before external calls
- only authorized roles mutate privileged state
- math preserves conservation and bounds

### 3) Failure Mode
How the invariant is broken:
- **Repeat**
- **Reorder**
- **Reenter**
- **Stale**

### 4) Reproduction
How the exploit is triggered and what the attacker gains.

Minimum:
- vulnerable implementation
- exploit path
- observable impact

### 5) Mitigation
What rule restores the invariant.

Examples:
- checks-effects-interactions
- explicit authority gating
- bounded and validated math
- freshness and finality checks

### 6) Impact
Which downstream systems trust the lie and are affected.

This is where belief propagation is made explicit.

---

## Evaluation Rule

A vulnerability is considered complete only if:
- a truth is committed before it is safe,
- the failure can be reproduced,
- and the mitigation restores the invariant.

If any of these are missing, the finding is incomplete.
