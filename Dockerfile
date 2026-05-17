ARG python_version=3.14-slim
# This must be the name of the folder to run with python -m $app_name
ARG app_name=app

FROM python:$python_version AS builder
ARG app_name
COPY --from=ghcr.io/astral-sh/uv:0.11 /uv /bin/

ENV UV_COMPILE_BYTECODE=1 \
  UV_LINK_MODE=copy

# Install build dependencies
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    gcc \
    && apt autoclean && rm -rf /var/lib/apt/lists/*

# Install project dependencies with build tools available
WORKDIR /opt/$app_name
RUN --mount=type=cache,target=/root/.cache/uv \
  --mount=type=bind,source=uv.lock,target=uv.lock \
  --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
  uv sync --frozen --no-install-project --no-group linting

FROM python:$python_version
ARG app_name
ENV APP_NAME=$app_name

# Create user 1000 so that the runAsUser has a username
RUN useradd $app_name -u 1000 -m

# Define Git SHA build argument for sentry
ARG git_sha="development"
ENV GIT_SHA=$git_sha

# Install tini for proper signal handling in containers
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    tini \
    && rm -rf /var/lib/apt/lists/* /var/cache/debconf/*

# Install dependencies from build cache
# .venv not put in /app so that it doesn't conflict with the dev
# volume we use to avoid rebuilding image every code change locally
COPY --from=builder /opt/$app_name/.venv /opt/$app_name/.venv

# Copy the source code in last to optimize rebuilding the image
WORKDIR /app
COPY . .
ENV PATH="/opt/$app_name/.venv/bin:$PATH"

ENTRYPOINT ["tini", "--"]
CMD ["sh", "-c", "python -m ${APP_NAME}"]
