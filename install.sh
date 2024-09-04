#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
# License holder: -

#COMMANDS
clear

echo -e "This script will:\n-Install Curl\n-Install Jq\n-Install shodan framework.\n"


function banner
{
clear
echo -e "
\e[32m     █████████   █████                            █████    \e[0m  ███████████                                        
\e[32m   ███░░░░░███ ░░███                            ░░███      \e[0m ░░███░░░░░███                                       
\e[32m    ███      ░░░   ████████     ███████     █████   ██████ \e[0m  ░███    ░███   ██████   ██████   ██████  ████████  
\e[32m  ░███           ░███ ░░██    ██  ░░██   ███░░  ░░░███░    \e[0m  ░██████████   ███░░███ ███░░███ ███░░███░░███░░███ 
\e[32m  ░███    █████  ░███  ░██   ░██   ░██  ░░█████   ░███     \e[0m  ░███░░░░░███ ░███████ ░███ ░░░ ░███ ░███ ░███ ░███ 
\e[32m ░███   ░░██    ░███  ░██   ░██   ░██    ░░░██   ░███      \e[0m  ░███    ░███ ░███░░░  ░███  ███░███ ░███ ░███ ░███ 
\e[32m   ░██████████   ████ █████  ░███████   ██████   ░░███     \e[0m  █████   █████░░██████ ░░██████ ░░██████  ████ █████
\e[32m   ░░░░░░░░░  ░░░░ ░░░░░    ░░░░░░   ░░░░░░     ░░░░       \e[0m░░░░░   ░░░░░  ░░░░░░   ░░░░░░   ░░░░░░  ░░░░ ░░░░░ 
                                                                                                          
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

read -p "Press enter to proceed"

#curl
echo -e "\e[1;31m [*] INSTALLING Curl\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
sudo apt-get -y install curl

#JQ
banner
echo -e "\e[1;31m [*] INSTALLING Jq\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
sudo apt-get -y install jq

#SHODAN
banner
echo -e "\e[1;31m [*] INSTALLING SHODAN\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
sudo apt install -y python3-shodan
banner

#MOVE DIR
banner
echo -e "\e[1;31m [*] FINISHING\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""


PATH_TO_TOOLS="/usr/share/GhostRecon"
sudo mkdir -p "$PATH_TO_TOOLS"

username=${SUDO_USER:-${USER}}
user_home="/home/$username"

mkdir -p "$user_home"/.config/GhostRecon

# Path to tools

# sudo curl -s -o "$PATH_TO_TOOLS/email_scanner.py" https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/tools/email_scanner.py
# sudo curl -s -o "$PATH_TO_TOOLS/phone_locator.py" https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/phone_locator.py
# sudo curl -s -o "$PATH_TO_TOOLS/uninstall.sh" https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/uninstall.sh
# sudo curl -s -o "/usr/bin/Grecon" https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/Grecon

sudo cp "$PWD"/tools/* "$PATH_TO_TOOLS"
sudo cp "$PWD"/Grecon /usr/bin/Grecon

sudo cp "$PWD"/install.sh "$PATH_TO_TOOLS"/install.sh

sudo chmod +x "$PATH_TO_TOOLS"/uninstall.sh /usr/bin/Grecon "$PATH_TO_TOOLS"/install.sh

echo ""
echo -e "\e[1;31m[*] GhostRecon 2.0 is installed/up to date\e[0m"
echo ""
#DONE :)
