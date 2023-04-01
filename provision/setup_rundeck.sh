#!/bin/bash
# Rundeck セットアップシェル実行
curl https://raw.githubusercontent.com/rundeck/packaging/main/scripts/rpm-setup.sh 2> /dev/null | bash -s rundeck 

# Rundeck・Javaインストール
dnf -y install java-1.8.0 rundeck

# Rundeck サービス起動
systemctl start rundeckd

# Rundeck 自動起動設定
systemctl enable rundeckd

# 変更する
# 【構文】usermod -aG 追加するグループ名 対象ユーザ
usermod -aG sugoroku rundeck
usermod -aG maingrp rundeck
usermod -aG postgres rundeck


# CLIインストール
dnf -y install rundeck-cli

# 設定ファイルの変更
# sed -e '$a # rundeck.api.tokens.duration.max = 0' /etc/rundeck/rundeck-config.properties

# bash_profile に環境設定を追加
# sed -e '$a # export RD_URL=http://localhost:4440' ~rundeck/.bash_profile 
echo "export RD_URL=http://localhost:4440" >> ~rundeck/.bash_profile 



# PostgreSQLへのパスワード無しログインの設定
# .pgpass の追加
echo -e "localhost:5432:sgpjdb01:sugoroku:pass\nlocalhost:5432:sgpjdb01:storage:pass" > ~rundeck/.pgpass

# パーミッション変更
chmod 600 ~rundeck/.pgpass

# パーミッションオーナー変更
chown rundeck:rundeck ~rundeck/.pgpass

# rundeckd サービス再起動
systemctl restart rundeckd


# zip コマンドインストール
dnf -y install zip unzip


