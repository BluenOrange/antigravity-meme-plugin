# Uninstall AGY Meme Preload Patch
$localAppData = $env:LOCALAPPDATA
$backupPath = "$localAppData\Programs\antigravity\resources\app\dist\preload.js.backup_agymeme"
$targetPath = "$localAppData\Programs\antigravity\resources\app\dist\preload.js"

if (Test-Path $backupPath) {
    Copy-Item -Path $backupPath -Destination $targetPath -Force
    Write-Host "✅ AGY Meme 输入框补丁已成功卸载并恢复原始 preload.js。" -ForegroundColor Green
} else {
    Write-Warning "未找到备份文件 preload.js.backup_agymeme。"
}
