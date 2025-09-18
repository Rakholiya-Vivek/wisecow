# Use a small Debian base
FROM debian:bookworm-slim

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    cowsay \
    fortune-mod \
    netcat-openbsd \
  && rm -rf /var/lib/apt/lists/*

# Copy the wisecow script into container
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose Wisecow app port
EXPOSE 4499

# Run the Wisecow server
ENTRYPOINT ["/usr/local/bin/wisecow.sh"]
