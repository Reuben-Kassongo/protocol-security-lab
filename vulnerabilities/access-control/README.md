# Access Control — Authority Mid-Transition

Why this matters:
This pattern reflects real incidents where authority is trusted too early, leading to permanent control loss or governance capture.

Invariant:
Only authorized roles may mutate privileged state.

Failure:
Reorder / Repeat — authority becomes usable before legitimacy is finalized.

Impact:
Unauthorized upgrades, parameter changes, or emergency actions become possible.
