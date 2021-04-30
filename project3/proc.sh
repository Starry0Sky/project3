#! /bin/bash
while true
do
	echo "(please enter the number of your selection below)"
	echo -e "1.Show all processes\n2.kill a process\n3.Bring up top\n4.Return to Main Menu\n"
	read ch
	case $ch in
	    1)
		    ps -ef
		    ;;
	    2)
                    echo Please enter thr PID of the process you wounld like to kill
		    read ki
		    kill ki
		    ;;
	    3)
		    top
		    ;;
            4)
		    exit 0
		    ;;
            *)
		    ;;
     esac
done
