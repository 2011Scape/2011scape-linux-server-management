#!/bin/bash

# Navigate to the game directory
cd game

# Fetch the latest changes from the origin
git fetch origin

# Checkout the main branch
git checkout main

# Merge changes from origin/main
git merge origin/main

# Navigate up a directory and run the restart script
cd ..
# ./restart.sh
