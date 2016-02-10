#! /bin/sh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/eaglesakura/git-flow-hook/develop/installer/install-commands-dev.sh)"
install_dir="/usr/local/bin"
branch="develop"

install_script() {
  echo "install -> $1"
  wget -O "$install_dir/$1" "https://raw.githubusercontent.com/eaglesakura/git-flow-hook/${branch}/bin/$1"
  chmod 755 "$install_dir/$1"
}

install_script "eshook-common.sh"
install_script "eshook-posttopic.sh"
install_script "git-mktopic"
install_script "git-endtopic"
install_script "git-mksubtopic"
install_script "git-endsubtopic"
