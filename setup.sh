#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

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
if [ -d ./.vim/ ]; then
    rm -rf .vim~
    mv .vim .vim~
fi
if [ -d ./dotfiles/ ]; then
    rm -rf dotfiles~
    mv dotfiles dotfiles~
fi
git clone --recursive https://github.com/merwan/dotfiles-ec2.git ~/dotfiles
ln -sb dotfiles/.vimrc .
ln -s dotfiles/.vim .

