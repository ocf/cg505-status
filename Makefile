RANDOM_PORT := $(shell expr $$(( 8000 + (`id -u` % 1000) )))

HUGO_VERSION ?= 0.54.0
HUGO_URL := https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz
HUGO_EXEC := vendor/hugo_$(HUGO_VERSION)

.PHONY: all
all: build

.PHONY: build
build: $(HUGO_EXEC)
	$(HUGO_EXEC)

.PHONY: dev
dev: $(HUGO_EXEC)
	$(HUGO_EXEC) --port $(RANDOM_PORT) server

.PHONY: deploy
deploy: build
	git -C public fetch
	git -C public reset --soft origin/gh-pages
	git -C public add .
	git -C public commit -m "Makefile deploy: $(USER)"
	git -C public push origin 'HEAD:gh-pages'

$(HUGO_EXEC):
	mkdir -p vendor
	curl -L "$(HUGO_URL)" | tar xz --directory vendor hugo
	mv vendor/hugo $(HUGO_EXEC)

.PHONY: install-hugo
install-hugo: $(HUGO_EXEC)
