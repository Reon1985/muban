# AI Exec Hooks

本目录承接 `__PROJECT_NAME__` 仓库当前默认挂载的轻量 hook 与自动学习脚本。

当前目录直接负责本仓库实际挂载的本地脚本，用于补足 AI 执行层的提醒、检查、收集与回填辅助。

当前状态：

1. 脚本已支持 Claude hooks 自动触发输入
2. 项目级自动触发配置已接入 `.claude/settings.local.json`
3. 仍遵守“只提醒、检查、收集，不自动改正式规则”的边界

当前脚本：

1. `startup-doc-check.sh`
2. `pre-build-gate-check.sh`
3. `pre-doc-skill-sync-check.sh`
4. `pre-release-batch-gate.sh`
5. `finish-backfill-check.sh`
6. `candidate-learning-capture.sh`

固定检查口径：

1. `startup-doc-check.sh`
   - 检查当前版本说明是否存在
   - 检查项目入口说明是否存在
   - 检查当前会话是否仍从正式入口链进入，而不是绕过入口散读
2. `pre-build-gate-check.sh`
   - 检查是否已经完成入口链定位
   - 检查是否已明确当前任务范围与不改项
   - 检查是否已确认实施文档批准状态与最小验证命令
3. `pre-doc-skill-sync-check.sh`
   - 检查 skill / hook / AI 治理文档调整时，是否同步检查索引、正式规则与升级日志
4. `pre-release-batch-gate.sh`
   - 检查发版类动作是否已有冻结问题清单、必要验证项与真实豁免原因
5. `finish-backfill-check.sh`
   - 检查关键结果是否已补文档、补升级日志或补连续性资产
6. 任务机已启用时，hooks 还应补查：
   - 关键任务是否已有 `TraceID`
   - 跨会话任务是否已有 `.handoff/`
   - 关键任务是否已记录主执行者与独立复核结论

使用示例：

```bash
bash .claude/scripts/ai-exec-hooks/startup-doc-check.sh v1.4
bash .claude/scripts/ai-exec-hooks/pre-build-gate-check.sh v1.4 "AI执行增强层"
bash .claude/scripts/ai-exec-hooks/pre-doc-skill-sync-check.sh
bash .claude/scripts/ai-exec-hooks/pre-release-batch-gate.sh "scp target.jar deploy@your-host:/opt/your-app/app.jar.upload"
bash .claude/scripts/ai-exec-hooks/finish-backfill-check.sh "AI执行增强层轻量试点"
bash .claude/scripts/ai-exec-hooks/candidate-learning-capture.sh "AI执行增强层轻量试点"
```

自动触发挂载：

1. `SessionStart` -> `startup-doc-check.sh`
2. `PreToolUse(Edit|Write|MultiEdit|NotebookEdit)` -> `pre-build-gate-check.sh`
3. `PreToolUse(Edit|Write|MultiEdit|NotebookEdit)` -> `pre-doc-skill-sync-check.sh`
4. `PreToolUse(Bash)` -> `pre-release-batch-gate.sh`
5. `Stop` -> `finish-backfill-check.sh`
6. `Stop(async)` -> `candidate-learning-capture.sh`

门禁补充说明：

1. `pre-release-batch-gate.sh` 只在命中发版类 Bash 命令时生效
2. 对测试报告驱动修复场景，脚本检查的是“字段有实际内容”，不是只看标题是否存在
3. 如需例外放行，实施文档中必须写出真实豁免原因，空白模板不会放行
4. `pre-doc-skill-sync-check.sh` 只做本仓库 AI 执行层同步提醒，不自动阻断、不自动改正式文档
5. 如果项目启用了任务机或连续性资产，应把对应结果同步回 `task-machine/`、`.project_state.json`、`.handoff/`

与正式规则的关系：

1. hooks 只负责提醒、检查、收集，不单独定义长期规则正文
2. 版本入口、实施门禁、独立复核和任务机口径，以 `doc/` 与 `task-machine/` 中正式文档为准
3. 如果 hook 检查项升级影响默认执行方式，必须先回写正式文档，再更新本 README 和挂载配置
