#!/usr/bin/env bash
set -e

# A simple wrapper for OpenAI Codex terminal interface or API harness

BRIEF_PATH=${1:-"context/active_brief.md"}
OUTPUT_DIR="output"
mkdir -p "$OUTPUT_DIR/03_launch_pack"

echo "[1/3] Running Adversarial Research via Codex..."
# Assuming a fictional codex-cli tool
codex-cli --prompt-file agents/01_adversarial_researcher.md --input $BRIEF_PATH --output $OUTPUT_DIR/01_competitor_matrix.md

echo "[2/3] Running Positioning Strategy via Codex..."
codex-cli --prompt-file agents/02_positioning_strategist.md --input "$BRIEF_PATH,$OUTPUT_DIR/01_competitor_matrix.md" --output $OUTPUT_DIR/02_gtm_strategy.md

echo "[3/3] Generating Launch Artifacts via Codex..."
codex-cli --prompt-file agents/03_copy_architect.md --input $OUTPUT_DIR/02_gtm_strategy.md --output-dir $OUTPUT_DIR/03_launch_pack/

echo "Codex execution complete. Check ./output directory."
