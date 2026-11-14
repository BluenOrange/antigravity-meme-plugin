#!/usr/bin/env bash
set -e

echo "=========================================="
echo "🚀 开始安装 AGY Meme 表情包插件 (macOS / Linux)..."
echo "=========================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/plugin.json" ]; then
    PLUGIN_SOURCE="$SCRIPT_DIR"
elif [ -f "$SCRIPT_DIR/agy-meme/plugin.json" ]; then
    PLUGIN_SOURCE="$SCRIPT_DIR/agy-meme"
else
    echo "❌ 未找到 plugin.json，请确认脚本在插件目录下运行！"
    exit 1
fi

TARGET_DIR="$HOME/.gemini/config/plugins/agy-meme"
echo "目标安装路径: $TARGET_DIR"

mkdir -p "$TARGET_DIR"

echo "正在复制插件文件..."
cp -R "$PLUGIN_SOURCE/"* "$TARGET_DIR/"

echo "正在配置环境路径..."
for file in "$TARGET_DIR/rules/AGENTS.md" "$TARGET_DIR/skills/meme-core/SKILL.md"; do
    if [ -f "$file" ]; then
        sed -i.bak "s|{PLUGIN_DIR}|$TARGET_DIR|g" "$file" && rm -f "$file.bak"
        sed -i.bak "s|C:/Users/[^/]*/\.gemini/config/plugins/agy-meme|$TARGET_DIR|g" "$file" && rm -f "$file.bak"
        echo "✅ 已配置路径: $file"
    fi
done

echo "=========================================="
echo "🎉 AGY Meme 表情包插件安装成功！"
echo "👉 请在 Antigravity 中重启软件或打开 Customizations 页面即可立即使用！"
echo "=========================================="
