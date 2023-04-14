#!/bin/bash

project_name="expand-sugoroku-project"
project_detail="すごろく拡張プロジェクトジョブ実行用"
rd projects create -p "${project_name}" -- --project.description="${project_detail}"

exit 0
