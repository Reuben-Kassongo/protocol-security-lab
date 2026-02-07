# Arithmetic / Bounds Failure

## Invariant
All arithmetic must respect bounds and never allow underflow/overflow or rounding exploits.

## Failure
**Stale / Repeat**: rounding + reused values allow value extraction or accounting drift.

## Impact
- balance corruption
- price / reward manipulation

## Files
- `vulnerable.cairo`
- `../../exploits/arithmetic/exploit.py`
- `../../mitigations/arithmetic/fixed.cairo`
