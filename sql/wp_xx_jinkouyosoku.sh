#!/bin/bash

echo
echo -----------------------------------------
echo 前処理
echo -----------------------------------------
# Amazon Linux にnkfがなかったのでcentosからダウンロード
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/nkf-2.0.8b-6.2.el6.x86_64.rpm
yum localinstall nkf-2.0.8b-6.2.el6.x86_64.rpm -y

echo
echo -----------------------------------------
echo 設定ファイルの読み込み
echo -----------------------------------------
# road settingfile
source ../scr/settings

# ファイル名を変数に入れる
file_name="wp_xx_jinkouyosoku.sql"

echo
echo -----------------------------------------
echo check.sh $file_name before
echo -----------------------------------------
source check.sh

echo
echo -----------------------------------------
echo SQL実行
echo -----------------------------------------
# ディレクトリ作成
docker exec $mysql_name mkdir /home/wordpress-auto
docker exec $mysql_name mkdir /home/wordpress-auto/sql

# ファイル送信
echo $file_name
docker cp ./$file_name $mysql_name:/home/wordpress-auto/sql/

# insert 実行
docker exec \
    -it $mysql_name mysql \
    -u root \
    -p$db_password \
    -e "source /home/wordpress-auto/sql/"$file_name


echo -----------------------------------------
echo csvディレクトリ処理

# データ格納用ディレクトリの作成
rm $dir_path/chika-graph/data/csv-jinkou -r

mkdir $dir_path/chika-graph/csv-jinkou

# download
cd $dir_path/chika-graph/csv-jinkou

curl -O https://makeshipcom-jinkou-data.s3-ap-northeast-1.amazonaws.com/kekkahyo1.csv


cd $dir_path/chika-graph/csv-jinkou

echo -----------------------------------------
echo 文字コード変換

# ファイル名にスペースがあるとうまくいかなかったのでfindを使った
# for file in `find . -maxdepth 1 -type f | sed 's!^.*/!!'`; do
find . -name '*.csv' | while read file
do
    # ファイル名を出力
    echo $file | sed -e "s/.\///"

    # 文字コード変更
    nkf --guess "`echo $file | sed -e "s/.\///"`"
    nkf -w --overwrite "`echo $file | sed -e "s/.\///"`"
    nkf --guess "`echo $file | sed -e "s/.\///"`"

    # csvの先頭行を削除
    sed -i '1,4d' "`echo $file | sed -e "s/.\///"`"
done

# csvディレクトリをmysqlコンテナに移動する
docker exec -it $mysql_name mkdir /home/wordpress-auto/app
docker exec -it $mysql_name mkdir /home/wordpress-auto/app/fudousan
docker exec -it $mysql_name mkdir /home/wordpress-auto/app/fudousan/csv-jinkou
docker cp $dir_path/chika-graph/csv-jinkou/. $mysql_name:/home/wordpress-auto/app/fudousan/csv-jinkou

# ファイル名にスペースがあるとうまくいかなかったのでfindを使った
# for file in `find . -maxdepth 1 -type f | sed 's!^.*/!!'`; do
find . -name '*.csv' | while read file
do
    # ファイル名を出力
    echo $file | sed -e "s/.\///"
    docker exec $mysql_name \
        mysql \
            -u root \
            -p$db_password \
            -e "LOAD DATA LOCAL INFILE \"/home/wordpress-auto/app/fudousan/csv-jinkou/`echo $file | sed -e "s/.\///"`\" INTO TABLE wordpress.wp_xx_jinkouyosoku FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
done

# check を流すため
cd $dir_path/chika-graph/sql

echo
echo -----------------------------------------
echo check.sh $file_name after
echo -----------------------------------------
source check.sh