# AI执行入口

`__PROJECT_NAME__` 默认采用“文档优先、预览先行、实施门禁、独立复核、关键任务自动主/审 agent”的执行模型。

默认动作：

1. 先读入口文档
2. 再判断任务分型
3. 需要正式文档时进入文档治理层
4. 需要代码时先确认实施文档
5. 需要部署、发版、测试时优先进入 `02-标准操作手册/`
6. 如果任务直接修改 AI 执行层，再进入 `.codex/skills/README.md`、`.claude/skills/README.md` 和 `.claude/scripts/ai-exec-hooks/README.md`
7. 如果任务属于大型跨会话协作，再按需读取 `.project_state.json` 与 `.handoff/` 作为连续性辅助
