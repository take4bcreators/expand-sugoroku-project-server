@echo off
@REM This file is written in 'Shift JIS'


@REM �萔�w�� -----------------------------------------------------------------------------------
@REM Vagrantfile �̂���f�B���N�g���̃p�X�𑊑΃p�X�Ŏw��i������ \ �͕s�v�j
set VAGRANT_FILE_DIR_ABS=..\..
@REM �{�b�N�X�̖��O���w��i�� Vagrantfile �ɂ��������O���w�肷��j
set REMOVE_BOX_NAME=sgpjbox
@REM --------------------------------------------------------------------------------------------


@REM ���s�m�F�p���b�Z�[�W�\��
echo.
echo �� Vagrant ��~�p�X�N���v�g
echo.
echo �E���~����ꍇ�͂��̂܂܃E�B���h�E����Ă��������B
echo.
pause


@REM �J�n����
echo.
echo �� �����J�n
echo %date% %time%


@REM �ϐ����ݒ肳��Ă��Ȃ��ꍇ�͏I��
if not defined REMOVE_BOX_NAME (
    echo �� ERROR  �ϐ� REMOVE_BOX_NAME ���ݒ肳��Ă��܂���
    echo.
    echo �� �ُ�I��
    echo %date% %time%
    echo.
    pause
    exit /b 1
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



@REM ���z����~
echo.
echo �� ��~�O�̉��z���̏�� [vagrant status]
vagrant status
echo.
echo �� ���z�����~���܂� [vagrant halt]
vagrant halt
set rtn_cd=%errorlevel%
echo %rtn_cd%
if %rtn_cd% neq 0 (
    echo �� ERROR  ���z����~�ŃG���[���������܂���
    echo �� �߂�l�F %rtn_cd%
    echo.
    echo �� �ُ�I��
    echo %date% %time%
    echo.
    pause
    exit /b %rtn_cd%
)
echo.
echo �� ��~��̉��z���̏�� [vagrant status]
vagrant status



@REM BOX�폜
echo.
echo �� �폜�O��BOX�̈ꗗ [vagrant box list]
vagrant box list
echo.
echo �� BOX���폜���܂� [vagrant box remove]
vagrant box remove %REMOVE_BOX_NAME% --force
if %rtn_cd% neq 0 (
    echo �� ERROR  BOX�폜�ŃG���[���������܂���
    echo �� �߂�l�F %rtn_cd%
    echo.
    echo �� �ُ�I��
    echo %date% %time%
    echo.
    pause
    exit /b %rtn_cd%
)
echo.
echo �� �폜���BOX�̈ꗗ [vagrant box list]
vagrant box list



@REM ���z�}�V���폜
echo.
echo �� �폜�O�̉��z�}�V���̈ꗗ [vagrant global-status]
vagrant global-status
echo.
echo �� ���z�}�V�����폜���܂� [vagrant destroy]
vagrant destroy --force
if %rtn_cd% neq 0 (
    echo �� ERROR  ���z�}�V���폜�ŃG���[���������܂���
    echo �� �߂�l�F %rtn_cd%
    echo.
    echo �� �ُ�I��
    echo %date% %time%
    echo.
    pause
    exit /b %rtn_cd%
)
echo.
echo �� �폜��̉��z�}�V���̈ꗗ [vagrant global-status]
vagrant global-status



@REM �I������
echo.
echo �� �������������܂���
echo.
echo �� ����I��
echo %date% %time%
echo.
pause
exit /b 0
