FROM alpine:latest

LABEL maintainer="sunnydog0826@gmail.com"

RUN apk update && \
  apk add git \
    ca-certificates && \
  rm -rf /var/cache/apk/*

COPY trivy /usr/local/bin/