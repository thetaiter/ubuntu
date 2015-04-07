#!/bin/sh

cwd=${PWD}

path=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

printf '\nRemoving unnecessary directories...\n'
sudo rm -r -f ~/Music ~/Public ~/Videos ~/examples.desktop ~/Pictures ~/Templates ~/Downloads/ubuntu-master*

printf '\nAdding Development directory...\n'
mkdir -p ~/Development

printf '\nChanging to directory %s...\n' $path
cd $path

printf '\nReplaceing ~/.bashrc...\n'
sudo rm ~/.bashrc
sudo cp $path/.bashrc ~/.bashrc

printf '\nInstalling programs...\n'
sudo apt-get -y install byobu htop vim git build-essential > /dev/null

printf '\nRunning Updates and Upgrades...\n'
sudo apt-get -y update > /dev/null
sudo apt-get -y dist-upgrade > /dev/null

printf '\nConfiguring git...\n'
git config --global user.name "Ian Tait"
git config --global user.email "thetaiter@gmail.com"
git config --global push.default simple

printf '\nReturning to original directory...\n'
cd $cwd

printf '\nDone! Rebooting now...\n'
sudo shutdown -r now
