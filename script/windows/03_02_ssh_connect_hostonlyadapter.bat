@echo off
@REM This file is written in 'Shift JIS'


@REM 定数指定 -----------------------------------------------------------------------------------
set CONNECT_USER=vagrant
set CONNECT_IP=192.168.60.10
set CONNECT_KEY=..\..\.vagrant\machines\default\virtualbox\private_key
@REM --------------------------------------------------------------------------------------------


cd %~dp0

@REM vagrant up でキーを再作成してSSH接続するとホスト認証がNGで接続できないので、
@REM known_hosts の情報を一旦削除する
ssh-keygen -R "%CONNECT_IP%"

@REM 鍵認証方式でSSH接続
@REM   known_hosts の情報を削除したことにより、
@REM   新規接続時の yes/no の確認が毎回表示されるので、
@REM   「-o StrictHostKeyChecking=no」で確認表示を行わないようにする
ssh "%CONNECT_USER%@%CONNECT_IP%" -i "%CONNECT_KEY%" -o StrictHostKeyChecking=no
