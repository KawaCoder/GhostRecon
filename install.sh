#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
# License holder: -

#COMMANDS
clear

function get_version() {
  local file_path="$1"
  local version_line
  version_line=$(sed -n '2p' "$file_path")
  local version_number
  version_number=$(echo "$version_line" | cut -d ' ' -f 3)
  echo "$version_number"
}


echo -e "This script will:\n-Install Curl\n-Install Jq\n-Install shodan framework.\n"

function banner {
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

# Install Curl, Jq, Shodan, and Exiv2
sudo apt-get -y install curl jq python3-shodan exiv2

# Create directory for tools
PATH_TO_TOOLS="/usr/share/GhostRecon"
PATH_TO_REPORTS="$HOME/.config/GhostRecon"
sudo mkdir -p "$PATH_TO_TOOLS" "$PATH_TO_REPORTS"

# Update tools
banner
echo -e "\e[1;31m [*] UPDATING SCRIPTS\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""

sudo curl -s -o "$PATH_TO_TOOLS/email_scanner.py" "https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/tools/email_scanner.py"
sudo curl -s -o "$PATH_TO_TOOLS/phone_locator.py" "https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/tools/phone_locator.py"
sudo curl -s -o "$PATH_TO_TOOLS/uninstall.sh" "https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/tools/uninstall.sh"
sudo curl -s -o "$PATH_TO_TOOLS/install.sh" "https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/install.sh"
sudo curl -s -o "/usr/bin/Grecon" "https://raw.githubusercontent.com/KawaCoder/GhostRecon/master/Grecon"

# Make scripts executable
sudo chmod +x "$PATH_TO_TOOLS"/uninstall.sh /usr/bin/Grecon "$PATH_TO_TOOLS"/install.sh

version_local=$(get_version "/usr/bin/Grecon")
api_response=$(curl -s https://api.github.com/repos/KawaCoder/GhostRecon/branches/master)
lastcommitmessage=$(echo "$api_response" | jq -r '.commit.commit.message')
lastupdate_date=$(echo "$api_response" | jq -r '.commit.commit.author.date')
echo ""
echo -e "\e[1;31m  VERSION: $version_local $lastupdate_date by DR34M-M4K3R\e[0m"
echo "----------------------------------------------------------------------------"
echo "$lastcommitmessage"
echo "----------------------------------------------------------------------------"
echo "You can restart GhostRecon "



