# Reentrancy

## Invariant
State must update **before** any external interaction.

## Failure
**Reenter**: attacker re-enters mid-transition and consumes value twice.

## Impact
- TVL drain
- double-withdraw / double-claim

## Files
- `vulnerable.cairo` — broken example
- `../../exploits/reentrancy/exploit.py` — reproduction
- `../../mitigations/reentrancy/fixed.cairo` — fix
