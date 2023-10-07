#!/bin/bash

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

source ~/.bash_profile

# Need update -> Customization
source setup/terminal.sh

source config/zsh/custom.zsh
source config/zsh/functions.zsh
source config/zsh/basics.zsh

source ~/.bash_profile

# Execute config files
