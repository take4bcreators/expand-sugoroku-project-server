#!/bin/bash

# 開始処理
echo "■ ロケール・タイムゾーン設定 開始"
date


# ロケール設定
dnf install -y glibc-langpack-ja
localectl set-locale ja_JP.UTF-8
localectl set-keymap jp106

echo "======= ロケール設定後の状態 ======="
localectl status
echo "===================================="


# タイムゾーンの設定
timedatectl set-timezone Asia/Tokyo

echo "======= タイムゾーン設定後の状態 ======="
timedatectl status
echo "========================================"


# 終了処理
date
echo "■ ロケール・タイムゾーン設定 完了"
exit 0
