#!/bin/zsh
# Windows の GirBash で実行する場合は、bashコマンドの引数に指定する形で実行してください


# 定数指定 -----------------------------------------------------------------------------------
# Vagrantfile のあるディレクトリのパスを相対パスで指定（末尾の / は不要）
VAGRANT_FILE_DIR_ABS="../.."
# --------------------------------------------------------------------------------------------


# 実行確認用メッセージ表示
echo
echo "■ Vagrant 開始用スクリプト"
echo
echo "・中止する場合はこのままウィンドウを閉じてください。"
echo
echo -n "続行するには Return キー を押してください . . ."
read -s
echo


# 開始処理
echo
echo "■ 処理開始"
date

# Vagrantfile が対象ディレクトリにない場合は終了
cd "$(dirname $0)"
if [ ! -f "${VAGRANT_FILE_DIR_ABS}/Vagrantfile" ]; then
    echo "■ ERROR  対象ディレクトリに Vagrantfile がありません"
    echo "■ このスクリプトの場所：$(pwd)/"
    echo "■ 存在確認対象ファイル：${VAGRANT_FILE_DIR_ABS}/Vagrantfile"
    echo
    echo "■ 異常終了"
    date
    echo
    echo -n "続行するには Return キー を押してください . . ."
    read -s
    echo
    exit 1
fi

# Vagrantfile のあるディレクトリに移動
cd "${VAGRANT_FILE_DIR_ABS}/"



# BOX追加・仮想環境作成・起動
echo
echo "■ 追加前のBOXの一覧 [vagrant box list]"
vagrant box list
echo
echo "■ 起動前の仮想環境の状態 [vagrant status]"
vagrant status
echo
echo "■ BOXの追加と仮想環境の作成・起動を行います [vagrant up]"
vagrant up
rtn_cd=$?
if [ ${rtn_cd} -ne 0 ]; then
    echo "■ ERROR  仮想環境起動でエラーが発生しました"
    echo "■ 戻り値：${rtn_cd}"
    echo
    echo "■ 異常終了"
    date
    echo
    echo -n "続行するには Return キー を押してください . . ."
    read -s
    echo
    exit ${rtn_cd}
fi
echo
echo "■ 追加後のBOXの一覧 [vagrant box list]"
vagrant box list
echo
echo "■ 起動後の仮想環境の状態 [vagrant status]"
vagrant status



# 終了処理
echo
echo "■ 処理が完了しました"
echo
echo "■ 正常終了"
date
echo
echo -n "続行するには Return キー を押してください . . ."
read -s
echo
exit 0
