# Project Skills README

## 1. 文件定位

本文件是当前仓库 `.codex/skills/` 的项目本地 skill 索引。

它用于回答：

1. 当前项目本地到底维护了哪些 skill
2. 先用哪个 skill
3. 什么时候应该优先更新现有 skill，而不是新增一个重叠 skill

---

## 1.1 使用前提

当前项目统一口径：

1. 正式规则以 `doc/` 中的正式文档为准
2. 项目本地 skill 只做路由、门禁提醒和入口收口
3. 如果某条规则只写在 skill 里、没有正式文档落点，默认视为治理未完成

对应规则见：

1. [文档、SOP、模板与Skill职责边界规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档、SOP、模板与Skill职责边界规范.md)
2. [文档与skill去重治理规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md)

---

## 2. 当前项目本地 Skills

1. [project-ai-doc-ops/SKILL.md](__PROJECT_ROOT__/.codex/skills/project-ai-doc-ops/SKILL.md)
2. [project-doc-governance/SKILL.md](__PROJECT_ROOT__/.codex/skills/project-doc-governance/SKILL.md)

关联辅助层入口：

1. [.claude/skills/README.md](__PROJECT_ROOT__/.claude/skills/README.md)
2. [.claude/scripts/ai-exec-hooks/README.md](__PROJECT_ROOT__/.claude/scripts/ai-exec-hooks/README.md)

---

## 3. 最短使用顺序

如果只想知道“现在该先用哪个 skill”，默认按下面顺序：

1. 先用 `project-ai-doc-ops` 判断任务阶段和阅读入口
2. 涉及正式文档路由、版本承接、实施门禁时，再用 `project-doc-governance`
3. 如果正式文档已经足够清楚，不强制额外展开 skill 说明

一句话：

- 先用 `project-ai-doc-ops` 定位，再按需切 `project-doc-governance`。

---

## 4. 适用边界

### 4.1 `project-ai-doc-ops`

适合场景：

1. 几乎所有正式仓库任务的起步阶段
2. 不确定该先看哪份文档、该进入哪一层
3. 需要先做任务分型，再决定是否进入文档治理、预览、实施或执行阶段
4. 需要判断这次是否同时影响项目辅助 skills / hooks / AI 执行层入口

### 4.2 `project-doc-governance`

适合场景：

1. 写需求、规则、UI、数据库、API、实施文档
2. 判断某份文档应进入 `01 / 02 / 03 / 04 / 05 / 99` 哪一层
3. 判断问题修复文档应留在当前版本包、问题总结还是升级日志
4. 判断 skill / hook 治理变更应同步哪些正式文档和升级日志

正式规则入口：

1. [文档、SOP、模板与Skill职责边界规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档、SOP、模板与Skill职责边界规范.md)
2. [问题修复文档归档与执行规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/问题修复文档归档与执行规范.md)
3. [全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md)

强约束：

1. 正式规则以 `doc/` 中的正式文档为准
2. 本文件只保留最小 skill 入口说明，不平行维护完整规则正文

---

## 5. 新增 Skill 的默认规则

当前项目默认不鼓励因为一个局部场景就新增平行 skill。

新增前至少先判断：

1. 现有两个项目本地 skill 是否已经能覆盖
2. 这次新增是否只是把现有规则重复写一遍
3. 这次新增是否会造成入口竞争或职责重叠

默认优先级：

1. 先更新正式文档
2. 再更新现有 adapter skill
3. 只有在职责明显独立、重复使用频率高且无法被现有 skill 清晰承接时，才新增新的项目本地 skill

---

## 6. 维护动作

只要项目本地 skill 发生调整，默认至少同步检查：

1. [全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md)
2. [文档与skill去重治理规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档与skill去重治理规范.md)
3. [文档、SOP、模板与Skill职责边界规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/文档、SOP、模板与Skill职责边界规范.md)
4. [AI能力与规则升级日志.md](__PROJECT_ROOT__/doc/05-升级日志/AI执行体系/AI能力与规则升级日志.md)
5. [.claude/skills/README.md](__PROJECT_ROOT__/.claude/skills/README.md)
6. [.claude/scripts/ai-exec-hooks/README.md](__PROJECT_ROOT__/.claude/scripts/ai-exec-hooks/README.md)
