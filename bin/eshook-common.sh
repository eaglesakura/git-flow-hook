# developブランチ名を指定する
# git-flow標準に従い、developとする
export develop_branch="develop"


# ブランチ名を取得して、$branch_nameに格納する
read_branchname()
{
  if[ -e ./.git/HEAD ]; then
    echo "read branchname"
  else
    echo ".git directory not found..."
    exit 1
  fi

  read branch_name < ./.git/HEAD
  echo $branch_name | sed -e "s/ref: refs\/heads\///">.branchname.txt
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

# ビルドを行なって、失敗したらスクリプトの実行を終了する
assert_build_success()
{
  if [ -f ./build ]; then
    ./build
    if [ $? -ne 0 ]; then
      exit 1
    fi
  else
    echo "build script not exist..."
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
