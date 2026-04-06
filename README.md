# AI Project Management System Template Repo

这个仓库是“AI 项目管理 2.0 体系”的可迁移模板仓库，目标是让你在另一台电脑或另一个项目里，直接复制并落地以下完整能力：

- 全局 core skills
- 项目 adapter skills
- 项目专属 hooks 与脚本入口
- 状态机与交接机制
- 文档分层结构与入口导航
- AI 执行增强层规则、模板、SOP 与升级日志骨架

## 1. 仓库结构

- `global-skills/`
  放可直接安装到 `~/.codex/skills/` 的全局 core skills
- `templates/project-system-template/`
  放完整项目模板，包含项目 skills、hooks、文档体系、状态机与脚本
- `scripts/install_global_skills.sh`
  把 `global-skills/` 安装到当前电脑的 `~/.codex/skills/`
- `scripts/bootstrap_project_template.py`
  把完整项目模板初始化到目标仓库，并替换项目名与绝对路径占位符

## 2. 推荐使用顺序

### 2.1 新电脑安装全局 skills

```bash
cd /path/to/muban
./scripts/install_global_skills.sh
```

### 2.2 给一个新项目初始化完整体系

```bash
cd /path/to/muban
python3 scripts/bootstrap_project_template.py   --target /absolute/path/to/your-project   --project-name your-project
```

如果目标仓库已存在同名文件，允许覆盖时加：

```bash
python3 scripts/bootstrap_project_template.py   --target /absolute/path/to/your-project   --project-name your-project   --force
```

## 3. 当前模板包含什么

当前模板已经包含：

1. `ai-doc-ops-core`
2. `doc-governance-core`
3. `project-ai-doc-ops`
4. `project-doc-governance`
5. 轻量 hook 与轻量自动学习脚本
6. 测试报告驱动问题批量收口规则与发版门禁
7. 文档分层、状态机、版本包、升级日志骨架
8. AI 执行增强层 `6` 模块相关长期规则与模板

## 4. 维护原则

1. 通用方法论优先更新 `global-skills/`
2. 项目级执行规则优先更新 `templates/project-system-template/`
3. 任何 hook、规则、模板或治理机制升级，优先同步到模板仓库，再同步到业务仓库
4. 业务正文、业务测试报告、业务部署细节不要带回模板仓库，模板仓库只保留可迁移骨架
