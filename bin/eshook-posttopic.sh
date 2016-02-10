#! /bin/sh
source eshook-common.sh
source eshook-repoinfo.sh

# ブランチ名を取得
read_branchname

# コミットし忘れ防止
git commit -a -m "close this topic"

# マージする？
echo "merge $branch_name -> $develop_branch ?"
assert_user_enter

# 開発ブランチに移動
git checkout -f $develop_branch
assert_true
git merge $branch_name
assert_true

# ビルド検証が成功したら、元のブランチに戻す
assert_build_success
git branch -d $branch_name
