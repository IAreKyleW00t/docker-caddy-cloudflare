# syntax=docker/dockerfile:1
FROM caddy:2.7.2-builder AS builder
RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
RUN apk update && apk upgrade --no-cache
