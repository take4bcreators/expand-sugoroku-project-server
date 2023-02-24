#!/bin/bash

# 開始処理
echo "■ コマンドインストール 開始"
date


# jqコマンドインストール
dnf -y install epel-release
dnf -y install jq --enablerepo=epel

echo "======= jqコマンド追加後の状態 ======="
jq --version
echo "======================================"


# 終了処理
date
echo "■ コマンドインストール 完了"
exit 0
