FROM --platform=linux/amd64 python:3.10-slim

# Set pip to have no saved cache
ENV PIP_NO_CACHE_DIR=false \
  PIP_DISABLE_PIP_VERSION_CHECK=true \
  POETRY_HOME="/opt/poetry" \
  POETRY_VIRTUALENVS_IN_PROJECT=true \
  POETRY_NO_INTERACTION=true \
  INSTALL_DIR="/opt/dependancies" \
  APP_DIR="/app"

ENV PATH="$POETRY_HOME/bin:/$INSTALL_DIR/.venv/bin:$PATH"

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install --no-install-recommends -y curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python

# Install project dependencies
WORKDIR $INSTALL_DIR
COPY pyproject.toml poetry.lock ./
RUN poetry install --only main

# Define Git SHA build argument
ARG git_sha="development"

# Set Git SHA environment variable for Sentry
ENV GIT_SHA=$git_sha

# Copy the source code in last to optimize rebuilding the image
WORKDIR $APP_DIR
COPY . .

ENTRYPOINT ["python3"]
CMD ["-m", "app"]
