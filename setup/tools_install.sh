#!/bin/bash
##################### #!/usr/bin/env bash

DEBUG_STD="&>/dev/null"
DEBUG_ERROR="2>/dev/null"

yellow="\e[93m\e[1m"
green="\e[32m"
reset="\e[0m"

highlight(){
    str=$1
    echo -e "${green}$(tput rev)[*] $1 $(tput sgr0)";
}

dir="$HOME/tools"

mkdir -p ~/.gf
mkdir -p ~/tools
mkdir -p ~/lists
mkdir -p ~/.config/notify
mkdir -p ~/.config/amass
mkdir -p ~/.config/nuclei

install_tool(){
    local tool="$1"
    local repo="$2"

    echo -e "$yellow[!] Installing $tool"
    go install $repo@latest
    highlight "Done! $tool installed."; 
    echo -e "${reset}\n";
}

# Check this. Exemple jwt_tool, wfuzz....
# python_tool_install(){
#     local tool="$1"
#     local repo="$2"

#     echo -e "$yellow[!] Installing $tool"
#     pip3 install $2
#     highlight "Done! $tool installed."; 
#     echo -e "${reset}\n";
# }

install_tool "fff" "github.com/tomnomnom/fff"
install_tool "hakrawler" "github.com/hakluke/hakrawler"
install_tool "tojson" "github.com/tomnomnom/hacks/tojson"
install_tool "gowitness" "github.com/sensepost/gowitness"
install_tool "Rush" "github.com/shenwei356/rush"
install_tool "Gf-Patterns" "1ndianl33t/Gf-Patterns"
install_tool "LinkFinder" "dark-warlord14/LinkFinder"
install_tool "Naabu" "github.com/projectdiscovery/naabu/v2/cmd/naabu"
install_tool "hakcheckurl" "github.com/hakluke/hakcheckurl"
install_tool "shuffledns" "github.com/projectdiscovery/shuffledns/cmd/shuffledns"
install_tool "gron" "github.com/tomnomnom/gron"
install_tool "html-tool" "github.com/tomnomnom/hacks/html-tool"
install_tool "Chaos" "github.com/projectdiscovery/chaos-client/cmd/chaos"
install_tool "gf" "github.com/tomnomnom/gf"
install_tool "qsreplace" "github.com/tomnomnom/qsreplace"

install_tool "Amass" "github.com/owasp-amass/amass/v3/...@"
go install -v github.com/owasp-amass/amass/v3/...@master

install_tool "ffuf" "github.com/ffuf/ffuf"
install_tool "assetfinder" "github.com/tomnomnom/assetfinder"
install_tool "github-subdomains" "github.com/gwen001/github-subdomains"
install_tool "waybackurls" "github.com/tomnomnom/hacks/waybackurls"
install_tool "nuclei" "github.com/projectdiscovery/nuclei/v2/cmd/nuclei"
install_tool "Anew" "github.com/tomnomnom/anew"
install_tool "notify" "github.com/projectdiscovery/notify/cmd/notify"
install_tool "mildew" "github.com/daehee/mildew/cmd/mildew"
install_tool "dirdar" "github.com/m4dm0e/dirdar"
install_tool "unfurl" "github.com/tomnomnom/unfurl"
install_tool "httpx" "github.com/projectdiscovery/httpx/cmd/httpx"
install_tool "dnsx" "github.com/projectdiscovery/dnsx/cmd/dnsx"
install_tool "subfinder" "github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
install_tool "gauplus" "github.com/bp0lr/gauplus"
install_tool "subjs" "github.com/lc/subjs"
install_tool "Gxss" "github.com/KathanP19/Gxss"
install_tool "gospider" "github.com/jaeles-project/gospider"
install_tool "dalfox" "github.com/hahwul/dalfox/v2"
install_tool "puredns" "github.com/d3mondev/puredns/v2"
install_tool "interactsh-client" "github.com/projectdiscovery/interactsh/cmd/interactsh-client"
install_tool "gotator" "github.com/Josue87/gotator"
install_tool "kxss" "github.com/tomnomnom/hacks/kxss"
install_tool "GetJs" "github.com/003random/getJS"
install_tool "Goop" "github.com/deletescape/goop"
install_tool "Meg" "github.com/tomnomnom/meg"
install_tool "Freq" "github.com/takshal/freq"
install_tool "Sdlookup" "github.com/j3ssie/sdlookup"
install_tool "Airixss" "github.com/ferreiraklet/airixss"
install_tool "Nilo" "github.com/ferreiraklet/nilo"
install_tool "haip2host" "github.com/hakluke/hakip2host"
install_tool "scopein" "github.com/ferreiraklet/scopein"
install_tool "metabigor" "github.com/j3ssie/metabigor"
install_tool "hakrevdns" "github.com/hakluke/hakrevdns"
install_tool "alterx" "github.com/projectdiscovery/alterx/cmd/alterx"
install_tool "katana" "github.com/projectdiscovery/katana/cmd/katana"
install_tool "Github Subdomains" "github.com/gwen001/github-subdomains"
install_tool "Gobuster" "github.com/OJ/gobuster/v3"
install_tool "Unfurl" "github.com/tomnomnom/unfurl"

