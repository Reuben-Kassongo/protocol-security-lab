# Protocol Security Lab

Invariant-driven security research showing **how protocol truths break** —
and how those failures propagate across systems.

This lab demonstrates:
- vulnerability discovery via invariant violations,
- exploit reproduction at truth-critical moments,
- mitigations that restore safety guarantees.

Audience: protocol engineers, security reviewers, and auditors.

---

## How to evaluate this repository

Each vulnerability is evaluated by one rule:

**Rule:** if a truth can be committed before it is safe, the system is exploitable.

Navigate by invariant:
- **Reentrancy** → Commit before safety
- **Access Control** → Authority before finality
- **Arithmetic** → Value escapes bounds

Start with:
- `docs/methodology.md` — how targets are chosen and evaluated
- `vulnerabilities/` — invariant → failure → impact write-ups

---

## Structure

Each vulnerability follows the same shape:

- `vulnerable.sol` — minimal unsafe implementation
- `exploits/<name>/exploit.py` — reproduction of the failure
- `mitigations/<name>/fixed.sol` — invariant-preserving fix
- `README.md` — proof narrative (why it breaks, why it matters)

This consistency is intentional.
It mirrors how real audits reason about risk.

---

Status: Locked.  
This lab is intentionally limited to a small number of deep cases.
