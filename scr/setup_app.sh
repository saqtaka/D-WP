#!/bin/bash

echo
echo -----------------------------------------
echo 設定ファイルの読み込み
echo -----------------------------------------

# road settingfile
source settings

echo
echo -----------------------------------------
echo WordPressの設定
echo -----------------------------------------

docker exec -it $wordpress_name \
    wp post create \
        --allow-root \
        --path="/var/www/html/" \
        --post_content="chika" \
        --post_date="2019-6-16 00:00:00" \
        --post_modified="2019-6-16 00:00:00" \
        --post_status="publish" \
        --post_title="chika" \
        --post_type="page"

docker exec -it $wordpress_name \
    wp post create \
        --allow-root \
        --path="/var/www/html/" \
        --post_content="chika-result" \
        --post_date="2019-6-16 00:00:00" \
        --post_modified="2019-6-16 00:00:00" \
        --post_status="publish" \
        --post_title="chika-result" \
        --post_type="page" \
        --post_parent="chika"

docker exec -it $wordpress_name \
    wp post create \
        --allow-root \
        --path="/var/www/html/" \
        --post_content="chika-ranking" \
        --post_date="2019-6-16 00:00:00" \
        --post_modified="2019-6-16 00:00:00" \
        --post_status="publish" \
        --post_title="chika-ranking" \
        --post_type="page" \
        --post_parent="chika"

docker exec -it $wordpress_name \
    wp post create \
        --allow-root \
        --path="/var/www/html/" \
        --post_content="chika-help" \
        --post_date="2019-6-16 00:00:00" \
        --post_modified="2019-6-16 00:00:00" \
        --post_status="publish" \
        --post_title="chika-help" \
        --post_type="page" \
        --post_parent="chika"





docker exec -it $wordpress_name \
    wp post create \
        --allow-root \
        --path="/var/www/html/" \
        --post_content="population" \
        --post_date="2020-11-15 00:00:00" \
        --post_modified="2020-11-15 00:00:00" \
        --post_status="publish" \
        --post_title="population" \
        --post_type="page"

docker exec -it $wordpress_name \
    wp post create \
        --allow-root \
        --path="/var/www/html/" \
        --post_content="population-result" \
        --post_date="2020-11-15 00:00:00" \
        --post_modified="2020-11-15 00:00:00" \
        --post_status="publish" \
        --post_title="population-result" \
        --post_type="page"

docker exec -it $wordpress_name \
    wp post create \
        --allow-root \
        --path="/var/www/html/" \
        --post_content="population-ranking" \
        --post_date="2020-11-15 00:00:00" \
        --post_modified="2020-11-15 00:00:00" \
        --post_status="publish" \
        --post_title="population-ranking" \
        --post_type="page"

docker exec -it $wordpress_name \
    wp post create \
        --allow-root \
        --path="/var/www/html/" \
        --post_content="population-help" \
        --post_date="2020-11-15 00:00:00" \
        --post_modified="2020-11-15 00:00:00" \
        --post_status="publish" \
        --post_title="population-help" \
        --post_type="page"