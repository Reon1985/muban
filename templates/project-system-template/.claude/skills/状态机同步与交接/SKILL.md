# 状态机同步与交接 Skill

## 当前状态

- `历史试点 / 非默认`
- 当前仓库默认执行链以正式文档和 `.codex/skills/` 主 adapter 为准
- 本 skill 仅在维护历史状态机、交接单和 `.handoff` 资产时按需使用，不作为当前默认收尾入口

## 1. 触发场景
- 明确正在维护 `.project_state.json`、`.handoff/` 或历史状态机试点资产时。
- 旧试点任务因为上下文截断、技术中断而需要补写交接单时。
- 新会话启动且确认需要接力旧状态机任务时。

## 2. 核心指令集

### 2.1 同步状态 (Sync State)
```text
指令: "执行状态机同步 [TASK_ID] [PHASE]"
动作: 
1. 读取 `.project_state.json`。
2. 更新 `current_phase` 和对应的 `steps` 状态为 "COMPLETED"。
3. 检查是否有新的 Handoff 产生。
```

### 2.2 生成交接单 (Gen Handoff)
```text
指令: "生成本轮交接单 [TASK_ID]"
动作:
1. 提取当前会话中已达成的共识（API 定义、表结构、UI 规则）。
2. 提取当前代码实现的快照。
3. 识别下一步必须由下游 Agent 完成的动作。
4. 写入 `.handoff/[TASK_ID].md`。
```

### 2.3 恢复任务 (Recover Task)
```text
指令: "根据状态机恢复任务"
动作:
1. 读取 `.project_state.json` 确定 `active_task_id` 和 `current_phase`。
2. 读取对应的 `.handoff/[TASK_ID].md`。
3. 输出: "我已同步至 [PHASE]，之前的硬约束为 [xxx]，下一步应由 [Agent Name] 执行 [xxx]。"
```

## 3. 禁令
- **禁止误当默认入口**：当前仓库的大多数任务不应默认调用本 skill。
- **禁止口头交接**：如果已经确定沿用旧状态机资产，则严禁只靠聊天约定，必须物理化到 Handoff 文件。
- **禁止状态过期**：仅当该任务仍属于旧状态机试点时，才要求同步状态机。
