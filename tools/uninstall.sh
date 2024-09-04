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
echo -e "
\e[32m     █████████   █████                            █████     \e[0m  ███████████                                        
\e[32m   ███░░░░░███ ░░███                            ░░███       \e[0m ░░███░░░░░███                                       
\e[32m    ███      ░░░   ████████     ███████     █████   ██████  \e[0m  ░███    ░███   ██████   ██████   ██████  ████████  
\e[32m  ░███           ░███ ░░██    ██  ░░██   ███░░  ░░░███░     \e[0m  ░██████████   ███░░███ ███░░███ ███░░███░░███░░███ 
\e[32m  ░███    █████  ░███  ░██   ░██   ░██   ░░█████  ░███      \e[0m  ░███░░░░░███ ░███████ ░███ ░░░ ░███ ░███ ░███ ░███ 
\e[32m ░███   ░░██    ░███  ░██   ░██   ░██    ░░░██   ░███       \e[0m  ░███    ░███ ░███░░░  ░███  ███░███ ░███ ░███ ░███ 
\e[32m   ░██████████   ████ █████  ░███████   ██████   ░░███      \e[0m  █████   █████░░██████ ░░██████ ░░██████  ████ █████
\e[32m   ░░░░░░░░░  ░░░░ ░░░░░    ░░░░░░   ░░░░░░     ░░░░        \e[0m░░░░░   ░░░░░  ░░░░░░   ░░░░░░   ░░░░░░  ░░░░ ░░░░░ 
                                                                                                          
                        '##::::'##:::::'#######:::::::::'#####:::
             ##          ##:::: ##::::'##.... ##:::::::'##.. ##::
               ##        ##:::: ##::::..::::: ##::::::'##:::: ##:
                 ##      ##:::: ##:::::'#######::::::: ##:::: ##:
                   ##   . ##:: ##:::::'##::::::::::::: ##:::: ##:
                 ##     :. ## ##:::::: ##::::::::'###:. ##:: ##::
               ##       ::. ###::::::: #########: ###::. #####:::
             ##         :::...::::::::.........::...::::.....::::\e[5m############\e[0m"

  echo -e "\e[32m               GhostRecon: Open Source Intelligence Investigations Made Easy\e[0m"
  echo ""

}
banner

PATH_TO_TOOLS="/usr/share/GhostRecon"
PATH_TO_REPORTS="$1"


echo "
[1] Classic uninstall:
      -GhostRecon


[2] Full uninstall:
      -GhostRecon
        -Shodan
        -GhostRecon Reports (MAKE BACKUP BEFORE UNINSTALL)

[3] CANCEL"

      read -p " 1/2/3 (3) > " x
      if [ "$x" != "3" ]; then
        sudo rm -rf "$PATH_TO_TOOLS"
        sudo rm /usr/bin/Grecon
        echo GhostRecon Removed.

      fi

      if [ "$x" -eq "2" ]; then

        rm -rf "$PATH_TO_REPORTS"

        echo -e "\e[1;31m [*] UNNSTALLING SHODAN...\e[0m"
        echo "-------------------------------------------------------------------------------"
        echo -e "\n\e[1;31m[*] REMOVING PIP MODULE...\e[0m"
        sudo apt-get remove --purge python3-shodan
        echo -e "\e[1;31m[*] OK\e[0m"

      fi
