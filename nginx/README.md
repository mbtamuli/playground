# Experiments with Nginx

## Setup

1. Install [Docker](https://docs.docker.com/install/).
2. Clone this repo and switch to the `nginx` directory.
```bash
cd ~
git clone https://github.com/mbtamuli/playground.git
cd ~/playground/nginx
```
3. Pull the `openresty` image
```bash
docker pull openresty/openresty:alpine
```

## Usage

[Start the container](#start-container) and then [find the container IP](#get-nginxcontainer-ip).

1. Run the following to check the output
```bash
curl http://site.com --resolve 'site.com:80:<IP_of_container>'
```

2. Run the following to check the headers
```bash
curl -XGET -IL http://site.com --resolve 'site.com:80:<IP_of_container>'
```

### Start Container
```bash
cd ~/playground/nginx
docker run --name openresty -dit -v $PWD/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf openresty/openresty:alpine
```

### Stop Container
```bash
docker stop openresty
```

### Resume Container after machine restart.
```bash
docker start openresty
```

### Reload Nginx
```bash
docker exec -it openresty sh -c 'nginx -t && nginx -s reload'
```

### Get Nginx(container) IP
```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' openresty
```

## Experiments

All these correspond to one single location block in the `nginx.conf`

### Hello World
[Nginx Conf](nginx.conf#L8)

```bash
curl http://site.com/hello --resolve 'site.com:80:<IP_of_container>'
```

### Clean URI
Clean the URI of all arguments. [Nginx Conf](nginx.conf#L12)

```bash
curl http://site.com/clean-uri --resolve 'site.com:80:<IP_of_container>'
curl 'http://site.com/clean-uri?a=1' --resolve 'site.com:80:<IP_of_container>'
curl 'http://site.com/clean-uri?a=1&b=1' --resolve 'site.com:80:<IP_of_container>'
```

### Clean URI except arguments in whitelist
Clean the URI of all arguments which are not in the whitelist. [Nginx Conf](nginx.conf#L19)

**Note:** _In this example, `a` and `b` are in whitelist._

```bash
curl http://site.com/clean-uri-keep-whitelist --resolve 'site.com:80:<IP_of_container>'
curl 'http://site.com/clean-uri-keep-whitelist?a=1' --resolve 'site.com:80:<IP_of_container>'
curl 'http://site.com/clean-uri-keep-whitelist?a=1&c=1' --resolve 'site.com:80:<IP_of_container>'
curl 'http://site.com/clean-uri-keep-whitelist?c=1&a=1' --resolve 'site.com:80:<IP_of_container>'
curl 'http://site.com/clean-uri-keep-whitelist?b=1&c=1&a=1' --resolve 'site.com:80:<IP_of_container>'
```
