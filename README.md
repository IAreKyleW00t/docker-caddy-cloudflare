# Caddy-Cloudflare

The official [Caddy](https://hub.docker.com/_/caddy) Docker image with the added [caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare) module for DNS-01 ACME validation support. This image does not change anything with Caddy except replacing the `caddy` binary. Built for x86 and ARM!

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-iarekylew00t%2Fcaddy--cloudflare-blue?style=flat)](https://hub.docker.com/r/iarekylew00t/caddy-cloudflare)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/iarekylew00t/caddy-cloudflare/latest?style=flat)
[![Docker](https://img.shields.io/github/actions/workflow/status/IAreKyleW00t/docker-caddy-cloudflare/docker.yml?style=flat)](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/actions/workflows/docker.yml)

## Usage

Since this is built off the official Docker image all of the same Volumes, Environment variables, etc. can be used with this container. Please refer to the official [Caddy](https://hub.docker.com/_/caddy) Docker image and [docs](https://caddyserver.com/docs/) for more information on using Caddy.

Simply create the container as usual and include your `CF_API_TOKEN` (email no longer required for API Tokens). We can utilizing Caddy's support for [Environment varaiables](https://caddyserver.com/docs/caddyfile/concepts#environment-variables) to pass these values into our `Caddyfile`.

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

Then for _each site_ you will need to add the following to your [`tls`](https://caddyserver.com/docs/caddyfile/directives/tls#tls) directive in your `Caddyfile`

```Caddyfile
tls {
  dns cloudflare {env.CF_API_TOKEN}
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

See the [caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare) module and [`tls`](https://caddyserver.com/docs/caddyfile/directives/tls#tls) directive for advanced usage.

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

## Contributing

Feel free to contribute and make things better by opening an [Issue](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/issues) or [Pull Requests](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/pulls).

## License

See [LICENSE](https://github.com/IAreKyleW00t/docker-caddy-cloudflare/blob/main/LICENSE).
