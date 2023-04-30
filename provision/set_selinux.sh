#!/bin/bash

# 開始処理
echo "■ selinuxの設定変更 開始"
date


# selinuxの無効化設定
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# 次のリブートまでの無効化
setenforce 0

echo "======= selinuxの無効化設定後の状態 ======="
getenforce
echo "==========================================="


# 終了処理
date
echo "■ selinuxの設定変更 完了"
exit 0
