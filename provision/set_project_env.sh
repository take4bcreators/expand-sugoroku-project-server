#!/bin/bash

#######################################
# プロジェクト用環境変数設定処理
#######################################

# 設定するユーザーのホームディレクトリのリスト
#  スペースまたは改行区切りで記載する
#  ~ (チルダ) で指定する場合はクォーテーションNG
USER_HOME_LIST=(
    ~root
    ~vagrant
    ~sugoroku
    ~postgres
    ~rundeck
)


# 環境変数設定処理
#  ユーザー毎に環境変数を .bash_profile へ追記する
for user_home in "${USER_HOME_LIST[@]}"; do
    profile_path="${user_home}/.bash_profile"
    echo "環境変数書き込み先：${profile_path}"
    echo -e '
        # Sugoroku Project Env
        export PROJECT_BATCH_ROOT="/mnt/project/expand-sugoroku-project-batch"
        export PROJECT_FRONT_ROOT="/mnt/project/expand-sugoroku-project-front"
    ' | sed 's/^ *//' >> "${profile_path}"
done

exit 0
