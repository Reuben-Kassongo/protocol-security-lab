# Reentrancy

## Invariant
State must be fully committed before any external interaction.
Once value is observable externally, it must already be final.

---

## Failure Mechanism — Reenter
The contract performs an external call before updating internal state.
An attacker re-enters during this window and consumes the same value twice.

This is a **Repeat / Early Commit** failure.

---

## Exploit Path
1. Attacker deposits value once.
2. Calls `withdraw(amount)`.
3. External call executes before balance update.
4. Attacker re-enters `withdraw()` during the call.
5. Balance check still passes.
6. Value is withdrawn multiple times.
7. Events and downstream systems trust the result.

---

## Impact
- Direct value drain (TVL loss)
- Accounting corruption
- Downstream systems trust invalid state
- Loss becomes permanent once observed

This matches the global pattern:
> commit happens early → systems trust → lie locks in

---

## Fix
Update internal state **before** any external interaction.
This ensures:
- re-entry sees final state
- repeated consumption is impossible

The fix is minimal and preserves original intent.

---

## What Test Would Have Caught This
An invariant test asserting:

- balance decreases BEFORE transfer
- repeated calls without new deposit revert or pay zero

Example:
- call withdraw twice in same transaction
- assert total payout ≤ initial balance
