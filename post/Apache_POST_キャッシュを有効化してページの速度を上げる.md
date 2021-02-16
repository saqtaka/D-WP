Apache_POST_キャッシュを有効化してページの速度を上げる

00077
2020-03-29 00:00:00
2020-03-29 00:00:00
Publish
Post

# Apache_POST_キャッシュを有効化してページの速度を上げる
キャッシュとはPHPなどで動的に生成しているHTMLをWebサーバーの一時領域に保存し、二回目からは一時領域からHTMLを返すことでページの表示速度を上げることができる仕組みです。

キャッシュを有効化すればスペックの低いマシンでも表示速度の速いサイトを作ることができる可能性があります。

デメリットとしては記事を更新してもキャッシュが残っている限り表示されるページが前のまま反映されないことです。通常はキャッシュの有効期限を決めるなどして対応します。

AWS Lightsailで運用しているこのサイトですが、プランをサイズダウンするためにApacheにキャッシュを導入することにしました。

環境はAmazon LinuxにWordPressのDockerコンテナを立てています。WordPressのDockerコンテナはDebianなのでDebianのApacheにキャッシュを導入する手順を紹介します。


## cacheモジュールの設定

設定ファイルを編集します。

DebianのApacheは`/etc/apache2/mods-available/`の中に利用可能なモジュールの設定ファイルがあって、a2enmodコマンドでモジュールを有効化して使用します。

```
vim /etc/apache2/mods-available/cache_disk.conf
```

```
        #
        # For further information, see the comments in that file,
        #
<IfModule mod_cache_disk.c>

        # cache cleaning is done by htcacheclean, which can be configured in
        # /etc/default/apache2
        #
        # For further information, see the comments in that file,
        # /usr/share/doc/apache2/README.Debian, and the htcacheclean(8)
        # man page.

        # This path must be the same as the one in /etc/default/apache2
        CacheRoot /var/cache/apache2/mod_cache_disk

        # This will also cache local documents. It usually makes more sense to
        # put this into the configuration for just one virtual host.
        CacheEnable disk /


    # The result of CacheDirLevels * CacheDirLength must not be higher than
    # 20. Moreover, pay attention on file system limits. Some file systems
    # do not support more than a certain number of inodes and
    # subdirectories (e.g. 32000 for ext3)
    CacheDirLevels 2
    CacheDirLength 1

</IfModule>
```

`CacheEnable disk /`のコメントアウトを外します。

## cacheモジュールの有効化
```
a2enmod cache
a2enmod cache_disk
```
## Apacheを再起動して設定を反映
```
service apache2 restart
```

## 実験
ページにアクセスして`/var/cache/apache2/mod_cache_disk`にファイルが出来ていれば成功です。

## おまけ
キャッシュをクリアする。
```
htcacheclean -v -p /var/cache/apache2/mod_cache_disk -l 1k
```