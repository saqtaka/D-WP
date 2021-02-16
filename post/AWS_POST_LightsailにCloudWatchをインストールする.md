AWS_POST_LightsailにCloudWatchをインストールする

00067
2020-01-31 00:00:00
2020-01-31 00:00:00
Publish
Post

# AWS_POST_LightsailにCloudWatchをインストールする
AWS Lightsail(AmazonLinux)にCloudWatchをインストールすることにしました。

Lightsail固有の問題があって少しインストールするのに詰まったので解決方法も記載します。

## AWS上で作成するリソース
* IAM
* AWS System Manager パラメータストア
* Cloud Watch ロググループ
* Cloud Watch ログストリーム

### IAMの作成
CloudWatch用のユーザーを作成します。

* CloudWatchAgentAdminPolicy
* CloudWatchAgentServerPolicy

2つのポリシーを付与します。

### AWS System Manager パラメータストアの作成


## ダウンロード
```
wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
```

## エージェントをインストール
```
sudo rpm -U ./amazon-cloudwatch-agent.rpm
```

## IAM情報を設定
```
sudo aws configure --profile AmazonCloudWatchAgent
```

ユーザーを作成した時のアクセスキーを聞かれます。

リージョンは`ap-northeast-1`を入力しました。

## cloudwatchを設定

コマンドを実行します。

```
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
```

## エージェントを起動
```
# AWS パラメータストアにパラメータを置いて、パラメータストアのconfigを使って起動
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c ssm:AmazonCloudWatch-linux -s
```
パラメータストアを使用する場合はconfig名がAmazonCloudWatch-で始まる必要があるようです。

### おまけ
```
# configファイルから起動
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:[configuration-file-path] -s

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-conflig -m onPremise -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
```

## ハマりポイント1
エージェント起動時にtypes.dbというファイルがないとうまく起動しないので作成する。
```
mkdir -p /usr/share/collectd/

touch /usr/share/collectd/types.db
```

## ハマりポイント2
/opt/aws/amazon-cloudwatch-agent/etc/common-config.tomlに設定を追加しないとうまく起動しない。

```
[credentials]
shared_credential_profile = "AmazonCloudWatchAgent"
```
2行追加する。

下記サイトに書いてありました。英語なので合ってるか分かりませんが読んだ限りでは、言わば「EC2もどき」であるLightsailでCloudWatchを使おうとするとうまく動かなくなってしまうので、回避するために設定を追加する必要があるみたいです。

[https://stackoverflow.com/questions/41645642/can-i-use-aws-lightsail-with-aws-cloudwatch](https://stackoverflow.com/questions/41645642/can-i-use-aws-lightsail-with-aws-cloudwatch)

## 動いているか確認
```
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m onPremise -a status
```
## サーバーにログインしたら、メールを送る
### メトリクスフィルターを作成する
作成したロググループの中にメトリクスフィルターを作成します。
SSHでログインが成功するとログの文字列の中に`Accept`が書き込まれるので`Accept`でフィルターをかけて数値化します。

メトリクス値は1を設定しました。

### CloudWatchでアラームを設定する


## やり直す時はアンインストール
```
sudo rpm -e amazon-cloudwatch-agent

```


