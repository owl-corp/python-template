import logging

from app.settings import SETTINGS

# Console handler prints to terminal
console_handler = logging.StreamHandler()
level = logging.DEBUG if SETTINGS.debug else logging.INFO
console_handler.setLevel(level)

# Remove old loggers, if any
root = logging.getLogger()
if root.handlers:
    for handler in root.handlers:
        root.removeHandler(handler)

# Setup new logging configuration
logging.basicConfig(
    format="%(asctime)s - %(name)s %(levelname)s: %(message)s",
    datefmt="%D %H:%M:%S",
    level=logging.DEBUG if SETTINGS.debug else logging.INFO,
    handlers=[console_handler],
)
