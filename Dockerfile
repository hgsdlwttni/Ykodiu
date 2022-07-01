FROM alpine:edge

ARG AUUID="57bcccb7-dc57-41fb-8d0b-16303ab2f898"
ARG CADDYIndexPage="https://github.com/StartBootstrap/startbootstrap-new-age/archive/master.zip"
ARG ParameterSSENCYP8T="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
