@echo off
@REM This file is written in 'Shift JIS'


@REM 定数指定 -----------------------------------------------------------------------------------
@REM Vagrantfile のあるディレクトリのパスを相対パスで指定（末尾の \ は不要）
set VAGRANT_FILE_DIR_ABS=..\..
@REM ボックスの名前を指定（※ Vagrantfile にも同じ名前を指定する）
set REMOVE_BOX_NAME=sgpjbox
@REM --------------------------------------------------------------------------------------------


@REM 実行確認用メッセージ表示
echo.
echo ■ Vagrant 停止用スクリプト
echo.
echo ・中止する場合はこのままウィンドウを閉じてください。
echo.
pause


@REM 開始処理
echo.
echo ■ 処理開始
echo %date% %time%


@REM 変数が設定されていない場合は終了
if not defined REMOVE_BOX_NAME (
    echo ■ ERROR  変数 REMOVE_BOX_NAME が設定されていません
    echo.
    echo ■ 異常終了
    echo %date% %time%
    echo.
    pause
    exit /b 1
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



@REM 仮想環境停止
echo.
echo ■ 停止前の仮想環境の状態 [vagrant status]
vagrant status
echo.
echo ■ 仮想環境を停止します [vagrant halt]
vagrant halt
set rtn_cd=%errorlevel%
echo %rtn_cd%
if %rtn_cd% neq 0 (
    echo ■ ERROR  仮想環境停止でエラーが発生しました
    echo ■ 戻り値： %rtn_cd%
    echo.
    echo ■ 異常終了
    echo %date% %time%
    echo.
    pause
    exit /b %rtn_cd%
)
echo.
echo ■ 停止後の仮想環境の状態 [vagrant status]
vagrant status



@REM BOX削除
echo.
echo ■ 削除前のBOXの一覧 [vagrant box list]
vagrant box list
echo.
echo ■ BOXを削除します [vagrant box remove]
vagrant box remove %REMOVE_BOX_NAME% --force
if %rtn_cd% neq 0 (
    echo ■ ERROR  BOX削除でエラーが発生しました
    echo ■ 戻り値： %rtn_cd%
    echo.
    echo ■ 異常終了
    echo %date% %time%
    echo.
    pause
    exit /b %rtn_cd%
)
echo.
echo ■ 削除後のBOXの一覧 [vagrant box list]
vagrant box list



@REM 仮想マシン削除
echo.
echo ■ 削除前の仮想マシンの一覧 [vagrant global-status]
vagrant global-status
echo.
echo ■ 仮想マシンを削除します [vagrant destroy]
vagrant destroy --force
if %rtn_cd% neq 0 (
    echo ■ ERROR  仮想マシン削除でエラーが発生しました
    echo ■ 戻り値： %rtn_cd%
    echo.
    echo ■ 異常終了
    echo %date% %time%
    echo.
    pause
    exit /b %rtn_cd%
)
echo.
echo ■ 削除後の仮想マシンの一覧 [vagrant global-status]
vagrant global-status



@REM 終了処理
echo.
echo ■ 処理が完了しました
echo.
echo ■ 正常終了
echo %date% %time%
echo.
pause
exit /b 0
