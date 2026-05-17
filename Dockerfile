ARG python_version=3.14-slim

FROM python:$python_version

# Define Git SHA build argument for sentry
ARG git_sha="development"
ENV GIT_SHA=$git_sha

# Install project dependencies
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy the source code in last to optimize rebuilding the image
COPY . .

ENTRYPOINT ["python"]
CMD ["-m", "app"]