declare -A repos
repos["gf"]="tomnomnom/gf"
repos["Knock"]="guelfoweb/knock"
repos["altdns"]="infosec-au/altdns"
repos["Massdns"]="blechschmidt/massdns"
repos["Git-Dumper"]="arthaud/git-dumper"
repos["Dirsearch"]="maurosoria/dirsearch"
repos["GitTools"]="internetwache/GitTools"
repos["JSScanner"]="0x240x23elu/JSScanner"
repos["SecretFinder"]="m4ll0k/SecretFinder"
repos["Gf-Patterns"]="1ndianl33t/Gf-Patterns"
repos["DNSvalidator"]="vortexau/dnsvalidator"
repos["LinkFinder"]="dark-warlord14/LinkFinder"
repos["xnLinkFinder"]="xnl-h4ck3r/xnLinkFinder"
repos["XSStrike-Reborn"]="ItsIgnacioPortal/XSStrike-Reborn"

pip3 install uro
pip3 install bhedak

# python_tool_install "Wfuzz" "wfuzz"

eval wget -nc -O ~/lists/XSS-OFJAAAH.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-OFJAAAH.txt
eval wget -nc -O ~/lists/params.txt https://raw.githubusercontent.com/s0md3v/Arjun/master/arjun/db/params.txt
eval wget -nc -O ~/lists/raft-large-directories-lowercase.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-directories-lowercase.txt
eval wget -nc -O ~/.gf/potential.json https://raw.githubusercontent.com/devanshbatham/ParamSpider/master/gf_profiles/potential.json
eval wget -nc -O ~/lists/httparchive_apiroutes_2022_03_28.txt https://wordlists-cdn.assetnote.io/data/automated/httparchive_apiroutes_2022_03_28.txt
eval wget -nc -O ~/lists/raft-large-files.txt https://github.com/danielmiessler/SecLists/blob/master/Discovery/Web-Content/raft-large-files.txt
eval wget -nc -O ~/lists/raft-large-words-lowercase.txt https://github.com/danielmiessler/SecLists/blob/master/Discovery/Web-Content/raft-large-words-lowercase.txt

eval wget -nc -O $HOME/lists/namelist.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/namelist.txt
eval wget -nc -O $HOME/lists/directory-list-2.3-small.txt ehttps://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/directory-list-2.3-small.txt
eval wget -nc -O $HOME/lists/web-extensions.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/web-extensions.txt
eval wget -nc -O $HOME/lists/subdomains-top1million-5000.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-5000.txt
eval wget -nc -O $HOME/lists/burp-parameter-names.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/burp-parameter-names.txt
eval wget -nc -O $HOME/lists/xato-net-10-million-usernames.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Usernames/xato-net-10-million-usernames.txt
eval wget -nc -O $HOME/lists/subdomains-top1million-110000.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-110000.txt
eval wget -nc -O $HOME/lists/raft-large-words.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-words.txt
eval wget -nc -O $HOME/lists/all.txt https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

echo "${yellow}\n[*]Installing repositories (${#repos[@]})...\n\n"

cd $dir || {
    echo -e "Failed to cd to $dir in ${FUNCNAME[0]} @ line ${LINENO}"
    exit 1
}

steps=0
for repo in "${!repos[@]}"; do
    steps=$((steps + 1))
    eval git clone https://github.com/${repos[$repo]} $dir/$repo $DEBUG_STD
    eval cd $dir/$repo $DEBUG_STD
    eval git pull $DEBUG_STD
    exit_status=$?
    if [ $exit_status -eq 0 ]; then
        printf "${yellow} $repo installed (${repos_step}/${#repos[@]})${reset}\n"
    else
        printf "Unable to install $repo, try manually (${repos_step}/${#repos[@]})${reset}\n"
    fi
    if [ -s "requirements.txt" ]; then
        eval $SUDO pip3 install -r requirements.txt $DEBUG_STD
    fi
    if [ -s "setup.py" ]; then
        eval $SUDO python3 setup.py install $DEBUG_STD
    fi
    if [ -s "Makefile" ]; then
        eval $SUDO make $DEBUG_STD
        eval $SUDO make install $DEBUG_STD
    fi
    if [ "gf" = "$repo" ]; then
        eval cp -r examples/*.json ~/.gf $DEBUG_ERROR
    elif [ "Gf-Patterns" = "$repo" ]; then
        eval mv *.json ~/.gf $DEBUG_ERROR
    fi
    cd "$dir" || {
        echo "Failed to cd to $dir in ${FUNCNAME[0]} @ line ${LINENO}"
        exit 1
    }
done

source ~/.bash_profile;
echo "TODO: Adding templates";
# add gf templates

# TODO: dnsutils
# Analyze: Lazyrecon - https://github.com/nahamsec/bbht
# Analyze: crtndstry https://github.com/nahamsec/crtndstry
