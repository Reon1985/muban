# 项目辅助 Skills

## 1. 目录定位

本目录存放本项目历史保留且仍可复用的辅助 skills，用于：

- 承接 `.codex/skills/` 主 adapter 之外的辅助提醒
- 提供项目特定阶段的复用剧本或检查清单
- 为历史试点技能保留可追溯入口，但不再与正式文档争夺主入口

当前仓库的 AI 辅助层分为三块：

- `/.codex/skills/`：当前 Codex 默认优先读取的项目本地 adapter skills，也是当前仓库主入口
- `/.claude/skills/`：历史保留、仍可复用的项目辅助 skills，默认不作为主入口
- `/.claude/scripts/ai-exec-hooks/`：只负责提醒、检查、收集的轻量 hooks

一句话：

- 先走 `.codex/skills/`，再按需补 `.claude/skills/`。

## 2. 当前 Skills 清单

| Skill | 状态 | 用途 | 触发场景 |
|-------|------|----------|
| [需求审查前置](./需求审查前置/SKILL.md) | `辅助可用` | 用户提出修改意见时的前置审查 | 需求/页面/交互/范围变更 |
| [实施门禁检查](./实施门禁检查/SKILL.md) | `辅助可用` | 确认是否可进入开发阶段 | 进入正式开发前 |
| [UI阶段确认](./UI阶段确认/SKILL.md) | `辅助可用` | UI 阶段高频调整与确认 | 模块 UI 确认阶段 |
| [知识回填提醒](./知识回填提醒/SKILL.md) | `辅助可用` | 探索新结论后的知识沉淀 | 发现新框架认知/规范 |
| [效率复盘](./效率复盘/SKILL.md) | `辅助可用` | 开发超过 8 分钟后的复盘 | 正式开发收尾时 |
| [项目导航](./项目导航/SKILL.md) | `辅助可用` | 快速定位文档和代码 | 需要查找文档/代码 |
| [任务全生命周期编排](./任务全生命周期编排/SKILL.md) | `历史试点 / 非默认` | 早期任务状态机与阶段剧本 | 仅在维护历史试点资产时按需参考 |
| [状态机同步与交接](./状态机同步与交接/SKILL.md) | `历史试点 / 非默认` | 早期 `.project_state.json` / `.handoff` 交接规则 | 仅在维护历史状态机资料时按需参考 |

状态说明：

- `辅助可用`：可作为当前主流程的补充 skill 使用，但不替代 `.codex/skills/` 主 adapter
- `历史试点 / 非默认`：保留追溯价值，不作为当前仓库默认调用入口

## 3. 与全局 Skills 的关系

### 项目辅助 Skills

负责：

- 项目局部场景的辅助提醒
- 对当前正式规则的补充执行提示
- 对历史试点能力的保留和降级承接

### 全局 Skills

负责：

- 通用开发能力（`agency-*`）
- 通用流程能力（`gstack-*`）
- 系统基础能力（`.system/*`）

### 配合使用方式

推荐顺序：

1. 先用 `.codex/skills/` 的项目 adapter 明确流程和规则
2. 再用全局 `agency-*` 选择专业角色
3. 再用全局 `gstack-*` 选择流程技能
4. 最后按需补 `.claude/skills/` 中的辅助 skill 完成复盘、回填或局部检查

典型组合：

```text
project-ai-doc-ops（项目主 adapter）
→ 需求审查前置（项目辅助）
→ agency-product-manager（全局）
→ project-doc-governance（项目主 adapter）
→ 实施门禁检查（项目辅助）
→ agency-frontend-developer（全局）
→ gstack-review（全局）
→ 效率复盘（项目辅助）
→ 知识回填提醒（项目辅助）
```

## 4. 使用建议

### 开发任务

```text
project-ai-doc-ops → project-doc-governance
→ 项目导航 / 实施门禁检查
→ [全局 agent]
→ 效率复盘 → 知识回填提醒
```

### 需求修改

```text
project-ai-doc-ops
→ 需求审查前置 → [全局 agent]
→ UI阶段确认 → 知识回填提醒
```

### 探索任务

```text
project-ai-doc-ops → 项目导航 → [探索] → 知识回填提醒
```

### 历史状态机 / 交接资产维护

```text
project-ai-doc-ops
→ 项目导航
→ 状态机同步与交接（仅在确实维护 .project_state.json / .handoff 时）
```

## 5. 维护规则

- 新增 skill 后，更新本 README 清单
- Skill 内容变化后，同步更新 SKILL.md
- Skill 废弃后，不默认直接删除；先标记状态为 `历史试点 / 非默认`，确认无引用后再移除
- 与 `.codex/skills/` 主 adapter 有重叠或冲突时，优先使用 `.codex/skills/`
- 与正式文档有重叠时，优先更新 `doc/` 中的权威正文，再回写本 README / 对应 SKILL
