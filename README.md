# Protocol Security Lab (Phase 4.5)

A focused lab for **protocol-level security failures in Solidity systems**.

This repository demonstrates how **invariants break**, how exploits arise,
and how minimal fixes restore safety.

## What this repo is
- Solidity / EVM focused
- Protocol-level reasoning (not single-function bugs)
- Invariant → failure → impact → mitigation

## Primary focus (deep)
- Reentrancy
  - early state use
  - repeated consumption
  - invariant violation
  - minimal fix

## Secondary examples (light)
- Access control
- Arithmetic / accounting

These exist to show breadth, not depth.

## Structure
- vulnerabilities/ — intentionally broken Solidity contracts
- exploits/ — scripts demonstrating failure
- mitigations/ — minimal Solidity fixes
- docs/ — methodology and reasoning

## How to read
1. Start with vulnerabilities/reentrancy/README.md
2. Review the vulnerable Solidity contract
3. Review the exploit
4. Review the fix
5. Compare invariant before vs after

This repo is intentionally separate from the main
Smart-Contract Architect Portfolio and is frozen by design.
