---
name: ai-doc-ops-core
description: "Reusable top-level workflow for documentation-driven software projects. Use at the start of a substantive repository task to build context, classify the work, keep document-first and preview-first sequencing, decide when formal design or implementation is allowed, and coordinate a main-agent plus independent-review loop. Pair with a project adapter skill when a repository has one."
---

# AI Doc Ops Core

## Overview

Use this skill as the global operating skeleton for software projects that rely on formal documentation, staged design, and gated implementation.

It answers five questions before deeper work begins:

1. what kind of task this is
2. which project materials to read first
3. whether the task stays in docs, stays in preview, or can enter implementation
4. which main agent should lead
5. when an independent review pass is required before advancing

## Before You Start

If the repository has a project adapter skill such as `project-ai-doc-ops`, use that adapter together with this core skill.

The core skill owns the reusable workflow.
The project adapter owns actual repository paths, document names, version entry files, and project-specific exceptions.

Load detailed references only when needed:

- [references/task-classification.md](references/task-classification.md)
- [references/review-loop.md](references/review-loop.md)
- [references/project-adapter-contract.md](references/project-adapter-contract.md)

## Core Workflow

Follow this default spine:

1. start from repository entry docs, not from blind code exploration
2. identify the current version, target module, and target stage
3. classify the task
4. choose `1` main agent for the primary output
5. if the output is a key artifact, require `1` independent review agent before advancing
6. if the task changes an existing formal page, keep the work in requirement clarification and isolated preview until UI is confirmed
7. if the task will change code, require an approved implementation document first
8. finish with validation, documentation backfill, and execution-log updates when required

## Non-Negotiable Rules

1. Do not start from blind code exploration when entry docs can establish context first.
2. Do not jump into database or API design before page rules and UI confirmation for preview-first tasks.
3. Do not edit code before there is an approved implementation document.
4. Treat requirements, rule lists, UI plans, database designs, API contracts, implementation docs, test conclusions, and code as key outputs that need independent review before they become the next-stage baseline.
5. Use lightweight self-check only for typo, link, or pure formatting fixes that do not change meaning or scope.
6. Backfill reusable discoveries into formal docs; do not leave them only in chat or code comments.
7. When the repository has a project adapter, let the adapter supply the actual reading path, document structure, and approval signals.

## Resources

### references/

- `task-classification.md`: reusable task categories and stage decisions
- `review-loop.md`: reusable main-agent and independent-review loop
- `project-adapter-contract.md`: what a project adapter should define
