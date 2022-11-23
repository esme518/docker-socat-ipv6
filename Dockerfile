#
# Dockerfile for socat
#

FROM alpine:latest

RUN set -ex \
    && apk --update add --no-cache \
       socat \
    && rm -rf /tmp/* /var/cache/apk/*

ENV PORT  8080
ENV PORT2 8080
ENV HOST  example.com

CMD socat -d -d TCP-LISTEN:$PORT,fork,reuseaddr TCP6:$HOST:$PORT2 & \
    socat -d -d UDP-LISTEN:$PORT,fork,reuseaddr UDP6:$HOST:$PORT2
