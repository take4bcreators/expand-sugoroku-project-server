#!/bin/bash

# 設定値指定

# ホストとサーバーで共有するディレクトリ名
export SERVER_SYNC_DIR="/mnt/sync"
# プロビジョニング用環境設定ファイルのパス
export PROVISION_ENV_FILE="${SERVER_SYNC_DIR}/env/provision.env"
# メインユーザー名
export MAIN_USER_NAME="sugoroku"
# メインユーザーのUID
export MAIN_USER_UID="456"
# メインで使用するグループ名
export MAIN_GROUP_NAME="maingrp"
# メインで使用するグループのGID
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
# shellcheck source=../sync/env/provision.env
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
useradd -u "${MAIN_USER_UID}" -G "${MAIN_GROUP_GID}" "${MAIN_USER_NAME}"

# パスワード変更
echo "${ENV_MAIN_USER_PASS}" | passwd --stdin "${MAIN_USER_NAME}"

echo "======= ユーザ追加後の状況 ======="
getent passwd | grep "${MAIN_USER_NAME}"
echo "=================================="


# 終了処理
date
echo "■ ユーザ・グループ設定 完了"
exit 0
