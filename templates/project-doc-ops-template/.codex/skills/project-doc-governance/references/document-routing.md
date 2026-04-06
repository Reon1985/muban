# Document Routing

## 1. Entry And Governance Layer

Keep these in `doc/` root or `doc/00-入口/`:

- `README.md`
- `项目文档总览.md`
- `00-入口/README.md`
- `00-入口/AI执行入口.md`
- `00-入口/当前生效版本说明.md`
- `00-入口/目录导航与阅读顺序.md`
- Locator docs such as frontend, backend, environment, and version entry files

Rule:

- Root and entry files are for navigation, startup context, and reusable project cognition
- Do not place single-change implementation docs, per-version UI schemes, or raw inputs here

## 2. Standards Layer

Use `01-规范标准/` for long-lived rules:

- AI reading path and governance rules
- Frontend and backend standards
- UI standards and page-implementation standards
- Document-structure rules
- Stable framework cognition and common architecture standards

## 3. SOP Layer

Use `02-标准操作手册/` for high-frequency operator guides:

- Deployment and release cards
- Test execution manuals
- Page connectivity and click-test procedures
- Reusable operational runbooks

## 4. Version Package Layer

Use `03-版本包/<版本>/` for version-specific formal deliverables:

- `需求/`: requirement baselines, page lists, rule lists
- `前端/`: UI schemes, preview plans, formal page schemes
- `后端/`: backend schemes and implementation support docs
- `数据库/`: schema designs and table-structure docs
- `测试/`: test plans, execution records, verification reports
- `升级/`: implementation docs in status folders such as `待确认`, `已确认`, `已执行`, `已作废`
- `版本总览.md`: per-version summary and navigation

Rule:

- If a document belongs to one version only, keep it inside that version package
- Do not put current version deliverables into generic root folders unless they are meant to become long-lived standards

## 5. Problem And Log Layers

Use:

- `04-问题总结/` for known issues, root-cause analysis, troubleshooting guides, risk lists, and framework limits
- `05-升级日志/` for system change evidence, implementation records, and AI-execution evolution logs

Rule:

- System changes belong in the normal version or system logs
- AI / rule / skill evolution belongs in `05-升级日志/AI执行体系/AI能力与规则升级日志.md`

## 6. Archive Layer

Use `99-参考与归档/` for:

- raw DOCX, PDFs, screenshots, templates, and external source materials
- historical references and deprecated documents
- migration leftovers and archived comparison material

## 7. Naming Rules

Use Chinese filenames by default.

Recommended patterns:

- Long-lived formal docs: `主题 + 类型 + v1.md`
- Small revision: `主题 + 类型 + v1.1.md`
- Single-change implementation docs: `主题 + 实施文档 + 1.0.md`
- Logs: `主题 + 日志 + 2026-03-28.md`

Keep fixed-name governance files unversioned in the filename:

- `README.md`
- `SOUL.md`
- `AGENTS.md`
- `WORKFLOW.md`
- `AI执行入口.md`
- `当前生效版本说明.md`

## 8. Transitional-State Rule

This repository has already moved into the layered structure. During cleanup:

1. New formal docs should follow the current layered structure, not the old generic folders
2. Existing archived or compatibility material may stay in historical folders until an explicit migration batch is approved
3. If an old document is superseded, point readers to the new formal destination when helpful

## 9. Quick Decision Table

- Startup navigation or current-version entry: `doc/` root or `00-入口/`
- Long-lived governance or standards: `01-规范标准/`
- Reusable operator manual: `02-标准操作手册/`
- Version-only requirement / UI / DB / API / implementation / test doc: `03-版本包/<版本>/`
- Known issue or troubleshooting guide: `04-问题总结/`
- System change evidence or AI execution evolution: `05-升级日志/`
- Raw reference, template, screenshot, or archive: `99-参考与归档/`
