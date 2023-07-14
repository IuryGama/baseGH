#!/bin/bash

sudo apt install -y autojump tree ttf-ancient-fonts fzf tmux alacritty
sleep 1

yellow="\e[93m\e[1m"
green="\e[32m"
reset="\e[0m"

# Installing TMUX TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Installing Colorscripts
# echo -e "${yellow}[+] Instalando colorscripts${reset}"
# sleep 1
# git clone https://gitlab.com/dwt1/shell-color-scripts.git
# cd shell-color-scripts
# sudo make install
# cd -
# rm -rf shell-color-scripts

# Zap zsh
echo -e "${yellow}[+] Instalando ZAPzsh${reset}"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

echo -e "Now type \`chsh -s $(which zsh)\` to zsh becomes default."
echo -e "${red}Logout and login to effective your changes.${reset}"
chsh -s $(which zsh)

echo -e "${yellow}[*] Feito.${reset}"
sleep 1
