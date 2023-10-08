#!/bin/bash

# Author: Wellington Moraes <wellpunk@gmail.com> [https://github.com/mswell/dotfiles]
# Modified by Iury Gama <iurycn.gama@gmail.com>

yellow="\e[93m"
green="\e[32m"
reset="\e[0m"

echo -e "${yellow}[+] Installing Go Lang";

GOversion=$(curl -L -s https://golang.org/VERSION?m=text | head -n 1)
wget https://go.dev/dl/${GOversion}.linux-amd64.tar.gz &>/dev/null
sudo tar -C /usr/local -xzf ${GOversion}.linux-amd64.tar.gz &>/dev/null
sudo mv go /usr/local

rm -rf "$GOversion.linux-amd64.tar.gz"
sleep 1

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	

source ~/.bash_profile
sleep 1

echo -e "${green}$(tput rev)[*] Go installed $(tput sgr0)";
echo -e "${reset}";
