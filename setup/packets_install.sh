#!/bin/bash

# Author: Wellington Moraes <wellpunk@gmail.com> [https://github.com/mswell/dotfiles]
# Modified by Iury Gama <iurycn.gama@gmail.com>

DEBUG_STD="&>/dev/null"
DEBUG_ERROR="2>/dev/null"

yellow="\e[93m"
green="\e[32m"
reset="\e[0m"

dir="$HOME/tools"

highlight(){
    str=$1
    echo -e "${green}$(tput rev)[*] $1 $(tput sgr0)";
}

# Essencial packets
echo -e "${yellow}----->Installing essential packets-tools";

sudo apt install -y build-essential \
		            vim \
	                git  \
                    nano  \
		            wget   \
                    tmux    \
                    curl     \
		            xclip     \
                    rename     \
                    findutils   \
                    terminator   \
                    chromium-browser
highlight "Done! Essencial packets installed.";
echo -e "${reset} \n";
sleep 1.5

# Python, ruby and some packets
echo -e "${yellow}----> Installing Python,Ruby and some packages";

sudo apt install -y python3 \
	            python3-pip \
		        build-essential \
		        gcc \
		        cmake \
		        ruby \
		        git \
		        curl \
		        libpcap-dev \
		        zip \
		        python3-dev \
		        pv \
		        dnsutils \
		        libssl-dev \
		        libffi-dev \
		        libxml2-dev \
		        libxslt1-dev \
		        zlib1g-dev \
		        jq \
		        apt-transport-https \
		        xvfb \
		        prips &>/dev/null

highlight "Done! Packets installed."
echo -e "${reset}\n";
sleep 1.5

echo -e "${yellow}Installing network scanner tools"
sudo apt install -y nmap > /dev/null 2>&1;
highlight "Done! Nmap installed."
echo -e "${reset}";
sleep 1.5


# Temporary:
#   # Find another location to this packs
#   # Could crate another file to put this and execute after golang_install.sh

# URL_NEOVIM=" https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release"
# URL_RUST="https://sh.rustup.rs"

# echo -e "${yellow}[+] Instalando tools for developers${reset}"

# python and neovim dependencies
# echo -e "${yellow}[+] Instalando python & neovim dependencies${reset}"
# sudo -H pip3 install --upgrade pynvim virtualenvwrapper

# neovim
# echo -e "${yellow}[+] Instalando Neovim${reset}"
# cria diretorio se ele nao existe
# [ ! -d "$HOME/.config/nvim" ] && mkdir $HOME/.config/nvim
#bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)
# Faz o download e instala
# wget -q -O - --no-check-certificate $URL_NEOVIM | bash

# install base packages
echo -e "${yellow}[+] Instalando pacotes base${reset}"
sudo apt update
sudo apt install -y vim-nox tmux git exuberant-ctags zsh tree htop ncurses-term silversearcher-ag curl npm

# instala o Rust
# echo -e "${yellow}[+] Instalando o  Rust${reset}"
# curl --proto '=https' --tlsv1.2 -sSf $URL_RUST | sh

echo -e "${yellow}[+] Feito.${reset}"
