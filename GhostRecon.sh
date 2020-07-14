#!/bin/bash

#IMPORTS
#NONE YET

#COMMAND
clear

#COLORS
#RED = \e[1;31m
#BLUE = \e[34m
#END = \e[0m

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
                                (-h TO SEE COMMANDS)"
        echo ""
        echo ""
        echo ""
   }
banner

function help
    {
      echo "
      USAGE: run [core_commands] [suggested] | <sub_commands>...

      ABOUT:
        GhostRecon is compact OSINT tool for OSINT investigators.
        Developer: mZzgamerDEV
        Status: Still under developement.

      SUBCOMMANDS:
        List of available commands that can be invoked using GhostRecon.

        <core_commands>   <sub_command_options>
          whois_lookup        Find public information from a database.
          DNS_lookup          Gather information from a domain.
          reverse_DNS         Reverse DNS.
          geoip               Find IP location.
          ip_lookup           Reverse IP Address information.
          phone_info          Gather information from a specific phone number.
          email_info          Gather information from an email address.
          grab_banner         Get software banner information.
          nmap_scan           Scans Open ports, etc.
          generate_user       Generates a list of candidate usernames based on known information.
          ssh_scan            SSH scanner.
          sqlmap              SQL scanner.
          vuln_scan           Scans for Vulnerabilities.

        <sub_commands>
          clear               Clear terminal
          update              Update tool
          banner              To spawn banner

      ABOUT ARGUMENTS:
        Showing additional information about this program.

        -h, --help            shows this help and exists.
        -v  --version         shows the version of the program and exists.

      Use 'run <command> --help' to learn more about each command. You can contact me
      if there is any issues by Twitter & Discord. (Discord) mZzgamer#8652 (Twitter) @mZzgamerDEV

      CTRL+C to exit!"
      echo ""
      echo ""
    }

#VARIABLES
a1='-h'
a2='--help'
a3='--version'
a4='-v'
a5='clear'
a6='update'
a7='banner'
#######################
a8='run whois_lookup'
a9='run geoip'
a10='run ip_lookup'
a11='run DNS_lookup'
a12='run reverse_DNS'
a13='run phone_info'
a14='run grab_banner'
a15='run nmap_scan'
a16='run ssh_scan'
a17='run sqlmap'
a18='run vuln_scan'
a19='run generate_user'
a20='run email_info'

