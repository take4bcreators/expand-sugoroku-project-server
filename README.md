# expand-sugoroku-project-server
すごろく拡張ツールインフラ用リポジトリ

## 前提条件
- VirtualBox がインストールされていること
- Vagrant がインストールされていること

## 実行条件
- このリポジトリと同じレベルの階層にメイン開発用リポジトリのフォルダがあること
- 次のファイルが存在すること（ない場合は Google Drive からダウンロードして配置する）
  - sync/env/provision.env

## Vagrant サーバ作成・開始方法
### Windows
- script/windows/01_create_and_start.bat を実行する

### macOS
- script/mac/01_create_and_start.command を実行する


## Vagrant サーバ停止・削除方法
### Windows
- script/windows/02_stop_and_remove.bat を実行する

### macOS
- script/mac/02_stop_and_remove.command を実行する

