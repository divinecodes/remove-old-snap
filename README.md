# Snap Revision Removal Script

This bash script automates the process of removing the oldest revisions of installed Snap applications on your system. It helps to free up disk space by removing unnecessary old versions of Snap packages. The script can be run manually or scheduled to run automatically on a weekly basis.

## Description

The script performs the following actions:

1. Lists all installed Snap applications.
2. For each application with multiple revisions:
   - Identifies the oldest revision (lowest revision number).
   - Attempts to remove the oldest revision using the `snap remove` command.
3. Provides feedback on the number of snaps cleaned up or if no cleanup was necessary.

## Prerequisites

- A Linux system with Snap package manager installed.
- Sudo privileges to run the script (as it needs to remove Snap packages).
- Cron (for scheduling the script to run automatically).

## Installation

1. Clone this repository or download the script:

   ```
   git clone git@github.com:divinecodes/remove-old-snap.git
   ```

   Or if you're downloading directly:

   ```
   wget https://raw.githubusercontent.com/divinecodes/remove-old-snap/master/remove_snap.sh
   ```

2. Make the script executable:

   ```
   chmod +x remove_snap.sh
   ```

## Usage

The script can be used in two ways:

1. Run the cleanup immediately:

   ```
   sudo ./remove_snap.sh --run
   ```

2. Schedule the script to run weekly:

   ```
   ./remove_snap.sh --schedule
   ```

   This will add a cron job to run the script every Sunday at midnight.

## Error Handling

The script  handles several potential scenarios:

- If no snaps are installed on the system, it will display a message saying "No snaps found on the system."
- If there are no old revisions to clean up, it will display "No old revisions found to clean up."
- If it encounters any errors while trying to remove a specific snap revision, it will display an error message for that snap and continue with the next one.
- At the end of the process, it will report how many snaps were successfully cleaned up.

## Caution

- This script modifies your system by removing Snap package revisions. Always ensure you have backups of important data before running system maintenance scripts.
- The script only removes old, disabled revisions. It will not touch the currently active revision of any Snap package.
- When scheduling the script, make sure your system will be on at the scheduled time for the cleanup to occur.

## Contributing

Contributions to improve the script are welcome. Please feel free to submit a Pull Request.

## License

[MIT License](LICENSE)

## Disclaimer

This script is provided as-is, without any warranty. Use it at your own risk. Always review scripts before running them on your system.
