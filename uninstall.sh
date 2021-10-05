#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
# License holder: DR34M-M4K3R#7751

#COMMANDS
clear

function banner
    {
      clear
      echo "
                            ____ _               _   ____
                           / ___| |__   ___  ___| |_|  _ \ ___  ___ ___  _ __
                          | |  _| '_ \ / _ \/ __| __| |_) / _ \/ __/ _ \| '_ \.
               /\.        | |_| | | | | (_) \__ \ |_|  _ <  __/ (_| (_) | | | |
              /**\.        \____|_| |_|\___/|___/\__|_| \_\___|\___\___/|_| |_|
             /****\   /\.             DEVELOPER: MZZGAMER | VERSION: V.1.0
            /      \ /**\.
           /  /\    /    \        /\    /\  /\      /\            /\/\/\  /\.
          /  /  \  /      \      /  \/\/  \/  \  /\/  \/\  /\  /\/ / /  \/  \.
         /  /    \/ /\     \    /    \ \  /    \/ /   /  \/  \/  \  /    \   \.
         /  /      \/  \/\   \  /      \    /   /    \.
         __/__/_______/___/__\___\_______________________________________________________."
        echo -e "\e[1;31m                             !!!      CLEANING HARD DRIVE      !!!\e[0m"
        echo -e "\e[1;31m                             !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  \e[0m"
        echo ""
        echo ""
        echo ""
      }


      banner



      echo "Are you sure that you want to uninstall GhostRecon and all his dependencies?
      Warning: the script will also delete dependencies of previous versions of GhostRecon.
      The following programs are going to  be deleted:
      -ANONSURF
      -Nikto (previous versions)
      -Nmap (previous versions)
      -jq
      -ip-tracer (previous versions
      -Shodan)"
      read -p " y/n (n) > " x
      if [ "$x" == "y" ]; then
        pathtogrecon=$(find /home/ -type d -iname "GhostRecon")


        banner
        echo -e "\e[1;31m [*] UNNSTALLING ANONSURF...\e[0m"
        echo "-------------------------------------------------------------------------------"
        echo -e "\n\e[1;31m[*] SEARCHING ORIGINAL DIRECTORY...\e[0m"
        cd
        echo -e "\e[1;31m[*] OK\e[0m"
        echo -e "\n\e[1;31m[*] REMOVING FOLDER...\e[0m"
        rm -rf kali-anonsurf
        echo -e "\e[1;31m[*] OK\e[0m"
        echo -e "\n\e[1;31m[*] REMOVING DEPENDENCIES...\e[0m"
        rm /tmp/i2p-debian-repo.key.asc
        apt-get -y remove tor i2p i2p-keyring
        apt-get -y purge tor i2p i2p-keyring
        echo -e "\e[1;31m[*] OK\e[0m"



        banner
        echo -e "\e[1;31m [*] UNNSTALLING NIKTO...\e[0m"
        echo "-------------------------------------------------------------------------------"
        echo -e "\n\e[1;31m[*] REMOVING PACKAGE...\e[0m"
        apt-get -y remove nikto
        echo -e "\e[1;31m[*] OK\e[0m"
        echo -e "\n\e[1;31m[*] REMOVING DEPENDENCIES...\e[0m"
        rm /tmp/i2p-debian-repo.key.asc
        echo -e "\e[1;31m[*] OK\e[0m"
        echo -e "\n\e[1;31m[*] PURGING FILES...\e[0m"
        apt-get -y purge nikto
        echo -e "\e[1;31m[*] OK\e[0m"


        banner
        echo -e "\e[1;31m [*] UNNSTALLING JQ...\e[0m"
        echo "-------------------------------------------------------------------------------"
        echo -e "\n\e[1;31m[*] REMOVING PACKAGE...\e[0m"
        apt-get -y remove jq
        apt-get -y purge jq
        echo -e "\e[1;31m[*] OK\e[0m"

        banner
        echo -e "\e[1;31m [*] UNNSTALLING IP-TRACER...\e[0m"
        echo "-------------------------------------------------------------------------------"
        echo -e "\n\e[1;31m[*] REMOVING DIRECTORY...\e[0m"
        rm -rf /usr/share/IP-Tracer
        echo -e "\e[1;31m[*] OK\e[0m"
        echo -e "\n\e[1;31m[*] REMOVING BINARY...\e[0m"
        rm /usr/bin/trace
        echo -e "\e[1;31m[*] OK\e[0m"


        banner
        echo -e "\e[1;31m [*] UNNSTALLING NMAP...\e[0m"
        echo "-------------------------------------------------------------------------------"
        echo -e "\n\e[1;31m[*] REMOVING PACKAGE...\e[0m"
        apt-get -y remove nmap
        echo -e "\e[1;31m[*] OK\e[0m"
        echo -e "\n\e[1;31m[*] PURGING FILES...\e[0m"
        apt-get -y purge nmap
        echo -e "\e[1;31m[*] OK\e[0m"



        echo -e "\e[1;31m [*] UNNSTALLING SHODAN...\e[0m"
        echo "-------------------------------------------------------------------------------"
        echo -e "\n\e[1;31m[*] REMOVING PIP MODULE...\e[0m"
        pip uninstall -y -y shodan
        echo -e "\e[1;31m[*] OK\e[0m"



        banner
        echo -e "\n\e[1;31m[*] PURGING FILES...\e[0m"
        apt-get -y autoremove
        echo -e "\e[1;31m[*] OK\e[0m"


        banner
        echo -e "\e[1;31m ARE YOU SURE? DO YOU REALLY WANT TO WIPE-OUT GHOSTRECON FROM YOUR HARD DRIVE?\n TRUST ME, YOU'LL NOT SEE IT ANYMORE... \n\e[0m"

        read -p "y/n (n) >" y
        if [ "$y" == "y" ]; then
          rm -rf $pathtogrecon
          rm /usr/bin/Grecon
          #banner
          echo -e "GhostRecon AND ALL HIS DEPENDENCIES HAVE BEEN DESTROYED, TASK COMPLETED.\n YOU CAN NOW CLOSE THIS TERMINAL.\n THANKS HAVING USED GhostRecon."
        else
          exit
        fi

      else
        exit
      fi


    #fi
