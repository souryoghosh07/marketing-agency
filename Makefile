.PHONY: demo run clean init extract

init:
	cp -n context/templates/software_brief.md context/active_brief.md || true
	cp -n .env.example .env || true
	mkdir -p output/03_launch_pack

demo:
	@echo "Running demo with preconfigured devtool brief..."
	cp context/examples/devtool_saas.md context/active_brief.md
	bash runtimes/agy/run.sh context/active_brief.md

extract:
	@echo "Running Agent 00: Context Extractor & Brief Generator..."
	agy --model claude-3-opus "Read my local codebase. Follow instructions in agents/00_brief_generator.md to analyze it and output context/active_brief.md."

run:
	@test -f context/active_brief.md || (echo "Error: active_brief.md missing. Run 'make init' first." && exit 1)
	bash runtimes/agy/run.sh context/active_brief.md

clean:
	rm -rf output/*
	mkdir -p output
	touch output/.gitkeep
