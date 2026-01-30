#!/bin/bash

# VSCode AI 工具快速安装和配置脚本

echo "开始配置 VSCode AI 工具..."

# 创建 VSCode 配置目录
mkdir -p ~/.vscode/extensions

echo "安装推荐的 AI 扩展..."

# 安装主要 AI 扩展
code --install-extension GitHub.copilot
code --install-extension GitHub.copilot-chat
code --install-extension TabNine.tabnine-vscode
code --install-extension Codeium.codeium
code --install-extension amazon-q-developer
code --install-extension blackboxapp.blackbox
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension Aide.aide

echo "安装辅助开发扩展..."

# 安装辅助扩展
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension bradlc.vscode-tailwindcss

echo "创建 VSCode 配置..."

# 创建配置目录
CONFIG_DIR="$HOME/.vscode"
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
fi

# 备份现有配置（如果存在）
if [ -f "$CONFIG_DIR/settings.json" ]; then
    cp "$CONFIG_DIR/settings.json" "$CONFIG_DIR/settings.json.backup.$(date +%Y%m%d_%H%M%S)"
fi

# 创建 settings.json
cat > "$CONFIG_DIR/settings.json" << 'EOF'
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

echo "创建键盘快捷键配置..."

# 创建键盘快捷键配置
KEYBINDINGS_FILE="$HOME/Library/Application Support/Code/User/keybindings.json"
if [ ! -f "$KEYBINDINGS_FILE" ]; then
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
else
    echo "键盘快捷键配置文件已存在，跳过创建。如需覆盖，请手动处理。"
fi

echo "配置完成！"

echo ""
echo "请按以下步骤完成设置："
echo "1. 重启 VSCode"
echo "2. 登录 GitHub 账户以激活 GitHub Copilot"
echo "3. 根据需要配置其他 AI 工具的账户"
echo "4. 享受 AI 驱动的编码体验！"

echo ""
echo "推荐的后续步骤："
echo "- 查看 advanced_vscode_ai_setup.md 了解高级配置选项"
echo "- 根据项目类型调整 .vscode/settings.json 配置"
echo "- 定期更新 AI 扩展以获得最新功能"