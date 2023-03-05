\echo '======= スキーマの作成======='
\! date

--スキーマの作成
CREATE SCHEMA prd;
CREATE SCHEMA dev;
CREATE SCHEMA work;


-- オブジェクトへのアクセス権限を付与する
GRANT USAGE ON SCHEMA prd TO sugorokugrp;
GRANT USAGE ON SCHEMA dev TO sugorokugrp;
GRANT USAGE ON SCHEMA work TO sugorokugrp;


-- CREATE TABLE などのオブジェクト作成権限を与える
GRANT CREATE ON SCHEMA prd TO sugorokugrp;
GRANT CREATE ON SCHEMA dev TO sugorokugrp;
GRANT CREATE ON SCHEMA work TO sugorokugrp;


-- 終了メッセージ
\echo '======= スキーマの作成======='
\! date
