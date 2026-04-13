# __PROJECT_NAME__ — AI 快速启动入口

## 1. 文件定位

本文件是当前仓库的 `L0` 启动入口。

默认先从这里进入，再进入 `doc/` 分层文档体系，不从零散代码或旧目录直接启动。

## 2. 最小阅读链路

```text
CLAUDE.md
→ doc/README.md
→ doc/00-入口/README.md
→ doc/00-入口/AI执行入口.md
→ doc/00-入口/当前生效版本说明.md
→ 目标标准 / 目标SOP / 目标版本包
```

## 3. 硬规则

1. 状态机优先：跨会话任务先看 `.project_state.json`
2. 入口优先：先走 `doc/00-入口/`，不要盲扫仓库
3. 文档优先：没有实施文档，不默认改代码
4. 探索必回填：新结论必须回写正式文档
5. SOP 优先：部署、发版、测试优先读 `02-标准操作手册/`
6. AI 执行层联动：如果修改 `.codex/skills/`、`.claude/skills/`、`.claude/scripts/ai-exec-hooks/` 或 AI 治理文档，默认同步检查它们的 README 和升级日志

## 4. 当前仓库结构速查

```text
.doc           可按项目需要自行扩展
.claude/       hooks、脚本、项目专属 skill 与临时产物
.codex/        项目 adapter skills
.handoff/      交接单目录
.project_state.json  状态机

doc/
  00-入口/
  01-规范标准/
  02-标准操作手册/
  03-版本包/
  04-问题总结/
  05-升级日志/
  99-参考与归档/
```

## 5. 一句话使用方式

先读本文件，再进入 `doc/README.md` 和 `doc/00-入口/README.md`，后续所有正式结论默认进入分层文档体系。

如果本轮任务直接修改 AI 执行体系，再补读：

1. `.codex/skills/README.md`
2. `.claude/skills/README.md`
3. `.claude/scripts/ai-exec-hooks/README.md`
