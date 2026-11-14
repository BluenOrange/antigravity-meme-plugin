# AGY Meme Preload Patcher (Windows 客户端可选输入框增强)
$localAppData = $env:LOCALAPPDATA
$targetPath = "$localAppData\Programs\antigravity\resources\app\dist\preload.js"
$backupPath = "$localAppData\Programs\antigravity\resources\app\dist\preload.js.backup_agymeme"

if (-not (Test-Path $targetPath)) {
    Write-Warning "未检测到 Antigravity 默认安装目录 ($targetPath)，跳过 preload 补丁。"
    exit 0
}

if (-not (Test-Path $backupPath)) {
    Copy-Item -Path $targetPath -Destination $backupPath -Force
}

$injectorJsPath = Join-Path $PSScriptRoot "final_injector.js"
if (-not (Test-Path $injectorJsPath)) {
    $injectorJsPath = "$HOME\.gemini\config\plugins\agy-meme\final_injector.js"
}

if (-not (Test-Path $injectorJsPath)) {
    Write-Warning "未找到 final_injector.js，跳过补丁应用。"
    exit 0
}

$cleanPreload = [System.IO.File]::ReadAllText($backupPath, [System.Text.Encoding]::UTF8)
$injectorJs = [System.IO.File]::ReadAllText($injectorJsPath, [System.Text.Encoding]::UTF8)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$banner = "`r`n`r`n/* AGY Meme Composer Injector */`r`n"
$patched = $cleanPreload + $banner + $injectorJs

[System.IO.File]::WriteAllText($targetPath, $patched, $utf8NoBom)
Write-Host "✅ AGY Meme 输入框表情选择器补丁已成功应用！重启 Antigravity 后生效。" -ForegroundColor Green
