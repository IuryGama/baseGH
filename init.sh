#!/bin/bash
# 
# Starter script to configure pentesting machines and bug bounty
# This project was inspired by Wellington Moraes <wellpunk@gmail.com> [https://github.com/mswell/dotfiles] repository.
# Inspired not only the project, but also to study more and do more bounty.
# Modified by Iury Gama <iurycn.gama@gmail.com>
# 

export EDITOR='vim'
export DOTFILES=$PWD

export yellow="\e[93m\e[1m"
export green="\e[32m"
export reset="\e[0m"

# Update & upgrade
apt update -y && apt upgrade -y && apt install sudo -y
echo -e "${green}Update completed!";
sleep 2
clear;

# Create a Tools folder in Home ~/
echo -e "${yellow}----> Create a Tools folder";
mkdir $HOME/tools
echo -e "${green}Done!"; echo "";
sleep 2


# Execute setup files

source setup/packets_install.sh
source setup/golang_install.sh
source setup/tools_install.sh

# TODO: analizar 
# source setup/pyenv_install.sh
# source setup/colors_fonts.sh

# Need update -> Customization
source ./setup/terminal.sh


# Execute config files
