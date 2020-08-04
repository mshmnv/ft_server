#!/bin/bash

service nginx start
service mysql restart
service php7.3-fpm start
bash mysql.sh
bash wp.sh
bash