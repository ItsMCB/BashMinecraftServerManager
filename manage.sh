#!/bin/bash
# Simple server management designed for the SouthHollow network
# Developed by ItsMCB 
# Need support? Contact me on Discord: ItsMCB#8964


SERVER_NAME="SouthHollow"
SERVERS_DIR="/home/Servers/"
TEMPLATSERVERS_DIR="/home/ServerTemplates/"
BACKUP_DIR="/home/ServerBackup/"



# DO NOT EDIT ANYTHING BELOW THIS.
BUILD=2

home() {
    clear
    echo "===== ${SERVER_NAME} - $(date)  ====="
    read -p "Manage a Server or Tmux Session (m/s) | Check for Manage.sh Updates (u) | Close (q) " ans;
    case $ans in
        m|M|s|S)
            manageserver;;
        u|U)
            clear;
            echo "Build: ${BUILD}";
            echo "Tmux Version:"
            tmux -V
            read temp; # Pause
            home;;
        d|D)
            debug;;
        *)
            clear
            echo $'Peace!\n'
            exit;;
    esac
}

manageserver() {
    clear
    echo "===== ${SERVER_NAME} - $(date)  ====="
    echo "Select Server (s)"
    echo "Open a New Tmux Session (n)"
    echo "Update Pre-existing Server From a Template (u)"
    echo "Create New Server (c)"
    read -p "Go Back (q) " ans;
    case $ans in
        s|S) # Select Server
            echo "--------------------"
            tmux ls
            echo "--------------------"
            echo "Which server would you like to select? | q to cancel"
            read server
            if [ $server = "q" ]
            then
            manageserver;
            else
            tmux a -t $server;
            fi;;
        n|N)
            echo "What would you like the session to be called?"
            read sessionname
            if [ $sessionname = "q" ]
            then
            manageserver;
            else
            tmux new -s $sessionname
            fi;;
        c|C)
            echo "Create new server moment";;
        u|U)
            updateservertemplate;;
        q|Q)
            home;;
        *)
            exit;;
    esac
}



updateservertemplate() {
    clear
    echo "===== ${SERVER_NAME} - Updater  ====="
    echo "Which server would you like to update? - (q to cancel)"
    read updatethisserver
    if [ ${updatethisserver} = "q" ]; then
    manageserver;
    elif [ -z ${updatethisserver} ]; then
    echo "BAD IDEA. You understand you're targeting the whole server directory, right? Don't worry. I'll reset your mistake."
    read temp
    updateservertemplate
    else
    # Wants to update a server through a template
    echo "You want to update '${updatethisserver}', correct? (y/n)"
    read confirmupdateservertemplate
    if [ $confirmupdateservertemplate = "n" ]
    then
    updateservertemplate;
    else
    TEMPLATESERVERLOC=${TEMPLATSERVERS_DIR}${updatethisserver} #Template Serv Loc
    ORIGINSERVERLOC=${SERVERS_DIR}${updatethisserver} # Production Serv Loc
    BACKUP_DIR=${BACKUP_DIR}${updatethisserver} # Backup Loc
    cp -R ${ORIGINSERVERLOC}* ${BACKUP_DIR} # Make a quick backup to avoid catastrophes 
    echo "Made a copy of ${ORIGINSERVERLOC} to ${BACKUP_DIR}"
    echo "Now removing files from ${ORIGINSERVERLOC}..."
    rm -r ${ORIGINSERVERLOC} # Deletes the origin folder
    echo "Writing over data for ${ORIGINSERVERLOC} from ${TEMPLATESERVERLOC}..."
    cp -R ${TEMPLATESERVERLOC}* ${SERVERS_DIR} # Copy template to production
    echo "Done! Press any key to return."
    read temp
    manageserver
    fi
    fi
}









# Testing out interesting things I can do in bash

debug(){
    clear
    echo "===== ${SERVER_NAME} - Debug Menu - $(date)  ====="
    read -p $'U | Q' ans;
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


home # Call the home to open
