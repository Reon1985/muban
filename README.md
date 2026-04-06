# Codex AI Doc Ops Template Repo

这个仓库用于把“全局 core skills + 项目 adapter skills + 最小文档模板”一起打包，方便你：

- 传到 GitHub
- 在另一台电脑安装全局 skills
- 在另一个项目里快速初始化这套文档运营体系

## 目录结构

- `global-skills/`
  - 可直接安装到 `~/.codex/skills/` 的全局 core skills
- `templates/project-doc-ops-template/`
  - 新项目可用的项目 adapter skills
  - 最小必需文档骨架
- `scripts/install_global_skills.sh`
  - 把 `global-skills/` 安装到本机 Codex 全局技能目录
- `scripts/bootstrap_project_template.py`
  - 把项目模板初始化到目标仓库，并替换路径占位符

## 快速使用

### 1. 在新电脑安装全局 skills

```bash
cd /path/to/this-repo
./scripts/install_global_skills.sh
```

### 2. 在新项目初始化项目 adapter 和文档骨架

```bash
cd /path/to/this-repo
python3 scripts/bootstrap_project_template.py \
  --target /absolute/path/to/your-project \
  --project-name your-project
```

如果目标仓库里已经有同名文件，可以加：

```bash
python3 scripts/bootstrap_project_template.py \
  --target /absolute/path/to/your-project \
  --project-name your-project \
  --force
```

## 分层规则

- 全局 core skills 负责通用方法论
- 项目 adapter skills 负责仓库路径、文档入口、目录结构和项目细则

维护原则：

- 通用规则升级，优先更新 `global-skills/`
- 项目规则升级，优先更新 `templates/project-doc-ops-template/`
- 跨层规则，再双向同步
