---
name: project-doc-governance
description: "__PROJECT_NAME__-repository adapter for the global doc-governance-core workflow. Use after or together with doc-governance-core when creating or updating formal documents in this repository, deciding where a document belongs, applying the repository's layered doc structure, or enforcing the repository-specific implementation review gate."
---

# Project Doc Governance

## Overview

Use this skill as the `__PROJECT_NAME__` repository adapter layer for the global `doc-governance-core` skill.

The global core owns reusable governance rules.
This adapter provides the repository's actual `doc/` structure, current entry docs, migration context, and repository-specific gate details.

This skill is the document-governance and gate-control specialist for this repository. For the repo-wide startup flow, task classification, and total execution loop, first use `project-ai-doc-ops`.

## Start Here

Use the global `doc-governance-core` workflow first, then read these repository docs:

Read these files first:

- [CLAUDE.md](__PROJECT_ROOT__/CLAUDE.md)
- [doc/README.md](__PROJECT_ROOT__/doc/README.md)
- [doc/00-入口/README.md](__PROJECT_ROOT__/doc/00-入口/README.md)
- [doc/00-入口/AI执行入口.md](__PROJECT_ROOT__/doc/00-入口/AI执行入口.md)
- [doc/00-入口/当前生效版本说明.md](__PROJECT_ROOT__/doc/00-入口/当前生效版本说明.md)
- [doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md)
- [doc/01-规范标准/文档治理/知识回填规范/current/框架探索与知识回填规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/知识回填规范/current/框架探索与知识回填规范.md)
- [doc/01-规范标准/文档治理/文档结构规范/current/doc目录结构与使用规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/文档结构规范/current/doc目录结构与使用规范.md)
- [doc/项目文档总览.md](__PROJECT_ROOT__/doc/项目文档总览.md)

When the task involves implementation-agent selection, independent-review-agent selection, or agent / skill rule updates, also read:

- [doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md)
- [doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md)

When the task directly changes repository-local skills or hooks, also read:

- [.codex/skills/README.md](__PROJECT_ROOT__/.codex/skills/README.md)
- [.claude/skills/README.md](__PROJECT_ROOT__/.claude/skills/README.md)
- [.claude/scripts/ai-exec-hooks/README.md](__PROJECT_ROOT__/.claude/scripts/ai-exec-hooks/README.md)

When the task involves document inventory, migration, or historical references, also read:

- [doc/01-规范标准/文档治理/文档结构规范/versions/v1/现有文档迁移映射表v1.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/文档结构规范/versions/v1/现有文档迁移映射表v1.md)

Load detailed routing and gate rules only when needed:

- [references/document-routing.md](references/document-routing.md)
- [references/change-control.md](references/change-control.md)

## Workflow Decision

Within this repository, classify every request into one of three types before producing output:

1. `doc-only`
   - Requirement, UI, overview, review, migration, governance, or summary documents
   - Do not touch code
2. `plan-first`
   - The user ultimately wants code changes, but there is no approved implementation document yet
   - Produce or update the implementation document and stop
3. `approved-build`
   - There is a confirmed implementation document and the user has explicitly approved moving into code changes
   - Code edits are allowed, but only within the approved scope

## Non-Negotiable Rules

