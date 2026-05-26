<#
.SYNOPSIS
  一键安装 legal-cn-judgment-predictor
.DESCRIPTION
  自动安装必需依赖（core-codices + mcp-hub），部署技能到 ~/.codex/skills/。
#>
#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsDir = "$env:USERPROFILE\.codex\skills"
$ParentDir = Split-Path -Parent $RepoRoot

Write-Host "=== legal-cn-judgment-predictor 安装 ===" -ForegroundColor Green
Write-Host ""

# =========================================================
# [0] 必需依赖 — 自动安装
# =========================================================
Write-Host "[0] 安装必需依赖..." -ForegroundColor Yellow

function Install-Required {
    param($Name, $RepoUrl, $DirName)
    $targetPath = Join-Path $ParentDir $DirName
    if (Test-Path $targetPath) {
        Write-Host "  [OK] $Name 已存在: $targetPath" -ForegroundColor Green
        return
    }
    Write-Host "  [安装] $Name -> $targetPath" -ForegroundColor Yellow
    Push-Location $ParentDir
    git clone --depth 1 $RepoUrl $DirName 2>&1 | Out-Null
    Pop-Location
    Write-Host "  [OK] $Name 安装完成" -ForegroundColor Green
}

Install-Required -Name "core-codices (162部法律全文JSON)" `
    -RepoUrl "https://github.com/laubeing-droid/legal-cn-core-codices.git" `
    -DirName "legal-cn-core-codices"

Install-Required -Name "legal-cn-mcp-hub (MCP连接器)" `
    -RepoUrl "https://github.com/laubeing-droid/legal-cn-mcp-hub.git" `
    -DirName "legal-cn-mcp-hub"

Write-Host ""

# =========================================================
# [1] 安装技能
# =========================================================
Write-Host "[1] 安装技能..." -ForegroundColor Yellow

$skillName = "judgment-predictor"
$tgt = "$SkillsDir\$skillName"
$null = New-Item -ItemType Directory -Force $tgt

if (Test-Path "$RepoRoot\SKILL.md") {
    Copy-Item "$RepoRoot\SKILL.md" "$tgt\SKILL.md" -Force
    Write-Host "  技能安装完成: $tgt" -ForegroundColor Green
} else {
    Write-Host "  [错误] SKILL.md 未找到" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "  使用方式:" -ForegroundColor Cyan
Write-Host "    @judgment-predictor [案件事实描述]" -ForegroundColor White
Write-Host ""
Write-Host "  已安装依赖:" -ForegroundColor Cyan
Write-Host "    [必需] legal-cn-core-codices — 162部法律全文JSON" -ForegroundColor White
Write-Host "    [必需] legal-cn-mcp-hub    — MCP连接器(类案检索/法条核验)" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Green

