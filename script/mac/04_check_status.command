#!/bin/zsh
# Windows の GirBash で実行する場合は、bashコマンドの引数に指定する形で実行してください


# 定数指定 -----------------------------------------------------------------------------------
# Vagrantfile のあるディレクトリのパスを相対パスで指定（末尾の / は不要）
VAGRANT_FILE_DIR_ABS="../.."
# --------------------------------------------------------------------------------------------


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

# 情報確認
echo
echo "■ Vagrant 状態確認"
echo
echo
echo "■ BOX一覧 [vagrant box list]"
vagrant box list
echo
echo
echo "■ 仮想環境の状態 [vagrant status]"
vagrant status
echo
echo
echo "■ 仮想マシン一覧 [vagrant global-status]"
vagrant global-status
echo

# ユーザー確認用メッセージ表示
if [ "${askuser}" = "true" ]; then
    echo
    echo -n "続行するには Return キー を押してください . . ."
    read -s
    echo
fi

exit 0
