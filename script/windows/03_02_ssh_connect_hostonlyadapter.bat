@echo off
@REM This file is written in 'Shift JIS'


@REM �萔�w�� -----------------------------------------------------------------------------------
set CONNECT_USER=vagrant
set CONNECT_IP=192.168.60.10
set CONNECT_KEY=..\..\.vagrant\machines\default\virtualbox\private_key
@REM --------------------------------------------------------------------------------------------


cd %~dp0

@REM vagrant up �ŃL�[���č쐬����SSH�ڑ�����ƃz�X�g�F�؂�NG�Őڑ��ł��Ȃ��̂ŁA
@REM known_hosts �̏�����U�폜����
ssh-keygen -R "%CONNECT_IP%"

@REM ���F�ؕ�����SSH�ڑ�
@REM   known_hosts �̏����폜�������Ƃɂ��A
@REM   �V�K�ڑ����� yes/no �̊m�F������\�������̂ŁA
@REM   �u-o StrictHostKeyChecking=no�v�Ŋm�F�\�����s��Ȃ��悤�ɂ���
ssh "%CONNECT_USER%@%CONNECT_IP%" -i "%CONNECT_KEY%" -o StrictHostKeyChecking=no
