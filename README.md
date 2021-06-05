# osc_assignment



# Author details
Name: Kaleb Cowie
Student Code: cowikj1 
Last editied: 5/06/2021



# Task1 
The point of this script is to ingest a csv file (local or remote) that contains user infomation that will help with running the script as it has all the users details that we need. with this it will then create the users, passwords and groups you can added as many users you want just add them to the csv file. 
The only pre-requisites is to have the csv file made with a similar structre:
email,date,group,folder
data,data,data,data

Then once you have that then do the command bash taskuno.sh then follow these steps:
1. Enter the csv file
2. It will then come up with your details to make sure they are correct, it will then ask you if you want to contiune then enter (Y/N)
3. if Y it will start making the user and if the person already exsits there is a prompt telling you so, there will then then be a prompt saying "Im checking stuff" this is just making sure that the user is in a group.
4. If the use in not part of a group the script will create a default group and assign that user to the default group. if user is already in group it will still say they were assigned to that same group.
5. It will then create a symbolic link between the users shared folder which is like a shortcut to the shared folder.






# Task2
The purpose of this script is for the user to be able to tar a file or folder. Tar is a command used to create a compressed archive file this could be done to something to make it easier to move from one machine to another or to just take up less room in your drive. There are no pre-requisties for running this script. 

How to run task2:
1. use command "bash task2.sh"
2. follow prompts given
3. The script will do the rest
