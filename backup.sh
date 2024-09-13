#!/bin/bash

# set source and destination directories
SOURCE_DIRS=( "/opt/2011Scape/game/data/saves" "/opt/2011Scape/game/data/cache" "/opt/2011Scape/game/data/xteas" )
DEST_DIRS=( "/opt/2011Scape/backup/saves" "/opt/2011Scape/backup/cache" "/opt/2011Scape/backup/xteas" )

# generate the current date in the format YYYYMMDD
DATE=$(date +%Y%m%d)

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

    # set the backup filename
    BACKUP_FILE="backup-$DATE.zip"

    # move to source directory, create the backup, check if operation was successful
    if ! (cd "$SOURCE_DIR" && zip -r "$DEST_DIR/$BACKUP_FILE" .); then
        echo "Error: Failed to create backup $BACKUP_FILE in $DEST_DIR"
        exit 1
    fi

    echo "Backup $BACKUP_FILE created in $DEST_DIR"

    # keep only the three most recent backups, check if operation was successful
    if ! (cd "$DEST_DIR" && ls -t | sed -e '1,3d' | xargs -d '\n' rm -f --); then
        echo "Error: Failed to delete old backups in $DEST_DIR"
        exit 1
    fi
done

