#!/usr/bin/env bash

echo "1 - Instalando pacotes básicos iniciais"
sudo aptitude install ruby rdoc irb git

echo "2 - Baixando RubyGems no diretório ~/tools/"
mkdir -p ~/tools
cd ~/tools
wget http://production.cf.rubygems.org/rubygems/rubygems-2.2.2.tgz

echo "3 - Extraindo o pacote RubyGems"
tar xzf rubygems-2.2.2.tgz

echo "4 - Instalando o RubyGems"
cd rubygems-2.2.2
sudo ruby setup.rb all

echo "5 - Instalando o homesick"
sudo gem install homesick

echo "6 - Clonando o repositório do estadão dados para dotfiles"
homesick clone https://github.com/estadaodados/dotfiles.git

echo "Instalando ctags"
echo "sudo apt-get install exuberant-ctags"
sudo apt-get install exuberant-ctags
git submodule update --init
homesick symlink dotfiles

git_uri='https://github.com/estadaoDados/spf13-vim.git'
git_branch='3.0'
VUNDLE_URI="https://github.com/gmarik/vundle.git"

lnif() {
  if [ -e "$1" ]; then
    ln -sf "$1" "$2"
  fi
  ret="$?"
}

clone_vundle() {
  if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
    git clone $VUNDLE_URI "$HOME/.vim/bundle/vundle"
  else
    cd "$HOME/.vim/bundle/vundle" &&
    git pull origin master
  fi
  ret="$?"
}

create_symlinks() {
  endpath="$HOME/.spf13-vim"

  if [ ! -d "$endpath/.vim/bundle" ]; then
    mkdir -p "$endpath/.vim/bundle"
  fi

  lnif "$endpath/.vimrc" "$HOME/.vimrc"
  lnif "$endpath/.vimrc.bundles" "$HOME/.vimrc.bundles"
  lnif "$endpath/.vimrc.before" "$HOME/.vimrc.before"
  lnif "$endpath/.vim" "$HOME/.vim"

  ret="$?"
}

setup_vundle() {
  system_shell="$SHELL"
  export SHELL='/bin/sh'
  vim +BundleInstall +BundleClean +qall
  export SHELL="$system_shell"
}

create_symlinks "Setting up vim symlinks"

clone_vundle "Successfully cloned vundle"

setup_vundle "Now updating/installing plugins using Vundle"
