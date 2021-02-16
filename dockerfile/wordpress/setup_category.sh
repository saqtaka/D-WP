#!/bin/bash

echo -----------------------------------------
echo カテゴリーとタグの登録

# ファイル名をテキストに格納
cd /home/wordpress-auto/post
rm ../post_name.txt
rm ../term.txt

for file in `find . -maxdepth 1 -type f | sed 's!^.*/!!'`; do
  echo $file >> ../post_name.txt
done

# アンダーバーより前を取り出す
cut -d '_' -f 1 ../post_name.txt >> ../term.txt
cut -d '_' -f 2 ../post_name.txt >> ../term.txt

# term.txtを1行ずつループで回してカテゴリーとタグを登録する
while read line
do
  # echo $line
  # TODO 存在判定を足したい

  # カテゴリーの登録
  wp term create category $line --allow-root --path="/var/www/html/"

  # タグも登録
  wp term create post_tag $line --allow-root --path="/var/www/html/"
done < ../term.txt
