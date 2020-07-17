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
#IP TRACER
echo -e "\e[1;31m [*] INSTALLING IP-TRACER\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
git clone https://github.com/rajkumardusad/IP-Tracer.git
cd IP-Tracer
chmod +x install
./install
echo ""
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
#osrframework
echo -e "\e[1;31m [*] INSTALLING OSRFRAMEWORK\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
apt install osrframework
sudo apt-get install osrframework
pip3 install osrframework
echo ""
#NIKTO
echo -e "\e[1;31m [*] INSTALLING NIKTO\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
sudo apt install nikto
sudo apt-get install nikto
sudo apt-get install nikto -y
echo ""
#SPIDERFOOT
echo -e "\e[1;31m [*] INSTALLING SPIDERFOOT\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
git clone https://github.com/smicallef/spiderfoot.git
mv spiderfoot /root/
cd
cd spiderfoot/
pip3 install -r requirements.txt
echo ""
#SHODAN
echo -e "\e[1;31m [*] INSTALLING SHODAN\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
sudo easy_install shodan
easy_install shodan
sudo pip install shodan
echo ""
echo "HOW TO GET API KEY: https://www.youtube.com/watch?v=nAcaAr00yjI"
echo ""
read -p "SHODAN API KEY (REQUIRED): " shodan
echo ""
shodan init $shodan
echo ""
#MOVE DIR
echo -e "\e[1;31m [*] MOVING DIRECTORIES\e[0m"
echo "-------------------------------------------------------------------------------------------------------------"
echo ""
cp Grecon /usr/bin/
cp firefly /root/

echo ""
echo -e "\e[1;31m[*] DONE YOU CAN NOW EXECUTE IT BY TYPING (Grecon)\e[0m"
echo ""
#DONE :)
