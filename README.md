# 2011Scape Game Server Management
## Linux/Ubuntu 22.04 LTS
This repository contains scripts for managing the 2011Scape game server and file server in Linux Server CLI environment. The scripts are installed in the `/opt/2011Scape` directory.

## Setup

1. Ensure that the scripts are executable by running the following command:

```bash
chmod +x /opt/2011Scape/*.sh
```

## Starting the Game Server

To start the game server, run the `game-server.sh` script:

```bash
/opt/2011Scape/game-server.sh
```

This script will start a new `screen` session named "game-server" and run the game server in that session. The game server will be started in the `/opt/2011Scape/game/` directory, and the `./gradlew game:run build -x test` command will be executed.

## Starting the File Server

To start the file server, run the `file-server.sh` script:

```bash
/opt/2011Scape/file-server.sh
```

This script will start a new `screen` session named "file-server" and run the file server in that session. The file server will be started in the `/opt/2011Scape/file-server/` directory, and the `./gradlew run` command will be executed.

## Restarting the Game Server

To restart the game server, run the `restart.sh` script:

```bash
/opt/2011Scape/restart.sh
```

This script will check if a `screen` session named "game-server" exists. If the session exists, it will send a `Ctrl+C` command to gracefully stop the server, wait for 5 seconds, and then kill the session. After terminating the existing session, the script will start a new "game-server" session and run the game server in that session, similar to the `game-server.sh` script.

## Maintaining the Game Server

1. To attach to the "game-server" or "file-server" `screen` sessions, run `screen -r game-server` or `screen -r file-server`, respectively.
2. This will allow you to view the output of the servers and interact with them if needed.
3. To detach from a `screen` session, press `Ctrl+A` followed by `Ctrl+D`.
4. If you need to stop the game server or file server manually, attach to the respective `screen` session and send a `Ctrl+C` command to stop the process gracefully.

Note: These scripts assume that the necessary dependencies and configurations are already in place for running the game server and file server. Make sure to set up the required environments and configurations before using these scripts.
