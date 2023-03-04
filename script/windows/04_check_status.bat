@echo off
@REM This file is written in 'Shift JIS'


@REM �萔�w�� -----------------------------------------------------------------------------------
@REM Vagrantfile �̂���f�B���N�g���̃p�X�𑊑΃p�X�Ŏw��i������ \ �͕s�v�j
set VAGRANT_FILE_DIR_ABS=..\..
@REM --------------------------------------------------------------------------------------------


@REM �I�v�V�����`�F�b�N
set askuser=true
if "%~1" == "/Y" (
    set askuser=false
)

@REM Vagrantfile ���Ώۃf�B���N�g���ɂȂ��ꍇ�͏I��
cd %~dp0
if not exist %VAGRANT_FILE_DIR_ABS%\Vagrantfile (
    echo �� ERROR  �Ώۃf�B���N�g���� Vagrantfile ������܂���
    echo �� ���̃X�N���v�g�̏ꏊ�F%CD%\
    echo �� ���݊m�F�Ώۃt�@�C���F%VAGRANT_FILE_DIR_ABS%\Vagrantfile
    echo.
    echo �� �ُ�I��
    echo %date% %time%
    echo.
    pause
    exit /b 1
)

@REM Vagrantfile �̂���f�B���N�g���Ɉړ�
cd %VAGRANT_FILE_DIR_ABS%\


@REM ���m�F
echo.
echo �� Vagrant ��Ԋm�F
echo.
echo.
echo �� �ǉ��O��BOX�̈ꗗ [vagrant box list]
vagrant box list
echo.
echo.
echo �� �N���O�̉��z���̏�� [vagrant status]
vagrant status
echo.
echo.
echo �� ���z�}�V���ꗗ [vagrant global-status]
vagrant global-status
echo.

@REM ���[�U�[�m�F�p���b�Z�[�W�\��
if "%askuser%" == "true" (
    pause
)

exit /b 0
