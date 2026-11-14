# 🎭 AGY Meme 表情包插件 (Antigravity Plugin)

<p align="center">
  <img src="assets/logo.jpg" width="128" height="128" alt="AGY Meme Logo" style="border-radius: 20%;" />
</p>

**AGY Meme 表情包插件** 是专为 Google Antigravity 设计的情绪化表情包互动插件。支持 AI 根据对话情绪自动发图、文字 Token 斗图、AI 自动学习用户新图，并原生支持多表情包库扩展。

> [!NOTE]
> **🎨 素材版权与原创致谢声明**：
> 该插件灵感来源yyh在dsh-market上发布的dsh-meme，并借鉴了部分功能。
> 本插件内建的 64 张「哈基米」猫耳娘 Q 版表情包素材**非本人原创**，素材版权均归原作者所有！  
> 特别感谢原作者的精彩创作与无私分享，原作品 B 站出处链接：  
> 🔗 **[\[Gemini\]A创聊天表情64张_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1F34G6BEVA/?vd_source=fa37798b584fd71f54c6564e37ef4d3e#reply320132746737)**

---

## ✨ 核心特性

- **情绪驱动自动发图**：在闲聊互动、被夸、被调侃、日常关怀、工作里程碑（测试通过、任务完成）时，AI 会主动挑选最贴切的表情发送。
- **文字 Token 识别斗图**：
  - `:表情名:` 格式 — 如 `:元气招手:`, `:laugh:`, `:哭:`, `:开心:`, `:angry:`, `:cool:`
  - `/meme 关键词` 格式 — 如 `/meme 笑`, `/meme think`, `/meme 庆祝`
- **默认内建 64 张「哈基米」Q 版猫耳娘表情**：全套透明背景 256×256 PNG 贴图，涵盖开心、心动、得意、搞怪、尴尬、难过、暴怒、震惊、思考等 11 类情绪。（原素材出处：**[\[Gemini\]A创聊天表情64张_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1F34G6BEVA/?vd_source=fa37798b584fd71f54c6564e37ef4d3e#reply320132746737)**）
- **AI 自动学图**：用户发送新表情图片时，AI 自动识别情绪并收录到 `user-custom` 表情包，持久化留存供后续随时使用。
- **精致行内贴图尺寸**：严格规范输出宽高（`width="140"`），原生小巧精致，绝不占满全屏。

---

## 🚀 安装方法

请查看配套的 [INSTALL.md](INSTALL.md)。  
- **Windows**: 运行 `powershell -ExecutionPolicy Bypass -File .\install.ps1`
- **macOS / Linux**: 运行 `bash ./install.sh`
- **或直接把压缩包/网页链接扔给你的 AI**，AI 会读取 `INSTALL.md` 自动为你完成安装！

---

## 📂 插件目录结构

```text
agy-meme/
├── plugin.json              # 插件核心清单元数据
├── README.md                # 插件使用文档（含原作者版权致谢）
├── INSTALL.md               # 自动化安装指引（AI 优先读取）
├── install.ps1              # Windows 一键全自动安装配置脚本
├── install.sh               # macOS/Linux 一键全自动安装配置脚本
├── apply_patch.ps1          # (可选) Windows 客户端输入框表情选择器补丁
├── uninstall_patch.ps1      # (可选) 卸载输入框补丁
├── final_injector.js        # (可选) 输入框补丁注入代码
├── assets/
│   └── logo.jpg             # 插件图标
├── rules/
│   └── AGENTS.md            # 始终生效规则（自动发图、Token 匹配、学图规则）
├── skills/
│   └── meme-core/
│       └── SKILL.md         # 表情包核心技能与 64 个表情对照表
└── packs/
    ├── hakimi/              # 默认 64 张哈基米表情包
    │   ├── pack.json
    │   └── assets/          # 64 张高清透明 PNG
    └── user-custom/         # 用户自定义学习表情包目录
        ├── pack.json
        └── assets/
```

---

## 💡 互动示例

- **打招呼**：`猫猫嗨！` → 回复带招手贴图 😄
- **Token 触发**：`:元气招手:` / `/meme 庆祝`
- **要求发图**：`用表情包回我一个`
- **学新图**：直接把一张表情图发送给 AI，AI 会自动标注并保存！

---

## 🙏 鸣谢与版权声明 (Credits)

**特别鸣谢**：  
本插件内建的 64 张「哈基米」猫耳娘 Q 版表情包素材**非本人原创**，素材版权均归原作者所有！  
再次感谢原作者在 B 站的精彩创作与分享：  
👉 **[\[Gemini\]A创聊天表情64张_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1F34G6BEVA/?vd_source=fa37798b584fd71f54c6564e37ef4d3e#reply320132746737)**  

本仓库仅对表情资源进行了 Antigravity 插件适配、自动化路径封装、规则配置与一键安装脚本开发，供广大 AI 爱好者交流与学习使用。
