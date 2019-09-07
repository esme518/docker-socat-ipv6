#
# Dockerfile for socat
#

FROM alpine

RUN set -ex \
    && apk add --update socat \
    && rm -rf /var/cache/apk

ENV PORT  8080
ENV PORT2 8080
ENV HOST  example.com

EXPOSE $PORT/tcp
EXPOSE $PORT/udp

CMD socat -d -d TCP6-LISTEN:$PORT,fork,reuseaddr TCP6:$HOST:$PORT2 & \
    socat -d -d UDP6-LISTEN:$PORT,fork,reuseaddr UDP6:$HOST:$PORT2
