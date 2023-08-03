#!/bin/sh

# Replace WEB_ROOT in nginx.conf template with the value from the WEB_ROOT environment variable
if [ -n "$WEB_ROOT" ]; then
  sed "s|root /var/www/html;|root ${WEB_ROOT};|" /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf
else
  echo "WEB_ROOT environment variable not set. Using the default WEB_ROOT value."
fi

# Start supervisord
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
