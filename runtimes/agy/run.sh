#!/usr/bin/env bash
set -e

BRIEF_PATH=${1:-"context/active_brief.md"}
OUTPUT_DIR="output"
mkdir -p "$OUTPUT_DIR/03_launch_pack"

echo "[1/3] Running Adversarial Research..."
agy --model claude-3-opus \
    "Read $BRIEF_PATH and instructions in agents/01_adversarial_researcher.md. Conduct live research on competitors and write the full report into $OUTPUT_DIR/01_competitor_matrix.md."

echo "[2/3] Running Positioning Strategy..."
agy --model claude-3-opus \
    "Read $BRIEF_PATH, $OUTPUT_DIR/01_competitor_matrix.md, and agents/02_positioning_strategist.md. Formulate the strategy and write into $OUTPUT_DIR/02_gtm_strategy.md."

echo "[3/3] Generating Launch Artifacts..."
agy --model claude-3-opus \
    "Read $OUTPUT_DIR/02_gtm_strategy.md and agents/03_copy_architect.md. Write landing_page.md, show_hn.md, and x_thread.md into $OUTPUT_DIR/03_launch_pack/."

echo "Swarm execution complete. Check ./output directory."
