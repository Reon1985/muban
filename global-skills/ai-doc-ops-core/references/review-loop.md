# Review Loop

Use this as the default collaboration loop for key outputs.

## 1. Minimal Stable Loop

1. choose `1` main agent
2. produce the primary output
3. choose `1` independent review agent
4. review for omissions, conflicts, implementability, and readiness to advance
5. merge or revise before continuing

## 2. Key Outputs

Treat these as key outputs:

- requirement baselines
- page lists and rule lists
- UI plans and preview plans
- database designs
- API lists and interface contracts
- implementation docs
- test conclusions
- code changes

## 3. Review Output

The review should explicitly say:

- whether there are omissions
- whether there are conflicts or inconsistencies
- whether the result is implementable
- whether the task can advance to the next stage

## 4. Lightweight Exception

Use self-check only for:

- typo fixes
- broken links
- pure formatting cleanup

Do not use the exception when meaning, scope, rules, structure, data, APIs, or rollout boundaries change.
