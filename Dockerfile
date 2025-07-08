FROM ghcr.io/windmill-labs/windmill:main

# Set environment variables for standalone operation
ENV DATABASE_URL="sqlite:///tmp/windmill.db"
ENV MODE="standalone"
ENV BASE_URL="https://llm-agent-committee.ondigitalocean.app"

# Copy the Windmill configuration files
COPY .wm /tmp/.wm

# Create necessary directories
RUN mkdir -p /tmp/windmill

# Expose the port Windmill runs on
EXPOSE 8000

# Use Windmill's default start command with proper configuration
CMD ["windmill"]
