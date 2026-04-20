# 文档治理 README

## 1. 文件定位

本目录承接项目级文档治理、AI 阅读路径、Agent / Skill 协作规则、文档结构规范与知识回填规则。

如果当前任务涉及：

1. 文档应该落到哪里
2. AI / Agent / Skill 应该怎么配合
3. 代码改动前有哪些门禁
4. 新规则、新模板、新 skill 应该写进哪一层

优先从本目录进入。

## 2. 最小阅读顺序

建议按下面顺序建立上下文：

1. [AI阅读路径规范/current/README.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/README.md)
2. [AI阅读路径规范/current/SOUL.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/SOUL.md)
3. [AI阅读路径规范/current/WORKFLOW.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/WORKFLOW.md)
4. [AI阅读路径规范/current/AGENTS.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/AGENTS.md)
5. [AI阅读路径规范/current/开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md)

## 3. Agent / Skill 入口

如果当前任务涉及 agent 选型、skill 边界、项目专属 skill 维护或去重治理，优先看：

1. [AI阅读路径规范/current/全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md)
2. [AI阅读路径规范/current/文档与skill去重治理规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md)
3. [AI阅读路径规范/current/文档、SOP、模板与Skill职责边界规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档、SOP、模板与Skill职责边界规范.md)

## 4. 执行与治理规则

如果当前任务涉及执行骨架、接入、知识隔离、自动学习边界或批量收口规则，按需看：

1. [AI阅读路径规范/current/测试报告驱动问题批量收口规则.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/测试报告驱动问题批量收口规则.md)
2. [AI阅读路径规范/current/问题修复文档归档与执行规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/问题修复文档归档与执行规范.md)
3. [AI阅读路径规范/current/复杂任务蓝图规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/复杂任务蓝图规范.md)
4. [AI阅读路径规范/current/新项目接入规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/新项目接入规范.md)
5. [AI阅读路径规范/current/项目级知识隔离规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/项目级知识隔离规范.md)
6. [AI阅读路径规范/current/轻量自动学习与自动进化边界规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/轻量自动学习与自动进化边界规范.md)
7. [AI阅读路径规范/current/轻量hook清单设计规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/轻量hook清单设计规范.md)

## 5. 结构与回填规则

如果当前任务涉及文档落点、结构迁移、知识回填或历史映射，优先看：

1. [文档结构规范/current/doc目录结构与使用规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/文档结构规范/current/doc目录结构与使用规范.md)
2. [知识回填规范/current/框架探索与知识回填规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/知识回填规范/current/框架探索与知识回填规范.md)
3. [文档结构规范/versions/v1/项目文档体系整体重构方案v1.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/文档结构规范/versions/v1/项目文档体系整体重构方案v1.md)
4. [文档结构规范/versions/v1/现有文档迁移映射表v1.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/文档结构规范/versions/v1/现有文档迁移映射表v1.md)
5. [AI阅读路径规范/current/问题修复文档归档与执行规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/问题修复文档归档与执行规范.md)

## 6. 使用原则

1. 总纲、流程、角色、开发门禁分别看不同权威正文，不在 README 重复维护整套规则。
2. 涉及 Agent / Skill 的问题，优先看正式文档中的权威口径，再看仓库 `.codex/skills/` 中的项目 adapter。
3. 新增长期规则优先写入 `01-规范标准/`，重复执行步骤优先写入 `02-标准操作手册/`，不要把长期规则直接塞进模板或 skill。
