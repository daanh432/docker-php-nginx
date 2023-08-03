#!/bin/sh

# Replace WEB_ROOT in nginx.conf template with the value from the WEB_ROOT environment variable
if [ -n "$WEB_ROOT" ]; then
  sed "s|root /var/www/html;|root ${WEB_ROOT};|" /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
  echo "WEB_ROOT environment variable set. Using the WEB_ROOT value: ${WEB_ROOT}"
else
  cp /etc/nginx/conf.d/default.conf.template /etc/nginx/conf.d/default.conf
  echo "WEB_ROOT environment variable not set. Using the default WEB_ROOT value: /var/www/html"
fi

# Start CMD
exec "$@"
