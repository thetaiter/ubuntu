#!/bin/sh

cwd=${PWD}

path=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

printf '\nChanging to directory %s...\n\n' $path
cd $path

printf '\nReplaceing ~/.bashrc...\n\n'
sudo rm ~/.bashrc
sudo cp .bashrc ~/.bashrc

printf '\nInstalling programs...\n\n'
sudo apt-get -y install byobu htop vim git build-essential

printf '\nRunning Updates and Upgrades...\n\n'
sudo apt-get -y update
sudo apt-get -y upgrade

printf '\nConfiguring git...\n\n'
git config --global user.name "Ian Tait"
git config --global user.email "thetaiter@gmail.com"
git config --global push.default simple

printf '\nReturning to original directory...\n\n'
cd $cwd

printf '\nDone!\n\n'
