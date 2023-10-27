.PHONY: lock
lock:
	poetry lock
	poetry export --only main --output requirements.txt

.PHONY: lint
lint:
	poetry run pre-commit run --all-files

.PHONY: precommit
precommit:
	poetry run pre-commit install
