#! /bin/sh

install_dir="/usr/local/bin"

install_script() {
  echo "install -> $1"
  cp -f "./bin/$1" "$install_dir/$1"
  chmod 755 "$install_dir/$1"
}

install_script "eshook-common.sh"
install_script "eshook-posttopic.sh"
install_script "git-mktopic"
install_script "git-endtopic"
install_script "git-mksubtopic"
install_script "git-endsubtopic"
