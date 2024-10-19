# Log Archive Tool
Bash script to automate the process of archiving and cleaning up log files. It compresses log files, stores them in an archive, and removes older backups to help maintain a clean and manageable logging system.

## Features
- Archives log files into a `.tar.gz` file.
- Stores archives in an `archives` directory.
- Logs the archiving process to a file (`archive_log.txt`).
- Deletes logs older than 7 days to free up space.
- Deletes archive files older than 30 days to prevent excess backup accumulation.

## Usage

## Usage
1. Clone the repository:
    ```
    git clone https://github.com/julieboysen/log-archive-tool.git
    cd log-archive-tool
    ```
2. Make it an executable:
   ```
   chmod +x log-archiver.sh
   ```
3. Run the script:
   ```
   ./log-archiver.sh /path/to/log-directory
   ```

### Example
```
./log-archiver.sh /var/log
```

### Parameters
- **Log Directory**: The directory where log files are stored. This is passed as the first argument to the script.

## Configuration

You can customize the number of days for keeping logs and backup archives by modifying the variables at the top of the script:

- `DAYS_TO_KEEP_LOGS=7`: The number of days to keep log files before archiving and deleting them.
- `DAYS_TO_KEEP_BACKUPS=30`: The number of days to keep backup archive files before they are deleted.

## Example Output

- Archived log file: `archives/logs_archive_20240816_100648.tar.gz`
- Log of the archive process: `archives/archive_log.txt`

## Project Link
For more details about this project, visit the [Log Archive Tool Project](https://roadmap.sh/projects/log-archive-tool).
    



