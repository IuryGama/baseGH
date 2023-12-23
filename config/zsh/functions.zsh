#!/usr/bin/zsh
#
# Author: Wellington Moraes <wellpunk@gmail.com> [https://github.com/mswell/dotfiles/blob/master/config/zsh/functions.zsh]
#

pathResults="$HOME/recon"
toolsPath="$HOME/tools"
configPath="$HOME/.config/"
UserAgent="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0"

workspace() {
    name=$(echo $1 | unfurl -u domains)
    wdir=$name/$(date +%F)/
    mkdir -p $wdir
    cd $wdir
    echo $name | anew domains
}

# Enumeracao de subdominios baseado no dominio informado no arquivo "domains"
subdomainenum() {
  echo "[+] Recon subdomains..."
  Domain=$(cat domains)
  # subfinder -up
  subfinder -nW -t 100 -all -o subfinder.subdomains -dL domains
  cat subfinder.subdomains | anew all.subdomains
  rm -f subfinder.subdomains
  amass enum -v -norecursive -passive -nf all.subdomains -df domains -o amass.subdomains
  cat amass.subdomains | anew all.subdomains
  rm -f amass.subdomains
  curl -s "https://crt.sh/?q=%25.$Domain&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | anew all.subdomains
  crobat -s domains | anew all.subdomains
  cat all.subdomains | dnsx -silent | anew clean.subdomains
  echo "[+] Passive subdomain recon completed :)"
}

getfreshresolvers() {
  wget -nv -O $HOME/lists/resolvers.txt https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt
}

getalltxt() {
  wget -nv -O $HOME/lists/all.txt https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt
}

bruteTop1million() {
  for domain in $(cat domains); do
    shuffledns -d $domain -r $HOME/lists/resolvers.txt -w $HOME/lists/subdomains-top1million-110000.txt -o brutesubs_out.txt
    cat brutesubs_out.txt | anew clean.subdomains
  done
  rm -rf brutesubs_out.txt
}

bruteAlltxt() {
  for domain in $(cat domains); do
    shuffledns -d $domain -r $HOME/lists/resolvers.txt -w $HOME/lists/all.txt -o brutesubs_out.txt
    cat brutesubs_out.txt | anew clean.subdomains
  done
  rm -rf brutesubs_out.txt
}

getalive() {
  echo "${yellow}[+] Check live hosts ${reset}"
  cat naabuScan | httpx -silent -status-code -tech-detect -title -cl -timeout 10 -threads 10 -o HTTPOK
  cat HTTPOK | grep 200 | awk -F " " '{print $1}' | anew 200HTTP
  cat HTTPOK | grep -E '40[0-4]' | grep -Ev 404 | awk -F " " '{print $1}' | anew 403HTTP
  cat HTTPOK | grep -v 404 | awk '{print $1}' | anew Without404
  cat HTTPOK | awk -F " " '{print $1}' | anew ALLHTTP
}

brutesub() {
  echo "[+] Brute subdomains"
  getfreshresolvers
  getalltxt
  bruteTop1million
  bruteAlltxt
  echo "[+] Brute subdomains complete"
}

naabuRecon() {
  naabu -l clean.subdomains -r $HOME/lists/resolvers.txt -ec -p 80,443,81,300,591,593,832,981,1010,1311,1099,2082,2095,2096,2480,3000,3128,3333,4243,4567,4711,4712,4993,5000,5104,5108,5280,5281,5601,5800,6543,7000,7001,7396,7474,8000,8001,8008,8014,8042,8060,8069,8080,8081,8083,8088,8090,8091,8095,8118,8123,8172,8181,8222,8243,8280,8281,8333,8337,8443,8500,8834,8880,8888,8983,9000,9001,9043,9060,9080,9090,9091,9200,9443,9502,9800,9981,10000,10250,11371,12443,15672,16080,17778,18091,18092,20720,32000,55440,55672 -sa -o naabuScanFull
  [ -s "naabuScanFull" ] && cat naabuScanFull | grep -v '\[' | anew naabuScan
}

dnsrecords() {
  echo "[+] Get dnshistory data"
  mkdir dnshistory
  cat clean.subdomains | dnsx -silent -a -resp-only -o dnsx.txt
  cat clean.subdomains | dnsx -a -resp -silent -o dnshistory/A-records
  cat clean.subdomains | dnsx -ns -resp -silent -o dnshistory/NS-records
  cat clean.subdomains | dnsx -cname -resp -silent -o dnshistory/CNAME-records
  cat clean.subdomains | dnsx -soa -resp -silent -o dnshistory/SOA-records
  cat clean.subdomains | dnsx -ptr -resp -silent -o dnshistory/PTR-records
  cat clean.subdomains | dnsx -mx -resp -silent -o dnshistory/MX-records
  cat clean.subdomains | dnsx -txt -resp -silent -o dnshistory/TXT-records
  cat clean.subdomains | dnsx -aaaa -resp -silent -o dnshistory/AAAA-records
}

wellSubRecon() {
    subdomainenum
    [ -s "asn" ] && cat asn | metabigor net --asn | anew cidr
    [ -s "cidr" ] && cat cidr | anew clean.subdomains
    brutesub
}

updateTemplatesNuc() {
  rm -rf ~/nuclei-templates
  git clone --branch main --depth 1 https://github.com/projectdiscovery/nuclei-templates.git ~/nuclei-templates
}

nucTakeover() {
  echo "[+] Takeover scan"
  cat ALLHTTP | nuclei -tags takeover -H $UserAgent -o nucleiTakeover
  [ -s "nucleiTakeover" ] && echo "Takeover found :)" | notify -silent -id nuclei
  [ -s "nucleiTakeover" ] && notify -silent -bulk -data nucleiTakeover -id nuclei
  cat ALLHTTP | nuclei -t $HOME/custom_nuclei_templates/m4cddr-takeovers.yaml -H $UserAgent -o takeovers_m4c
  [ -s "takeovers_m4c" ] && echo "Takeover m4c found :)" | notify -silent -id nuclei
  [ -s "takeovers_m4c" ] && notify -silent -bulk -data takeovers_m4c -id nuclei
}

graphqldetect() {
  echo "[+] Graphql Detect"
  cat ALLHTTP | nuclei -id graphql-detect -H $UserAgent -o graphqldetect
  [ -s "graphqldetect" ] && echo "Graphql endpoint found :)" | notify -silent -id api
  [ -s "graphqldetect" ] && notify -silent -bulk -data graphqldetect -id api

}

GitScan() {
  echo "[+] Git scan"
  cat ALLHTTP | nuclei -tags git -H $UserAgent -o gitvector
  [ -s "gitvector" ] && echo "Git vector found :)" | notify -silent -id nuclei
  [ -s "gitvector" ] && notify -silent -bulk -data gitvector -id nuclei
}

panelNuc() {
  echo "[+] Panel scan"
  [ -s "ALLHTTP" ] && cat ALLHTTP | nuclei -tags panel -H $UserAgent -o nucPanel
  [ -s "nucPanel" ] && echo "Panel found :)" | notify -silent -id nuclei
  [ -s "nucPanel" ] && notify -silent -bulk -data nucPanel -id nuclei
}

exposureNuc() {
  echo "[+] Exposure scan"
  [ -s "ALLHTTP" ] && cat ALLHTTP | nuclei -tags exposure -H $UserAgent -o exposurevector
  [ -s "exposurevector" ] && echo "Exposure vector found :)" | notify -silent -id nuclei
  [ -s "exposurevector" ] && notify -silent -bulk -data exposurevector -id nuclei
}
