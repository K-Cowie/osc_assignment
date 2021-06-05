#!/bin/bash

csv() {
numofusers=0

echo -e "Enter name of csv file"
read uploadfile

while IFS="," read -r email date group folder 
do :
	
first=$(echo "$email" | sed 's/^[^.]*.//' | sed 's/@.*//')
second=${email:0:1}
username+=("$first$second")

third=$(echo "${date:5}" | sed 's/[/].*//')
four=$(echo "$date" | sed 's/[/].*//')
password+=("$third$four")

groups+=("$group")
folders+=("$folder")

let numofusers++ 
done < <(tail -n +2 $uploadfile)

for x in "${!username[@]}" 
do :

echo "PLEASE CHECK THE DETAILS BELOW ARE CORRECT"
echo "username ${username[$o]}"
echo "password ${password[$o]}"
echo "group ${groups[$o]}"
echo "folder ${folders[$o]}"


done

echo "there is ${numofusers} being created"
echo "would you like to contiune? (Y/N)" 
read contiune

case "$contiune" in 
[Yy])
echo "Now making users...."
loop
;;
[Nn])
echo "Exiting"
exit 0
;; 
esac
}



usercreation () {
if sudo grep -q ${username[$o]} /etc/passwd; then
echo "this person already exists"
else
sudo useradd -d /home/${username[$o]} -m -s /bin/bash ${username[$o]}
echo ${username[$0]}:${password[$o]} | sudo chpasswd
sudo chage -d0 ${username[$o]}
fi
}


groupcreation () {
echo "I am checking stuff"
if [ -z "${username[$o]}" ]; then 
echo "No specified group for ${username[$o]}, going to put in default group."
sudo groupadd default 2> /dev/null


if [ $? -eq 0 ]; then
echo "Group 'default' has been created"
sudo usermod -a -G default ${username[$o]}
echo "${username[$o]} has been added to the default group"
else 
sudo usermod -a -G default ${username[$o]}
echo "${username[$0]} has been added to the default group"

fi

elif grep -q ${groups[$o]} /etc/group; then
echo "${groups[$o]} already is there"
sudo usermod -a -G ${groups[$o]} ${username[$o]}
echo "${username[$o]} is now assigned to ${groups[$o]}"
else
echo "${group[$o]} is being created"
sudo groupadd "${groups[$o]}"
sudo usermod -a -G ${groups[$o]} ${username[$o]}
echo "${username[$o]} is now assigned to ${groups[$o]}"

fi
}


foldercreation() {
if [ -z "${folders[$o]}" ]; then

echo "No folder found for ${username[$o]}, added to the default folder"
sudo mkdir /home/folder 2> /dev/null

if [ $? -eq 0 ]; then 
echo "default has been created"

elif [ -z ${folders$[$o]} ]; then
sudo chgrp -R default /home/folder
sudo chmod -R 2775 /home/folder
sudo ln -s /home/folder /home/${username[$o]}
 
if [ $? -eq 0 ]; then
echo "created link"
fi 

else
sudo chgrp -R ${folders[$o]} /home/folder
sudo chmod -R 2775 /home/folders
sudo ln -s /home/folder /home/${folders[$o]}

if [ $? -eq 0 ]; then
echo "created link"
fi

fi
elif [ -d /home/${folders[$o]} ]; then
echo "${username[$o]} this folder already exists"
sudo chgrp -R ${groups[$o]} /home/${folders[$o]}
sudo chmod -R 2775 /home/${folders[$o]}
sudo ln -s /home/${folders[$o]} /home/${username[$o]}

if [ $? -eq 0 ]; then
echo "created link"
fi
 
else
echo "Making the folder for ${username[$o]}"
sudo mkdir /home/${folders[$o]}
sudo chgrp -R ${groups[$o]} /home/${folders[$o]}
sudo chmod -R 2775 /home/${folders[$o]}
sudo ln -s /home/${folders[$o]} /home/${username[$o]}

	if [ $? -eq 0 ]; then
	echo "created link"
	fi

fi
}








loop() {
for o in "${username[@]}"
do
usercreation
groupcreation
foldercreation 
done
}

csv




