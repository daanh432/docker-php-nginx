#!/bin/sh

# Replace WEB_ROOT in nginx.conf template with the value from the WEB_ROOT_ENV environment variable
if [ -n "$WEB_ROOT" ]; then
  sed "s|root /var/www/html;|root ${WEB_ROOT};|" /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
else
  echo "WEB_ROOT_ENV environment variable not set. Using the default WEB_ROOT value."
  cp /etc/nginx/nginx.conf.template /etc/nginx/nginx.conf
fi

# Start supervisord
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
