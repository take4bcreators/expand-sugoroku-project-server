@echo off
@REM This file is written in 'Shift JIS'


@REM 定数指定 -----------------------------------------------------------------------------------
set CONNECT_USER=vagrant
set CONNECT_IP=192.168.60.10
set CONNECT_KEY=..\..\.vagrant\machines\default\virtualbox\private_key
@REM --------------------------------------------------------------------------------------------


cd %~dp0

@REM 鍵認証方式で Teraterm を開く
@REM  「start /b cmd /c コマンド」 でバックグラウンド起動させて、
@REM  このバッチ自体のウィンドウは直ぐに閉じるようにする
start /b cmd /c "C:\Program Files (x86)\teraterm\ttermpro.exe" %CONNECT_IP% /auth=publickey /user=%CONNECT_USER% /keyfile=%~dp0\%CONNECT_KEY%
