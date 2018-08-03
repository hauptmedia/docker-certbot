This container will create letsencrypt certificates for the given domain names
and automatically renew the certificates.

```
docker run \
    -e DOMAIN_1="('domain1.com'. 'www.domain1.com')"\
    -e DOMAIN_2="('domain2.com' 'www.domain2.com' 'blog.domain2.com')"\
    -e CERTBOT_EMAIL="your.mail@mail.de" \
    -v /etc/letsencrypt:/etc/letsencrypt \
    hauptmedia/certbot:latest
```