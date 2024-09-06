#!/bin/bash

php-fpm -D -c /etc/php/8.2/fpm/php.ini -y /etc/php/8.2/fpm/php-fpm.conf

nginx

touch /tmp/php.log
chmod 777 /tmp/php.log
tail -f /tmp/php.log
