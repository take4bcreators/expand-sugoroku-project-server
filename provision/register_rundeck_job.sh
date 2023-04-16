#!/bin/bash

project_batch_root="/mnt/project/expand-sugoroku-project-batch"
register_rundeck_dir="provision/register_rundeck"


exec_shell="01_register_rundeck_job_unit.sh"
if [ -f "${project_batch_root}/${register_rundeck_dir}/${exec_shell}" ]; then
    ${project_batch_root}/${register_rundeck_dir}/${exec_shell}
else
    echo "${project_batch_root}/${register_rundeck_dir}/${exec_shell} が存在しません。スキップします"
fi

exec_shell="02_register_rundeck_job_group.sh"
if [ -f "${project_batch_root}/${register_rundeck_dir}/${exec_shell}" ]; then
    ${project_batch_root}/${register_rundeck_dir}/${exec_shell}
else
    echo "${project_batch_root}/${register_rundeck_dir}/${exec_shell} が存在しません。スキップします"
fi

exec_shell="03_register_rundeck_job_main.sh"
if [ -f "${project_batch_root}/${register_rundeck_dir}/${exec_shell}" ]; then
    ${project_batch_root}/${register_rundeck_dir}/${exec_shell}
else
    echo "${project_batch_root}/${register_rundeck_dir}/${exec_shell} が存在しません。スキップします"
fi

exit 0
