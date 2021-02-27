# FT_SERVER

*System Administration project*

* Web server is set up with Nginx, in only one docker container. The container OS is debian buster.
* Web server is able to run several services at the same time. The services are a WordPress website, phpMyAdmin and MySQL. SQL database works with the WordPress and phpMyAdmin.
* Server is able to use the SSL protocol.
* Depending on the url, server redirects to the
correct website.
* Server is running with an autoindex that must be able to be disabled.

**COMMANDS TO USE:**
```
docker build -t server .
docker run -it -p 80:80 -p 443:443 server
```
**or**
```
make build
make run
```
