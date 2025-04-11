#!/bin/bash

set -e  # Exit on error

# Go to project directory
cd ~/Sysadmin\ scripts/autoGit || exit 1

# Create counter.txt if it doesn't exist
if [ ! -f counter.txt ]; then
  echo 0 > counter.txt
fi

# Increment the counter
counter=$(cat counter.txt)
((counter++))
echo "$counter" > counter.txt

# Commit and push
git add counter.txt
git commit -m "Auto increment: $counter"
git push origin main  # or your branch
