#!/bin/bash

echo
echo -----------------------------------------
echo execute setup_container.sh
echo -----------------------------------------

# road settingfile
source settings

# mysql
docker container run \
  --name $mysql_name \
  -e MYSQL_ROOT_PASSWORD=$db_password \
  -d \
  -m 448m \
  --oom-kill-disable=true \
  --restart=always mysql-auto:$version

# wordpress
docker container run \
  --name $wordpress_name \
  --link $mysql_name:mysql \
  -d \
  -e SITE_DOMAIN=$site_domain \
  -e CERTBOT_EMAIL=$certbot_email \
  -e SITE_TITLE=$site_title \
  -e ADMIN_USER=$admin_user \
  -e ADMIN_PASSWORD=$admin_password \
  -e ADMIN_EMAIL=$admin_email \
  -v $dir_path/mytheme:/var/www/html/wp-content/themes/mytheme \
  -v $dir_path/post:/home/wordpress-auto/post \
  -p 80:80 \
  -p 443:443 \
  -m 192m \
  --oom-kill-disable=true \
  --restart=always wordpress-auto:$version
