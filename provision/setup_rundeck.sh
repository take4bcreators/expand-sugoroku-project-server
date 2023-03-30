#!/bin/bash
# Rundeck セットアップシェル実行
curl https://raw.githubusercontent.com/rundeck/packaging/main/scripts/rpm-setup.sh 2> /dev/null | bash -s rundeck 

# Rundeck・Javaインストール
dnf -y install java-1.8.0 rundeck

# Rundeck サービス起動
systemctl start rundeckd

# Rundeck 自動起動設定
systemctl enable rundeckd

# CLIインストール
dnf -y install rundeck-cli

