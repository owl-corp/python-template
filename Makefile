.PHONY: setup
setup: install prek lint

.PHONY: install
install:
	uv sync --frozen --all-groups

.PHONY: just-lock
just-lock:
	uv lock --upgrade

.PHONY: lock
lock: just-lock install

.PHONY: outdated
outdated:
	uv tree --outdated --all-groups

.PHONY: lint
lint:
	uv run prek run --all-files

.PHONY: prek
prek:
	uv run prek install
