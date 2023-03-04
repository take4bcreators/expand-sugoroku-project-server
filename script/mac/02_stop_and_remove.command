#!/bin/zsh
# Windows の GirBash で実行する場合は、bashコマンドの引数に指定する形で実行してください


# 定数指定 -----------------------------------------------------------------------------------
# Vagrantfile のあるディレクトリのパスを相対パスで指定（末尾の / は不要）
VAGRANT_FILE_DIR_ABS="../.."
# ボックスの名前を指定（※ Vagrantfile にも同じ名前を指定する）
REMOVE_BOX_NAME="sgpjbox"
# --------------------------------------------------------------------------------------------


# 開始メッセージ
echo
echo "■ Vagrant 停止用スクリプト"
echo

# オプションチェック
askuser="true"
while getopts y option; do
    case "${option}" in
        y)
            askuser="false"
            ;;
        \?)
            echo "Usage: $0 [-y]" 1>&2
            exit 1
            ;;
    esac
done

# ユーザー確認用メッセージ表示
if [ "${askuser}" = "true" ]; then
    echo "・中止する場合はこのままウィンドウを閉じてください。"
    echo
    echo -n "続行するには Return キー を押してください . . ."
    read -s
    echo
fi


# 開始処理
echo
echo "■ 処理開始"
date

# 変数が設定されていない場合は終了
if [ -z "${REMOVE_BOX_NAME}" ]; then
    echo "■ ERROR  変数 REMOVE_BOX_NAME が設定されていません"
    echo
    echo "■ 異常終了"
    date
    echo
    echo -n "続行するには Return キー を押してください . . ."
    read -s
    echo
    exit 1
fi

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



# 仮想環境停止
echo
echo "■ 停止前の仮想環境の状態 [vagrant status]"
vagrant status
echo
echo "■ 仮想環境を停止します [vagrant halt]"
vagrant halt
rtn_cd=$?
if [ ${rtn_cd} -ne 0 ]; then
    echo "■ ERROR  仮想環境停止でエラーが発生しました"
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
echo "■ 停止後の仮想環境の状態 [vagrant status]"
vagrant status



# BOX削除
echo
echo "■ 削除前のBOXの一覧 [vagrant box list]"
vagrant box list
echo
echo "■ BOXを削除します [vagrant box remove]"
vagrant box remove "${REMOVE_BOX_NAME}" --force
rtn_cd=$?
if [ ${rtn_cd} -ne 0 ]; then
    echo "■ ERROR  BOX削除でエラーが発生しました"
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
echo "■ 削除後のBOXの一覧 [vagrant box list]"
vagrant box list



# 仮想マシン削除
echo
echo "■ 削除前の仮想マシンの一覧 [vagrant global-status]"
vagrant global-status
echo
echo "■ 仮想マシンを削除します [vagrant destroy]"
vagrant destroy --force
rtn_cd=$?
if [ ${rtn_cd} -ne 0 ]; then
    echo "■ ERROR  仮想マシン削除でエラーが発生しました"
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
echo "■ 削除後の仮想マシンの一覧 [vagrant global-status]"
vagrant global-status



# 終了処理
echo
echo "■ 処理が完了しました"
echo
echo "■ 正常終了"
date

# ユーザー確認用メッセージ表示
if [ "${askuser}" = "true" ]; then
    echo
    echo -n "続行するには Return キー を押してください . . ."
    read -s
    echo
fi

exit 0