while true; do
  read -p " GhostRecon > " x
      if [ "$x" == "$a1" ]; then
          help
      fi
      if [ "$x" == "$a2" ]; then
          help
      fi
      if [ "$x" == "$a3" ]; then
          echo ""
          echo -e "\e[1;31m     GHOSTRECON VERSION: BETA\e[0m"
          echo ""
      fi
      if [ "$x" == "$a4" ]; then
          echo ""
          echo -e "\e[1;31m     GHOSTRECON VERSION: BETA\e[0m"
          echo ""
      fi
      if [ "$x" == "$a5" ]; then
          clear
      fi
      if [ "$x" == "$a6" ]; then
        clear
        echo "UPDATING TOOL..."
        cd ..
        mv ./ ./GhostRecon.SAV
        git clone https://github.com/mZzgamer/GhostRecon.git
        echo "UPDATE SUCCESSFULLY"
        rm -rf ./GhostRecon.SAV
        read -p "PRESS ENTER TO CONTINUE"
        clear
        git clone https://github.com/mZzgamer/GhostRecon.git
        cd GhostRecon/
        chmod +x GhostRecon.sh
        sudo bash GhostRecon.sh
      fi
      if [ "$x" == "$a7" ]; then
          banner
      fi
      if [ "$x" == "$a8" ]; then #WHOIS
          echo ""
          echo "WHAT WEBSITE DO YOU WANT TO SEARCH?"
          read -p "DOMAIN: " whois
          echo ""
          echo "Gathering Information..."
          echo ""
          whois $whois
          echo ""
      fi
      if [ "$x" == "$a9" ]; then #GEOIP
         echo ""
         echo "Enter IP Or Domain!"
         read -p "IP/DOMAIN: " geoip
         echo ""
         echo "Gathering Information..."
         echo ""
         curl http://api.hackertarget.com/geoip/?q=$geoip
         echo ""
         echo ""
      fi
      if [ "$x" == "$a10" ]; then #IPLOOKUP
      echo ""
      echo "Enter IP Or Domain."
      read -p "IP Address: " ip_lookup
      echo ""
      echo "Gathering Information..."
      echo ""
      curl http://api.hackertarget.com/reverseiplookup/?q=$ip_lookup
      echo ""
      echo ""
      fi
      if [ "$x" == "$a11" ]; then #DNS_LOOKUP
      echo ""
      echo "Enter IP Address - IP Range Or Domain"
      read -p "DNS LOOKUP: " DNS_LOOKUP
      echo ""
      echo "Gathering Information..."
      echo ""
      curl http://api.hackertarget.com/dnslookup/?q=$DNS_LOOKUP
      echo ""
      echo ""
      fi
      if [ "$x" == "$a12" ]; then #reverse_DNS
      echo ""
      echo "Enter IP Or Domain."
      read -p "IP/DOMAIN: " reversedns
      echo ""
      echo "Gathering Information..."
      echo ""
      curl https://api.hackertarget.com/reversedns/?q=$reversedns
      echo ""
      echo ""
      fi
      if [ "$x" == "$a13" ]; then #phone_info
      echo ""
      echo "Please Enter The Number Followed By The Dialing Code"
      echo "for example : +447410490080 / +44 Is My Dialing Code"
      read -p "PHONE NUMBER: " phone_info
      echo ""
      echo "Gathering Information..."
      echo ""
      curl https://api.telnyx.com/anonymous/v2/number_lookup/$phone_info
      echo ""
      echo ""
      fi
      if [ "$x" == "$a14" ]; then #grab_banner
      echo ""
      echo "Enter Host's IP"
      read -p "IP ADDRESS: " grab_banner
      echo ""
      echo "Gathering Information..."
      echo ""
      curl https://api.hackertarget.com/bannerlookup/?q=$grab_banner
      echo ""
      echo ""
      fi
      if [ "$x" == "$a15" ]; then #nmap_scan
      echo ""
      echo "Enter IP Or Domain."
      read -p "IP/DOMAIN: " nmap_scan
      echo ""
      echo "Gathering Information..."
      echo ""
      curl http://api.hackertarget.com/nmap/?q=$nmap_scan
      echo ""
      echo ""
      fi
      if [ "$x" == "$a16" ]; then #sshscan
      echo ""
      echo "Enter The Host You Want To Scan."
      read -p "HOST: " sshscan
      echo ""
      echo "Gathering Information..."
      echo ""
      sshscan.py -t $sshscan
      echo ""
      echo ""
      fi
      if [ "$x" == "$a17" ]; then #sqlmap
      echo ""
      echo "Enter Website"
      read -p "WEBSITE: " sqlhost2
      echo "php or html ?"
      read -p "PHP/HTML: " phphtml1
      echo ""
      echo "Gathering Information..."
      echo ""
      sqlmap -u $sqlhost2  searchgetby_id.$phphtml1?id=4 --dbs --columns -D scanme --tamper=space2comment --level 5
      echo ""
      echo ""
      fi
      if [ "$x" == "$a18" ]; then #vuln_scan
      echo ""
      echo "Victim's IP Or Website:"
      read -p "IP/WEBSITE: " vuln_scan
      echo ""
      echo "Gathering Information..."
      echo ""
      msfconsole -q -x "nmap -v --script vuln $vuln_scan ;exit ;"
      echo ""
      echo ""
      fi
      if [ "$x" == "$a19" ]; then #generate_user
      echo ""
      apt install osrframework
      osrf alias_generator
      echo ""
      echo ""
      fi
      if [ "$x" == "$a20" ]; then #email_info
      echo ""
      echo "ENTER EMAIL ADDRESS."
      read -p "EMAIL ADDRESS: " email_info
      echo ""
      echo "Gathering Information..."
      echo ""
      apt install osrframework
      mailfy -m $email_info -p all
      echo ""
      echo ""
      fi
done
