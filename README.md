This container will create letsencrypt certificates for the given domain names
and automatically renew the certificates.

```
docker run \
    -e DOMAIN_1="('domain1.com' 'www.domain1.com')"\
    -e DOMAIN_2="('domain2.com' 'www.domain2.com' 'blog.domain2.com')"\
    -e CERTBOT_EMAIL="your.mail@mail.de" \
    -v /etc/letsencrypt:/etc/letsencrypt \
    hauptmedia/certbot:latest
```

Certbot will run in standalone mode so just pass through the acme requests to this container.

Example config for nginx:

```
server {
    listen 80;
    server_name domain.com;

    location /.well-known/acme-challenge {
        proxy_pass http://certbot:80;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto http;
    }

    return 301 https://domain.com$request_uri;
}
```