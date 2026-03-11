# syntax=docker/dockerfile:1
FROM caddy:2.11.1-builder AS builder
RUN xcaddy build \
  --with github.com/corazawaf/coraza-caddy/v2 \
  --with github.com/caddy-dns/cloudflare

FROM caddy:2.11.1 AS caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
