from pydantic_settings import BaseSettings


class _Settings(BaseSettings, env_file=".env", env_file_encoding="utf-8"):
    debug: bool = False
    git_sha: str = "development"


SETTINGS: _Settings = _Settings()
