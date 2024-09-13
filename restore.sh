#!/bin/bash

# set source and destination directories
SOURCE_DIRS=( "/opt/2011Scape/backup/saves" "/opt/2011Scape/backup/cache" "/opt/2011Scape/backup/xteas" )
DEST_DIRS=( "/opt/2011Scape/game/data/saves" "/opt/2011Scape/game/data/cache" "/opt/2011Scape/game/data/xteas" )

for index in ${!SOURCE_DIRS[*]}; do
    SOURCE_DIR="${SOURCE_DIRS[$index]}"
    DEST_DIR="${DEST_DIRS[$index]}"

    # check if source directory exists
    if [ ! -d "$SOURCE_DIR" ]; then
        echo "Error: Source directory $SOURCE_DIR does not exist."
        exit 1
    fi

    # check if destination directory exists
    if [ ! -d "$DEST_DIR" ]; then
        echo "Error: Destination directory $DEST_DIR does not exist."
        exit 1
    fi

    # find the most recent backup file (only consider zip files)
    BACKUP_FILE=$(ls -t $SOURCE_DIR/*.zip | head -n 1)

    # check if backup file exists
    if [ ! -f "$BACKUP_FILE" ]; then
        echo "Error: Backup file $BACKUP_FILE does not exist."
        exit 1
    fi

    # remove current data
    echo -e "\033[31mDeleting all current files in: $DEST_DIR\033[0m"
    rm -rf $DEST_DIR/*

    # move to the destination directory and restore from the most recent backup
    cd "$DEST_DIR" || exit
    if ! unzip -o "$BACKUP_FILE"; then
        echo "Error: Failed to restore from backup $BACKUP_FILE"
        exit 1
    fi

    echo "Data restored from backup $BACKUP_FILE to $DEST_DIR"
done

