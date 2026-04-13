#!/bin/bash

set -euo pipefail

INPUT_JSON=""
if [ ! -t 0 ]; then
  INPUT_JSON="$(cat || true)"
fi

[ -n "$INPUT_JSON" ] || exit 0

TOOL_NAME="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); print(data.get("tool_name",""))' 2>/dev/null || true)"
FILE_PATH="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); ti=data.get("tool_input") or {}; print(ti.get("file_path") or ti.get("notebook_path") or "")' 2>/dev/null || true)"

case "$TOOL_NAME" in
  Edit|Write|MultiEdit|NotebookEdit) ;;
  *) exit 0 ;;
esac

[ -n "$FILE_PATH" ] || exit 0

MATCHED_LAYER=""
case "$FILE_PATH" in
  *"/.codex/skills/"*|*"/.claude/skills/"*)
    MATCHED_LAYER="skills"
    ;;
  *"/.claude/scripts/ai-exec-hooks/"*)
    MATCHED_LAYER="hooks"
    ;;
  *"/doc/01-规范标准/文档治理/AI阅读路径规范/current/"*|*"/doc/05-升级日志/AI执行体系/AI能力与规则升级日志.md")
    MATCHED_LAYER="governance-doc"
    ;;
  *)
    exit 0
    ;;
esac

python3 - "$MATCHED_LAYER" "$FILE_PATH" <<'PY'
import json
import sys

layer = sys.argv[1] if len(sys.argv) > 1 else "governance-doc"
path = sys.argv[2] if len(sys.argv) > 2 else ""

focus = {
    "skills": "正在修改项目本地 skills",
    "hooks": "正在修改项目 hooks",
    "governance-doc": "正在修改 AI 执行治理文档",
}.get(layer, "正在修改 AI 执行层文件")

message = (
    "AI执行层同步提醒：\n"
    f"{focus}\n"
    f"目标文件：{path}\n"
    "1. 是否同步 `.codex/skills/README.md`\n"
    "2. 是否同步 `.claude/skills/README.md`\n"
    "3. 是否同步 `.claude/scripts/ai-exec-hooks/README.md`\n"
    "4. 是否同步 `全局Agent与Skill说明.md` / `文档与skill去重治理规范.md` / `轻量hook清单设计规范.md`\n"
    "5. 是否同步 `AI能力与规则升级日志.md`\n"
    "6. 是否需要补充链接审计或入口清单检查"
)

print(json.dumps({
    "systemMessage": message,
    "suppressOutput": True
}, ensure_ascii=False))
PY
