#!/bin/sh

if [ -z "$TIMEZONE" ]; then
	TIMEZONE=Etc/UTC
fi

echo $TIMEZONE > /etc/timezone && \
dpkg-reconfigure -f noninteractive tzdata

# save environment so that pam will re-initialize any new shells with our container environment (used by crond)
env > /etc/environment

/usr/local/sbin/certbot-init.sh

exec "$@"
