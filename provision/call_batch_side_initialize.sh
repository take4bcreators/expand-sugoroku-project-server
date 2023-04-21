#!/bin/bash

# フォルダ名・実行シェルのパスを指定
project_batch_root="/mnt/project/expand-sugoroku-project-batch"
exec_shell="${project_batch_root}/provision/batch_side_initialize/batch_side_initialize.sh"

# 実行シェルの存在確認
if [ ! -f "${exec_shell}" ]; then
    echo "${exec_shell} が存在しません。スキップします"
    exit 0
fi

echo "バッチサイド初期化処理開始"
${exec_shell}
return_code=$?
echo "バッチサイド初期化処理終了"
echo "戻り値：${return_code}"

exit 0
