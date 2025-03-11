#!/bin/bash

# プロジェクト名を引数として受け取る
name=$1

# プロジェクト名が指定されているか確認
if [ -z "$name" ]; then
    echo "Usage: ./init.sh <project-name>"
    exit 1
fi

# ビルド成果物のクリーンアップ
rm -rf dist
rm -f .clasp.json

# プロジェクトの依存関係をインストール
pnpm install

# Google Apps Scriptにログイン
npx clasp login

# 新しいGoogle Apps Scriptプロジェクトを作成
npx clasp create --type standalone --title "$name"

# デプロイメント用にclaspのdistディレクトリを設定
jq '.rootDir = "dist"' .clasp.json > tmp.$$.json && mv tmp.$$.json .clasp.json
