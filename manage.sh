#!/bin/bash
# Simple server management designed for the SouthHollow network
# Developed by ItsMCB 
# Need support? Contact me on Discord: ItsMCB#8964


SERVER_NAME="SouthHollow"
SERVERS_DIR="/home/Servers"


# DO NOT EDIT ANYTHING BELOW THIS.
VERSION=1.0

function home {
    clear
    echo "===== ${SERVER_NAME} - $(date)  ====="
    read -n 1 -p "Manage Server (m/s) | Check for Updates (u) | Close (q) " ans;
    case $ans in
        m|M|s|S)
            manageserver;;
        u|U)
            clear;
            echo "Version: ${VERSION} | Update feature coming soon!";
            read;
            home;;
        d|D)
            debug;;
        *)
            clear
            echo $'Peace!\n'
            exit;;
    esac
}

function manageserver {
    clear
    echo "===== ${SERVER_NAME} - $(date)  ====="
    read -n 1 -p "Select Server (s) | Open New Session (n) | Update Pre-existing Server (u) | Create New Server (c) | Go Back (q) " ans;
    case $ans in
        s|S)
            echo "Select server moment";;
        n|N)
            echo "Open new session moment";;
        c|C)
            echo "Create new server moment";;
        u|U)
            echo "Update pre-existing server moment";;
        q|Q)
            home;;
        *)
            exit;;
    esac
}


function debug {
    clear
    echo "===== ${SERVER_NAME} - $(date)  ====="
    read -n 1 -p $'Debug Menu.... Press q to go back\n' ans;
    case $ans in
        u|U)
            for i in 1 2 3 4 5;
            do
                echo $'\nHoi' $i
            done;;
        q|Q)
            home;;
        *)
            exit;;
    esac
}


home













# Testing, ignore.
PS3='Please enter your choice: '
options=("Server Manager" "Bungee Restart" "Option 3 y33t" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Server Manager")
            echo "you chose choice 1"
            ;;
        "Bungee Restart")
            echo "you chose choice 2"
            ;;
        "Option 3 y33t")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "Hey, $REPLY is an invalid option";;
    esac
done