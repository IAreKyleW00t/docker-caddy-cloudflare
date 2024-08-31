# Caddy-Cloudflare

[![DockerHub](https://img.shields.io/badge/DockerHub-iarekylew00t%2Fcaddy--cloudflare-blue?style=flat)](https://hub.docker.com/r/iarekylew00t/caddy-cloudflare)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/IAreKyleW00t/docker-caddy-cloudflare?label=version)](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/tags)
[![GitHub build status](https://img.shields.io/github/actions/workflow/status/IAreKyleW00t/docker-caddy-cloudflare/docker.yml?style=flat)](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/actions/workflows/docker.yml)
[![License](https://img.shields.io/github/license/IAreKyleW00t/docker-caddy-cloudflare)](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/blob/main/LICENSE)
![Dependabot](https://img.shields.io/badge/dependabot-025E8C?style=flat&logo=dependabot&logoColor=white)

The [Caddy](https://hub.docker.com/_/caddy) Docker image with the added
[caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare) module for
DNS-01 ACME validation support.  
Built for the same platforms as the upstream Caddy project (except Windows, sorry)!

> [!NOTE]
> This image does not change anything with original Caddy Docker image except
> replace the `caddy` binary.

```sh
# Docker Hub
docker pull iarekylew00t/caddy-cloudflare:latest

# GHCR
docker pull ghcr.io/iarekylew00t/caddy-cloudflare:latest
```

## Tags

The following tags are available for the `iarekylew00t/caddy-cloudflare` image.

- `latest`
- `<version>` (eg: `2.6.4`, including: `2.6`, `2`, etc.)

## Usage

Since this is built off the official Docker image all of the same Volumes,
Environment variables, etc. can be used with this container. Please refer to the
official [Caddy](https://hub.docker.com/_/caddy) Docker image and
[docs](https://caddyserver.com/docs/) for more information on using Caddy.

Simply create the container as usual and include your `CF_API_TOKEN` (email no
longer required for API Tokens). We can utilizing Caddy's support for
[Environment varaiables](https://caddyserver.com/docs/caddyfile/concepts#environment-variables)
to pass these values into our `Caddyfile`.

```sh
docker run --rm -it \
  --name caddy \
  -p 80:80 \
  -p 443:443 \
  -v caddy_data:/data \
  -v caddy_config:/config \
  -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
  -e CF_API_TOKEN=UhKLc...JD9jk \
  iarekylew00t/caddy-cloudflare:latest
```

Then set the global
[acme_dns](https://caddyserver.com/docs/caddyfile/options#acme-dns) directive
in your `Caddyfile`

```Caddyfile
{
  acme_dns cloudflare {env.CF_API_TOKEN}
}
```

or via JSON

```json
{
  "module": "acme",
  "challenges": {
    "dns": {
      "provider": {
        "name": "cloudflare",
        "api_token": "{env.CF_API_TOKEN}"
      }
    }
  }
}
```

See the [caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare) module
and [`tls`](https://caddyserver.com/docs/caddyfile/directives/tls#tls) directive
for advanced usage.

### Creating a Cloudflare API Token

You can generate a Cloudflare API token via the Cloudflare web console using the following steps:

1. Login to your [Dashboard](https://dash.cloudflare.com/)
2. Go to [Account Profile](https://dash.cloudflare.com/profile) > [API Tokens](https://dash.cloudflare.com/profile/api-tokens)
3. Click "Create token" (Use the "Create Custom Token" option)
4. Grant the following permissions:
   - `Zone > Zone > Read`
   - `Zone > DNS > Edit`

## Building

You can easily build the Docker image locally by doing

```sh
docker build -t caddy-cloudflare .
```

## Container signatures

All container images will be automatically signed via
[Cosign](https://docs.sigstore.dev/cosign/overview/) using
[keyless signatures](https://docs.sigstore.dev/cosign/keyless/). You can use the
following command to verify the integrity of these images yourself.

```sh
cosign verify \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp https://github.com/IAreKyleW00t/docker-caddy-cloudflare/.github/workflows/ \
  iarekylew00t/caddy-cloudflare:latest
```

## Contributing

Feel free to contribute and make things better by opening an
[Issue](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/issues) or
[Pull Request](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/pulls).

## License

See [LICENSE](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/blob/main/LICENSE).
