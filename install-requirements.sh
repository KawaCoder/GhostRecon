#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
# License holder: DR34M-M4K3R#7751

#COMMANDS
clear

function banner
    {
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

#BANNER EXTRA
clear
banner
#PYTHON
echo -e "\e[1;31m [*] INSTALLING PYTHON VERSIONS\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
sudo apt-get install python
sudo apt-get install python-pip
sudo apt-get install python2
sudo apt-get install python3
sudo apt-get install python3-pip
sudo apt-get install python-setuptools
echo ""
#phonelocator
echo -e "\e[1;31m [*] INSTALLING ANONIMITY\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
cd
git clone https://github.com/Und3rf10w/kali-anonsurf.git
cd kali-anonsurf/
./installer.sh
echo ""
#phonelocator



#SHODAN
echo -e "\e[1;31m [*] INSTALLING SHODAN\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
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
echo -e "\e[1;31m [*] MOVING DIRECTORIES\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
cd



pathtogrecon=$(find /home/$USER -type f -iname "Grecon")
chmod +x $pathtogrecon


cp -v $pathtogrecon /usr/bin/


echo ""
echo -e "\e[1;31m[*] DONE YOU CAN NOW EXECUTE IT BY TYPING Grecon\e[0m"
echo ""
#DONE :)
