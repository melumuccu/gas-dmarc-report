# 実際のファイルを表さないターゲットを定義
.PHONY: init git-init

# GASプロジェクトテンプレートを使用して新しいGitHubリポジトリを初期化
# 使用方法: make git-init name=gas-your-project-name
git-init:
	@./scripts/git-init.sh $(name)

# Google Apps Scriptプロジェクトの初期化
# 使用方法: make init name=your-project-name
gas-init:
	@./scripts/gas-init.sh $(name)
