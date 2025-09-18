# Dockerfile for wisecow
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    cowsay \
    fortune-mod \
    netcat-openbsd \
  && rm -rf /var/lib/apt/lists/*

COPY wisecow.sh /usr/local/bin/wisecow.sh
RUN chmod +x /usr/local/bin/wisecow.sh

EXPOSE 4499

CMD ["/usr/local/bin/wisecow.sh"]
