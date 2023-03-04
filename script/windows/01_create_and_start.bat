@echo off
@REM This file is written in 'Shift JIS'


@REM �萔�w�� -----------------------------------------------------------------------------------
@REM Vagrantfile �̂���f�B���N�g���̃p�X�𑊑΃p�X�Ŏw��i������ \ �͕s�v�j
set VAGRANT_FILE_DIR_ABS=..\..
@REM --------------------------------------------------------------------------------------------


@REM ���s�m�F�p���b�Z�[�W�\��
echo.
echo �� Vagrant �N���p�X�N���v�g
echo.
echo �E���~����ꍇ�͂��̂܂܃E�B���h�E����Ă��������B
echo.
pause


@REM �J�n����
echo.
echo �� �����J�n
echo %date% %time%

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



@REM BOX�ǉ��E���z���쐬�E�N��
echo.
echo �� �ǉ��O��BOX�̈ꗗ [vagrant box list]
vagrant box list
echo.
echo �� �N���O�̉��z���̏�� [vagrant status]
vagrant status
echo.
echo �� BOX�̒ǉ��Ɖ��z���̍쐬�E�N�����s���܂� [vagrant up]
vagrant up
set rtn_cd=%errorlevel%
echo %rtn_cd%
if %rtn_cd% neq 0 (
    echo �� ERROR  ���z���N���ŃG���[���������܂���
    echo �� �߂�l�F %rtn_cd%
    echo.
    echo �� �ُ�I��
    echo %date% %time%
    echo.
    pause
    exit /b %rtn_cd%
)
echo.
echo �� �ǉ����BOX�̈ꗗ [vagrant box list]
vagrant box list
echo.
echo �� �N����̉��z���̏�� [vagrant status]
vagrant status



@REM �I������
echo.
echo �� �������������܂���
echo.
echo �� ����I��
echo %date% %time%
echo.
pause
exit /b 0
