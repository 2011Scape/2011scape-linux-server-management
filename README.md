# 2011Scape Game Server Management

This repository contains scripts for managing the 2011Scape game server and file server. The scripts are installed in the `/opt/2011Scape` directory.

## Prerequisites

Before using these scripts, you need to install the following dependencies:

### Install OpenJDK 11

```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
```

### Install Gradle 7.2

```bash
sudo mkdir /opt/gradle
sudo wget https://services.gradle.org/distributions/gradle-7.2-bin.zip -P /tmp
sudo unzip -d /opt/gradle /tmp/gradle-7.2-bin.zip
sudo ln -s /opt/gradle/gradle-7.2/bin/gradle /usr/bin/gradle
```

### Install Git

```bash
sudo apt install git -y
```

## Setup

1. Clone the server management repository with the game and file-server submodules:

```bash
sudo git clone --recursive=https://github.com/2011Scape/game.git https://github.com/2011Scape/file-server.git https://github.com/2011Scape/2011scape-linux-server-management.git /opt/2011Scape
```

This command will clone the server management repository and automatically initialize and update the game and file-server submodules.

2. Ensure that the scripts are executable by running the following command:

```bash
sudo chmod +x /opt/2011Scape/*.sh
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
