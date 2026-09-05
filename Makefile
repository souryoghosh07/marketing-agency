.PHONY: demo run clean init extract

ifeq ($(OS),Windows_NT)
    COPY = powershell -NoProfile -ExecutionPolicy Bypass -Command "Copy-Item -Force"
    RM = powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Force -ErrorAction SilentlyContinue"
    CHECK_FILE = powershell -NoProfile -ExecutionPolicy Bypass -Command "if (!(Test-Path active_brief.md)) { Write-Error 'Error: active_brief.md missing. Run make init first.'; exit 1 }"
    RUN_SCRIPT = powershell -NoProfile -ExecutionPolicy Bypass -File workflows/run_full_agency.ps1
else
    COPY = cp -f
    RM = rm -f
    CHECK_FILE = test -f active_brief.md || (echo "Error: active_brief.md missing. Run 'make init' first." && exit 1)
    RUN_SCRIPT = bash workflows/run_full_agency.sh
endif

init:
	$(COPY) context/templates/software_brief.md active_brief.md
	$(COPY) .env.example .env

demo:
	@echo Running demo with preconfigured devtool brief...
	$(COPY) context/examples/devtool_saas.md active_brief.md
	$(RUN_SCRIPT) active_brief.md

extract:
	@echo Running Agent 00: Context Extractor & Brief Generator...
	agy --dangerously-skip-permissions --model claude-opus-4-6 -p "Read my local codebase. Follow instructions in skills/brief-generator/SKILL.md to analyze it and output active_brief.md."

run:
	@$(CHECK_FILE)
	$(RUN_SCRIPT) active_brief.md

clean:
	$(RM) active_brief.md 01_competitor_matrix.md 02_gtm_strategy.md landing_page.md show_hn.md x_thread.md