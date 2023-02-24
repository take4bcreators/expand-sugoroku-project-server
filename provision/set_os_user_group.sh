#!/bin/bash

# 設定値指定
export SERVER_SYNC_DIR="/mnt/sync"
export PROVISION_ENV_FILE="${SERVER_SYNC_DIR}/env/provision.env"
export MAIN_USER_NAME="sugoroku"
export MAIN_GROUP_NAME="sugorokugrp"
export MAIN_GROUP_GID="1234"



# 開始処理
echo "■ ユーザ・グループ設定 開始"
date

# 設定ファイル読み込み・条件確認
# 設定ファイルの存在確認
if [ ! -f "${PROVISION_ENV_FILE}" ]; then
    echo "ERROR  ${PROVISION_ENV_FILE} が存在しません"
    exit 1
fi
source "${PROVISION_ENV_FILE}"

# 必要な変数の存在確認
if [ -z "${ENV_MAIN_USER_PASS}" ]; then
    echo "ERROR  変数 ENV_MAIN_USER_PASS が設定されていません"
    exit 1
fi


# グループの追加
groupadd "${MAIN_GROUP_NAME}"

# GIDの変更
groupmod -g "${MAIN_GROUP_GID}" "${MAIN_GROUP_NAME}"

echo "======= グループ追加後の状況 ======="
getent group | grep "${MAIN_GROUP_NAME}"
echo "===================================="


# ユーザの追加
useradd -c "mainuser" -G "${MAIN_GROUP_GID}" "${MAIN_USER_NAME}"

# パスワード変更
echo "${ENV_MAIN_USER_PASS}" | passwd --stdin "${MAIN_USER_NAME}"

echo "======= ユーザ追加後の状況 ======="
getent passwd | grep "${MAIN_USER_NAME}"
echo "=================================="


# 終了処理
date
echo "■ ユーザ・グループ設定 完了"
exit 0
