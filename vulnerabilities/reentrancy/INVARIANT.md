# Reentrancy — Invariant

## Invariant

Vault balance must always equal the sum of recorded user balances.

---

## Assumption

External calls do not re-enter execution before state is fully updated.

---

## Violation

An external call performed before effects allows re-entrant execution,
breaking the assumption and violating the balance invariant.

