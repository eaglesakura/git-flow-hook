#! /bin/sh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/eaglesakura/git-flow-hook/develop/installer/install-hooks-dev.sh)"
install_dir=".git/hooks"
branch="develop"

if [ -e "$install_dir"]; then
  echo "install dir -> $install_dir"
else
  echo "$install_dir :  directory not found"
  exit 1
fi

install_script() {
  echo "install -> $1"
  wget -O "$install_dir/$1" "https://raw.githubusercontent.com/eaglesakura/git-flow-hook/${branch}/hooks/$1"
  chmod 755 "$install_dir/$1"
}

install_script "common.sh"
install_script "commit-msg"
install_script "pre-commit"
install_script "update"
