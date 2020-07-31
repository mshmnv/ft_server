#!/bin/bash

#create key and certificate for https
openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt \
-keyout /etc/ssl/certs/localhost.key -subj "/C=RU/ST=MSK/L=MSK/O=None/CN=www.example.com"

#delete default nginx conf and put my conf
rm -f /etc/nginx/sites-available/default
rm -f /etc/nginx/sites-enabled/default
mv /nginx.conf /etc/nginx/conf.d/nginx.conf
ln /etc/nginx/conf.d/nginx.conf /etc/nginx/sites-enabled/default

service nginx start
service mysql restart
service php7.3-fpm start
bash