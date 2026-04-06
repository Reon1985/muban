#!/bin/bash

set -euo pipefail

INPUT_JSON=""
if [ ! -t 0 ]; then
  INPUT_JSON="$(cat || true)"
fi

TASK_NAME="${1:-未命名任务}"
if [ -n "$INPUT_JSON" ]; then
  STOP_HOOK_ACTIVE="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); print(str(bool(data.get("stop_hook_active", False))).lower())' 2>/dev/null || true)"
  if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
    exit 0
  fi
  LAST_MESSAGE="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); print((data.get("last_assistant_message") or "").replace("\n"," "))' 2>/dev/null || true)"
  if printf '%s' "$LAST_MESSAGE" | grep -Eiq '未完成|尚未完成|继续处理中|处理中|进行中|未收口|待继续|wip|in progress|not finished|not completed'; then
    exit 0
  fi
  if ! printf '%s' "$LAST_MESSAGE" | grep -Eiq '完成|已完成|收口|交付|下一步|done|completed|finished|wrapped|handoff'; then
    exit 0
  fi
  if [ -n "$LAST_MESSAGE" ]; then
    TASK_NAME="$(printf '%s' "$LAST_MESSAGE" | cut -c1-40)"
  fi
fi

OUTPUT_DIR=".claude/tmp_ai_learning"
TIMESTAMP="$(date '+%Y%m%d_%H%M%S')"
SAFE_NAME="$(
  python3 - "$TASK_NAME" <<'PY'
import re
import sys

name = sys.argv[1] if len(sys.argv) > 1 else "task"
name = name.replace(" ", "_").replace("/", "_")
name = re.sub(r"[^\w\u4e00-\u9fff-]", "", name, flags=re.UNICODE)
name = re.sub(r"_+", "_", name).strip("_")
print(name or "task")
PY
)"
if [ -z "$SAFE_NAME" ]; then
  SAFE_NAME="task"
fi
OUTPUT_FILE="${OUTPUT_DIR}/${TIMESTAMP}_${SAFE_NAME}.md"

mkdir -p "$OUTPUT_DIR"

cat > "$OUTPUT_FILE" <<EOF
# 候选经验池

## 1. 基本信息

1. 任务名称：${TASK_NAME}
2. 生成时间：$(date '+%Y-%m-%d %H:%M:%S')

## 2. 错误候选

1. 

## 3. 规则候选

1. 

## 4. SOP 候选

1. 

## 5. hook 候选

1. 

## 6. 风险候选

1. 

## 7. 建议回填路径

1. 01-规范标准：
2. 02-标准操作手册：
3. 04-问题总结：
4. 05-升级日志：

## 8. 审查结论

1. 待人工审查
EOF

python3 - "$OUTPUT_FILE" <<'PY'
import json
import sys

output_file = sys.argv[1] if len(sys.argv) > 1 else ".claude/tmp_ai_learning"
print(json.dumps({
    "systemMessage": f"已生成轻量自动学习候选文件：{output_file}",
    "suppressOutput": True
}, ensure_ascii=False))
PY
