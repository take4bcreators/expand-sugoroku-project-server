-- 既存のテーブルに権限を付与する
GRANT ALL ON ALL TABLES IN SCHEMA prd TO sugorokugrp;
GRANT ALL ON ALL TABLES IN SCHEMA dev TO sugorokugrp;
GRANT ALL ON ALL TABLES IN SCHEMA work TO sugorokugrp;
GRANT ALL ON ALL SEQUENCES IN SCHEMA prd TO sugorokugrp;
GRANT ALL ON ALL SEQUENCES IN SCHEMA dev TO sugorokugrp;
GRANT ALL ON ALL SEQUENCES IN SCHEMA work TO sugorokugrp;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA prd TO sugorokugrp;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA dev TO sugorokugrp;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA work TO sugorokugrp;

-- 今後作成される テーブル へのデフォルト権限を設定する （ユーザごとに行う）
-- ここでは TRUNCATE 権限を与えないように、ALL ではなく個別に権限を指定する
ALTER DEFAULT PRIVILEGES GRANT ALL ON TABLES TO sugorokugrp;

