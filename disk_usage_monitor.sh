#!/bin/bash

WATCH_DIR=${1:-"/"} # Directory to monitor (default: "/")
THRESHOLD=${2:-80}  # Alert threshold in percentage (default: 80%)
LOG_FILE="disk_usage_log.txt"   # Log file
TELEGRAM_BOT_TOKEN="<YOUR_BOT_TOKEN>" # Replace <YOUR_BOT_TOKEN> with yours
TELEGRAM_CHAT_ID="<YOUR_CHAT_ID>"  # Replace <YOUR_CHAT_ID> with yours

monitor_disk_usage() {
    echo "### Disk usage monitor for $WATCH_DIR ###"
    date
    echo "Alert threshold: $THRESHOLD%"

    # Get the percentage of disk usage for the directory
    usage=$(df "$WATCH_DIR" | awk 'NR==2 {print $5}' | sed 's/%//')

    # Alert if usage exceeds the threshold
    if [ "$usage" -ge "$THRESHOLD" ]; then
        alert_message="⚠️ Alert: Disk usage in $WATCH_DIR reached ${usage}% (exceeds the threshold of ${THRESHOLD}%)"
        echo "$alert_message"
        echo "$(date) - $alert_message" >> "$LOG_FILE"
        send_telegram_message "$alert_message"
    else
        echo "Disk usage in $WATCH_DIR: ${usage}% (below the threshold)"
    fi
}

send_telegram_message() {
    local message=$1
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d chat_id="$TELEGRAM_CHAT_ID" \
        -d text="$message" >/dev/null 2>&1
}

monitor_disk_usage
