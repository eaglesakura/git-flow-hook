#! /bin/sh

install_dir="/user/local/bin"

install_script() {
  echo "install -> $1"
  wget -O "$install_dir/$1" "https://raw.githubusercontent.com/eaglesakura/git-flow-hook/master/bin/$1"
  chmod 755 "$install_dir/$1"
}

install_script "eshook-common.sh"
install_script "eshook-posttopic.sh"
install_script "git-mktopic"
install_script "git-endtopic"
install_script "git-mksubtopic"
install_script "git-endsubtopic"
