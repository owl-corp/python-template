.PHONEY: setup
setup: sync precommit

.PHONEY: sync
sync:
	poetry install --sync

.PHONY: lock
lock:
	poetry lock
	poetry export --only main --output requirements.txt
	pre-commit run --files pyproject.toml poetry.lock requirements.txt

.PHONY: lint
lint:
	poetry run pre-commit run --all-files

.PHONY: precommit
precommit:
	poetry run pre-commit install
