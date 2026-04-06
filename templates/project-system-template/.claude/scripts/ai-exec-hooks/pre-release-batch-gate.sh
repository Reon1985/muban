#!/bin/bash

set -euo pipefail

INPUT_JSON=""
if [ ! -t 0 ]; then
  INPUT_JSON="$(cat || true)"
fi

HOOK_MODE="0"
COMMAND="${1:-}"
DOCS_OVERRIDE="${2:-}"

guess_version() {
  if [ -f "doc/00-入口/当前生效版本说明.md" ]; then
    local found
    found="$(sed -n 's/.*当前项目版本：`\\([^`]*\\)`.*/\\1/p' 'doc/00-入口/当前生效版本说明.md' | head -n 1)"
    if [ -n "$found" ]; then
      echo "$found"
      return
    fi
  fi
  echo "v1.4"
}

fail_gate() {
  local message="$1"
  if [ "$HOOK_MODE" = "1" ]; then
    echo "$message" >&2
    exit 2
  fi
  echo "$message"
  exit 1
}

is_release_command() {
  local cmd="$1"
  printf '%s' "$cmd" | grep -Eiq \
    'sshpass .*scp|scp .*192\.168\.24\.48|rsync .*192\.168\.24\.48|pnpm build:stage|pnpm build:prod|start-jeelowcode\.sh|/opt/jeelowcode|nohup java -jar|/opt/company-accounting-system/frontend|pkill -9 -f .*jeelowcode-admin\.jar'
}

doc_is_report_driven() {
  local file="$1"
  rg -q '来源测试报告|测试报告：|测试报告版本|报告日期 / 版本' "$file"
}

doc_status() {
  local file="$1"
  python3 - "$file" <<'PY'
import re
import sys
from pathlib import Path

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")
lines = text.splitlines()

def has_value(prefixes):
    for idx, line in enumerate(lines):
        stripped = line.strip()
        for prefix in prefixes:
            if stripped.startswith(prefix):
                value = stripped[len(prefix):].strip()
                if value and value not in {"-", "无", "N/A", "待补充", "待确认", "否"}:
                    return True
                j = idx + 1
                while j < len(lines):
                    nxt = lines[j].strip()
                    if not nxt:
                        j += 1
                        continue
                    if nxt.startswith("#") or re.match(r"^\d+\.", nxt):
                        break
                    if nxt not in {"-", "无", "N/A", "待补充", "待确认", "否"}:
                        return True
                    j += 1
    return False

def section_has_content(keywords):
    for idx, line in enumerate(lines):
        stripped = line.strip()
        if stripped.startswith("#") and any(keyword in stripped for keyword in keywords):
            j = idx + 1
            while j < len(lines):
                nxt = lines[j].strip()
                if not nxt:
                    j += 1
                    continue
                if nxt.startswith("#"):
                    break
                if re.match(r"^\d+\.\s*$", nxt):
                    j += 1
                    continue
                if nxt in {"-", "无", "N/A", "待补充", "待确认", "否"}:
                    j += 1
                    continue
                return True
                j += 1
    return False

report_ok = has_value(["3. 来源测试报告：", "1. 来源测试报告：", "来源测试报告：", "测试报告："])
issues_ok = has_value(["1. 本轮必修复：", "1. 本轮问题清单：", "本轮问题清单："]) or section_has_content(["本轮必修复", "本轮问题清单"])
freeze_ok = has_value(["1. 本轮冻结范围：", "冻结问题清单："]) or section_has_content(["冻结问题清单"])
verify_ok = has_value(["2. 统一发版验证计划：", "统一发版验证计划：", "统一发版验证：", "统一验证计划："]) or section_has_content(["统一发版验证计划", "统一发版验证", "统一验证计划"])
waiver_ok = has_value(["2. 如不适用，豁免原因：", "豁免原因：", "例外豁免："]) or section_has_content(["豁免原因", "例外豁免"])

if waiver_ok:
    print("WAIVED")
elif report_ok and issues_ok and freeze_ok and verify_ok:
    print("COMPLIANT")
else:
    print("INCOMPLETE")
PY
}

collect_active_docs() {
  python3 <<'PY'
import json
from pathlib import Path

state_path = Path(".project_state.json")
version_path = Path("doc/00-入口/当前生效版本说明.md")
version = "v1.4"
if version_path.exists():
    import re
    m = re.search(r"当前项目版本：`([^`]+)`", version_path.read_text(encoding="utf-8"))
    if m:
        version = m.group(1)

if not state_path.exists():
    raise SystemExit(0)

data = json.loads(state_path.read_text(encoding="utf-8"))
for item in data.get("active_tasks", []):
    entry = item.get("entry_doc") or ""
    status = item.get("status") or ""
    if status != "ACTIVE":
        continue
    if f"doc/03-版本包/{version}/" not in entry:
        continue
    if Path(entry).exists():
        print(entry)
PY
}

if [ -n "$INPUT_JSON" ]; then
  HOOK_MODE="1"
  TOOL_NAME="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); print(data.get("tool_name",""))' 2>/dev/null || true)"
  COMMAND="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); ti=data.get("tool_input") or {}; print(ti.get("command",""))' 2>/dev/null || true)"
  if [ "$TOOL_NAME" != "Bash" ]; then
    exit 0
  fi
fi

if [ -z "$COMMAND" ]; then
  exit 0
fi

if ! is_release_command "$COMMAND"; then
  exit 0
fi

VERSION="$(guess_version)"

if [ -n "$DOCS_OVERRIDE" ]; then
  ACTIVE_DOCS="$DOCS_OVERRIDE"
else
  ACTIVE_DOCS="$(collect_active_docs)"
fi

if [ -z "$ACTIVE_DOCS" ]; then
  exit 0
fi

REPORT_DOCS=()
NONCOMPLIANT_DOCS=()

while IFS= read -r file; do
  [ -n "$file" ] || continue
  if doc_is_report_driven "$file"; then
    REPORT_DOCS+=("$file")
    STATUS="$(doc_status "$file")"
    if [ "$STATUS" = "INCOMPLETE" ]; then
      NONCOMPLIANT_DOCS+=("$file")
    fi
  fi
done <<EOF
$ACTIVE_DOCS
EOF

if [ "${#REPORT_DOCS[@]}" -eq 0 ]; then
  exit 0
fi

if [ "${#NONCOMPLIANT_DOCS[@]}" -gt 0 ]; then
  MESSAGE="[BLOCK] 命中测试报告驱动修复发布门禁。当前活跃实施文档缺少“本轮问题清单 / 冻结问题清单 / 统一发版验证计划”字段，且未写明豁免原因："
  for file in "${NONCOMPLIANT_DOCS[@]}"; do
    MESSAGE="${MESSAGE}
- ${file}"
  done
  MESSAGE="${MESSAGE}
请先按以下文档补齐后再发版：
- doc/01-规范标准/文档治理/AI阅读路径规范/current/测试报告驱动问题批量收口规则.md
- doc/02-标准操作手册/测试执行/测试报告问题批量收口与统一发版验证操作卡片1.0.md
- doc/02-标准操作手册/AI执行模板/测试报告问题批量收口实施模板.md"
  fail_gate "$MESSAGE"
fi

if [ "$HOOK_MODE" != "1" ]; then
  echo "=== pre-release-batch-gate ==="
  echo "版本: ${VERSION}"
  echo "[OK] 测试报告驱动修复文档已满足批量收口门禁。"
fi
