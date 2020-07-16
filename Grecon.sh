#!/bin/bash

#IMPORTS
#NONE YET

#COMMAND
clear

#COLORS
#RED = \e[1;31m
#BLUE = \e[34m
#END = \e[0m

# ROOT
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   echo "Your not rooted, please root your Terminal."
   exit 1
fi

function banner
    {
      echo "
                        ____ _               _   ____
                       / ___| |__   ___  ___| |_|  _ \ ___  ___ ___  _ __
                      | |  _| '_ \ / _ \/ __| __| |_) / _ \/ __/ _ \| '_ \.
           /\.        | |_| | | | | (_) \__ \ |_|  _ <  __/ (_| (_) | | | |
          /**\.        \____|_| |_|\___/|___/\__|_| \_\___|\___\___/|_| |_|
         /****\   /\.             DEVELOPER: MZZGAMER | VERSION: BETA
        /      \ /**\.
       /  /\    /    \        /\    /\  /\      /\            /\/\/\  /\.
      /  /  \  /      \      /  \/\/  \/  \  /\/  \/\  /\  /\/ / /  \/  \.
     /  /    \/ /\     \    /    \ \  /    \/ /   /  \/  \/  \  /    \   \.
     /  /      \/  \/\   \  /      \    /   /    \.
     __/__/_______/___/__\___\__________________________________________________.
                                  -h to see commands"
        echo ""
        echo ""
        echo ""
   }
banner

function help
    {
      echo "
  USAGE: run [core_commands]
  example: run -i 192.168.121 -d kali.org ... etc.
  You get the point.

      ABOUT:
        GhostRecon is compact OSINT tool for OSINT investigators.
        Developer: mZzgamerDEV
        Status: Still under developement.

      SUBCOMMANDS:
        List of available commands that can be invoked using GhostRecon.

      <core_commands>

             domain_scanner           Search all possible information for Domains.
             IP_scanner               Search all possible information from an IP Address.
             phone_scanner            Search all possible information from a phone number.
             email_scanner            Search all possible information from an email.
             vulnerability_scanner    Search all possible Vulnerabilities.
             link_scanner             Sniff all links from a Domain.
             media_scanner            Search all possible social media accounts from a username.


        <sub_commands>
          clear               Clear terminal
          update              Update tool
          banner              To spawn banner

   ABOUT ARGUMENTS:
     Showing additional information about this program.

      -h, --help            shows this help and exists.
      -v  --version         shows the version of the program and exists.

   Use 'run <core_command>' to learn more about each command. You can contact me
   if there is any issues by Twitter & Discord. (Discord) mZzgamer#8652 (Twitter) @mZzgamerDEV

   (CTRL+C to exit)"
      echo ""
      echo ""
    }

$DIRECTORY='GhostRecon'
a1='clear' ##
a2='banner' ##
a3='update' ##
b1='run -v' ##
b2='-h' ##
b3='--help' ##
b4='run --version' ##
b5='run domain_scanner' #
b6='run IP_scanner' #
b7='run phone_scanner'
b8='run email_scanner'
b9='run vulnerability_scanner'
b10='run link_scanner'
b11='run media_scanner'

#NEW COMMANDS
while true; do
  read -p " grecon > " x
     if [ "$x" == "$a1" ]; then
         clear
     fi
     if [ "$x" == "$a2" ]; then
         banner
     fi
     if [ "$x" == "$a3" ]; then
         echo ""
         echo -e "\e[1;31m [*] UPDATING\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
         echo ""
         cd ..
         mv ./GhostRecon ./GhostRecon.SAV
         git clone https://github.com/mZzgamer/GhostRecon.git
             	if [ -d $DIRECTORY ]; then
             		rm -rf ./ZEDD.SAV
             		read -p "UPDATE SUCCESSFULLY; PRESS ENTER TO CONTINUE"
             	else
             	read -p "UPTADE FAILED, EMERGENCY SYSTEM KEEP YOUR FILES ON /GhostRecon.SAV DIRECTORY; PRESS ENTER TO CONTINUE"
             	clear
             	cd GhostRecon
             	chmod +x GhostRecon.sh
         echo ""
     fi
############################################################################################################
     if [ "$x" == "$b1" ]; then
         echo ""
         echo -e "\e[1;31m  VERSION: BETA\e[0m"
         echo ""
     fi
     if [ "$x" == "$b2" ]; then
         help
     fi
     if [ "$x" == "$b3" ]; then
         help
     fi
     if [ "$x" == "$b4" ]; then
       echo ""
       echo -e "\e[1;31m  VERSION: BETA\e[0m"
       echo ""
     fi
     if [ "$x" == "$b5" ]; then
         echo ""
         echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
         echo -e "\e[1;31m!!!  WIFI REQUIRED  !!!\e[0m"
         echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
         echo ""
         read -p "[DOMAIN]: " domain
         echo ""
         echo "Gathering Informations...."
         echo ""
         echo -e "\e[1;31m [*] ADMIN INFO (WHOIS INFO)\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
         echo ""
         whois $domain
         echo ""
         echo -e "\e[1;31m [*] HOSTS AND IP ADDRESSES\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
         echo ""
         cd
         cd spiderfoot/
         python3 ./sf.py -m sfp_dnsbrute,sfp_dnsresolve -s $domain -q
         echo ""
         echo ""
         echo ""
         echo -e "\e[1;31m [*] NAMES AND EMAILS\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
         echo ""
         cd
         cd spiderfoot/
         python3 ./sf.py -m sfp_spider,sfp_names,sfp_email,sfp_phone -s $domain -q -F HUMAN_NAME,EMAILADDR,PHONENUMBER
         echo ""
         echo -e "\e[1;31m [*] VULNERABILITIES\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
         python3 ./sf.py -m sfp_dnsbrute,sfp_dnsresolve,sfp_portscan_tcp -s $domain -q -r
         echo ""
         echo -e "\e[1;31m [*] VULNERABILITIES\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
         echo ""
         msfconsole -q -x "nmap -v --script vuln $domain ;exit ;"
         echo ""
         echo -e "\e[1;31m [*] LINKS SCANNED\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
         echo ""
         curl https://api.hackertarget.com/pagelinks/?q=$domain
         echo ""
         echo "-------------------------------------------------------------------------------------------------------------"
         echo ""
         echo -e "\e[1;31m [*] DONE\e[0m"
         echo ""
     fi
     if [ "$x" == "$b6" ]; then
       echo ""
       echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
       echo -e "\e[1;31m!!!  WIFI AND SHODAN KEY REQUIRED  !!!\e[0m"
       echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
       echo ""
       read -p "[IP ADDRESS]: " ipaddress
       echo ""
       echo "Gathering Informations...."
       echo ""
       echo -e "\e[1;31m [*] IP LOCATION\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       echo ""
       curl http://api.hackertarget.com/geoip/?q=$ipaddress
       echo ""
       echo ""
       echo ""
       echo -e "\e[1;31m [*] ADMIN INFO\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       echo ""
       whois $ipaddress
       echo ""
       echo -e "\e[1;31m [*] ADMIN INFO\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       echo ""
       whois $ipaddress
       echo ""
       echo -e "\e[1;31m [*] VULNERABILITIES\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       echo ""
       nmap $ipaddress
       echo ""
       echo -e "\e[1;31m [*] SHODAN RESULTS\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       echo ""
       shodan stats --facets vuln net:$ipaddress
       echo ""
       shodan host $ipaddress
       echo ""
       echo ""
       echo -e "\e[1;31m [*] EMAILS SCANNED\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       echo ""
       echo "UNDER DEVELOPEMENT..."
       echo ""
       echo -e "\e[1;31m [*] DNS RECORDS\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       echo ""
       curl http://api.hackertarget.com/reverseiplookup/?q=$ipaddress
       echo ""
       echo ""
       echo -e "\e[1;31m [*] DONE\e[0m"
       echo ""
     fi
     if [ "$x" == "$b7" ]; then
       echo ""
       read -p "Phone Number: " phone_info
       echo ""
       echo "Gathering Information..."
       echo ""
       echo -e "\e[1;31m [*] PHONE $phone_info\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       curl https://api.telnyx.com/anonymous/v2/number_lookup/$phone_info
       echo ""
       echo ""
     fi
     if [ "$x" == "$b8" ]; then
       echo ""
       read -p "Email Address: " email_info
       echo ""
       echo "Gathering Information..."
       echo ""
       echo -e "\e[1;31m [*] EMAIL $email_info\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       mailfy -m $email_info -p all
       echo ""
       echo ""
     fi
     if [ "$x" == "$b9" ]; then
       echo ""
       read -p "IP/DOMAIN: " vuln
       echo ""
       echo " Gathering Information..."
       echo ""
       echo -e "\e[1;31m [*] VULNERABILITY SCAN\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       msfconsole -q -x "nmap -v --script vuln $vuln ;exit ;"
       nmap -O $domain
       python3 ./sf.py -m sfp_dnsbrute,sfp_dnsresolve,sfp_portscan_tcp -s $vuln -q -r
       echo ""
     fi
     if [ "$x" == "$b10" ]; then
       echo ""
       read -p "Enter DOMAIN: " link
       echo ""
       echo "Gathering Information..."
       echo ""
       echo -e "\e[1;31m [*] SNIFFING LINKS\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       curl https://api.hackertarget.com/pagelinks/?q=$link
       echo ""
     fi
     if [ "$x" == "$b11" ]; then
       echo ""
       echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
       echo -e "\e[1;31m!!!  PUT IN POSSIBLE USERNAME  !!!\e[0m"
       echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
       echo ""
       read -p "Username: " username
       echo ""
       echo "Gathering Information..."
       echo ""
       echo -e "\e[1;31m [*] POSSIBLE SOCIAL MEDIA ACCOUNTS\e[0m"
         echo "-------------------------------------------------------------------------------------------------------------"
       cd
       cd spiderfoot/
       python3 ./sf.py -m sfp_accounts -s $username -q
       echo ""
     fi
done

#    MODULES

#    whois $whois
#    curl http://api.hackertarget.com/geoip/?q=$geoip
#    curl http://api.hackertarget.com/reverseiplookup/?q=$ip_lookup
#    curl http://api.hackertarget.com/dnslookup/?q=$DNS_LOOKUP
#    curl https://api.hackertarget.com/reversedns/?q=$reversedns
#    curl https://api.telnyx.com/anonymous/v2/number_lookup/$phone_info
#    curl https://api.hackertarget.com/bannerlookup/?q=$grab_banner
#    curl http://api.hackertarget.com/nmap/?q=$nmap_scan
#    sshscan.py -t $sshscan
#    sqlmap -u $sqlhost2  searchgetby_id.$phphtml1?id=4 --dbs --columns -D scanme --tamper=space2comment --level 5
#    msfconsole -q -x "nmap -v --script vuln $vuln_scan ;exit ;"
#    osrf alias_generator
#    mailfy -m $email_info -p all
#    osrf alias_generator
#    curl https://api.hackertarget.com/pagelinks/?q=$link_sniffer
