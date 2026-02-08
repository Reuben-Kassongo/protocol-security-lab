# Protocol Security Lab

Audience: protocol engineers, security reviewers, and auditors.

This repo is a **bug-zoo security lab**: small, reproducible vulnerability demos with:
- a vulnerable implementation,
- an exploit reproduction,
- a mitigation (fixed version),
- a write-up mapping: invariant → failure → impact.

## How to navigate
Start here:
- docs/methodology.md

Then pick one:
- vulnerabilities/reentrancy/
- vulnerabilities/access-control/
- vulnerabilities/arithmetic/

## Core thesis (Merge Recall)
Spike happens early → corruption slips in → events confirm state → systems trust it → lie locks permanently.

This lab is intentionally small: depth over breadth.
Status: Locked.
