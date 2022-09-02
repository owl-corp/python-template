import logging

from app.settings import SETTINGS

log = logging.getLogger(__name__)
log.info(f"Hello world {SETTINGS.git_sha = }")
