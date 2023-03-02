# expand-sugoroku-project-server
すごろく拡張ツールインフラ用リポジトリ

## 前提条件
- VirtualBox がインストールされていること
- Vagrant がインストールされていること

## 実行条件
- このリポジトリと同じレベルの階層に、メイン開発用リポジトリのフォルダ（expand-sugoroku-project-main）があること
- 次のファイルが存在すること（ない場合は Google Drive からダウンロードして配置する）
  - sync/env/provision.env


## Vagrant サーバ開始方法（作成→起動）
### Windows
- `script/windows/01_create_and_start.bat` をダブルクリックで実行する

### macOS
- `script/mac/01_create_and_start.command` をダブルクリックで実行する


## Vagrant サーバ停止方法（停止→削除）
### Windows
- `script/windows/02_stop_and_remove.bat` をダブルクリックで実行する

### macOS
- `script/mac/02_stop_and_remove.command` をダブルクリックで実行する


## 各フォルダについて
#### document
- 共有保管する書類を配置

#### provision
- Vagrant のプロビジョニングで使用するシェルなどを配置

#### script
- Vagrant の停止起動など、作業用のスクリプト類を配置

#### sync
- Vagrant の仮想サーバーに共有されるフォルダ
  
  ##### sync/env
  - プロビジョニング中などに使用される、環境固有の設定ファイルを配置

  ##### sync/provision
  - プロビジョニング中などに使用される、シェルやSQLなどを配置

  ##### sync/work
  - 作業用のディレクトリ。このフォルダ内に保存したファイルは Git 管理対象外となる

#### work
- 作業用のディレクトリ。このフォルダ内に保存したファイルは Git 管理対象外となる
- sync/work との違いは、仮想サーバーに同期されるか否か

