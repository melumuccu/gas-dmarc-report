#!/bin/bash

# プロジェクト名を引数として受け取る
name=$1

# プロジェクト名が指定されているか確認
if [ -z "$name" ]; then
    echo "Usage: ./git-init.sh <project-name>"
    exit 1
fi

# プロジェクト名が'gas-'で始まることを確認
if [[ ! "$name" =~ ^gas- ]]; then
    echo "Error: Project name must start with 'gas-'"
    exit 1
fi

# プロジェクトディレクトリが既に存在するか確認
if [ -d "../$name" ]; then
    echo "Error: Directory '../$name' already exists"
    exit 1
fi

# 新規プロジェクトの作成
echo "Creating new project: $name"
cd .. && git clone --depth 1 https://github.com/melumuccu/gas-template.git "$name"
cd "$name" || exit 1

# Gitの初期化
rm -rf .git && git init

# 初回コミット
git add . && git commit -m "Initial commit"

# gas-init.sh を実行
./scripts/gas-init.sh "$name"

# 新しいプライベートリポジトリを作成するコマンドを叩くかどうか尋ねる
echo "新しいプライベートリポジトリを作成しますか？ (y/n)"
read -r answer
if [ "$answer" = "y" ]; then
    gh repo create "$name" --private --source . --push
else
    echo "新しいプライベートリポジトリを作成するには以下のコマンドを実行してください:"
    echo "gh repo create "$name" --private --source . --push"
fi

# VScode で開く
code .
cd ../gas-template || exit 1
