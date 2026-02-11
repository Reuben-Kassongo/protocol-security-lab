# Reentrancy — Proof

## Invariant

Vault balance must always equal the sum of recorded user balances.

---

## Violation

An external call is performed before state is finalised.
This allows re-entrant execution before balances are updated.

---

## Exploit

See:
- `exploits/reentrancy/exploit.py`

The exploit re-enters `withdraw`, draining funds before state is corrected.

---

## Mitigation

See:
- `mitigations/reentrancy/fixed.sol`

The fix applies effects before interactions and blocks re-entrancy.

