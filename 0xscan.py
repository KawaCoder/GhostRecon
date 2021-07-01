#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 0xScan v2.0
# Developed by: Abdullah Alzahrani and Saud Alanzi

import argparse, requests, sys, re

print("""\n           \033[1;33mDeveloped by: Abdullah Alzahrani and Saud Alanzi\033[1;m \033[1;31m
          ______            ______   ______   ______  __    __
         /      \          /      \ /      \ /      \/  \  /  |
        /$$$$$$  |__v2.0__/$$$$$$  /$$$$$$  /$$$$$$  $$  \ $$ |
        $$$  \$$ /  \  /  $$ \__$$/$$ |  $$/$$ |__$$ $$$  \$$ |
        $$$$  $$ $$  \/$$/$$      \$$ |     $$    $$ $$$$  $$ |
        $$ $$ $$ |$$  $$<  $$$$$$  $$ |   __$$$$$$$$ $$ $$ $$ |
        $$ \$$$$ |/$$$$  \/  \__$$ $$ \__/  $$ |  $$ $$ |$$$$ |
        $$   $$$//$$/ $$  $$    $$/$$    $$/$$ |  $$ $$ | $$$ |
         $$$$$$/ $$/   $$/ $$$$$$/  $$$$$$/ $$/   $$/$$/   $$/ \033[1;m
         \033[1;30mAbdullah\033[1;m = {'\033[1;36mTwiiter\033[1;m': '\033[1;36m@0xAbdullah\033[1;m',  'GitHub.com': '0xAbdullah'}
         \033[1;30mSaud\033[1;m = {'\033[1;36mTwitter\033[1;m': '\033[1;36m@Dmaral3noz\033[1;m', 'GitHub.com': 'Dmaral3noz'}""")


parser = argparse.ArgumentParser(description="\033[1;33m[--]\033[1;m 0xSCAN website scanner")
parser.add_argument('-d', required=True, default=None, help='Target Website.')

args = vars(parser.parse_args())

if len(sys.argv) == 1:
    print("[\033[1;33m--\033[1;m] Usage: python3 0xscan.py -d example.com")
    sys.exit()

host = args['d']
if host.startswith('http'):
    sys.exit("\n\n\033[1;33m[ERROR] Enter domain name\n[EXAMPLE] python3 0xscan.py -d example.com\033[1;m ")

## ./START Scan common ports ##
def commonPorts():
    requ = requests.post("https://www.portcheckers.com/portscan-result", data={'server': host, "quick": "false"})
    resp = requ.text
    output = re.sub('<pre>|\t|</pre>|<div style="margin:10px 0 20px 0;"><h3>Port Scan Result</h3>|'
                    '<span style="display: inline-block;width:200px;">|</span><span class="label label-danger">|</span>'
                    '|<span class="label label-success">|', '', resp).strip().lstrip()

    output = output.replace("Not Available", " Not Available")
    print("├── Host: 127.0.0.1")
    for lines in str(output).splitlines():
        print("\t├── {}".format(lines))
## ./END Scan common ports ##

## ./START Reverse IP ##
def reverseIP():
    requ = requests.get("https://api.hackertarget.com/reverseiplookup/?q="+host)
    resp = requ.text
    output = resp
    print("├── Host: {}".format(host))
    for lines in str(output).splitlines():
        print("\t├── {}".format(lines))
## ./END Reverse IP ##

## ./START http Header ##
def httpHeader():
    requ = requests.get("https://api.hackertarget.com/httpheaders/?q="+host)
    resp = requ.text
    output = resp.strip().lstrip()
    print("├── Host: {}".format(host))
    for lines in str(output).splitlines():
        print("\t├── {}".format(lines))
## ./END http Header ##

## ./START TCP Port Scan ##
def TCPport():
    requ = requests.get("https://api.hackertarget.com/nmap/?q="+host)
    resp = requ.text
    output = resp.strip().lstrip()
    print("├── Host: {}".format(host))
    for lines in str(output).splitlines():
        print("\t├── {}".format(lines))
## ./END TCP Port Scan ##

## ./START Extract Links from Page ##
def ELFP():
    requ = requests.get("https://api.hackertarget.com/pagelinks/?q="+host)
    resp = requ.text
    output = resp.strip().lstrip()
    print("├── Host: {}".format(host))
    for lines in str(output).splitlines():
        print("\t├── {}".format(lines))
## ./END Extract Links from Page ##

## ./START Extract Links from Page ##
def IPlocation():
    requ = requests.get("https://api.hackertarget.com/geoip/?q="+host)
    resp = requ.text
    output = resp.strip().lstrip()
    print("├── Host: {}".format(host))
    for lines in str(output).splitlines():
        print("\t├── {}".format(lines))

## ./END Extract Links from Page ##

## ./START DNS lookup ##
def DNSlookup():
    requ = requests.get("https://api.hackertarget.com/dnslookup/?q="+host)
    resp = requ.text
    output = re.sub(';; Truncated, retrying in TCP mode.', '', resp).strip().lstrip()
    print("├── Host: {}".format(host))
    for lines in str(output).splitlines():
        print("\t├── {}".format(lines))
## ./END DNS lookup ##

def main():
    """
    print('''
├── Enter Number
\t├──[1] Nmap | TCP Port Scan
\t├──[2] Scan common ports
\t├──[3] Reverse IP
\t├──[4] HTTP Header
\t├──[5] DNS lookup
\t├──[6] IP Location
\t├──[7] Extract Links from Page
\t├──[0]\033[1;31m EXIT\033[1;m''')

    chose = int(input('\t└─  '))

    if chose == 1:
        TCPport()
    elif chose == 2:
        commonPorts()
    elif chose == 3:
        reverseIP()
    elif chose == 4:
        httpHeader()
    elif chose == 5:
        DNSlookup()
    elif chose == 6:
        IPlocation()
    elif chose == 7:
        ELFP()
    elif chose == 0:
        sys.exit(0)
    else:
        print("\t└─\033[1;31m incorrect!\033[1;m")
        main()

        returnChose = str(input("\t└─────── \033[1;33mDo you want to continue Y/n:\033[1;m "))
        if returnChose == 'Y' or returnChose == 'y':
            main()
        else:
            sys.exit(0)
            """
print("\033[1;33m___________   TCP port scan   _____________________________\033[1;m")
TCPport()
print("\n\n\n")


print("\033[1;33m___________   Common ports scan   _____________________________\033[1;m")
commonPorts()
print("\n\n\n")

print("\033[1;33m___________   Reverse IP   _____________________________\033[1;m")
reverseIP()
print("\n\n\n")

print("\033[1;33m___________   HTTP header scan   _____________________________\033[1;m")
httpHeader()
print("\n\n\n")

print("\033[1;33m___________   DNS lookup   _____________________________\033[1;m")
DNSlookup()
print("\n\n\n")

print("\033[1;33m___________   Common ports scan   _____________________________\033[1;m")
IPlocation()
print("\n\n\n")

print("\033[1;33m___________   Links sniffed   _____________________________\033[1;m")
ELFP()
print("\n\n\n")

if __name__ == '__main__':
    main()
