import logging

from app.settings import SETTINGS

log = logging.getLogger(__name__)
log.info("Hello world! %s", SETTINGS.git_sha)