1. The global `doc-governance-core` guardrails still apply in this repository.
2. Never modify code first and explain later.
3. Treat all code changes as gated work, including small fixes and UI tweaks.
4. If there is no approved implementation document, stop at documentation and impact analysis.
5. Prefer the approved target doc structure from the project standard. Do not keep generating new formal docs in legacy compatibility folders unless the user explicitly asks to preserve the old layout.
6. Keep fixed-name governance files unversioned in the filename. Put version or revision information inside the body when needed.
7. Start with documentation context before exploring code or framework details whenever the task is inside this repository.
7.1 For code-related work, prioritize the locator docs first: `CLAUDE.md` -> `doc/00-入口/当前生效版本说明.md` -> current directory `README.md` -> `doc/00-入口/项目定位与环境/前端.md` / `doc/00-入口/项目定位与环境/后端.md` / `doc/01-规范标准/后端/权限与数据范围规范/current/框架用户组织角色数据权限架构说明.md` -> target files.
8. If exploration produces new reusable framework knowledge, backfill it into the correct formal document before treating the task as complete.
9. Do not leave framework discoveries only in the chat thread.
10. For approved code work, read [doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md) before editing.
11. Treat that development-stage entry document as authoritative for coding-stage rules.
12. When a task produces a key formal output, default to `1` main agent plus `1` independent review agent before treating that output as the next-stage baseline.
12.1 For every key task, automatically choose the most appropriate main agent before starting substantive work.
12.2 After the main result is produced, automatically choose the most appropriate independent review agent before treating the task as complete.
13. Key formal outputs include requirement baselines, page lists, rule lists, UI plans, database designs, API lists, implementation docs, test conclusions, and code-bearing implementation packages.
14. Independent review is not a formality. The review result should clearly say whether there are omissions, conflicts, implementation gaps, or reasons the output should not advance yet.
15. Lightweight typo, link, or pure formatting fixes can stay on self-check only. Anything that changes scope, rules, structure, data, APIs, implementation boundaries, or rollout conclusions still needs independent review.
16. When coding, automatically choose the most appropriate implementation agent by task type.
17. After coding, automatically choose an appropriate review agent for code review.
18. For page or interaction work that affects an existing formal page, keep the preview-first sequence: confirm requirements and rules -> create an isolated preview page or route -> confirm UI -> then move into database/API design and implementation docs.
19. Existing-page previews should preserve formal-page search items, core fields, and action semantics, and should not become a disconnected new prototype.
20. Preview pages should not be cluttered with rule-explanation blocks or review-only prose; if they are not fully aligned with the formal page yet, mark the differences explicitly.
21. If the task involves agent / skill selection or agent / skill rule changes, consult [doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md) as needed.
22. If new reusable development rules are discovered during implementation, write them back into the correct standard doc and update [doc/05-升级日志/AI执行体系/AI能力与规则升级日志.md](__PROJECT_ROOT__/doc/05-升级日志/AI执行体系/AI能力与规则升级日志.md) when the execution system itself changed.
23. If formal code work exceeded `8` minutes, complete an efficiency retrospective and route long-lived rules back into standards or SOPs before handoff.
24. Do not let project skills become the only place where long-lived governance rules exist; if a rule affects future decisions, keep it in formal docs.
25. When a task changes project skill boundaries, default prompts, routing guidance, or authority-source rules, update the corresponding formal docs in the same batch.
26. When a task changes repository hooks, also check whether hook README, hook mount config, and the AI execution upgrade log need updates in the same batch.

## Document Routing

Minimum routing rules:

- Root entry and navigation files stay in `doc/` and `doc/00-入口/`
- Long-lived standards and project rules go to `01-规范标准/`
- High-frequency operator instructions go to `02-标准操作手册/`
- Version-specific formal outputs go to `03-版本包/<版本>/`
- Problems, risks, troubleshooting, and limitations go to `04-问题总结/`
- Change evidence and execution evolution go to `05-升级日志/`
- Raw materials, templates, screenshots, and historical references go to `99-参考与归档/`

## Document vs Skill Boundary

Use formal docs for:

- long-lived governance rules
- routing and naming standards
- approval gates and review standards
- default agent / skill selection guidance

Use project skills for:

- repository-specific entry routing
- minimal reading order
- execution shortcuts and task classification
- concise adapter logic that points back to the formal docs

If both are involved:

- the document remains the authority source
- the skill mirrors only the minimal execution-facing subset
- both must stay synchronized

## Code Change Gate

Follow [references/change-control.md](references/change-control.md) before any code edit.

Mandatory rule for this repository:

- No code modification is allowed until the user has confirmed the implementation document.

## Output Checklist

Before finishing a task, confirm:

- The document type is correctly classified
- The target location matches the new layered standard
- Legacy compatibility folders were not used as the primary formal destination
- Existing same-purpose docs were checked before creating a new formal document
- Key formal outputs received an independent review pass when required
- The review result clearly states omissions, conflicts, implementation readiness, and whether the task can advance
- If code was requested, an approved implementation document exists
- If code was changed, the development-stage standard doc was checked first
- If project skill guidance changed, the corresponding `SKILL.md`, formal docs, and `agents/openai.yaml` consistency were checked
- If repository-local skills or hooks changed, the `.codex/skills/README.md`, `.claude/skills/README.md`, `.claude/scripts/ai-exec-hooks/README.md`, and AI execution upgrade log were checked

## Resources

### references/

- `document-routing.md`: directory, naming, and versioning rules
- `change-control.md`: implementation document gate, preview-first flow, and key-output review workflow
