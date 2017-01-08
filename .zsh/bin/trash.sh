#!/bin/bash

TRASH_DIR=/home/warlock/.trash
SUB_DIR=$(date +%m%d%Y)

# Order trash directory by date
CURR_TRASH_DIR=$TRASH_DIR/$SUB_DIR/

if [[ $1 == "--help" || $1 == "-h" || $# == 0 ]]; then
    echo " "
    echo "#-----------------------------------------#"
    echo "|              Trash script               |"
    echo "#-----------------------------------------#"
    echo "moves the files that are to be removed to the trash directory i.e ~/.trash."
    echo "you can manually clean the directory once a while to delete old trash"
    echo " "
    echo "Usage::"
    echo "$0 FOLDER_1 FOLDER_2 FILE_3.txt FILE_4.mp4 ...."
    echo " "
else
    # Create the trash dir if it doesn't exist
    /bin/mkdir -p $TRASH_DIR/$SUB_DIR

    # If there are folder conflicts they are automatically numbered
    # for example, hello, hello~, hello~1
    /bin/mv --backup=simple --suffix="" $@ $CURR_TRASH_DIR
fi

