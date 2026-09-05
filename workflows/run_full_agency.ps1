param (
    [string]$Brief = "active_brief.md"
)

$Workspace = (Get-Location).Path

Write-Host "[1/3] Running Adversarial Research..." -ForegroundColor Cyan
agy --dangerously-skip-permissions --model claude-opus-4-6 -p "The absolute path to this project is $Workspace. Read $Brief and follow instructions in skills/adversarial-research/SKILL.md. Conduct live research on competitors and write the report into 01_competitor_matrix.md"

Write-Host "[2/3] Running Positioning Strategy..." -ForegroundColor Cyan
agy --dangerously-skip-permissions --model claude-opus-4-6 -p "The absolute path to this project is $Workspace. Read $Brief, 01_competitor_matrix.md, and follow instructions in skills/positioning-strategy/SKILL.md. Formulate the strategy and write into 02_gtm_strategy.md"

Write-Host "[3/3] Generating Launch Artifacts..." -ForegroundColor Cyan
agy --dangerously-skip-permissions --model claude-opus-4-6 -p "The absolute path to this project is $Workspace. Read 02_gtm_strategy.md and follow instructions in skills/launch-copy/SKILL.md. Write landing_page.md, show_hn.md, and x_thread.md into the root directory."

Write-Host "Execution complete!" -ForegroundColor Green
