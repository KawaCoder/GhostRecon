#!/bin/bash

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
   __/__/_______/___/__\___\__________________________________________________."
        echo -e "\e[1;31m                       !!!  INSTALLING ALL REQUIREMENTS  !!!\e[0m"
        echo -e "\e[1;31m                       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  \e[0m"
        echo ""
        echo ""
        echo ""
   }
banner
echo ""
echo ""

#PYTHON
echo -e "\e[1;31m [*] INSTALLING PYTHON VERSIONS\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
apt-get install python
apt-get install python2
apt-get install python3
apt-get install python3-pip
echo ""
#osrframework
echo -e "\e[1;31m [*] INSTALLING OSRFRAMEWORK\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
pip3 install osrframework
echo ""
#NIKTO
echo -e "\e[1;31m [*] INSTALLING NIKTO\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
sudo apt-get install nikto
sudo apt-get install nikto -y
echo ""
#SPIDERFOOT
echo -e "\e[1;31m [*] INSTALLING SPIDERFOOT\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
git clone https://github.com/smicallef/spiderfoot.git
mv spiderfoot /root/
cd
cd spiderfoot/
pip3 install -r requirements.txt
echo ""
#SHODAN
echo -e "\e[1;31m [*] INSTALLING SHODAN\e[0m"
echo "-------------------------------------------------------------------------------"
echo ""
easy_install shodan
read -p "Shodan API key (REQUIRED): " shodan
echo ""
shodan init $shodan

echo ""
echo "DONE!"
#DONE
