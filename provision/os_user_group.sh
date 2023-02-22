#!/bin/bash

# 設定値指定
export SERVER_SYNC_DIR="/mnt/sync"
export PROVISION_ENV_FILE="${SERVER_SYNC_DIR}/env/provision.env"



############################################
# 開始処理
############################################
echo "======= ユーザ・グループ設定開始 ======="
date
sudo su -



############################################
# 設定ファイル読み込み・条件確認
############################################
# 設定ファイルの存在確認
if [ ! -f "${PROVISION_ENV_FILE}" ]; then
    echo "ERROR  ${PROVISION_ENV_FILE} が存在しません"
    exit 1
fi
source "${PROVISION_ENV_FILE}"

# 必要な変数の存在確認
if [ -z "${ENV_SUGOROKU_USER_PASS}" ]; then
    echo "ERROR  変数 ENV_SUGOROKU_USER_PASS が設定されていません"
    exit 1
fi



############################################
# グループの追加
############################################
echo "======= グループ追加前の状況 ======="
getent group | grep "sugorokugrp"
echo "===================================="

# グループの追加
groupadd sugorokugrp

# GIDの変更
groupmod -g 1234 sugorokugrp

echo "======= グループ追加後の状況 ======="
getent group | grep "sugorokugrp"
echo "===================================="



############################################
# ユーザの追加
############################################
echo "======= ユーザ追加前の状況 ======="
getent passwd | grep "sugoroku"
echo "=================================="

# ユーザー追加
useradd -c "mainuser" -G 1234 sugoroku

# パスワード変更
echo "${ENV_SUGOROKU_USER_PASS}" | passwd --stdin sugoroku

echo "======= ユーザ追加後の状況 ======="
getent passwd | grep "sugoroku"
echo "=================================="



############################################
# 終了処理
############################################
date
echo "======= ユーザ・グループ設定完了 ======="
exit 0
