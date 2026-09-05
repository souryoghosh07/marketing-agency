# run.ps1
param (
    [string]$Brief = "context\active_brief.md"
)

New-Item -ItemType Directory -Force -Path output\03_launch_pack | Out-Null

Write-Host "[1/3] Running Adversarial Research..." -ForegroundColor Cyan
agy "Read $Brief and instructions in agents/01_adversarial_researcher.md. Conduct live research on competitors and write the report into output/01_competitor_matrix.md"

Write-Host "[2/3] Running Positioning Strategy..." -ForegroundColor Cyan
agy "Read $Brief, output/01_competitor_matrix.md, and agents/02_positioning_strategist.md. Formulate the strategy and write into output/02_gtm_strategy.md"

Write-Host "[3/3] Generating Launch Artifacts..." -ForegroundColor Cyan
agy "Read output/02_gtm_strategy.md and agents/03_copy_architect.md. Write landing_page.md, show_hn.md, and x_thread.md into output/03_launch_pack/"

Write-Host "Execution complete! Check .\output" -ForegroundColor Green