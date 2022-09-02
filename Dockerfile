FROM --platform=linux/amd64 python:3.10-slim as base

# Set pip to have no saved cache
ENV PIP_NO_CACHE_DIR=1 \
  PIP_DISABLE_PIP_VERSION_CHECK=true \
  POETRY_HOME="/opt/poetry" \
  POETRY_VIRTUALENVS_IN_PROJECT=true \
  POETRY_NO_INTERACTION=true \
  INSTALL_DIR="/opt/dependancies" \
  APP_DIR="/app"

ENV PATH="$POETRY_HOME/bin:/$INSTALL_DIR/.venv/bin:$PATH"

# Set Git SHA environment variable
ARG git_sha="development"
ENV GIT_SHA=$git_sha

RUN groupadd -g 61000 app \
  && useradd -g 61000 -l -r -u 61000 app

##############################################################################

FROM base as builder

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install --no-install-recommends -y curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python

# Install project dependencies
WORKDIR $INSTALL_DIR
COPY pyproject.toml poetry.lock ./
RUN poetry install --only main

##############################################################################

FROM base as application

# Copy the source code in last to optimize rebuilding the image
COPY --from=builder $INSTALL_DIR $INSTALL_DIR

WORKDIR $APP_DIR
COPY . .

USER app
ENTRYPOINT ["python3"]
CMD ["-m", "app"]
