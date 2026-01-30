#!/bin/bash

# VSCode AI 工具快速安装和配置脚本 (修正版)

echo "开始配置 VSCode AI 工具..."

# 检查是否安装了 VSCode
if ! command -v code &> /dev/null; then
    echo "错误: 未找到 VSCode 命令行工具 'code'"
    echo "请确保已安装 VSCode 并将其添加到 PATH 中"
    exit 1
fi

echo "安装推荐的 AI 扩展..."

# 安装主要 AI 扩展 (使用正确的扩展 ID)
extensions=(
    "GitHub.copilot"
    "GitHub.copilot-chat"
    "TabNine.tabnine-vscode"
    "Codeium.codeium"
    "amazon.q-developer"  # 正确的扩展 ID
    "blackboxapp.blackbox"
    "VisualStudioExptTeam.vscodeintellicode"
    "Aide.aide"
)

for extension in "${extensions[@]}"; do
    echo "正在安装 $extension..."
    code --install-extension "$extension" || echo "警告: $extension 安装失败或已存在"
done

echo "安装辅助开发扩展..."

# 安装辅助扩展
aux_extensions=(
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-toolsai.jupyter"
    "dbaeumer.vscode-eslint"
    "esbenp.prettier-vscode"
    "bradlc.vscode-tailwindcss"
)

for extension in "${aux_extensions[@]}"; do
    echo "正在安装 $extension..."
    code --install-extension "$extension" || echo "警告: $extension 安装失败或已存在"
done

echo "创建 VSCode 用户配置..."

# 创建用户设置
SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"

# 如果配置文件不存在，则创建基本配置；否则备份并更新
if [ ! -f "$SETTINGS_FILE" ]; then
    mkdir -p "$(dirname "$SETTINGS_FILE")"
    cat > "$SETTINGS_FILE" << 'EOF'
{
  "github.copilot.enable": {
    "*": true,
    "yaml": true,
    "plaintext": false,
    "markdown": true
  },
  "github.copilot.editor.enableAutoCompletions": true,
  "github.copilot.advanced": {
    "debug": false,
    "enableCodeBlocks": true
  },
  "tabnine.experimentalAutoImports": true,
  "tabnine.inlineSuggestionLanguageIds": [
    "javascript",
    "typescript",
    "python",
    "java",
    "cpp",
    "c",
    "html",
    "css"
  ],
  "ai.codingAssistant.enabled": true,
  "editor.suggest.showInlineCompletions": true,
  "editor.acceptSuggestionOnCommitCharacter": true,
  "editor.inlineSuggest.enabled": true,
  "telemetry.enableTelemetry": false,
  "github.copilot.privacy": "public",
  "tabnine.maxDisplaySuggestions": 5,
  "github.copilot.editor.enableAutoCompletions": true,
  "codeium.enableChat": true,
  "amazon-q.chat.enabled": true,
  "blackbox.showWelcomeNotification": false,
  "editor.minimap.enabled": true,
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": true,
  "editor.fontSize": 14,
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "editor.wordWrap": "on",
  "files.autoSave": "onFocusChange",
  "explorer.confirmDelete": false,
  "explorer.confirmDragAndDrop": false,
  "workbench.colorTheme": "Default Dark+",
  "terminal.integrated.fontSize": 14
}
EOF
else
    # 备份现有配置
    BACKUP_FILE="$HOME/Library/Application Support/Code/User/settings.json.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$SETTINGS_FILE" "$BACKUP_FILE"
    echo "已备份现有配置到 $BACKUP_FILE"
    
    # 读取现有配置并合并新设置
    TEMP_SETTINGS="/tmp/vscode_settings_new.json"
    jq '. += {
      "github.copilot.enable": {
        "*": true,
        "yaml": true,
        "plaintext": false,
        "markdown": true
      },
      "github.copilot.editor.enableAutoCompletions": true,
      "github.copilot.advanced": {
        "debug": false,
        "enableCodeBlocks": true
      },
      "tabnine.experimentalAutoImports": true,
      "tabnine.inlineSuggestionLanguageIds": [
        "javascript",
        "typescript",
        "python",
        "java",
        "cpp",
        "c",
        "html",
        "css"
      ],
      "ai.codingAssistant.enabled": true,
      "editor.suggest.showInlineCompletions": true,
      "editor.acceptSuggestionOnCommitCharacter": true,
      "editor.inlineSuggest.enabled": true,
      "telemetry.enableTelemetry": false,
      "github.copilot.privacy": "public",
      "tabnine.maxDisplaySuggestions": 5,
      "github.copilot.editor.enableAutoCompletions": true,
      "codeium.enableChat": true,
      "amazon-q.chat.enabled": true,
      "blackbox.showWelcomeNotification": false
    }' "$SETTINGS_FILE" > "$TEMP_SETTINGS" 2>/dev/null || {
        echo "无法合并配置，使用基础配置覆盖"
        cat > "$TEMP_SETTINGS" << 'EOF'
{
  "github.copilot.enable": {
    "*": true,
    "yaml": true,
    "plaintext": false,
    "markdown": true
  },
  "github.copilot.editor.enableAutoCompletions": true,
  "github.copilot.advanced": {
    "debug": false,
    "enableCodeBlocks": true
  },
  "tabnine.experimentalAutoImports": true,
  "tabnine.inlineSuggestionLanguageIds": [
    "javascript",
    "typescript",
    "python",
    "java",
    "cpp",
    "c",
    "html",
    "css"
  ],
  "ai.codingAssistant.enabled": true,
  "editor.suggest.showInlineCompletions": true,
  "editor.acceptSuggestionOnCommitCharacter": true,
  "editor.inlineSuggest.enabled": true,
  "telemetry.enableTelemetry": false,
  "github.copilot.privacy": "public",
  "tabnine.maxDisplaySuggestions": 5,
  "github.copilot.editor.enableAutoCompletions": true,
  "codeium.enableChat": true,
  "amazon-q.chat.enabled": true,
  "blackbox.showWelcomeNotification": false,
  "editor.minimap.enabled": true,
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": true,
  "editor.fontSize": 14,
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "editor.wordWrap": "on",
  "files.autoSave": "onFocusChange",
  "explorer.confirmDelete": false,
  "explorer.confirmDragAndDrop": false,
  "workbench.colorTheme": "Default Dark+",
  "terminal.integrated.fontSize": 14
}
EOF
    }
    mv "$TEMP_SETTINGS" "$SETTINGS_FILE"
