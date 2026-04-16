# __PROJECT_NAME__

这是 `__PROJECT_NAME__` 的 AI 项目管理体系初始化模板。

## 1. 最小启动顺序

1. `CLAUDE.md`
2. `doc/README.md`
3. `doc/00-入口/README.md`
4. `doc/00-入口/AI执行入口.md`
5. `doc/00-入口/当前生效版本说明.md`
6. 如属大型跨会话任务，再补读 `.project_state.json` / `.handoff/`

## 2. 当前模板已包含

1. 项目 adapter skills
2. 项目级 hooks 与脚本
3. 文档分层骨架
4. 版本包骨架
5. 关键任务自动主 agent / 独立复核 agent 协作骨架
6. AI 执行增强层长期规则与模板
7. 可选连续性辅助资产（如 `.project_state.json`、`.handoff/`）

## 3. 初始化后建议第一批修改

1. 把 `CLAUDE.md` 改成你的真实项目入口说明
2. 把 `doc/00-入口/当前生效版本说明.md` 改成你的真实当前版本
3. 把 `doc/00-入口/项目定位与环境/` 补成你的真实环境定位文档
4. 如果你的项目需要跨会话任务续接，再把 `.project_state.json` 初始化成真实任务状态
5. 根据项目需要补充部署、测试和业务模块的正式正文
