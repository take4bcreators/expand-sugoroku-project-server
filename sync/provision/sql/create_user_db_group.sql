
-- 開始メッセージ
\echo '======= ユーザー・データベース・グループ作成SQL開始 ======='
\! date


-- ユーザ作成・ロール付与（sugoroku）
CREATE USER sugoroku;
ALTER ROLE sugoroku CREATEROLE CREATEDB LOGIN;

-- ユーザ作成・ロール付与（storage）
CREATE USER storage;
ALTER ROLE storage CREATEROLE CREATEDB LOGIN;

\echo '======= ユーザー作成後の状態 ======='
\du
\echo '===================================='


-- ユーザのパスワードを設定
-- @remind 暫定
ALTER ROLE postgres WITH PASSWORD 'pass';
ALTER ROLE sugoroku WITH PASSWORD 'pass';
ALTER ROLE storage WITH PASSWORD 'pass';


-- データベース作成
CREATE DATABASE sgpjdb01;

\echo '======= データベース作成後の状態 ======='
\l
\echo '========================================'


-- グループ作成
CREATE GROUP sugorokugrp;

-- テーブルへの権限をグループに追加
GRANT ALL ON DATABASE sgpjdb01 TO sugorokugrp;

-- グループにユーザを追加
ALTER GROUP sugorokugrp ADD USER sugoroku;
ALTER GROUP sugorokugrp ADD USER storage;


-- 終了メッセージ
\echo '======= ユーザー・データベース・グループ作成SQL完了 ======='
\! date
