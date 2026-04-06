# Project Adapter Contract

When a repository has its own adapter skill, the adapter should define the repository-specific layer that the core skill intentionally leaves open.

The adapter should provide:

1. startup docs and reading order
2. current version entry files
3. the repository's approved document structure
4. actual preview-first exceptions or constraints
5. the repository's approval signal for entering code
6. where discoveries, retrospectives, and upgrade logs must be written back
7. recommended specialist skills or role combinations for that repository

The adapter should not weaken the core guardrails:

- document-first context building
- preview before DB or API work for existing-page changes
- implementation-document gate before code
- independent review for key outputs

When the same workflow is migrated to another project:

- keep the core skill stable
- rewrite only the adapter layer and its references
