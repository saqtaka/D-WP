#!/bin/bash

echo
echo -----------------------------------------
echo 設定ファイルの読み込み
echo -----------------------------------------

# road settingfile
source ../scr/settings

echo
echo -----------------------------------------
echo SQL実行
echo -----------------------------------------

# SQLを実行する

docker exec \
    -it $mysql_name \
        mysql \
            -u root \
            -p$db_password \
            -e "select table_name, table_rows from information_schema.TABLES where table_schema = 'wordpress';"
