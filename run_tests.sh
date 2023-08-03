#!/usr/bin/env sh
apk --no-cache add curl
/bin/sleep 10
curl --silent --fail http://app:8080 | grep 'PHP 8.1'
