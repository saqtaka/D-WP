#!/bin/bash

echo
echo -----------------------------------------
echo post-rename
echo -----------------------------------------

cd /home/wordpress-auto/
source category_setup.sh

echo
echo -----------------------------------------
echo post-rename
echo -----------------------------------------
# post-renameの作成
rm /home/wordpress-auto/post-rename -r
cp -r /home/wordpress-auto/post /home/wordpress-auto/post-rename

# filename change
cd /home/wordpress-auto/post-rename
for file in `find . -maxdepth 1 -type f | sed 's!^.*/!!'`; do
  # ファイル名を変更
  mv $file `sed -n 3p $file`_$file
done

echo
echo -----------------------------------------
echo pandac install
echo -----------------------------------------

apt install pandoc -y
pandoc -v

echo
echo -----------------------------------------
echo post-html
echo -----------------------------------------
# from markdown convert to html with pandoc
rm /home/wordpress-auto/post-html -r
mkdir /home/wordpress-auto/post-html

echo -----------------------------------------
echo MarkdownからHTMLに変換

cd /home/wordpress-auto/post-rename
for file in `find . -maxdepth 1 -type f | sed 's!^.*/!!'`; do

  # pandacでMarkdownからHTMLに変換
  pandoc -f markdown -t html $file > /home/wordpress-auto/post-html/$file
done

echo -----------------------------------------
echo post-htmlからパラメータを取り除きます

cd /home/wordpress-auto/post-html
for file in `find . -maxdepth 1 -type f | sed 's!^.*/!!'`; do

  # post-htmlからパラメータを取り除きます
  sed -i '1,3d' $file

  # moreタグの追加
  sed -i -e '1i <!-- wp:more -->' $file
  sed -i -e '1i <!--more-->' $file
  sed -i -e '1i <!-- /wp:more -->' $file
done

echo -----------------------------------------
echo 記事を投稿します

# post
cd /home/wordpress-auto/post-rename
for file in `find . -maxdepth 1 -type f`; do

  # 記事名をecho
  echo $file

  # wp-cliで記事を投稿
  wp post update `sed -n 3p $file | sed 's!^.*/!!'` \
    --allow-root \
    --path="/var/www/html/" \
    --post_content="`cat /home/wordpress-auto/post-html/$file`" \
    --post_date="`sed -n 4p $file`" \
    --post_modified="`sed -n 5p $file`" \
    --post_status="`sed -n 6p $file`" \
    --post_title="【`echo $file | cut -d'_' -f2`】`echo $file | cut -d'_' -f4- | sed -e s/.md//`" \
    --post_type="`sed -n 7p $file`" \
    --post_category="`echo $file | cut -d'_' -f2`" \
    --tags_input="`echo $file | cut -d'_' -f2`, `echo $file | cut -d'_' -f3`" \
    --comment_status="closed" # コメントを閉める

done
