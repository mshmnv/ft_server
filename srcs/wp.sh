#!/bin/bash

siteurl="localhost"
wptitle="ft_server by lbagg"
wpemail="mshmnv@yandex.ru"
wpuser="lbagg"
wppass="lbagg"
curl -d "weblog_title=$wptitle&user_name=$wpuser&admin_password=$wppass&admin_password2=$wppass&admin_email=$wpemail" -k https://$siteurl/wp-admin/install.php?step=2 > /dev/null