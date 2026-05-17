.PHONY: setup
setup: install precommit lint

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
	uv run pre-commit run --all-files

.PHONY: precommit
precommit:
	uv run pre-commit install
