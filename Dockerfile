FROM debian:bookworm-slim

LABEL org.opencontainers.image.source="https://github.com/nyrahul/wisecow"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    fortune-mod cowsay socat ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# ensure /usr/games is in PATH
ENV PATH="/usr/games:${PATH}"

COPY wisecow-http.sh /usr/local/bin/wisecow-http.sh
RUN chmod +x /usr/local/bin/wisecow-http.sh

EXPOSE 4499

CMD ["sh","-c","socat TCP-LISTEN:4499,reuseaddr,fork EXEC:/usr/local/bin/wisecow-http.sh"]

