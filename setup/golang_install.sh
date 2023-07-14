#!/bin/bash

# Author: Wellington Moraes <wellpunk@gmail.com> [https://github.com/mswell/dotfiles]
# Modified by Iury Gama <iurycn.gama@gmail.com>

yellow="\e[93m"
green="\e[32m"
reset="\e[0m"

echo -e "${yellow}[+] Installing Go Lang";

GOversion=$(curl -L -s https://golang.org/VERSION?m=text)
wget https://go.dev/dl/${GOversion}.linux-amd64.tar.gz &>/dev/null
sleep 1
sudo tar -C /usr/local -xzf ${GOversion}.linux-amd64.tar.gz &>/dev/null
rm -rf "$GOversion.linux-amd64.tar.gz"
sleep 1

echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile && echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile	&& echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile;
# export GOROOT=/usr/local/go >> ~/.bash_profile;
# export GOPATH=$HOME/go	>> ~/.bash_profile;
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH >> ~/.bash_profile;

sleep 1
source ~/.bash_profile;

echo -e "${green}$(tput rev)[*] Go installed $(tput sgr0)";
echo -e "${reset}";
