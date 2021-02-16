#!/bin/bash

echo
echo -----------------------------------------
echo 証明書インストール
echo -----------------------------------------
# 証明書をインストール
certbot \
  -d $SITE_DOMAIN \
  --apache \
  --agree-tos \
  -m $CERTBOT_EMAIL \
  -n \
  --redirect \
  -w /var/www/html


echo
echo -----------------------------------------
echo WordPressインストール
echo -----------------------------------------

echo -----------------------------------------
echo wp-cli core install
# wp-cliでwordpressをインストールする
cd /var/www/html
wp core install \
  --allow-root \
  --url=https://$SITE_DOMAIN \
  --title=$SITE_TITLE \
  --admin_user=$ADMIN_USER \
  --admin_password=$ADMIN_PASSWORD \
  --admin_email=$ADMIN_EMAIL



echo -----------------------------------------
echo パーマリンク設定

wp rewrite structure '/p=%post_id%' --allow-root

echo -----------------------------------------
echo THEMEのインストール
cd /var/www/html/wp-content/themes/
wp --allow-root theme activate mytheme

echo
echo -----------------------------------------
echo サーバー設定
echo -----------------------------------------

echo -----------------------------------------
echo ログイン画面にBasic認証をかける
cd /var/www/html

# .htaccess
echo '' >> .htaccess
echo '# BEGIN server setting' >> .htaccess
echo '' >> .htaccess
echo '<Files wp-login.php>' >> .htaccess
echo 'AuthUserFile "/var/www/html/.htpasswd"' >> .htaccess
echo 'AuthName "Basic Auth"' >> .htaccess
echo 'AuthType Basic' >> .htaccess
echo 'Require valid-user' >> .htaccess
echo '</Files>' >> .htaccess
echo '' >> .htaccess
echo '# END server setting' >> .htaccess

# Basic認証のユーザー追加
htpasswd -cb "/var/www/html/.htpasswd" $ADMIN_USER $ADMIN_PASSWORD


echo
echo -----------------------------------------
echo 環境変数を解除
echo -----------------------------------------

unset ENV SITE_DOMAIN
unset CERTBOT_EMAIL
unset SITE_TITLE
unset ADMIN_USER
unset ADMIN_PASSWORD
unset ADMIN_EMAIL
unset THEME


echo
echo -----------------------------------------
echo 記事を下書きで作成しておく
echo -----------------------------------------

echo -----------------------------------------
echo 記事を下書きで作成しておく

wp post delete 1 \
  --allow-root \
  --path="/var/www/html/"

wp post delete 2 \
  --allow-root \
  --path="/var/www/html/"

# 下書き記事を投稿しておく
num=5
end=100

for((i=$num;i<$end;i++))do
  wp post create \
    --allow-root \
    --path="/var/www/html/" \
    --post_content="test" \
    --post_date="2019-6-16 00:00:00" \
    --post_modified="2019-6-16 00:00:00" \
    --post_status="draft" \
    --post_title="test" \
    --post_type="post"
done

