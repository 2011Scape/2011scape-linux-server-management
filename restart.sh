#!/bin/bash

# The name of the screen session
SESSION_NAME="game-server"

# Check if the screen session exists
if screen -list | grep -q "$SESSION_NAME"; then
  # Send Ctrl+C to gracefully stop the server
  screen -S "$SESSION_NAME" -X stuff '^C'
  
  # Wait for a few seconds to ensure the server has completely stopped
  sleep 5
  
  # Kill the screen session (if it's still running for some reason)
  screen -S "$SESSION_NAME" -X quit
fi

# Start the game server in a new screen session
screen -dmS $SESSION_NAME bash -c 'cd /opt/2011Scape/game/ && ./gradlew game:run build -x test'
