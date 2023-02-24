#!/bin/zsh

# 定数指定 -----------------------------------------------------------------------------------
CONNECT_USER="vagrant"
CONNECT_IP="192.168.60.10"
CONNECT_KEY="../../.vagrant/machines/default/virtualbox/private_key"
# --------------------------------------------------------------------------------------------


cd "$(dirname $0)"

# vagrant up でキーを再作成してSSH接続するとホスト認証がNGで接続できないので、
# known_hosts の情報を一旦削除する
ssh-keygen -R "${CONNECT_IP}"

# 鍵認証方式でSSH接続
#   known_hosts の情報を削除したことにより、
#   新規接続時の yes/no の確認が毎回表示されるので、
#   「-o StrictHostKeyChecking=no」で確認表示を行わないようにする
ssh "${CONNECT_USER}@${CONNECT_IP}" -i "${CONNECT_KEY}" -o StrictHostKeyChecking=no
