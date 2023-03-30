# Security Policy

## Supported Versions

This repository is automatically setup to stay in sync with the official [Caddy](https://hub.docker.com/_/caddy) image as new version come out. However this is **not** retroactive, so supported versions will only be since when this project started existing.

| Version    | Supported          |
| ---------- | ------------------ |
| `>= 2.6.2` | :white_check_mark: |
| `< 2.6.2`  | :x:                |
| `1.x`      | :x:                |

## Image and OS Updates

The goal of this project is to provide a Docker image as if it were published by the offical Caddy Team (it's not) and to stay in sync with it. This means there are **no modifications** to the base image or OS as part of the build process. Any security vulnerabilities will be kept and must be fixed in the upstream Caddy project (see [Reporting a Vulnerability](#reporting-a-vulnerability)).

## Reporting a Vulnerability

For security related issues with Caddy itself, please report it to their respective project using their guidelines.  
https://github.com/caddyserver/caddy-docker

For security related issues with Cloudflare module for Caddy, please report it to their respective project using their guidelines.  
https://github.com/caddy-dns/cloudflare
