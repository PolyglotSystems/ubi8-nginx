# ubi8-nginx

[![Container Image on Quay](https://img.shields.io/badge/Container%20Image-Quay.io-orange)](https://quay.io/polyglotsystems/ubi8-nginx) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/PolyglotSystems/ubi8-nginx/Build%20Nginx%20UBI%20Container?label=Container%20Build&style=flat-square) ![GitHub](https://img.shields.io/github/license/PolyglotSystems/ubi8-nginx) ![GitHub release (latest by date)](https://img.shields.io/github/v/release/PolyglotSystems/ubi8-nginx)

An Nginx runtime container based on RHEL UBI 8.

This container image is available on Quay and should be a drop-in image for most Nginx.

## Pulling the Container

```bash
podman pull quay.io/polyglotsystems/ubi8-nginx:latest
# or
docker pull quay.io/polyglotsystems/ubi8-nginx:latest
```

## Tags

- `main`, `:latest`, `:1.8`, `:1.8.0`, `:v1.8`, `:v1.8.0`

## Using this Container as a Base

```docker
FROM quay.io/polyglotsystems/ubi8-nginx:latest

COPY ./my-web-app /var/www/html
```

## Using this Container via Podman

```bash
sudo podman run --name ubi8-nginx --rm -p 8080:8080 -v ./my-web-app:/var/www/html quay.io/polyglotsystems/ubi8-nginx:latest
```

## Licenses

- The Red Hat Universal Base Image is covered by [its own EULA](https://www.redhat.com/licenses/EULA_Red_Hat_Universal_Base_Image_English_20190422.pdf)
- Nginx is covered by [its own license](http://nginx.org/LICENSE) as well
- Custom authored work in this repository is otherwise covered by the MIT license found in the file `LICENSE`