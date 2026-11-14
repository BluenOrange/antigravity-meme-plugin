# AGY Meme Plugin Installer for Windows
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Stop"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "🚀 开始安装 AGY Meme 表情包插件 (Windows)..." -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# 1. 确定源目录
$sourceDir = $PSScriptRoot
if (Test-Path (Join-Path $sourceDir "plugin.json")) {
    $pluginSource = $sourceDir
} elseif (Test-Path (Join-Path $sourceDir "agy-meme\plugin.json")) {
    $pluginSource = Join-Path $sourceDir "agy-meme"
} else {
    Write-Error "❌ 未找到 plugin.json，请确认脚本在 agy-meme 目录下运行！"
    exit 1
}

# 2. 目标安装路径
$targetDir = Join-Path $HOME ".gemini\config\plugins\agy-meme"
Write-Host "目标安装路径: $targetDir" -ForegroundColor Gray

if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

# 3. 复制插件完整文件
Write-Host "正在复制插件文件..." -ForegroundColor Yellow
Copy-Item -Path "$pluginSource\*" -Destination $targetDir -Recurse -Force

# 4. 规范化路径并替换占位符
$normalizedPath = $targetDir.Replace("\", "/")
Write-Host "规范化插件路径: $normalizedPath" -ForegroundColor Gray

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$filesToPatch = @(
    (Join-Path $targetDir "rules\AGENTS.md"),
    (Join-Path $targetDir "skills\meme-core\SKILL.md")
)

foreach ($filePath in $filesToPatch) {
    if (Test-Path $filePath) {
        $content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
        $content = $content.Replace("{PLUGIN_DIR}", $normalizedPath)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "C:[\\/]Users[\\/][^\\/]+[\\/]\.gemini[\\/]config[\\/]plugins[\\/]agy-meme", $normalizedPath)
        [System.IO.File]::WriteAllText($filePath, $content, $utf8NoBom)
        Write-Host "✅ 已配置路径: $filePath" -ForegroundColor Green
    }
}

# 5. 校验资源文件
$assetCount = (Get-ChildItem (Join-Path $targetDir "packs\hakimi\assets\*.png") -ErrorAction SilentlyContinue).Count
Write-Host "✅ 表情包资源校验: $assetCount / 64 张图片已就绪" -ForegroundColor Green

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "🎉 AGY Meme 表情包插件安装完成！" -ForegroundColor Green
Write-Host "👉 请在 Antigravity 中重启软件或打开 Customizations 页面即可立即使用！" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan
