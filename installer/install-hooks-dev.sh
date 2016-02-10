#! /bin/sh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/eaglesakura/git-flow-hook/develop/installer/install-hooks-dev.sh)"
branch="develop"

if [ -e .git/HEAD ]; then
  echo "install hook-scripts"
else
  echo ".git directory not found"
  exit 1
fi

#! /bin/sh
install_dir=".git/hooks"
branch="master"

install_script() {
  echo "install -> $1"
  wget -O "$install_dir/$1" "https://raw.githubusercontent.com/eaglesakura/git-flow-hook/${branch}/hooks/$1"
  chmod 755 "$install_dir/$1"
}

install_script "common.sh"
install_script "commit-msg"
install_script "pre-commit"
install_script "update"
