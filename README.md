# Disk Usage Monitor

A simple Bash script that monitors disk usage on a specified directory and sends alerts via Telegram if usage exceeds a defined threshold. This script is useful for system administrators and developers who want to keep track of disk space usage and avoid running out of space unexpectedly.

## Features

- Monitors the disk usage of a specified directory.
- Sends alerts to a Telegram bot when disk usage exceeds a specified threshold.
- Logs alert messages to a file for future reference.
- Lists the current percentage of disk usage and the top space-consuming files/directories.

## Prerequisites

- A working Telegram bot (you can create one using [BotFather](https://core.telegram.org/bots#botfather)).
- Your bot's token and your chat ID to send messages.
- `curl` installed on your system to send HTTP requests.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/MGalego/disk-usage-monitor.git
   cd disk-usage-monitor
   ```

2. **Edit the script**:
   - Open `disk_usage_monitor.sh` in your preferred text editor.
   - Replace `<YOUR_BOT_TOKEN>` with your bot token.
   - Replace `<YOUR_CHAT_ID>` with your chat ID.

3. **Make the script executable**:
   ```bash
   chmod +x disk_usage_monitor.sh
   ```

4. **(Optional) Set up cron job**:
   - You can set up a cron job to run the script daily. Open the crontab editor:
     ```bash
     crontab -e
     ```
   - Add a line to run the script every day at 8:00 AM:
     ```bash
     0 8 * * * /path/to/disk_usage_monitor.sh / 80
     ```
   - Make sure to replace `/path/to/` with the actual path to your script and adjust the threshold as necessary.

## Usage

To run the script manually, you can execute:
```bash
./disk_usage_monitor.sh / 80
```
- Replace `/` with the directory you want to monitor (default is the root directory).
- Replace `80` with your desired alert threshold percentage (default is 80%).

## Log File

The script logs all alert messages to `disk_usage_log.txt` in the current directory.

## License

This project is licensed under the MGPL-3.0 License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Telegram Bot API](https://core.telegram.org/bots/api) for the messaging capabilities.
- [Bash scripting](https://www.gnu.org/software/bash/) for the implementation.
