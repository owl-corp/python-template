from pydantic import BaseSettings


class _Settings(BaseSettings):
    debug: bool = False
    git_sha: str = "development"


SETTINGS: _Settings = _Settings()
