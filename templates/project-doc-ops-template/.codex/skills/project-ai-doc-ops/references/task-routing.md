# Task Routing

Route tasks by the first irreversible decision they require.

## 1. Context And Navigation

Use when the user needs project state, current-version location, or reading order.

Output:

- correct doc entry path
- current version baseline
- target module docs

## 2. Formal Document Work

Use when the user needs:

- requirement docs
- page lists or rule lists
- UI schemes
- implementation docs
- review docs
- migration or archive decisions

Action:

- load [project-doc-governance](__PROJECT_ROOT__/.codex/skills/project-doc-governance/SKILL.md)

## 3. Preview-First Work

Use when a new version changes an existing formal page or when page confirmation must precede backend design.

Sequence:

1. requirement baseline
2. page list / rule list
3. isolated preview page or route
4. UI confirmation
5. database / API design
6. implementation document
7. approved build

## 4. Design-After-Preview Work

Use when UI is already confirmed and the next artifact is:

- database design
- API list
- technical solution
- implementation package
- test package

Rule:

- treat the confirmed UI and current version docs as the baseline

## 5. Approved Build Work

Use when there is:

- an approved implementation document
- explicit user approval to enter code

Rule:

- still stay within the approved scope
- still use independent review for key outputs and code review after implementation
