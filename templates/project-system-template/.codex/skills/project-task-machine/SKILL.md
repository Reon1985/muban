---
name: project-task-machine
description: "Use for TraceID checks, handoff checks, and task-machine go/no-go decisions when the project enables continuity assets."
---

# Project Task Machine

## 触发条件

- 项目已启用任务机或连续性资产
- 关键任务启动
- 跨会话接力
- 关键任务收尾

## 核心原则

- 已启用任务机的关键任务必须有 TraceID
- 已启用任务机的跨会话任务必须有 handoff
- 已启用任务机的关键产出无 review 结论不得标记完成

## 必须先读的文档

1. `task-machine/项目任务机运行资产与拦截规范.md`
2. `doc/01-规范标准/文档治理/AI阅读路径规范/current/开发规范.md`

## 任务分型 / 判断分支

1. `start-task`
2. `resume-task`
3. `finish-task`

## 最小检查清单

- 是否已有 TraceID
- 是否已有 handoff
- 是否已记录主执行者
- 是否已记录独立复核者
- 是否已记录 review 结论
- 是否缺少必要文档回填

## 输出模板或结论格式

- 当前 TraceID
- 当前阶段
- 缺失项
- 是否允许继续
- 下一步建议

## 需要同步检查的入口

- `task-machine/`
- 项目仓 `.project_state.json`
- 项目仓 `.handoff/`
