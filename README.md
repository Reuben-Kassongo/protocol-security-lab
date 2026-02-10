# Protocol Security Lab

A focused security lab demonstrating **how protocol invariants fail**
and how those failures propagate across systems.

This is a **bug-zoo style repository**:
small, reproducible cases showing:
- a violated invariant,
- a concrete exploit path,
- a mitigation that restores correctness,
- and the resulting system-level impact.

Audience: protocol engineers, smart-contract developers, and security reviewers.

---

## What this repo is (and is not)

**This repo is:**
- a study of *truth-critical failures* (money, authority, price),
- a demonstration of invariant-driven security reasoning,
- intentionally small and curated.

**This repo is not:**
- a protocol implementation,
- a deployment environment,
- a tooling tutorial.

---

## How to navigate

- `docs/methodology.md`  
  The reasoning model used throughout the lab  
  (Merge Recall, threat model, evaluation rule).

- `vulnerabilities/`  
  Each vulnerability includes:
  - the broken invariant,
  - the failure mode (repeat / reorder / reenter / stale),
  - system impact via belief propagation.

- `exploits/`  
  Minimal exploit reproductions showing how the invariant is violated.

- `mitigations/`  
  Fixed implementations enforcing the invariant.

---

## Why only a few vulnerabilities?

This lab prioritizes **depth over coverage**.

Each case targets a *truth-critical spike*:
- Supply
- Authority
- Accrual
- Reserves
- Solvency

If a system commits one of these before it is safe,
the exploit is rarely local — it propagates across edges.

---

## Status

**Locked.**  
This repository is intentionally not expanded beyond these cases.
