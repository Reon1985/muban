#!/bin/bash

# AI 上下文聚合脚本 v2.0
# 用法: ./build-context.sh [模块名] [任务ID]

MODULE=$1
TASK_ID=$2
CURRENT_VERSION_FILE="doc/00-入口/当前生效版本说明.md"

if [ -z "$MODULE" ]; then
    echo "使用错误: 请提供模块名 (如 pm, base_setting)"
    exit 1
fi

OUTPUT_FILE=".claude/tmp_context_${MODULE}.md"

echo "---" > $OUTPUT_FILE
echo "### AI 任务上下文聚合 (Module: ${MODULE}, TaskID: ${TASK_ID})" >> $OUTPUT_FILE
echo "生成时间: $(date)" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

append_matches() {
    local title="$1"
    shift
    echo "#### [${title}]" >> "$OUTPUT_FILE"
    for dir in "$@"; do
        if [ -d "$dir" ]; then
            find "$dir" -type f \( -name "*.md" -o -name "*.txt" \) -maxdepth 5 | grep "$MODULE" | while read -r file; do
                echo "File: ${file}" >> "$OUTPUT_FILE"
                cat "$file" >> "$OUTPUT_FILE"
                echo "" >> "$OUTPUT_FILE"
            done
        fi
    done
    echo "" >> "$OUTPUT_FILE"
}

# 1. 抓取需求基线 (优先匹配模块名)
append_matches "需求基线" \
    "doc/03-版本包" \
    "doc/02-标准操作手册"

# 2. 抓取当前状态与交接单
echo "#### [当前状态机]" >> $OUTPUT_FILE
cat .project_state.json >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

if [ ! -z "$TASK_ID" ] && [ -f ".handoff/${TASK_ID}.md" ]; then
    echo "#### [最新交接单]" >> $OUTPUT_FILE
    cat ".handoff/${TASK_ID}.md" >> $OUTPUT_FILE
fi

# 3. 抓取相关技术方案
append_matches "方案设计" \
    "doc/01-规范标准" \
    "doc/02-标准操作手册"

if [ -f "$CURRENT_VERSION_FILE" ]; then
    echo "#### [当前版本入口]" >> "$OUTPUT_FILE"
    cat "$CURRENT_VERSION_FILE" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
fi

echo "---" >> $OUTPUT_FILE

echo "上下文已聚合至: $OUTPUT_FILE"
echo "请告知 AI: '读取 $OUTPUT_FILE 启动任务'"
