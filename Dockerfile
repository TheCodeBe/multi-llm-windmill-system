FROM ghcr.io/windmill-labs/windmill:main

# Copy the Windmill configuration files
COPY .wm /tmp/.wm

# Expose the port Windmill runs on
EXPOSE 8000

# Use Windmill's default start command (will use built-in SQLite)
CMD ["windmill"]
