#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
# License holder: DR34M-M4K3R#7751

#COMMANDS
clear


# ROOT
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  echo "Your not rooted, please root your Terminal."
  exit 1
fi

function banner
    {
      clear
      echo "
                            ____ _               _   ____
                           / ___| |__   ___  ___| |_|  _ \ ___  ___ ___  _ __
                          | |  _| '_ \ / _ \/ __| __| |_) / _ \/ __/ _ \| '_ \.
               /\.        | |_| | | | | (_) \__ \ |_|  _ <  __/ (_| (_) | | | |
              /**\.        \____|_| |_|\___/|___/\__|_| \_\___|\___\___/|_| |_|
             /****\   /\.             DEVELOPER: MZZGAMER | VERSION: V.1.2 by DR34M-M4K3R
            /      \ /**\.
           /  /\    /    \        /\    /\  /\      /\            /\/\/\  /\.
          /  /  \  /      \      /  \/\/  \/  \  /\/  \/\  /\  /\/ / /  \/  \.
         /  /    \/ /\     \    /    \ \  /    \/ /   /  \/  \/  \  /    \   \.
         /  /      \/  \/\   \  /      \    /   /    \.
         __/__/_______/___/__\___\_______________________________________________________."
        echo -e "\e[1;31m                             !!!  INSTALLING ALL REQUIREMENTS  !!!\e[0m"
        echo -e "\e[1;31m                             !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  \e[0m"
        echo ""
        echo ""
        echo ""

echo ""
echo -e "\e[1;31m !!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e "\e[1;31m !!!  WIFI REQUIRED  !!!\e[0m"
echo -e "\e[1;31m !!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo ""
  }
banner

cd


#BANNER EXTRA
clear
banner
#PYTHON
echo -e "\e[1;31m [*] INSTALLING PYTHON VERSIONS\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
sudo apt-get install -y python
sudo apt-get install -y python-pip
sudo apt-get install -y python2
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y python-setuptools
echo ""
#phonelocator
banner
echo -e "\e[1;31m [*] INSTALLING ANONIMITY\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
cd
git clone https://github.com/Und3rf10w/kali-anonsurf.git
cd kali-anonsurf/
./installer.sh
echo ""



#NMAP
banner
echo -e "\e[1;31m [*] INSTALLING Nmap\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
apt-get install -y nmap


#SHODAN
banner
echo -e "\e[1;31m [*] INSTALLING SHODAN\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
sudo pip install shodan
echo ""
echo -e "\e[1;31m[*] HOW TO GET API KEY: https://www.youtube.com/watch?v=nAcaAr00yjI\e[0m"
echo ""
read -p "SHODAN API KEY (REQUIRED): " shodan
echo ""
shodan init $shodan
echo ""
#MOVE DIR
banner
echo -e "\e[1;31m [*] MOVING DIRECTORIES\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
cd



chmod +x GhostRecon/Grecon

chmod +x GhostRecon/uninstall.sh


cp -v GhostRecon/Grecon /usr/bin/


echo ""
echo -e "\e[1;31m[*] DONE YOU CAN NOW EXECUTE IT BY TYPING Grecon\e[0m"
echo ""
#DONE :)
