#!/bin/bash

#######################################
# プロジェクト用環境変数設定処理
#######################################

# 環境変数設定処理
echo -e '
# Sugoroku Project Env
export PROJECT_BATCH_ROOT="/mnt/project/expand-sugoroku-project-batch"
export PROJECT_FRONT_ROOT="/mnt/project/expand-sugoroku-project-front"
export RD_URL=http://localhost:4440
export RD_USER=admin
export RD_PASSWORD=admin
' >> "/etc/profile"


exit 0
