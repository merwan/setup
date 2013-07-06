#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Generate french locales
sudo locale-gen fr_FR.UTF-8

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .vim/ ]; then
    mv .vim .vim~
fi
git clone --recursive https://github.com/merwan/dotfiles-ec2.git ~/dotfiles
ln -sb dotfiles/.vimrc .
ln -s dotfiles/.vim .
