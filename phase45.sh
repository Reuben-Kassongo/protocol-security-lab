#!/usr/bin/env bash
set -e

# STEP 3 — Ensure correct repo
cd ~/protocol-security-lab
echo "Repo: $(pwd)"

# STEP 3A — Structure (idempotent)
mkdir -p docs
mkdir -p vulnerabilities/{reentrancy,access-control,arithmetic}
mkdir -p exploits/{reentrancy,access-control,arithmetic}
mkdir -p mitigations/{reentrancy,access-control,arithmetic}

# .gitignore
cat > .gitignore <<'EOG'
.DS_Store
__pycache__/
*.pyc
.env
out/
cache/
node_modules/
EOG

# ROOT README.md
cat > README.md <<'EOG'
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
EOG

# docs/methodology.md
cat > docs/methodology.md <<'EOG'
# Methodology — Invariant → Failure → Impact

## Merge Recall
Spike → commit → trust → propagation.

## Required sections
- Spike
- Invariant
- Attack Surface
- Failure mode
- Reproduction
- Mitigation
- Impact

## Threat Model
Targets are truth-critical commit points:
money, authority, price, time.
EOG

# docs/index.md
cat > docs/index.md <<'EOG'
- Reentrancy
- Access Control
- Arithmetic
EOG

# Vulnerability READMEs
cat > vulnerabilities/reentrancy/README.md <<'EOG'
# Reentrancy — Commit Before Safety

Invariant: state updated before external calls.
Failure: reenter.
Impact: balance lies propagate.
EOG

cat > vulnerabilities/access-control/README.md <<'EOG'
# Access Control — Authority Mid-Transition

Invariant: only authorized roles mutate state.
Failure: reorder / repeat.
Impact: governance capture.
EOG

cat > vulnerabilities/arithmetic/README.md <<'EOG'
# Arithmetic — Value Escapes Bounds

Invariant: conservation.
Failure: stale math.
Impact: solvency drift.
EOG

# Exploit headers
cat > exploits/reentrancy/exploit.py <<'EOG'
"""
Exploit: Reentrancy
Invariant broken: effects after interactions.
"""
# KEEP EXISTING LOGIC BELOW
EOG

cat > exploits/access-control/exploit.py <<'EOG'
"""
Exploit: Access Control
Invariant broken: unauthorized mutation.
"""
# KEEP EXISTING LOGIC BELOW
EOG

cat > exploits/arithmetic/exploit.py <<'EOG'
"""
Exploit: Arithmetic
Invariant broken: conservation.
"""
# KEEP EXISTING LOGIC BELOW
EOG

# Mitigation headers
cat > mitigations/reentrancy/fixed.sol <<'EOG'
// Fix: effects before interactions
pragma solidity ^0.8.20;
EOG

cat > mitigations/access-control/fixed.sol <<'EOG'
// Fix: explicit authority gating
pragma solidity ^0.8.20;
EOG

cat > mitigations/arithmetic/fixed.sol <<'EOG'
// Fix: bounded math
pragma solidity ^0.8.20;
EOG

echo "PHASE 4.5 FILES APPLIED"
