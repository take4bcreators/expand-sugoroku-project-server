@echo off
@REM This file is written in 'Shift JIS'


@REM �萔�w�� -----------------------------------------------------------------------------------
set CONNECT_USER=vagrant
set CONNECT_IP=127.0.0.1
set CONNECT_PORT=2222
set CONNECT_KEY=..\..\.vagrant\machines\default\virtualbox\private_key
@REM --------------------------------------------------------------------------------------------


cd %~dp0

@REM ���F�ؕ����� Teraterm ���J��
@REM  �ustart /b cmd /c �R�}���h�v �Ńo�b�N�O���E���h�N�������āA
@REM  ���̃o�b�`���̂̃E�B���h�E�͒����ɕ���悤�ɂ���
start /b cmd /c "C:\Program Files (x86)\teraterm\ttermpro.exe" %CONNECT_IP%:%CONNECT_PORT% /auth=publickey /user=%CONNECT_USER% /keyfile=%~dp0\%CONNECT_KEY%
