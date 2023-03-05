#!/bin/bash

# 設定値指定
export SERVER_SYNC_DIR="/mnt/sync"
export PROVISION_ENV_FILE="${SERVER_SYNC_DIR}/env/provision.env"


# 設定ファイル読み込み・条件確認
# 設定ファイルの存在確認
if [ ! -f "${PROVISION_ENV_FILE}" ]; then
    echo "ERROR  ${PROVISION_ENV_FILE} が存在しません"
    exit 1
fi
source "${PROVISION_ENV_FILE}"

# 必要な変数の存在確認
if [ -z "${ENV_POSTGRES_USER_PASS}" ]; then
    echo "ERROR  変数 ENV_POSTGRES_USER_PASS が設定されていません"
    exit 1
fi

# パスワード変更
echo "${ENV_POSTGRES_USER_PASS}" | passwd --stdin postgres

# 【構文】usermod -aG 追加するグループ名 対象ユーザ
usermod -aG sugoroku postgres

# 【構文】usermod -aG 追加するグループ名 対象ユーザ
usermod -aG postgres sugoroku


