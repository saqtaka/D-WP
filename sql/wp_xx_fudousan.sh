#!/bin/bash

echo
echo -----------------------------------------
echo 前処理
echo -----------------------------------------
# Amazon Linux にnkfがなかったのでcentosからダウンロード
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/nkf-2.0.8b-6.2.el6.x86_64.rpm
yum localinstall nkf-2.0.8b-6.2.el6.x86_64.rpm -y
# nkf wsl2のDebian用
sudo apt-get install nkf

echo
echo -----------------------------------------
echo 設定ファイルの読み込み
echo -----------------------------------------
# road settingfile
source ../scr/settings

# ファイル名を変数に入れる
file_name="wp_xx_fudousan.sql"

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
rm $dir_path/.cache/csv -r

mkdir $dir_path/.cache/csv

# download
cd $dir_path/.cache/

# wget https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20151_20154.zip
# wget https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20161_20164.zip
# wget https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20171_20174.zip
# wget https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20181_20184.zip
# wget https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20191_20192.zip

# macにはwgetがないのでcurl
curl -O https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20151_20154.zip
curl -O https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20161_20164.zip
curl -O https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20171_20174.zip
curl -O https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20181_20184.zip
curl -O https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20191_20194.zip
curl -O https://makeshipcom-chika-data.s3-ap-northeast-1.amazonaws.com/All_20201_20202.zip

# unzip
unzip -d $dir_path/.cache/csv All_20151_20154.zip
unzip -d $dir_path/.cache/csv All_20161_20164.zip
unzip -d $dir_path/.cache/csv All_20171_20174.zip
unzip -d $dir_path/.cache/csv All_20181_20184.zip
unzip -d $dir_path/.cache/csv All_20191_20194.zip
unzip -d $dir_path/.cache/csv All_20201_20202.zip

cd $dir_path/.cache/csv

echo -----------------------------------------
echo 文字コード変換

# ファイル名にスペースがあるとうまくいかなかったのでfindを使った
# for file in `find . -maxdepth 1 -type f | sed 's!^.*/!!'`; do
find . -name '*.csv' | while read file
do
    # ファイル名を出力
    echo $file | sed -e "s/.\///"

    # 文字コード & 改行コードを変更
    # UTF-8 & LF
    nkf --guess "`echo $file | sed -e "s/.\///"`"
    nkf -Lu -w --overwrite "`echo $file | sed -e "s/.\///"`"
    nkf --guess "`echo $file | sed -e "s/.\///"`"

    # csvの先頭行を削除
    sed -i '1,1d' "`echo $file | sed -e "s/.\///"`"
done


# csvディレクトリをmysqlコンテナに移動する
docker exec -it $mysql_name mkdir /home/wordpress-auto/app
docker exec -it $mysql_name mkdir /home/wordpress-auto/app/fudousan
docker exec -it $mysql_name mkdir /home/wordpress-auto/app/fudousan/csv
docker cp $dir_path/.cache/csv/. $mysql_name:/home/wordpress-auto/app/fudousan/csv

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
            -e "LOAD DATA LOCAL INFILE \"/home/wordpress-auto/app/fudousan/csv/`echo $file | sed -e "s/.\///"`\" INTO TABLE wordpress.wp_xx_fudousan FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
done

# check を流すため
cd $dir_path/sql

echo
echo -----------------------------------------
echo check.sh $file_name after
echo -----------------------------------------
source check.sh