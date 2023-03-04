@echo off
@REM This file is written in 'Shift JIS'


@REM 定数指定 -----------------------------------------------------------------------------------
@REM Vagrantfile のあるディレクトリのパスを相対パスで指定（末尾の \ は不要）
set VAGRANT_FILE_DIR_ABS=..\..
@REM --------------------------------------------------------------------------------------------


@REM 実行確認用メッセージ表示
echo.
echo ■ Vagrant 起動用スクリプト
echo.
echo ・中止する場合はこのままウィンドウを閉じてください。
echo.
pause


@REM 開始処理
echo.
echo ■ 処理開始
echo %date% %time%

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



@REM BOX追加・仮想環境作成・起動
echo.
echo ■ 追加前のBOXの一覧 [vagrant box list]
vagrant box list
echo.
echo ■ 起動前の仮想環境の状態 [vagrant status]
vagrant status
echo.
echo ■ BOXの追加と仮想環境の作成・起動を行います [vagrant up]
vagrant up
set rtn_cd=%errorlevel%
echo %rtn_cd%
if %rtn_cd% neq 0 (
    echo ■ ERROR  仮想環境起動でエラーが発生しました
    echo ■ 戻り値： %rtn_cd%
    echo.
    echo ■ 異常終了
    echo %date% %time%
    echo.
    pause
    exit /b %rtn_cd%
)
echo.
echo ■ 追加後のBOXの一覧 [vagrant box list]
vagrant box list
echo.
echo ■ 起動後の仮想環境の状態 [vagrant status]
vagrant status



@REM 終了処理
echo.
echo ■ 処理が完了しました
echo.
echo ■ 正常終了
echo %date% %time%
echo.
pause
exit /b 0
