---
name: doc-governance-core
description: "Reusable document-governance and implementation-gate workflow for documentation-driven software projects. Use when creating or updating requirements, page rules, UI plans, database or API design docs, implementation docs, review packages, migration docs, or when deciding where a formal document belongs. Pair with a project adapter skill when a repository has one."
---

# Doc Governance Core

## Overview

Use this skill for the formal-document layer of a software project:

1. route formal outputs into the project's approved document structure
2. keep requirements, rules, UI plans, database or API design docs, and implementation docs in sync
3. enforce implementation gating before code work
4. make sure key formal outputs receive an independent review pass before they become the next-stage baseline

## Before You Start

If the repository has a project adapter skill such as `project-doc-governance`, use that adapter together with this core skill.

The core skill owns reusable governance rules.
The project adapter owns the repository's actual directory layout, fixed document names, migration history, and project-specific routing details.

Load detailed references only when needed:

- [references/change-control.md](references/change-control.md)
- [references/document-routing-contract.md](references/document-routing-contract.md)

## Workflow Decision

Classify the request into one of three types before producing output:

1. `doc-only`
   - Requirement, UI, overview, review, migration, governance, or summary documents
   - Do not touch code
2. `plan-first`
   - The user ultimately wants code changes, but there is no approved implementation document yet
   - Produce or update the implementation document and stop
3. `approved-build`
   - There is a confirmed implementation document and explicit approval to enter code
   - Code edits are allowed, but only within the approved scope

## Non-Negotiable Rules

1. Never modify code first and explain later.
2. Treat all code changes as gated work, including small fixes and UI tweaks, unless the repository explicitly defines a lighter path.
3. If there is no approved implementation document, stop at documentation and impact analysis.
4. Route formal docs into the project's approved layered structure rather than scattering them into ad hoc folders.
5. Check whether a same-purpose formal document already exists before creating a new one.
6. For work that affects an existing formal page, keep the preview-first sequence: confirm requirements and rules, build an isolated preview, confirm UI, then move into database or API design and implementation docs.
7. Key formal outputs should receive `1` main-agent pass plus `1` independent-review pass before they become the working baseline.
8. Lightweight typo, link, or pure formatting fixes can stay on self-check only.
9. Reusable framework or governance discoveries must be written back into the correct formal docs before the task is treated as complete.

## Resources

### references/

- `change-control.md`: reusable implementation gate, preview-first flow, and key-output review rules
- `document-routing-contract.md`: what the project adapter should define about structure and naming
