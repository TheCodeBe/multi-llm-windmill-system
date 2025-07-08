FROM ghcr.io/windmill-labs/windmill:main

# Copy the Windmill configuration files
COPY .wm /tmp/.wm

# Set environment variables that will be provided by DigitalOcean
ENV DATABASE_URL=""
ENV REDIS_URL=""

# Expose the port Windmill runs on
EXPOSE 8000

# Use Windmill's default start command
CMD ["windmill"]
