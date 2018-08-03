FROM	debian:stretch

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt-get update -qq && \
        apt-get install -y --force-yes cron certbot && \
        apt-get clean autoclean && \
        apt-get autoremove --yes && \
        rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD     crontab /etc/contab
ADD     entrypoint.sh /usr/local/sbin/
ADD     certbot-init.sh /usr/local/sbin/

ENTRYPOINT	["/usr/local/sbin/entrypoint.sh"]

EXPOSE		80

CMD	["/usr/sbin/cron", "-f"]
