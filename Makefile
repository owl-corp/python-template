.PHONEY: setup sync lock lint precommit

setup: sync precommit lint

sync:
	poetry install --sync

lock:
	poetry lock
	@poetry export --only main --output requirements.txt
	poetry install --sync --no-root
	pre-commit run --files pyproject.toml poetry.lock requirements.txt

lint:
	poetry run pre-commit run --all-files

precommit:
	poetry run pre-commit install
