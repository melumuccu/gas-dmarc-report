# GAS Template Project

Google Apps Script（GAS）プロジェクトのTypeScriptテンプレートです。

## 前提条件

- Node.js
- pnpm
- Google アカウント
- Google Apps Script API（要有効化）
- GitHub CLI (gh)

## セットアップ手順

1. 新しいプロジェクトの作成

```bash
# テンプレートを新しいディレクトリにクローン（履歴を除外）
git clone --depth 1 https://github.com/melumuccu/gas-template.git gas-${pj-name}

# Git履歴を初期化
rm -rf .git && git init

# 初回コミット
git add . && git commit -m "Initial commit"
```

2. GitHubリポジトリの作成

```bash
# 新しいプライベートリポジトリを作成
gh repo create gas-${pj-name} --private --source . --push
```

3. GASプロジェクトの初期化

```bash
make init name="gas-${pj-name}"
```

## プロジェクト構成

```
.
├── dist/              # ビルド出力ディレクトリ
│   └── main.js       # ビルドされたJavaScript
├── src/              # ソースコードディレクトリ
│   ├── appsscript.json   # GAS設定ファイル
│   ├── App.ts       # メイン処理
│   └── main.ts      # エントリーポイント
├── .clasp.json      # clasp設定ファイル
├── .gitignore       # Git除外設定
├── Makefile         # 初期化スクリプト
├── esbuild.js       # ビルド設定
├── package.json     # プロジェクト設定
└── tsconfig.json    # TypeScript設定
```

## 開発手順

1. コードの編集

   - src/App.tsにメインの処理を実装
   - `App`関数がエントリーポイントとなります

2. デプロイ

   ```bash
   pnpm run deploy
   ```

3. スクリプトエディタを開く
   ```bash
   pnpm run open
   ```

## ファイル構成のカスタマイズ例

```
src/
├── config/        # 設定ファイル
│   └── settings.ts
├── lib/          # ユーティリティ関数
│   └── gasProcessMethod.ts
├── types/        # 型定義
│   └── types.ts
├── App.ts        # メイン処理
└── main.ts       # エントリーポイント
```

## 注意事項

- `.clasp.json`には認証情報が含まれるため、Gitリポジトリにコミットしないでください
- `dist/`ディレクトリは自動生成されるため、直接編集しないでください
- Google Apps Script APIが有効化されていないと、claspコマンドが使用できません
- テンプレートからの新規プロジェクト作成時は、必ず新しいGitリポジトリとして初期化してください
