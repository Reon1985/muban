# 任务全生命周期编排剧本 (Mission Orchestrator)

## 1. 核心理念
本剧本是 2.0 体系的最高指令，它将开发过程抽象为 5 个物理阶段。AI 必须像“自动驾驶”一样，感知当前处于哪个阶段，并自动加载对应的 Agent 和工具。

## 2. 剧本流程定义

### Phase 1: MISSION_START (任务启动)
- **触发**: 用户下达新任务。
- **动作**:
  1. 调用 `build-context.sh` 聚合模块上下文。
  2. 初始化 `.project_state.json` 中的 `active_task_id`。
  3. 识别当前是否为“接力任务”（即是否已有 handoff）。
- **目标**: 锁定 TraceID，精准加载上下文。

### Phase 2: REQUIREMENTS_AND_DESIGN (需求与设计)
- **触发**: 状态机 `current_phase` 为 `INIT`。
- **动作**:
  1. 委派 `agency-product-manager` 进行需求与页面规则对齐。
  2. 委派 `agency-software-architect` 进行库表设计或 API 契约对齐。
  3. **强制**: 必须产出正式的“方案设计”文档，而不是仅停留在对话。
- **目标**: 达成业务与技术共识。

### Phase 3: IMPLEMENTATION_GATE (实施门禁)
- **触发**: 方案已定。
- **动作**:
  1. 委派 `agency-technical-writer` 编写“实施文档”。
  2. **强制**: 询问用户“是否批准此实施方案？”。
  3. 更新状态机为 `APPROVED`。
- **目标**: 获得代码修改的法定权力。

### Phase 4: CODING_AND_COMMIT (编码落地)
- **触发**: 状态机为 `APPROVED`。
- **动作**:
  1. 根据任务类型委派主开发 Agent。
  2. **强制**: Git Commit Message 必须以 `[TraceID]` 开头。
  3. 记录开发过程中的“框架新发现”。
- **目标**: 物理落地代码，记录变更轨迹。

### Phase 5: CLOSURE_AND_HANDOFF (闭环收口)
- **触发**: 代码编写完成。
- **动作**:
  1. 委派 `agency-code-reviewer` 审查代码。
  2. 运行 `git diff` 进行自动化文档回填 (Diff-to-Doc)。
  3. 生成本次任务的 `.handoff/[TraceID].md`。
  4. 同步更新 `.project_state.json` 为 `COMPLETED`。
- **目标**: 沉淀知识，准备好下一次接力。

## 3. 剧本硬约束
- **严禁跳关**: 未经过 Phase 3 批准，严禁进入 Phase 4 修改代码。
- **状态感知**: 每次对话开始，AI 必须首先在内心回答：“我现在处于 Phase 几？”。
- **交接为王**: 如果会话即将结束，必须通过 Phase 5 强制产出交接单。