fi

echo "创建键盘快捷键配置..."

# 创建键盘快捷键配置
KEYBINDINGS_FILE="$HOME/Library/Application Support/Code/User/keybindings.json"
cat > "$KEYBINDINGS_FILE" << 'EOF'
[
  {
    "key": "ctrl+i",
    "command": "editor.action.inlineSuggest.trigger",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "ctrl+enter",
    "command": "github.copilot.generate",
    "when": "editorHasSelection"
  },
  {
    "key": "ctrl+shift+i",
    "command": "editor.action.formatDocument"
  },
  {
    "key": "ctrl+shift+k",
    "command": "editor.action.deleteLines",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "ctrl+/",
    "command": "editor.action.commentLine"
  },
  {
    "key": "f1",
    "command": "workbench.action.showCommands"
  },
  {
    "key": "ctrl+shift+p",
    "command": "-workbench.action.showCommands"
  },
  {
    "key": "ctrl+shift+f",
    "command": "workbench.action.findInFiles"
  },
  {
    "key": "ctrl+shift+t",
    "command": "workbench.action.reopenClosedEditor"
  },
  {
    "key": "ctrl+shift+v",
    "command": "markdown.showPreview"
  },
  {
    "key": "ctrl+b",
    "command": "editor.action.revealDefinition",
    "when": "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor"
  }
]
EOF

echo "配置完成！"

echo ""
echo "请按以下步骤完成设置："
echo "1. 重启 VSCode (Cmd+Shift+P -> 'Developer: Reload Window')"
echo "2. 登录 GitHub 账户以激活 GitHub Copilot"
echo "3. 根据需要配置其他 AI 工具的账户"
echo "4. 享受 AI 驱动的编码体验！"

echo ""
echo "重要提示："
echo "- 如果您之前没有安装 jq，某些配置合并功能可能不会工作"
echo "- 您可以手动编辑 $HOME/Library/Application Support/Code/User/settings.json 来调整设置"
echo "- 扩展安装可能会因网络状况而需要几分钟时间"