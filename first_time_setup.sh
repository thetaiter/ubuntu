#!/bin/sh

cwd=${PWD}

path=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

printf 'Changing to directory %s' $path
cd $path

sudo rm ~/.bashrc
sudo cp .bashrc ~/.bashrc

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install byobu htop vim git build-essential

sudo apt-get -y update
sudo apt-get -y upgrade

git config --global user.name "Ian Tait"
git config --global user.email "thetaiter@gmail.com"
git config --global push.default simple

cd $cwd
