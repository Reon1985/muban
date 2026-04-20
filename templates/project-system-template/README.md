# __PROJECT_NAME__

这是 `__PROJECT_NAME__` 的 AI 治理与文档体系初始化模板。

## 1. 最小启动顺序

1. `CLAUDE.md`
2. `doc/README.md`
3. `doc/00-入口/README.md`
4. `doc/00-入口/AI执行入口.md`
5. `doc/00-入口/当前生效版本说明.md`
6. 如属大型跨会话任务，再补读 `.project_state.json` / `.handoff/`

## 2. 当前模板已包含

1. 项目 adapter skills
2. 项目级 review / task-machine skills
3. 项目级 hooks 与脚本
4. 文档分层骨架
5. 版本包骨架
6. 关键任务自动主 agent / 独立复核 agent 协作骨架
7. AI 执行增强层长期规则与模板
8. 可选连续性辅助资产（如 `.project_state.json`、`.handoff/`、`task-machine/`）

## 3. 初始化后建议第一批修改

1. 把 `CLAUDE.md` 改成你的真实项目入口说明
2. 把 `doc/00-入口/当前生效版本说明.md` 改成你的真实当前版本
3. 把 `doc/00-入口/项目定位与环境/` 补成你的真实环境定位文档
4. 把 `task-machine/项目任务机运行资产与拦截规范.md` 调整成你的真实启用口径
5. 如果你的项目需要跨会话任务续接，再把 `.project_state.json` 初始化成真实任务状态
6. 根据项目需要补充部署、测试和业务模块的正式正文
