---
name: project-ai-doc-ops
description: "__PROJECT_NAME__-repository adapter for the global ai-doc-ops-core workflow. Use after or together with ai-doc-ops-core when working in this repository to supply the actual startup docs, task routing, current-version entry points, preview-first baseline, and repository-specific execution expectations."
---

# Project Ai Doc Ops

## Overview

Use this skill as the `__PROJECT_NAME__` repository adapter layer for the global `ai-doc-ops-core` skill.

The global core owns the reusable workflow.
This adapter provides the repository-specific reading path, entry documents, current-version anchors, and routing targets.

If the same method is migrated to another project, keep the global core and rewrite only the adapter.

This adapter answers five repository-specific questions before work begins:

1. which `__PROJECT_NAME__` docs to read first
2. where the current version baseline lives
3. whether the task should stop at docs, stay in preview, or can enter implementation
4. which repo-local specialist docs should be loaded next
5. when to hand off to `project-doc-governance`

## Start Here

Use the global `ai-doc-ops-core` workflow first, then read these repository docs:

Read these files first:

- [CLAUDE.md](__PROJECT_ROOT__/CLAUDE.md)
- [doc/README.md](__PROJECT_ROOT__/doc/README.md)
- [doc/00-入口/README.md](__PROJECT_ROOT__/doc/00-入口/README.md)
- [doc/00-入口/AI执行入口.md](__PROJECT_ROOT__/doc/00-入口/AI执行入口.md)
- [doc/00-入口/当前生效版本说明.md](__PROJECT_ROOT__/doc/00-入口/当前生效版本说明.md)
- [doc/01-规范标准/文档治理/AI阅读路径规范/current/SOUL.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/SOUL.md)
- [doc/01-规范标准/文档治理/AI阅读路径规范/current/AGENTS.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/AGENTS.md)
- [doc/01-规范标准/文档治理/AI阅读路径规范/current/WORKFLOW.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/WORKFLOW.md)
- [doc/01-规范标准/文档治理/AI阅读路径规范/current/AI协作与项目运作体系说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/AI协作与项目运作体系说明.md)

When the task involves agent / skill selection, skill governance, or authority-source decisions, also read:

- [doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md)
- [doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md)

When the task directly changes the repository AI execution layer, also read:

- [.codex/skills/README.md](__PROJECT_ROOT__/.codex/skills/README.md)
- [.claude/skills/README.md](__PROJECT_ROOT__/.claude/skills/README.md)
- [.claude/scripts/ai-exec-hooks/README.md](__PROJECT_ROOT__/.claude/scripts/ai-exec-hooks/README.md)

Load detailed entry references only when needed:

- [references/startup-path.md](references/startup-path.md)
- [references/task-routing.md](references/task-routing.md)
- [references/review-loop.md](references/review-loop.md)

## Task Decision

Within this repository, classify the request before doing substantial work:

1. `context-and-routing`
   - The user needs to understand the project state, current version, reading order, or where to start
   - Build context and route to the right formal docs
2. `document-governed`
   - The user needs requirements, page rules, UI plans, implementation docs, migration, review docs, or naming / routing decisions
   - Load [project-doc-governance](__PROJECT_ROOT__/.codex/skills/project-doc-governance/SKILL.md)
3. `preview-first`
   - The task changes an existing formal page or needs page confirmation before backend work
   - Keep the work in requirements / page rules / isolated preview until UI confirmation
4. `design-after-preview`
   - UI is already confirmed and the next work is database design, API design, implementation packaging, or test planning
   - Use the confirmed UI and current version docs as the baseline
5. `approved-build`
   - There is an approved implementation document and explicit user approval to enter code
   - Coding is allowed, but still within the document-first and review-loop rules
6. `sop-or-execution`
   - The task is deployment, test execution, click validation, release, or troubleshooting
   - Route into `02-标准操作手册`, `04-问题总结`, or `05-升级日志` as appropriate

## Core Workflow

Apply the global core workflow with these repository specifics:

1. start from the listed entry docs, not from scattered code reads
2. identify the current version and target module
3. classify the task type
4. for formal-document routing or implementation gating, load `project-doc-governance`
5. for existing-page changes, keep the work in preview until UI is confirmed
6. for code work, require the approved implementation document plus the current development-stage rules
7. finish with validation, backfill, and change-log updates when required
8. if the task changes project-local skills, hooks, or AI execution entry docs, treat it as an execution-layer governance change and check the repository AI layer indexes together

## Non-Negotiable Rules

1. The global `ai-doc-ops-core` guardrails still apply in this repository.
2. In this repository, start from the documented entry chain before module-level exploration.
3. Do not jump into database or API design before page rules and UI confirmation for preview-first tasks.
4. Do not edit code before there is an approved implementation document.
5. If AI, rule, or skill behavior changes, update the formal rule docs and the AI execution upgrade log.
6. If this skill's routing, boundaries, or default invocation guidance change, also check whether [全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md) and [文档与skill去重治理规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md) need updates.
7. If the task changes repository-local skills or hooks, also sync [.claude/skills/README.md](__PROJECT_ROOT__/.claude/skills/README.md) and [.claude/scripts/ai-exec-hooks/README.md](__PROJECT_ROOT__/.claude/scripts/ai-exec-hooks/README.md) as needed.

## Coordination Model

Default collaboration model for this repository:

1. `1` main agent owns the primary output
2. `1` independent review agent checks omissions, conflicts, implementability, and stage readiness
3. the main thread sets boundaries, watches the critical path, and merges the result
4. do not let the main agent review itself through a near-identical role
5. do not over-process tiny, non-semantic edits

## Skill Boundary

Use this skill as a repository adapter, not as a hidden rules database.

1. Long-lived project rules stay in formal docs
2. This skill should stay focused on entry routing, task classification, and next-step decisions
3. If a new rule would affect future task judgment, update the formal docs first or in the same change
4. Prefer references files over growing SKILL.md into a second copy of the governance docs

## When To Load The Governance Skill

Load `project-doc-governance` when the task needs:

1. formal document routing into the layered `doc/` structure
2. implementation-document gating details
3. per-version document packaging
4. naming, migration, or archive decisions
5. document-only tasks that still need formal review packaging

## Resources

### references/

- `startup-path.md`: mandatory startup reading path and context-building order
- `task-routing.md`: task classification and next-step routing
- `review-loop.md`: repository-local emphasis for the main-agent and independent-review loop
