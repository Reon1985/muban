#!/bin/bash

set -euo pipefail

INPUT_JSON=""
if [ ! -t 0 ]; then
  INPUT_JSON="$(cat || true)"
fi

HOOK_MODE="0"
if [ -n "$INPUT_JSON" ]; then
  HOOK_MODE="1"
fi

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

VERSION="${1:-$(guess_version)}"
KEYWORD="${2:-}"
BASE_DIR="doc/03-版本包/${VERSION}/升级/待确认"

fail_gate() {
  local message="$1"
  if [ "$HOOK_MODE" = "1" ]; then
    echo "$message" >&2
    exit 2
  fi
  echo "$message"
  exit 1
}

if [ -n "$INPUT_JSON" ]; then
  TOOL_NAME="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); print(data.get("tool_name",""))' 2>/dev/null || true)"
  FILE_PATH="$(printf '%s' "$INPUT_JSON" | python3 -c 'import json,sys; data=json.load(sys.stdin); ti=data.get("tool_input") or {}; print(ti.get("file_path") or ti.get("notebook_path") or "")' 2>/dev/null || true)"

  case "$TOOL_NAME" in
    Edit|Write|MultiEdit|NotebookEdit) ;;
    *) exit 0 ;;
  esac

  case "$FILE_PATH" in
    *"/web_back/"*|*"/java_front/"*) ;;
    *) exit 0 ;;
  esac
fi

if [ "$HOOK_MODE" != "1" ]; then
  echo "=== pre-build-gate-check ==="
  echo "版本: ${VERSION}"
fi

if [ ! -d "$BASE_DIR" ]; then
  fail_gate "[BLOCK] 缺少实施文档目录: ${BASE_DIR}"
fi

if [ -n "$KEYWORD" ]; then
  matches=$(find "$BASE_DIR" -type f -name "*实施文档*.md" | grep "$KEYWORD" || true)
else
  matches=$(find "$BASE_DIR" -type f -name "*实施文档*.md" || true)
fi

if [ -z "$matches" ]; then
  fail_gate "[BLOCK] 未找到匹配的实施文档。建议: 先补实施文档，再进入代码实现。"
fi

if [ -z "$INPUT_JSON" ]; then
  echo "[OK] 命中实施文档:"
  echo "$matches"
  echo
  echo "人工确认清单:"
  echo "1. 是否已明确改动目标"
  echo "2. 是否已明确改动范围"
  echo "3. 是否已明确不改内容"
  echo "4. 是否已明确风险点"
fi
