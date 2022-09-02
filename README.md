# Python template

[![License](https://img.shields.io/github/license/ChrisLovering/python-template)](https://github.com/ChrisLovering/python-template)
[![CI](https://github.com/ChrisLovering/python-template/actions/workflows/lint.yml/badge.svg)](https://github.com/ChrisLovering/python-template/actions/workflows/lint.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/ChrisLovering/python-template/main.svg)](https://results.pre-commit.ci/latest/github/ChrisLovering/python-template/main)

## Summary
A template Python repo with docker, linting & CI.

To copy this simply press the "Use this template" green button near the top of the repo.

## Changes to consider after copying
- Pin the dependencies in [`pyproject.toml`](pyproject.toml) to a specific version and re-lock
- Update the `tool.poetry` section of in [`pyproject.toml`](pyproject.toml) to be relevant to your project
- Update the [LICENSE](LICENSE) as needed
- Update the schedule of the [dependabot config](.github/dependabot.yml) to `"daily"`
- Register your repo with [pre-commit.ci](https://pre-commit.ci/)
- Add a static type checker, such as mypy or Pyright
