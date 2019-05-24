FROM alpine

LABEL maintainer="sunnydog0826@gmail.com"

COPY trivy /usr/local/bin/

RUN apk add ca-certificates