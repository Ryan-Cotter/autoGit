#!/bin/bash
cd /home/swarm/sysadmin_scripts/autoGit
echo "Running from: $(pwd)" >> cron_output.log

LOGFILE="/home/swarm/sysadmin_scripts/autoGit/cron_output.log"
COUNTER_FILE="/home/swarm/sysadmin_scripts/autoGit/counter.txt"
MAX_COMMITS=10

# Choose a random number of commits from a weighted list
commit_weights=(1 1 1 2 2 3 4 5 7 10)
commits=${commit_weights[$RANDOM % ${#commit_weights[@]}]}

# Log the action
echo "$(date): Generating $commits commits" >> "$LOGFILE"

# Increment the counter by a random number of commits
for i in $(seq 1 $commits); do
    # Random commit message from the list
    COMMIT_MSGS=("update 🔄" "log increment 📈" "tweak counter" "autopush" "cron commit")
    MSG=${COMMIT_MSGS[$RANDOM % ${#COMMIT_MSGS[@]}]}
    echo "$(date): Commit #$i - $MSG" >> "$LOGFILE"

    # Simulate a commit here or your Git push logic
    echo "Commit #$i" >> "$COUNTER_FILE"
    git add "$COUNTER_FILE"
    git commit -am "$MSG"  # Commit with the random message
    git push origin main   # Push the changes
done
