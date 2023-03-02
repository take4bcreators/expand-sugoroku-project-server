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


# 終了処理
date
echo "■ PostgreSQLのセットアップ 完了"
exit 0


# postgres ユーザで作成した DB にログインする
psql -d sgpjdb01 -U postgres


# root ユーザに切替
su -

# postgresql.conf を探す
find / -name 'postgresql.conf'

# postgresql.conf の情報確認
ls -l /etc/postgresql-setup/upgrade/postgresql.conf
ls -l /var/lib/pgsql/data/postgresql.conf
ls -l /usr/lib/tmpfiles.d/postgresql.conf


# postgresql.conf の内容確認
cat /etc/postgresql-setup/upgrade/postgresql.conf
cat /var/lib/pgsql/data/postgresql.conf
cat /usr/lib/tmpfiles.d/postgresql.conf


# postgresql.conf の内容変更
sed -i 's/#listen_addresses = 'localhost'/listen_addresses = '*'/' /etc/postgresql-setup/upgrade/postgresql.conf
sed -i 's/# port = 5432/port = 5432/' /etc/postgresql-setup/upgrade/postgresql.conf

sed -i 's/#listen_addresses = 'localhost'/listen_addresses = '*'/' /var/lib/pgsql/data/postgresql.conf
sed -i 's/# port = 5432/port = 5432/' /var/lib/pgsql/data/postgresql.conf

sed -i 's/#listen_addresses = 'localhost'/listen_addresses = '*'/' /usr/lib/tmpfiles.d/postgresql.conf
sed -i 's/# port = 5432/port = 5432/' /usr/lib/tmpfiles.d/postgresql.conf


# サービス再起動
systemctl restart postgresql


# サービス確認（activeになっていること）
systemctl status postgresql