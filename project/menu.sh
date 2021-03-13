
#!/bin/bash
### Module contain the menu driver
### Function display the menus
function displayMenu {
	echo "Apache2 menu"
	echo "---------"
	echo "1-list all virtual hosts"
	echo "2-add a new virtual host"
	echo "3-Enable virtual host"
	echo "4-Disable virtual host"
	echo "5-Delete virtual host"
	echo "6-Enable authentication  for a certain virtualhost"
	echo "7-Disable authentiation for a certain virtualhost"
	echo "8-Return to main menu"
	echo "9-Quit"

}

	
function mainMenu {
	echo "Mainmenu"
	echo "----------"
	echo "1-Install apache2"
	echo "2-Uninstall apache2"
	echo "3-Go to apache2 menu"
	echo "4-Quit"
}

function runMainMenu {
	mainMenu
	local choice
	echo "Enter Your choice"
	local fl=1
	while [ ${fl} -eq 1 ]
	do
	read choice
	case ${choice} in 
		"1")
			source script.sh
			;;
		"2")
			source removeapache2.sh
			;;
		"3")
			runMenu
			;;
		"4")
			fl=0
                       	;;
		*)
			echo "Invalid choice, please try again"
                        ;;
		esac
		if [ ${fl} -eq 1 ]
		then
			mainMenu
		fi
		done

}

###Function control apache2 menu operations
function runMenu {
	displayMenu
	local CH
	echo "Enter your choice"
	local FLAG=1
	while [ ${FLAG} -eq 1 ]
	do
	read CH
	case ${CH} in
		"1")
			
			source listvs.sh
			
			;;
		"2")

			source createvs.sh

			;;
                "3")

                        source enable.sh

                        ;;

                "4")

                        source disable.sh

                        ;;

                "5")

                        source remove.sh

                        ;;
                "6")

                        source enableauth.sh

                        ;;
                "7")

                        source disableauth.sh

                        ;;
		
		"8")
			runMainMenu
			;;
		"9")
			FLAG=0
			;;
		*)
			echo "Invalid choice, please try again"
			;;
	esac
	if [ ${FLAG} -eq 1 ]
	then
		displayMenu
	fi
	done
}


runMainMenu
