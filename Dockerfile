FROM alpine:3.6
ARG DRONE_VERSION
RUN apk --no-cache update && \
  apk --no-cache add ca-certificates curl && \
  rm -rf /var/cache/apk/*
RUN curl -L https://github.com/drone/drone-cli/releases/download/v${DRONE_VERSION}/drone_linux_amd64.tar.gz | tar zx -C /usr/local/bin/ \
  && chmod +x /usr/local/bin/drone
ENTRYPOINT ["/usr/local/bin/drone"]
