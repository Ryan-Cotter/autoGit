#!/bin/bash
set -e

LOGFILE="/home/swarm/sysadmin_scripts/autoGit/increment.log"

echo "$(date): Incrementing counter..." >> $LOGFILE
cd /home/swarm.sysadmin_scripts/autoGit || exit 1

if [ ! -f counter.txt ]; then
  echo "0" > counter.txt
fi

counter=$(cat counter.txt)
((counter++))
echo "$counter" > counter.txt

# Log the counter update
echo "$(date): Counter updated to $counter" >> $LOGFILE

git add counter.txt
git commit -m "Auto increment: $counter"
git push origin main

# Log the completion of the push
echo "$(date): Git push completed" >> $LOGFILE
