@echo off
@REM This file is written in 'Shift JIS'


@REM 定数指定 -----------------------------------------------------------------------------------
@REM Vagrantfile のあるディレクトリのパスを相対パスで指定（末尾の \ は不要）
set VAGRANT_FILE_DIR_ABS=..\..
@REM --------------------------------------------------------------------------------------------


@REM オプションチェック
set askuser=true
if "%~1" == "/Y" (
    set askuser=false
)

@REM Vagrantfile が対象ディレクトリにない場合は終了
cd %~dp0
if not exist %VAGRANT_FILE_DIR_ABS%\Vagrantfile (
    echo ■ ERROR  対象ディレクトリに Vagrantfile がありません
    echo ■ このスクリプトの場所：%CD%\
    echo ■ 存在確認対象ファイル：%VAGRANT_FILE_DIR_ABS%\Vagrantfile
    echo.
    echo ■ 異常終了
    echo %date% %time%
    echo.
    pause
    exit /b 1
)

@REM Vagrantfile のあるディレクトリに移動
cd %VAGRANT_FILE_DIR_ABS%\


@REM 情報確認
echo.
echo ■ Vagrant 状態確認
echo.
echo.
echo ■ 追加前のBOXの一覧 [vagrant box list]
vagrant box list
echo.
echo.
echo ■ 起動前の仮想環境の状態 [vagrant status]
vagrant status
echo.
echo.
echo ■ 仮想マシン一覧 [vagrant global-status]
vagrant global-status
echo.

@REM ユーザー確認用メッセージ表示
if "%askuser%" == "true" (
    pause
)

exit /b 0
