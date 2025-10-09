# =====================================
# 🌱 Project & Environment Configuration
# =====================================
IMG = medokanja
CONTAINER = medokanja
PORT = 8080
TAG = latest
PROJECT_ID ?= your-gcp-project

# =====================================
# 🐋 Docker Commands
# =====================================

build: ## Build image
	docker build -t $(IMG):$(TAG) .

run: ## Run container
	@echo "🚀 Running container on port $(PORT)..."
	docker run -d -p $(PORT):8080 --name $(CONTAINER) $(IMG):$(TAG)

list: ## List containers
	docker run --rm $(IMG):$(TAG) ls -la /usr/src/app

clean: ## Clean up
	-docker stop $(CONTAINER)
	-docker rm $(CONTAINER)
	-docker rmi $(IMG):$(TAG)

restart: ## Restart container
	make clean && make build && make run

# =====================================
# 📚 Documentation & Help
# =====================================

help: ## Show this help message
	@echo "Available commands:"
	@echo ""
	@python3 -c "import re; lines=open('Makefile', encoding='utf-8').readlines(); targets=[re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$',l) for l in lines]; [print(f'  make {m.group(1):<20} {m.group(2)}') for m in targets if m]"


# =======================
# 🎯 PHONY Targets
# =======================

# Auto-generate PHONY targets (cross-platform)
.PHONY: $(shell python3 -c "import re; print(' '.join(re.findall(r'^([a-zA-Z_-]+):\s*.*?##', open('Makefile', encoding='utf-8').read(), re.MULTILINE)))")

# Test the PHONY generation
# test-phony:
# 	@echo "$(shell python3 -c "import re; print(' '.join(sorted(set(re.findall(r'^([a-zA-Z0-9_-]+):', open('Makefile', encoding='utf-8').read(), re.MULTILINE)))))")"
