#! /bin/bash
while true
do
echo $(date)
echo ----------------------------------------------
echo Main Menu
echo ----------------------------------------------
echo -e "1.Operating system info\n2.Hostname and DNS info\n3.Network info\n4.Who is online\n5.Last logged in users\n6.My IP address\n7.My disk usage\n8.My home file-tree\n9.Process operations\n10.Exit"
echo -n Enter your choice [ 1 - 10 ]  
read choice
case $choice in
	1)
		echo ----------------------------------------------
		echo System information
		echo ----------------------------------------------
		/usr/bin/lsb_release -a
		;;
	2)
	        echo ----------------------------------------------
                echo Hostname and DNS information
                echo ---------------------------------------------
		echo Hostname : $(hostname | awk -F"." '{print $1}')
		echo DNS domain : $(hostname | awk -F"." '{print $2}')
		echo Fully qualified domain name : $(hostname)
		echo Network adderess '(IP)' : $(hostname -i | awk '{print $2}')
		echo DNS name servers '(DNS IP)' : $(cat /etc/resolv.conf | grep name | awk '{print $2}')

		;;
	3)
	        echo ----------------------------------------------
                echo Network information
                echo ----------------------------------------------
		echo "*** IP Addresses Information ***"
		ip addr show
		echo "***********************"
		echo "*** Network routing ***"
                echo "***********************"
		netstat -r
		echo "*************************************"
		echo "*** Interface traffic information ***"
		echo "*************************************"
		netstat -i
		;;
	4)
                echo ----------------------------------------------
                echo Who is online
                echo ----------------------------------------------
		who -H
		;;
	5)
                echo ----------------------------------------------
                echo Last logged in users
                echo ----------------------------------------------
		lastlog | grep -v "**Never logged in**"
		;;
	6)
                echo ----------------------------------------------
                echo My IP address
                echo ----------------------------------------------
		hostname -i | awk '{print $2}'
		;;
	7)
                echo ----------------------------------------------
                echo My disk usage 
                echo ----------------------------------------------
		df | awk 'NR==1 {next} {print $5,"  ",$6}'
		;;
	8)
                echo ----------------------------------------------
                echo My Home file-tree
                echo ----------------------------------------------
		./project1.sh ~ /project3/filetree.html
		;;
	9)
                echo ----------------------------------------------
                echo Process operations
                echo ----------------------------------------------
		./proc.sh
		;;
	10)
		exit 0
		;;
	*)
		echo "Invalid Input"
		;;
esac
echo -n Press [Enter] key to continue...
read en
while true
do
	if [ en=="Enter" ] 
	then
		break
	fi
done
done
