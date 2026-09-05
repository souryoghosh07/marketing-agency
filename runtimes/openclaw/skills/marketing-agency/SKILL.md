---
name: marketing-agency
description: A 3-agent swarm that takes a product brief and generates a competitor matrix, GTM strategy, and complete launch copy pack.
tools_required: [browser, bash, write_file]
---

# Marketing Agency Skill

## Overview
This skill executes a sequential, 3-agent pipeline to generate marketing strategy and launch materials.

## Workflow
When triggered via `/run marketing-agency [path_to_brief]`:

1. **Adversarial Research**: Read the brief and `agents/01_adversarial_researcher.md`. Use the `browser` tool to research competitors. Use `write_file` to save `output/01_competitor_matrix.md`.
2. **Positioning Strategy**: Read the brief, competitor matrix, and `agents/02_positioning_strategist.md`. Formulate the strategy and use `write_file` to save `output/02_gtm_strategy.md`.
3. **Copy Architecture**: Read the strategy and `agents/03_copy_architect.md`. Generate `landing_page.md`, `show_hn.md`, and `x_thread.md` in `output/03_launch_pack/`.

Ensure all tasks run sequentially, waiting for the previous file to be written before proceeding.
