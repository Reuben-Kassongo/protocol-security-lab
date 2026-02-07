# Access Control Bypass

## Invariant
Only authorized roles can call privileged functions.

## Failure
**Reorder / Overlap**: role transition creates a window where unauthorized calls succeed.

## Impact
- authority bypass
- admin takeover / parameter hijack

## Files
- `vulnerable.cairo`
- `../../exploits/access-control/exploit.py`
- `../../mitigations/access-control/fixed.cairo`
