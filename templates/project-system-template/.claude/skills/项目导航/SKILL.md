# 项目导航

## 触发条件

当用户或 AI 需要快速定位当前项目的正式文档、代码入口、执行规则或版本材料时触发。

## 核心原则

先按入口和索引定位文档，再按文档定位代码；默认不从散落正文和源码盲扫开始。

## 当前导航结构

### 根入口

- [CLAUDE.md](__PROJECT_ROOT__/CLAUDE.md)

### 一级入口

- [doc/README.md](__PROJECT_ROOT__/doc/README.md)
- [项目文档总览.md](__PROJECT_ROOT__/doc/项目文档总览.md)
- [00-入口/README.md](__PROJECT_ROOT__/doc/00-入口/README.md)

### 二级索引

- [01-规范标准/README.md](__PROJECT_ROOT__/doc/01-规范标准/README.md)
- [02-标准操作手册/README.md](__PROJECT_ROOT__/doc/02-标准操作手册/README.md)
- [03-版本包/README.md](__PROJECT_ROOT__/doc/03-版本包/README.md)
- [04-问题总结/README.md](__PROJECT_ROOT__/doc/04-问题总结/README.md)
- [05-升级日志/README.md](__PROJECT_ROOT__/doc/05-升级日志/README.md)
- [99-参考与归档/README.md](__PROJECT_ROOT__/doc/99-参考与归档/README.md)

## 任务路由速查

| 当前任务 | 先看哪里 |
| --- | --- |
| 想判断当前项目如何启动 | [CLAUDE.md](__PROJECT_ROOT__/CLAUDE.md) |
| 想确认整体文档结构 | [项目文档总览.md](__PROJECT_ROOT__/doc/项目文档总览.md) |
| 想查长期规则 | [01-规范标准/README.md](__PROJECT_ROOT__/doc/01-规范标准/README.md) |
| 想查部署、测试、回滚 SOP | [02-标准操作手册/README.md](__PROJECT_ROOT__/doc/02-标准操作手册/README.md) |
| 想看本轮版本正文 | [03-版本包/README.md](__PROJECT_ROOT__/doc/03-版本包/README.md) |
| 想查历史问题和风险 | [04-问题总结/README.md](__PROJECT_ROOT__/doc/04-问题总结/README.md) |
| 想查升级证据和治理演进 | [05-升级日志/README.md](__PROJECT_ROOT__/doc/05-升级日志/README.md) |
| 想直接定位前后端代码 | [前端.md](__PROJECT_ROOT__/doc/00-入口/项目定位与环境/前端.md) / [后端.md](__PROJECT_ROOT__/doc/00-入口/项目定位与环境/后端.md) |
| 想定位权限、组织和数据范围 | [框架用户组织角色数据权限架构说明.md](__PROJECT_ROOT__/doc/01-规范标准/后端/权限与数据范围规范/current/框架用户组织角色数据权限架构说明.md) |

## 权威规则速查

| 主题 | 权威文档 |
| --- | --- |
| 标准流程 | [WORKFLOW.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/WORKFLOW.md) |
| 开发执行规则 | [开发规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md) |
| AI 协作说明 | [AI协作与项目运作体系说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/AI协作与项目运作体系说明.md) |
| 原则与价值观 | [SOUL.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/SOUL.md) |
| 角色与协作边界 | [AGENTS.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/AGENTS.md) |
| Agent 与 Skill 说明 | [全局Agent与Skill说明.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/AI阅读路径规范/current/全局Agent与Skill说明.md) |
| 文档目录规范 | [doc目录结构与使用规范.md](__PROJECT_ROOT__/doc/01-规范标准/文档治理/文档结构规范/current/doc目录结构与使用规范.md) |

## 代码定位路径

### 定位前端代码

```text
CLAUDE.md
→ 项目文档总览
→ 00-入口/项目定位与环境/前端.md
→ 目标模块目录
→ 目标文件
```

### 定位后端代码

```text
CLAUDE.md
→ 项目文档总览
→ 00-入口/项目定位与环境/后端.md
→ 目标模块目录
→ 目标文件
```

### 定位权限相关代码

```text
CLAUDE.md
→ 项目文档总览
→ 权限与数据范围规范
→ 前端.md / 后端.md
→ 目标文件
```

## 最快阅读路径

### 新任务进入

```text
CLAUDE.md
→ doc/README.md
→ 00-入口/README.md
→ 当前目标目录 README
→ 正文
```

### 进入开发前

```text
CLAUDE.md
→ 项目文档总览
→ 开发规范
→ 当前实施文档
→ 当前模块正式正文
```

## 注意事项

1. 先走入口和 README，不默认全库散读。
2. 文档已有结论时，优先复用，不重复探索。
3. 只有文档无法支撑判断时，才扩大到全库搜索。
