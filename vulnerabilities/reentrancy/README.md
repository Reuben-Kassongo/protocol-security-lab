# Reentrancy — Commit Before Safety

Why this matters:
This pattern mirrors real production exploits where state is trusted before finality, allowing value to be consumed multiple times.

Invariant:
State must be updated before any external interaction.

Failure:
Reenter — an external call occurs before internal accounting is finalized.

Impact:
Funds can be withdrawn repeatedly, breaking value conservation and propagating false balances downstream.
