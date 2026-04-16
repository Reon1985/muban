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
