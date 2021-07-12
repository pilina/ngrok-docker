ARG ARCH=arm64v8/
FROM ${ARCH}alpine:latest

ARG ARCH
RUN set -eux; \
  \
  case "$ARCH" in \
    "386/") \
      wget -q -O tmp.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip; \
      unzip tmp.zip; \
      rm tmp.zip; \
      ;; \
    "amd64/") \
      wget -q -O tmp.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip; \
      unzip tmp.zip; \
      rm tmp.zip; \
      ;; \
    "arm32v7/") \
      wget -q -O tmp.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip; \
      unzip tmp.zip; \
      rm tmp.zip; \
      ;; \
    "arm64v8/") \
      wget -q -O tmp.tgz https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.tgz; \
      tar xvfz tmp.tgz; \
      rm tmp.tgz; \
      ;; \
  esac; \
  \
  mv ngrok /usr/local/bin

ENTRYPOINT ["/usr/local/bin/ngrok"]
CMD ["help"]
