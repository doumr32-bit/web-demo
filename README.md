# MoltBot 管理网站与 VSCode AI 工具配置

## 项目概述

这个项目包含两个主要部分：

1. **MoltBot 管理网站** - 用于监控、教程和工具的中央控制台
2. **VSCode AI 工具配置** - 先进的 AI 驱动开发环境设置

## MoltBot 管理网站

### 功能特性

- **操作日志**: 实时查看 MoltBot 运行状态和事件记录
- **教程中心**: 发现和学习最新的 MoltBot 使用技巧
- **工具管理**: 管理 MoltBot 生态系统的各种工具
- **自动更新**: 每日自动采集新数据并更新网站

### 访问地址

https://doumr32-bit.github.io/web-demo/

### 页面导航

- 主控制台: `index.html`
- 操作日志: `logs.html`
- 教程中心: `tutorials.html`
- 工具管理: `tools.html`

## VSCode AI 工具配置

### 推荐的 AI 插件

- **GitHub Copilot**: AI 驱动的代码补全和建议
- **Codeium**: 免费的 AI 代码加速器
- **Tabnine**: 基于深度学习的代码补全
- **Amazon Q Developer**: ML 驱动的代码建议 (扩展ID: amazon.q-developer)
- **Blackbox AI**: 代码库理解 AI 助手
- **Visual Studio IntelliCode**: AI 辅助智能感知

### 快速安装

运行以下命令快速配置 VSCode AI 环境：

```bash
# 原始安装脚本（可能有部分扩展名不准确）
./setup_vscode_ai.sh

# 修正后的安装脚本（推荐使用）
./setup_vscode_ai_fixed.sh
```

### 配置文件

- `vscode_ai_setup.md`: VSCode AI 工具配置指南
- `advanced_vscode_ai_setup.md`: 高级配置选项
- `.vscode/settings.json`: VSCode 设置配置
- `.vscode/keybindings.json`: 键盘快捷键配置
- `.vscode/extensions.json`: 推荐扩展列表
- `setup_vscode_ai.sh`: VSCode AI 工具安装脚本
- `setup_vscode_ai_fixed.sh`: 修正后的安装脚本（推荐）

## 自动化任务

系统设置了每日定时任务，在每天凌晨 3 点自动运行：

- 收集 MoltBot 操作日志
- 搜索最新教程
- 发现新工具
- 更新网站数据

## 技术栈

- HTML/CSS/JavaScript
- Node.js 后端脚本
- GitHub Pages 部署
- macOS launchd 定时任务

## 项目结构

```
├── index.html          # 主控制台页面
├── logs.html           # 操作日志页面
├── tutorials.html      # 教程中心页面
├── tools.html          # 工具管理页面
├── api/                # API 端点
│   ├── logs.json
│   ├── tutorials.json
│   └── tools.json
├── data/               # 原始数据存储
│   ├── logs/
│   ├── tutorials/
│   └── tools/
├── scripts/            # 后端脚本
│   ├── daily_scheduler.js
│   ├── log_collector.js
│   ├── tutorial_finder.js
│   ├── tool_discoverer.js
│   └── update_api.js
├── .vscode/            # VSCode 配置
├── setup_vscode_ai.sh  # VSCode AI 工具安装脚本
└── ...
```

## 维护

### 手动运行任务

```bash
# 运行所有日常任务
npm run daily-tasks

# 单独运行各组件
npm run collect-logs
npm run find-tutorials
npm run discover-tools

# 更新 API 数据
npm run update-api
```

## 贡献

欢迎提交问题和拉取请求以改进此项目。