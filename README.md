# Python template

[![License](https://img.shields.io/github/license/owl-corp/python-template)](https://github.com/owl-corp/python-template)

## Summary
A template Python repo with docker, linting & CI.

To copy this simply press the "Use this template" green button near the top of the repo.

## Changes required after copying
- Pin the dependencies in [`pyproject.toml`](pyproject.toml) to a specific version
- Update the `[project]` section of in [`pyproject.toml`](pyproject.toml) to be relevant to your project
- Run `make lock` to lock dependencies
- Rename [`_.github/`](_.github/) to `.github` so that CI runs
- Update the `app_name` build argument in the [Dockerfile](Dockerfile) to be the name of your app.

## Changes to consider after copying
- Update the [LICENSE](LICENSE) file
- Update the schedule of the [dependabot config](.github/dependabot.yml)
- Add a static type checker, such as mypy or Pyright
- Delete [`.dockerignore](.dockerignore), [`docker-compose.yml`](docker-compose.yml) and the [build step](_.github/workflows/build.yaml) of CI if you do not plan to use docker.

# Contributing
Run `make` from the project root to both install this project's dependencies & install the pre-commit hooks.
- This requires both [make](https://www.gnu.org/software/make/) & [uv](https://docs.astral.sh/uv/getting-started/installation/) to be installed.

## Other make targets
- `make lint` will run the pre-commit linting against all files in the repository
- `make lock` will relock project dependencies and install them
