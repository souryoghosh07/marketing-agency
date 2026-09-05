#!/usr/bin/env bash
set -e

BRIEF_PATH=${1:-"active_brief.md"}

echo "[1/3] Running Adversarial Research..."
agy --dangerously-skip-permissions --model claude-opus-4-6 -p "Read $BRIEF_PATH and follow instructions in skills/adversarial-research/SKILL.md. Conduct live research on competitors and write the report into 01_competitor_matrix.md."

echo "[2/3] Running Positioning Strategy..."
agy --dangerously-skip-permissions --model claude-opus-4-6 -p "Read $BRIEF_PATH and 01_competitor_matrix.md. Follow instructions in skills/positioning-strategy/SKILL.md. Formulate the strategy and write into 02_gtm_strategy.md."

echo "[3/3] Generating Launch Artifacts..."
agy --dangerously-skip-permissions --model claude-opus-4-6 -p "Read 02_gtm_strategy.md and follow instructions in skills/launch-copy/SKILL.md. Write landing_page.md, show_hn.md, and x_thread.md into the root directory."

echo "Swarm execution complete."
