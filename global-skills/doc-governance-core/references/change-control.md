# Change Control

## 1. Hard Gate

Do not edit code until there is an approved implementation document.

This rule usually applies to:

- frontend code changes
- backend code changes
- routing changes
- API or schema changes
- UI layout changes that affect a formal page
- small fixes and style tweaks when they still change shipped behavior

## 2. Required Sequence

Use this sequence for code-bearing tasks:

1. clarify the requirement or cite the latest approved requirement baseline
2. read current formal docs first; only explore code or framework details when the docs are insufficient
3. if the task affects an existing formal page, follow the preview-first flow
4. produce or update the implementation document
5. review the implementation package when it is a key formal output
6. summarize scope, impacted areas, risks, and non-goals
7. wait for explicit approval
8. only after approval, edit code
9. after implementation, run an independent code review
10. update affected docs and logs as needed

## 3. Preview-First Rule For Existing Pages

When a new version changes an existing formal page:

1. do not modify the formal page first
2. create an isolated preview page or preview route
3. preserve the formal page's search items, core fields, and action semantics
4. keep the preview close to the target formal-page structure; do not turn it into a disconnected prototype
5. avoid rule-explanation blocks or review-only prose inside the preview itself
6. if the preview is not fully aligned with the formal page yet, explicitly mark the differences
7. only after UI confirmation, move into database design, API design, and implementation documents

## 4. Minimum Contents Of An Implementation Document

An implementation document should include at least:

- goal of this change
- scope of change
- out-of-scope items
- impacted code areas
- risks and compatibility concerns
- suggested execution order
- verification approach

## 5. Key-Output Review Standard

Treat the following as key outputs that need independent review before they become the working baseline:

- requirement baselines
- page lists and rule lists
- UI plans and preview implementation docs
- database designs and schema decisions
- API lists and interface contracts
- implementation documents
- code changes and code-review conclusions

The review result should clearly answer:

- are there omissions
- are there conflicts or inconsistencies
- is the result implementable
- can the work advance to the next stage now
