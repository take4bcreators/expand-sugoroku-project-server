#!/bin/bash

# 設定値指定
export SERVER_SYNC_DIR="/mnt/sync"
export PROVISION_SQL_DIR="${SERVER_SYNC_DIR}/provision/sql"
export PROVISION_SQL_NAME="create_user_db_group.sql"



# 開始処理
echo "■ PostgreSQLのセットアップ 開始"
date


# PostgreSQL のインストール
dnf -y install postgresql-server

# インストール後バージョン確認
echo "======= psql追加後の状態 ======="
psql --version
echo "================================"


# DBの初期化
# postgresql-setup initdb
postgresql-setup --initdb --unit postgresql

# サービス自動起動有効化
systemctl enable postgresql.service

# サービスの開始
systemctl start postgresql.service

# サービスの起動確認
echo "======= postgresqlサービスの状態 ======="
systemctl status postgresql
echo "========================================"

sleep 10

echo "======= postgresqlサービスの状態 ======="
systemctl status postgresql
echo "========================================"


# postgres ユーザで SQL実行
sudo -i -u postgres psql -f "${PROVISION_SQL_DIR}/create_user_db_group.sql"

# postgresql.conf の内容変更
sed -i -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" -e 's/^#port/port/' /var/lib/pgsql/data/postgresql.conf

# pg_hba.conf の内容変更
sed -i 's/\(local *all *all *\)peer/\1md5/' /var/lib/pgsql/data/pg_hba.conf
sed -i 's/\(host *all *all.* *\)ident/\1md5/' /var/lib/pgsql/data/pg_hba.conf

# サービス再起動
systemctl restart postgresql

# サービス確認（activeになっていること）
systemctl status postgresql


#パスワード無しログインの設定
# .pgpass の追加
echo -e "localhost:5432:sgpjdb01:sugoroku:pass\nlocalhost:5432:sgpjdb01:storage:pass" > ~sugoroku/.pgpass

# パーミッション変更
chmod 600 ~sugoroku/.pgpass

# パーミッションオーナー変更
chown sugoroku:sugoroku ~sugoroku/.pgpass


# 終了処理
date
echo "■ PostgreSQLのセットアップ 完了"

exit 0
