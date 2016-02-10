# developブランチ名を指定する
# git-flow標準に従い、developとする
export develop_branch="develop"


# ブランチ名を取得して、$branch_nameに格納する
read_branchname()
{
  git rev-parse --abbrev-ref @ > .branchname.txt
  read branch_name < .branchname.txt
  rm .branchname.txt
}

# ユーザーに作業を行うか確認を行う
assert_user_enter()
{
  echo "Y/n ?"
  read INPUT
  if [ $INPUT != "Y" ]; then
    echo "command abort..."
    exit 1
  fi
}

# ユーザーに作業を行うか確認を行う
# assert_user_enter_or_revert  revert_branch_name delete_branch_name
assert_user_enter_or_revert()
{
  echo "Y/n ?"
  read INPUT
  if [ $INPUT != "Y" ]; then
    echo "revert branch"
    git checkout -f $1
    git branch -D $2
    git clean -f .
    exit 1
  fi
}

# 直前の実行が失敗した場合スクリプトを終了する
assert_true()
{
  if [ $? -ne 0 ]; then
    echo "command fail..."
    exit 1
  fi
}
