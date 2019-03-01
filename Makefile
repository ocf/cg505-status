RANDOM_PORT := $(shell expr $$(( 8000 + (`id -u` % 1000) )))

HUGO_VERSION ?= 0.54.0
HUGO_URL := https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz
HUGO_EXEC := vendor/hugo_$(HUGO_VERSION)

CNAME := "dev-status.ocf.io"

.PHONY: dev
dev: $(HUGO_EXEC)
	@echo "Starting dev server on port $(RANDOM_PORT)"
	$(HUGO_EXEC) --port $(RANDOM_PORT) server

.PHONY: build
build: $(HUGO_EXEC)
	@echo "Removing old build"
	rm -rf public/*
	@echo "Building static site"
	$(HUGO_EXEC)
	@echo "$(CNAME)" >> public/CNAME

.PHONY: worktree
worktree:
	@echo "Clearing existing public/ folder"
	rm -rf public
	mkdir public
	git worktree prune
	rm -rf .git/worktrees/public/
	@echo "Checking out gh-pages worktree in public/"
	git fetch
	git worktree add -B gh-pages public origin/gh-pages

.PHONY: deploy_check
deploy_check:
	@echo -n "Is Jenkins down? [y/N] " && read ans && [ $${ans:-N} == y ] || { echo "If Jenkins is up, you should use it to deploy." && false; }
	@[ -z "$$(git status --porcelain)" ] || { echo "You have uncommitted changes. Please commit your changes and try again." && false; }

.PHONY: really_deploy
.NOTPARALLEL:
really_deploy: worktree build
	git -C public add --all
	git -C public commit -m "Makefile deploy: $(USER)"
	git -C public push origin gh-pages

.PHONY: deploy
.NOTPARALLEL:
deploy: deploy_check really_deploy

$(HUGO_EXEC):
	mkdir -p vendor
	curl -L "$(HUGO_URL)" | tar xz --directory vendor hugo
	mv vendor/hugo $(HUGO_EXEC)

.PHONY: install-hugo
install-hugo: $(HUGO_EXEC)
