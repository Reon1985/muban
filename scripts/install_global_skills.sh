#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOURCE_DIR="${REPO_ROOT}/global-skills"
TARGET_DIR="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "${TARGET_DIR}"

for skill in ai-doc-ops-core doc-governance-core; do
  rm -rf "${TARGET_DIR}/${skill}"
  cp -R "${SOURCE_DIR}/${skill}" "${TARGET_DIR}/"
  echo "Installed ${skill} -> ${TARGET_DIR}/${skill}"
done

echo "Global skills installation complete."
