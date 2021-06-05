#!/bin/bash


getinfo() {
echo -e  "Enter directory you would like to use: " 
read dir 

echo -e "Enter the port number" port 
read port

echo -e "Enter username"
read username 

echo -e "Enter the ip address of remote server"
read address


echo -e "Enter the destination of the file"
read destination
backup
}



backup () {
echo -e "What would you like to name your backup file"
read filename

filename+=".tar.gz"

sudo tar -zcvf $filename $dir
send $filename
}

send () {
sudo scp -P $port $1 $user@$address:"$destination"
}
 
getinfo

  
