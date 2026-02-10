# Methodology — Invariant → Failure → Impact

This lab documents vulnerabilities using a single, repeatable reasoning model.

---

## Merge Recall (Global Pattern)

**Spike happens early → corruption slips in → events confirm state → systems trust it → lie locks permanently.**

Translation:
- a truth is consumed too early,
- a transition can be repeated / reordered / reentered,
- the system emits a signal others trust,
- the failure becomes irreversible.

---

## Threat Model (How targets are chosen)

This lab focuses on **truth-critical moments**, not random surfaces.

Targets are selected where:
- a value is committed (money, authority, price, time),
- that value can be consumed before finality,
- downstream systems trust the result.

If a contract commits state before it is safe,
the exploit is rarely local — it propagates across edges.

This is why each vulnerability maps to a spike
(Supply, Authority, Accrual, Reserves, Solvency),
and why depth matters more than coverage.

---

## Vulnerability Write-Up Template

Every vulnerability answers the same questions:

### 1) Spike
What truth is consumed too early?
(e.g. Supply, Authority, Reserves, Solvency)

### 2) Invariant
What must always be true for safety?

### 3) Failure Mode
How does it break?
- Repeat
- Reorder
- Reenter
- Stale

### 4) Reproduction
How the exploit is triggered and what is gained.

### 5) Mitigation
What rule restores the invariant.

### 6) Impact
Which downstream systems trust the lie.

---

## Why this works

Auditors and senior engineers do not hunt bugs.
They test **assumptions**.

This lab is designed to show:
- which assumptions matter,
- how they fail,
- and how failure propagates.

