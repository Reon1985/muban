#!/bin/bash

set -euo pipefail

INPUT_JSON=""
if [ ! -t 0 ]; then
  INPUT_JSON="$(cat || true)"
fi

TASK_NAME="${1:-未命名任务}"

should_emit="1"
if [ -n "$INPUT_JSON" ]; then
  STOP_HOOK_ACTIVE="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); print(str(bool(data.get("stop_hook_active", False))).lower())' 2>/dev/null || true)"
  if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
    exit 0
  fi
  LAST_MESSAGE="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); print((data.get("last_assistant_message") or "").replace("\n"," "))' 2>/dev/null || true)"
  if printf '%s' "$LAST_MESSAGE" | grep -Eiq '未完成|尚未完成|继续处理中|处理中|进行中|未收口|待继续|wip|in progress|not finished|not completed'; then
    should_emit="0"
  fi
  if ! printf '%s' "$LAST_MESSAGE" | grep -Eiq '完成|已完成|收口|交付|下一步|done|completed|finished|wrapped|handoff'; then
    should_emit="0"
  fi
  if [ -n "$LAST_MESSAGE" ]; then
    TASK_NAME="$(printf '%s' "$LAST_MESSAGE" | cut -c1-40)"
  fi
fi

if [ "$should_emit" != "1" ]; then
  exit 0
fi

python3 - "$TASK_NAME" <<'PY'
import json
import sys

task_name = sys.argv[1] if len(sys.argv) > 1 else "未命名任务"
message = (
    "收尾提醒：\n"
    f"任务：{task_name}\n"
    "1. 是否需要独立复核\n"
    "2. 是否需要回填到 01-规范标准\n"
    "3. 是否需要回填到 02-标准操作手册\n"
    "4. 是否需要回填到 04-问题总结\n"
    "5. 是否需要回填到 05-升级日志\n"
    "6. 是否需要效率复盘"
)
print(json.dumps({
    "systemMessage": message,
    "suppressOutput": True
}, ensure_ascii=False))
PY
