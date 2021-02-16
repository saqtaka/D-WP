#!/bin/bash

echo
echo -----------------------------------------
echo execute build_dockerfile.sh
echo -----------------------------------------

# road settingfile
source settings

docker build \
  -t wordpress-auto:$version ../dockerfile/wordpress
  --no-cache
# --no-cache 毎回ゼロからビルドする

docker build -t mysql-auto:$version ../dockerfile/mysql
