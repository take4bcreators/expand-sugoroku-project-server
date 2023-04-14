#!/bin/bash

# yumリポジトリの追加（現在は18が最新？）
# 「https://github.com/nodejs/Release#nodejs-release-working-group」の「LTS」のバージョンを指定する
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -

# Node.jsのインストール（★yumではなくdnfで行う）
dnf install -y nodejs

# yarn のインストール（★追加）
npm install -g yarn

# インストール（npmではなくyarnで行う）
yarn global add gatsby-cli

# Puppeteerインストール（HTML→PDF変換用のモジュール）
yarn global add puppeteer


exit 0
