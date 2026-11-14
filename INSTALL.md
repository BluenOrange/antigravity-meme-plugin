# 📦 AGY Meme 表情包插件安装与使用指引

> 本指引专门面向**用户**以及**正在协助用户安装的 AI 助手（Prompt for Assistant）**。  
> 目标：将本插件无差错地安装到 Antigravity（反重力）中，并立即可用。

---

## 🤖 致正在协助用户的 AI 助手（Prompt for Assistant）

你好！如果用户把这个压缩包发送给你并说「帮我安装这个插件」，请按以下步骤执行：

### 🎯 核心原理
Antigravity 全局插件的标准安装目录为用户的全局配置目录：
- **Windows**: `~/.gemini/config/plugins/agy-meme` （即 `C:\Users\<当前用户名>\.gemini\config\plugins\agy-meme`）
- **macOS / Linux**: `~/.gemini/config/plugins/agy-meme` （即 `$HOME/.gemini/config/plugins/agy-meme`）

### ⚡ 推荐方案：直接运行一键安装脚本
在终端中执行以下命令（根据用户系统选择）：

**Windows (PowerShell)**:
```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

**macOS / Linux (Bash)**:
```bash
bash ./install.sh
```

脚本会自动完成：
1. 检测用户主目录并创建 `~/.gemini/config/plugins/agy-meme`
2. 完整复制所有插件资源（包括 64 张哈基米表情图片）
3. 自动将 `rules/AGENTS.md` 和 `skills/meme-core/SKILL.md` 中的 `{PLUGIN_DIR}` 替换为本机实际绝对路径（正斜杠规范）
4. 校验文件完整性并输出结果

---

### 🛠️ 备用方案：AI 手动文件操作安装（如果无法执行脚本）
如果环境受限无法执行脚本，AI 请使用文件工具执行以下 3 步：

1. **确定目标路径**：
   获取用户主目录，目标目录为 `<USER_HOME>/.gemini/config/plugins/agy-meme`  
   （Windows 下例如 `C:/Users/username/.gemini/config/plugins/agy-meme`，路径统一转为正斜杠 `/`）

2. **复制文件**：
   将本插件解压目录内的所有文件复制到目标目录，确保目录结构保持：
   ```text
   ~/.gemini/config/plugins/agy-meme/
   ├── plugin.json
   ├── assets/logo.jpg
   ├── rules/AGENTS.md
   ├── skills/meme-core/SKILL.md
   └── packs/
       ├── hakimi/ (含 pack.json 及 assets/ 下 64 张 png)
       └── user-custom/ (含 pack.json 及 assets/)
   ```

3. **路径适配**：
   读取目标目录中的 `rules/AGENTS.md` 和 `skills/meme-core/SKILL.md`，将所有的 `{PLUGIN_DIR}` 替换为目标目录的实际绝对路径（使用正斜杠，如 `C:/Users/username/.gemini/config/plugins/agy-meme`），然后写回。

4. **告知用户**：
   安装完成后，提示用户：  
   「✅ AGY Meme 表情包插件已安装成功！请在 Antigravity 中重启软件或打开 Customizations（自定义）页面，即可立即体验表情包互动！」

---

## 👤 面向用户的快捷安装指南

### 快捷安装方式（双击或命令行）
1. 将下载的 `agy-meme.zip` 解压到任意临时目录。
2. **Windows 用户**：右键 `install.ps1` 选择「使用 PowerShell 运行」（或打开终端运行 `powershell -ExecutionPolicy Bypass -File .\install.ps1`）。
3. **macOS / Linux 用户**：终端运行 `bash ./install.sh`。
4. 重启 Antigravity 客户端即可！

### 如何验证安装成功
1. 打开 Antigravity。
2. 点击右侧或设置中的 **Plugins** / **Customizations**。
3. 看到列表中有 **「AGY Meme 表情包」**，且处于启用状态。
4. 在聊天中发送：`:元气招手:` 或「发个表情看看」，AI 即刻回复精美哈基米表情贴图！
