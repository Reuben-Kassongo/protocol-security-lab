# Methodology — Invariant → Failure → Impact

This lab documents security vulnerabilities using a **single, repeatable reasoning model**.

It does not catalogue bugs.  
It explains **why systems fail**.

---

## Merge Recall (Global Pattern)

**Spike happens early → corruption slips in → events confirm state → systems trust it → the lie locks permanently.**

In plain terms:

- a truth is consumed too early,
- a state transition can be repeated, reordered, reentered, or used stale,
- the system emits signals that others trust,
- the failure becomes irreversible.

Most critical exploits follow this exact sequence.

---

## Threat Model (How targets are chosen)

This lab focuses on **truth-critical moments**, not random attack surfaces.

Targets are selected where:

- a value is committed (money, authority, price, or time),
- that value can be consumed before finality,
- downstream systems trust the result.

If a contract commits state before it is safe,  
the exploit is rarely local — **it propagates across edges**.

This is why each vulnerability maps to a specific spike  
(Supply, Authority, Accrual, Reserves, Solvency),  
and why **depth matters more than coverage**.

---

## Vulnerability Write-Up Template

Every vulnerability answers the same questions:

### 1) Spike  
What truth is consumed too early?  
(e.g. Supply, Authority, Reserves, Solvency)

### 2) Invariant  
What must always remain true for the system to be safe?

### 3) Failure Mode  
How does the invariant break?

- Repeat  
- Reorder  
- Reenter  
- Stale  

### 4) Reproduction  
How the exploit is triggered and what the attacker gains.

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
- and how failure propagates through a system.

---

## Status

Locked.  
This methodology is intentionally not expanded.
