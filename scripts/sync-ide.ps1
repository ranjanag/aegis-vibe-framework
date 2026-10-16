param (
    [string]$ActiveAgent = ""
)

$RepoRoot = (Get-Item $PSScriptRoot).Parent.FullName
$MasterRule = Join-Path $RepoRoot "docs\AGENTS.md"

function Link-Rule($TargetPath) {
    if (Test-Path $TargetPath) {
        Remove-Item $TargetPath -Force
    }
    # Create Windows HardLink (zero external storage, instantaneous sync)
    New-Item -ItemType HardLink -Path $TargetPath -Target $MasterRule | Out-Null
    Write-Host "✔ Synced: $TargetPath" -ForegroundColor Green
}

# Link all IDE rule files to docs\AGENTS.md
Link-Rule (Join-Path $RepoRoot "CLAUDE.md")
Link-Rule (Join-Path $RepoRoot ".cursorrules")
Link-Rule (Join-Path $RepoRoot ".devin\instructions.md")
Link-Rule (Join-Path $RepoRoot ".agents\rules\vibe-rules.md")

# Update active agent in docs\STATE.md if provided
if ($ActiveAgent -ne "") {
    $StateFile = Join-Path $RepoRoot "docs\STATE.md"
    (Get-Content $StateFile) -replace "- Last Active Agent:.*", "- Last Active Agent: $ActiveAgent" | Set-Content $StateFile
    Write-Host "✔ Active agent updated in STATE.md: $ActiveAgent" -ForegroundColor Cyan
}

Write-Host "All IDE configurations are synchronized!" -ForegroundColor Yellow
