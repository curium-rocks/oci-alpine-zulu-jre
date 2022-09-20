FROM ghcr.io/curium-rocks/alpine-zulu AS zulu_base
RUN apk add --no-cache zulu17-jre-headless
ENV USER=docker
ENV UID=1000
ENV GID=1000

WORKDIR /app
RUN addgroup -g ${GID} docker && \
    adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"