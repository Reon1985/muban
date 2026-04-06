# Task Classification

Route work by the first irreversible decision it requires.

## 1. Context And Routing

Use when the user needs:

- startup reading order
- current version or current baseline
- target module navigation
- clarification on which documents matter first

Output:

- the right entry docs
- the right next stage
- the right project adapter or specialist skill to load

## 2. Document-Governed Work

Use when the user needs:

- requirement docs
- page lists or rule lists
- UI plans
- implementation docs
- review docs
- migration or archive decisions

Action:

- load the repository's document-governance adapter when one exists
- otherwise use the repository's approved doc structure and gate rules

## 3. Preview-First Work

Use when a new version changes an existing formal page or when page confirmation must precede backend design.

Sequence:

1. requirement baseline
2. page list or rule list
3. isolated preview page or route
4. UI confirmation
5. database or API design
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

- treat the confirmed UI and current approved docs as the baseline

## 5. Approved Build Work

Use when there is:

- an approved implementation document
- explicit approval to enter code

Rule:

- stay within the approved scope
- still use independent review for key outputs and code review after implementation

## 6. SOP Or Troubleshooting Work

Use when the task is:

- deployment
- release
- test execution
- troubleshooting
- migration execution

Rule:

- route into the repository's SOP, troubleshooting, or upgrade-log layer
