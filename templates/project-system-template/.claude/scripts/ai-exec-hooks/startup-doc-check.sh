#!/bin/bash

set -euo pipefail

INPUT_JSON=""
if [ ! -t 0 ]; then
  INPUT_JSON="$(cat || true)"
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

FILES=(
  "CLAUDE.md"
  ".project_state.json"
  "doc/README.md"
  "doc/00-入口/README.md"
  "doc/00-入口/AI执行入口.md"
  "doc/00-入口/当前生效版本说明.md"
  ".codex/skills/README.md"
  ".claude/skills/README.md"
  ".claude/scripts/ai-exec-hooks/README.md"
  "doc/03-版本包/${VERSION}/README.md"
)

echo "=== startup-doc-check ==="
echo "版本: ${VERSION}"

missing=0
for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    echo "[OK] $file"
  else
    echo "[MISSING] $file"
    missing=1
  fi
done

if [ "$missing" -eq 0 ]; then
  echo "结论: 入口文档齐全。"
else
  echo "结论: 存在缺失入口文档，请先补齐。"
fi
