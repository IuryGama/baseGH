#!/usr/bin/zsh

pathResults="$HOME/recon"
toolsPath="$HOME/tools"
configPath="$HOME/.config/"
UserAgent="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0"

simpleRecon() {
    if [ -z "$1"  ]; then
        # se não passar argumento, ler arquivo "domain"
        Domain=$(cat domains)
    else
        Domain="$1"
    fi

    # amass enum -d $Domain -o amass.subdomains
    # cat amass.subdomains | anew all.subdomains
    # rm -f amass.subdomains

    subfinder -nW -t 100 -all -o subfinder.subdomains -dL $Domain
    cat subfinder.subdomains | anew all.subdomains
    rm -f subfinder.subdomains

    cat all.subdomains | dnsx -silent | anew clean.subdomains
    cat clean.subdomains | nuclei -H $UserAgent -eid http-missing-security-headers -o simpleNuc
    cat clean.subdomains | nuclei -H $UserAgent -tags takeover,git -o nuclei.git_and_takeover
    

    echo "[+] Simple subdomain recon completed :)"
}