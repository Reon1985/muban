# 状态机同步与交接 Skill

## 1. 触发场景
- 任何阶段性任务（如需求确认、接口设计、代码编写）完成时。
- 探测到 Token 消耗接近上限或任务由于技术原因中断时。
- 新会话启动且需要接力上一次任务时。

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
- **禁止口头交接**：在大型任务中，严禁仅通过聊天文字进行后续动作的约定，必须物理化到 Handoff 文件。
- **禁止状态过期**：每次发版或重大代码合入后，状态机必须同步。
