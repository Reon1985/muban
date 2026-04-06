# Change Control

## 1. Hard Gate

For this repository, do not edit code until there is an approved implementation document.

This rule applies to:

- Frontend code changes
- Backend code changes
- UI layout changes
- Routing changes
- API or schema changes
- Small fixes and style tweaks

## 2. Required Sequence

Use this sequence for all code-bearing tasks:

1. Clarify the requirement or cite the latest approved requirement baseline
2. Read the current formal docs first; only explore code or framework details when the docs are insufficient
3. Read [CLAUDE.md](__PROJECT_ROOT__/CLAUDE.md), [doc/README.md](__PROJECT_ROOT__/doc/README.md), [doc/00-入口/AI执行入口.md](__PROJECT_ROOT__/doc/00-入口/AI执行入口.md), and [doc/00-入口/当前生效版本说明.md](__PROJECT_ROOT__/doc/00-入口/当前生效版本说明.md) before narrowing into module docs
4. Read [开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md) before any approved code edit
5. If the task involves implementation-agent selection, independent-review-agent selection, or agent / skill rule changes, also read [全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md) as needed
6. If the task affects an existing formal page, follow the preview-first flow: confirm requirements and page rules -> build an isolated preview page or route -> confirm UI -> then proceed to database/API design and implementation docs
7. If exploration yields new reusable framework knowledge, backfill it into the correct project docs
8. Produce or update the implementation document
9. For key formal outputs such as page rules, UI plans, database designs, API lists, implementation docs, and code-bearing conclusions, use `1` main agent plus `1` independent review agent before treating the output as the next-stage baseline
10. Summarize scope, impacted files, risks, and non-goals
11. Wait for explicit user confirmation
12. Only after confirmation, edit code
13. After implementation, automatically choose an appropriate review agent for code review
14. If implementation produced new reusable development rules, write them back into [开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md)
15. If implementation changed agent / skill descriptions, routing guidance, recommended combinations, or default selection rules, update [全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md)
16. After implementation, update affected docs and change logs as needed

## 3. Preview-First Rule For Existing Pages

When a new version changes an existing formal page:

1. Do not modify the formal page first
2. Create an isolated preview page or preview route
3. Preserve the formal page's search items, core fields, and action semantics
4. Keep the preview close to the target formal-page structure; do not turn it into a disconnected prototype
5. Avoid rule-explanation blocks or review-only prose inside the preview itself
6. If the preview is not fully aligned with the formal page yet, explicitly mark the differences
7. Only after UI confirmation, move into database design, API design, and implementation documents

## 4. Minimum Contents of an Implementation Document

An implementation document should include at least:

- Goal of this change
- Scope of change
- Out-of-scope items
- Impacted code areas
- Risks and compatibility concerns
- Suggested execution order
- Verification approach

## 5. Key-Output Review Standard

Treat the following as key outputs that need independent review before they become the working baseline:

- Requirement baselines
- Page lists and rule lists
- UI plans and preview implementation docs
- Database designs and schema decisions
- API lists and interface contracts
- Implementation documents
- Code changes and code-review conclusions

The review result should clearly answer:

- Are there omissions?
- Are there conflicts or inconsistencies?
- Is the result implementable?
- Can the work advance to the next stage now?

Lightweight typo, link, or pure formatting fixes can stay on self-check only.

## 6. Approval Standard

Treat the implementation document as approved only when the user clearly confirms it.

Typical approval signals:

- “可以，按这个做”
- “我同意这个实施方案”
- “按这版开始改”
- “可以进入开发”

If the user only discusses or asks for revisions, the plan is not approved yet.

## 7. What To Do When Approval Is Missing

If approval is missing:

1. Continue refining documents
2. Answer questions
3. Improve the implementation plan
4. Do not patch code

## 8. After Approval

After approval:

1. Stay within the approved scope
2. Do not expand into unrelated files or extra features without re-confirmation
3. Reflect meaningful implementation changes back into project docs
4. Reflect new reusable development rules back into [开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md)
5. If agent / skill guidance changed, reflect it back into [全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md)
6. Use a separate review agent after coding, not only self-check
7. Within an already approved module UI scope, repeated UI refinements can continue without creating a brand-new implementation document each time
8. If the menu structure, page rules, interaction scope, backend scope, or rollout boundary materially change, revise the implementation document and get re-approval before continuing
