# Security Policy

This project would like to make sure that it stays on
top of all vulnerabilities and has information for directing reports and
findings to the appropriate upstream project.

## Supported Versions

This project is setup to automatically stay in sync with the official upstream
[Caddy](https://hub.docker.com/_/caddy) using
[Dependabot](https://github.com/dependabot). However this is **not** retroactive,
so supported versions will only be since this projects inception.

| Version    | Supported |
| ---------- | --------- |
| `>= 2.6.2` | ✅        |
| `< 2.6.2`  | ❌        |
| `1.x`      | ❌        |
| `< 1.x`    | ❌        |

## Image and OS Updates

The goal of this project is to provide a Docker image _as if it were published by
the offical Caddy Team_ (it's not) and to stay in sync with it. This means there
are **no modifications** to the base image or OS as part of the build process;
no OS or other package updates.

Any security vulnerabilities must be fixed in the upstream Caddy project
(see [Reporting a Vulnerability](#reporting-a-vulnerability)).

## Reporting a Vulnerability

For security related issues with **this project**, please report it privately
using the [Report a Vulnerability](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/security/advisories/new)
form including as much detail as possible.

For security related issues with **Caddy itself**, please report it to their
respective projects using their guidelines.  
<https://github.com/caddyserver/caddy>  
<https://github.com/caddyserver/caddy-docker>

For security related issues with the **Cloudflare module for Caddy**, please report it
to their respective project using their guidelines.  
<https://github.com/caddy-dns/cloudflare>
