# Python template

[![License](https://img.shields.io/github/license/owl-corp/python-template)](https://github.com/owl-corp/python-template)

## Summary
A template Python repo with docker, linting & CI.

To copy this simply press the "Use this template" green button near the top of the repo.

## Changes required copying
- Pin the dependencies in [`pyproject.toml`](pyproject.toml) to a specific version
- Update the `tool.poetry` section of in [`pyproject.toml`](pyproject.toml) to be relevant to your project
- Run `make lock` to lock poetry dependencies and export to a `requirements.txt` file
- Rename [`_.github/`](_.github/) to `.github` so that CI runs

## Changes to consider after copying
- Update the [LICENSE](LICENSE) file
- Update the schedule of the [dependabot config](.github/dependabot.yml)
- Add a static type checker, such as mypy or Pyright


# Contributing
Run `make` from the project root to both install this project's dependencies & install the pre-commit hooks.
- This requires both [make](https://www.gnu.org/software/make/) & [poetry](https://python-poetry.org/) to be installed.

## Other make targets
- `make lint` will run the pre-commit linting against all files in the repository
- `make lock` wil relock project dependencies and update the [`requirements.txt`](./requirements.txt) file with production dependencies
