# 任务全生命周期编排剧本 (Mission Orchestrator)

## 当前状态

- `历史试点 / 非默认`
- 当前仓库主入口已收敛到 `.codex/skills/project-ai-doc-ops` 与 `.codex/skills/project-doc-governance`
- 本剧本仅在维护旧的 `.project_state.json` / `.handoff` / 状态机试点资产时按需参考，不作为当前默认执行入口

## 1. 核心理念
本剧本是早期 2.0 状态机试点留下的历史剧本，用于解释当时如何把任务拆成 5 个物理阶段。

当前仓库默认不再把它当作“最高指令”或默认入口；只有在维护旧的状态机、handoff 或历史试点资料时，才按需参考其中结构。

## 2. 剧本流程定义

### Phase 1: MISSION_START (任务启动)
- **历史触发**: 早期试点中，用户下达新任务且需要进入状态机追踪时。
- **动作**:
  1. 调用 `build-context.sh` 聚合模块上下文。
  2. 初始化 `.project_state.json` 中的 `active_task_id`。
  3. 识别当前是否为“接力任务”（即是否已有 handoff）。
- **历史目标**: 锁定 TraceID，精准加载上下文。

### Phase 2: REQUIREMENTS_AND_DESIGN (需求与设计)
- **历史触发**: 状态机 `current_phase` 为 `INIT` 且仍在沿用该试点流程时。
- **动作**:
  1. 委派 `agency-product-manager` 进行需求与页面规则对齐。
  2. 委派 `agency-software-architect` 进行库表设计或 API 契约对齐。
  3. **强制**: 必须产出正式的“方案设计”文档，而不是仅停留在对话。
- **历史目标**: 达成业务与技术共识。

### Phase 3: IMPLEMENTATION_GATE (实施门禁)
- **历史触发**: 方案已定且继续沿用旧状态机门禁时。
- **动作**:
  1. 委派 `agency-technical-writer` 编写“实施文档”。
  2. **强制**: 询问用户“是否批准此实施方案？”。
  3. 更新状态机为 `APPROVED`。
- **历史目标**: 获得代码修改的法定权力。

### Phase 4: CODING_AND_COMMIT (编码落地)
- **历史触发**: 状态机为 `APPROVED` 且当轮任务仍在旧试点中执行。
- **动作**:
  1. 根据任务类型委派主开发 Agent。
  2. **强制**: Git Commit Message 必须以 `[TraceID]` 开头。
  3. 记录开发过程中的“框架新发现”。
- **历史目标**: 物理落地代码，记录变更轨迹。

### Phase 5: CLOSURE_AND_HANDOFF (闭环收口)
- **历史触发**: 代码编写完成且需要为旧状态机生成交接材料时。
- **动作**:
  1. 委派 `agency-code-reviewer` 审查代码。
  2. 运行 `git diff` 进行自动化文档回填 (Diff-to-Doc)。
  3. 生成本次任务的 `.handoff/[TraceID].md`。
  4. 同步更新 `.project_state.json` 为 `COMPLETED`。
- **历史目标**: 沉淀知识，准备好下一次接力。

## 3. 剧本硬约束
- **仅限历史试点**: 这些硬约束只适用于仍在维护旧状态机资料的场景。
- **当前默认流程**: 当前仓库正式默认入口和阶段判断，以 `.codex/skills` 主 adapter 和 `doc/` 中的正式规则为准。
