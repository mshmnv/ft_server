#!/bin/bash

mysql -e "CREATE DATABASE wp_base"
mysql -e "CREATE USER 'lbagg'@'localhost' IDENTIFIED BY 'lbagg';"
mysql -e "GRANT ALL ON *.* TO 'lbagg'@'localhost' IDENTIFIED BY 'lbagg' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES"