#!/bin/bash

set -euo pipefail

PROJECT_DIR=$(pwd)
CODEX_SKILL_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
PROJECT_SKILL_DIR="$PROJECT_DIR/.claude/skills"

chmod +x .claude/scripts/build-context.sh || true
if [ -d ".claude/scripts/ai-exec-hooks" ]; then
  chmod +x .claude/scripts/ai-exec-hooks/*.sh
fi

echo "[OK] local scripts are executable"

if [ -d "$CODEX_SKILL_DIR" ] && [ -d "$PROJECT_SKILL_DIR" ]; then
  LINK_NAME="$CODEX_SKILL_DIR/project-${PWD##*/}-skills"
  rm -rf "$LINK_NAME"
  ln -s "$PROJECT_SKILL_DIR" "$LINK_NAME"
  echo "[OK] linked local Claude skills -> $LINK_NAME"
else
  echo "[SKIP] CODEX skill dir or project .claude/skills missing"
fi

if [ -f ".project_state.json" ]; then
  echo "[OK] state machine file is present"
else
  echo "[WARN] missing .project_state.json"
fi
