# Marketing Agency Claude Code Shortcuts

This file provides slash commands for executing the marketing agency pipeline directly within the Anthropic `claude` CLI.

## Instructions
Make sure your product brief is located at `context/active_brief.md` before running these commands.

## Commands

- `/research`: Triggers Agent 01. Reads `context/active_brief.md` and `agents/01_adversarial_researcher.md`. Conducts live research and outputs to `output/01_competitor_matrix.md`.
- `/strategy`: Triggers Agent 02. Reads `context/active_brief.md`, `output/01_competitor_matrix.md`, and `agents/02_positioning_strategist.md`. Outputs to `output/02_gtm_strategy.md`.
- `/copy`: Triggers Agent 03. Reads `output/02_gtm_strategy.md` and `agents/03_copy_architect.md`. Generates launch assets in `output/03_launch_pack/`.
- `/agency`: Executes the entire pipeline sequentially. Runs research, then strategy, then copy.
