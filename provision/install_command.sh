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


# vim インストール
dnf -y install vim
echo -e "\nalias vi='vim'" >> ~/.bashrc
echo "======= vimコマンド追加後の状態 ======="
type vim
echo "======================================"


# tmux インストール
dnf -y install tmux
echo "======= tmuxコマンド追加後の状態 ======="
type tmux
echo "======================================"


# 終了処理
date
echo "■ コマンドインストール 完了"
exit 0
