# docker build -t server .
# docker run -it -p 80:80 -p 443:443 server

# the base image
FROM debian:buster

RUN apt-get update
# 'y' for auto 'yes'
RUN apt-get install -y vim
# NGINX
RUN apt-get install -y nginx
# MARIADB
RUN apt-get install -y mariadb-server
# PHP (extencions to communicate with MariaDB)
RUN apt-get install -y php-fpm php-mysql
# PHP packages for wordpress
RUN apt-get install -y php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
# wget to download files from net
RUN apt-get install -y wget

# WORDPRESS
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /var/www/html/wordpress
RUN cp -a /var/www/html/wordpress/. /var/www/html/ && rm -R /var/www/html/wordpress
# COPY srcs/wp-config.php /var/www/html/wp-config.php

# modify permissions (chown - change owner)
RUN chown -R www-data:www-data /var/www/html
RUN chmod 775 -R /var/www/html
# RUN chmod 660 /var/www/html/wp-config.php

# copy NGINX config
COPY /srcs/nginx.conf /nginx.conf
# COPY /srcs/nginx.conf /etc/nginx/conf.d/nginx.conf

# delete default nginx conf and put my conf
# RUN cp nginx.conf etc/nginx/sites-available/nginx.conf
# RUN cp nginx.conf etc/nginx/sites-enabled/nginx.conf
# RUN rm -f /etc/nginx/sites-available/default
# RUN rm -f /etc/nginx/sites-enabled/default
# RUN mv /nginx.conf /etc/nginx/conf.d/nginx.conf
# RUN ln /etc/nginx/conf.d/nginx.conf /etc/nginx/sites-enabled/default

# copy php-info
# COPY srcs/info.php /var/www/html/info.php

#delete standart nginx page
RUN rm -f /var/www/html/index.nginx-debian.html

# PHPMYADMIN
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
# RUN tar -xzvf phpMyAdmin-5.0.2-english.tar.gz && rm -rf phpMyAdmin-5.0.2-english.tar.gz
# RUN mv phpMyAdmin-5.0.2-english/ /var/www/html/phpmyadmin
# COPY /srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php

# Define the port number the container should expose.
# Expose port 80 for HTTP and 443 for HTTPS.
EXPOSE 80 443

# copy scrypst
COPY srcs/start.sh ./

# run the default command
CMD bash start.sh
