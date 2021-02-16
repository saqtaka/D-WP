Docker_Dockerfile_DockerfileでディレクトリごとコンテナにCOPYするまで

00052
2019-06-18 00:00:00
2019-06-18 00:00:00
Publish
Post

# Docker_Dockerfile_DockerfileでディレクトリごとコンテナにCOPYするまで
## はじめに
### ADDとCOPY
Dockerfileには親のOSからコンテナにファイルを送るADDとCOPYというコマンドがあります。

COPYはファイルをコンテナの中にコピーするだけですが、ADDはtarファイルの展開機能もあります。なのでファイルをコピーするだけならCOPYを使用した方が、コードの意味が推測しやすくなるので推奨されているようです。

COPYの使用方法を紹介します。

### 開発環境
```
Docker version 18.06.1-ce
```

## 手順
### 1つのファイルをコピーする
Dockerfileがあるディレクトリの中にコピーしたいファイルを配置します。その上でDockerfileに記述します。

```
COPY wordpress_setup.sh /home/wordpress-auto/
```

このような形で送りたいファイルの後に送りたいコンテナの中のパスをします。

### ディレクトリごとコピーする
ディレクトリの中を全部コンテナの中にコピーしたい場合は、

```
COPY post/ /home/wordpress-auto/post/
```

のようにファイルではなく、フォルダを指定するとできます。

## さいごに
コンテナにコピーしたいファイルが複数ある場合は、ファイルではなくディレクトリごと指定する方が効率的にDockerfileを記述することができます。

[http://docs.docker.jp/engine/reference/builder.html](http://docs.docker.jp/engine/reference/builder.html)
