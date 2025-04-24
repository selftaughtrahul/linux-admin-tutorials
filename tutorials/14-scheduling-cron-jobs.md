# Scheduling Cron Jobs in Linux

## Introduction

**Cron** is a time-based job scheduler in Unix-like systems.  
It allows users to run commands or scripts automatically at specified times and dates.

In this tutorial, we'll cover:

- What is a Cron Job?
- Cron Syntax
- How to Schedule a Cron Job
- Managing Cron Jobs
- Practical Examples
- Troubleshooting Cron Jobs
- Bonus: Advanced Cron Tricks

---

## What is a Cron Job?

A **Cron Job** is a scheduled task that runs automatically at predefined times.

**Cron Daemon (`crond`)** runs in the background and checks the crontab files to execute scheduled tasks.

---

## Cron Syntax

Each line in a crontab file follows this syntax:

```text
* * * * * command_to_execute
- - - - -
| | | | |
| | | | +----- Day of the week (0 - 7) [Sunday=0 or 7]
| | | +------- Month (1 - 12)
| | +--------- Day of month (1 - 31)
| +----------- Hour (0 - 23)
+------------- Minute (0 - 59)
```

---

## How to Schedule a Cron Job

### Step 1: Open Crontab

Edit your user's crontab file:

```bash
crontab -e
```

View your existing crontab:

```bash
crontab -l
```

### Step 2: Add a Cron Job

Example: Run a backup script every day at 2 AM

```bash
0 2 * * * /home/username/backup.sh
```

### Step 3: Save and Exit

- Save the file and cron will automatically install the new job.

---

## Managing Cron Jobs

| Command | Description |
|---------|-------------|
| `crontab -e` | Edit the current user's crontab |
| `crontab -l` | List current user's cron jobs |
| `crontab -r` | Remove current user's crontab |
| `sudo crontab -e` | Edit root's crontab |

Other system-wide crontab files:

| File | Purpose |
|------|---------|
| `/etc/crontab` | System-wide crontab |
| `/etc/cron.d/` | Directory for package-specific cron jobs |
| `/etc/cron.daily/`, `/etc/cron.hourly/` | Scripts that run periodically |

---

## Practical Cron Job Examples

| Schedule | Cron Syntax | Example Command |
|----------|-------------|-----------------|
| Every minute | `* * * * *` | `echo "Hello"` |
| Every 5 minutes | `*/5 * * * *` | `bash /path/to/script.sh` |
| Every day at midnight | `0 0 * * *` | `/usr/bin/python3 /home/user/cleanup.py` |
| Every Sunday at 6 PM | `0 18 * * 0` | `systemctl restart apache2` |
| On 1st of every month | `0 0 1 * *` | `/usr/local/bin/monthly_report.sh` |

---

## Special Cron Keywords

Instead of numeric values, you can use special keywords:

| Keyword | Meaning | Equivalent |
|---------|---------|------------|
| `@reboot` | Run once at startup | (no equivalent) |
| `@hourly` | Run every hour | `0 * * * *` |
| `@daily` | Run every day | `0 0 * * *` |
| `@weekly` | Run every week | `0 0 * * 0` |
| `@monthly` | Run every month | `0 0 1 * *` |
| `@yearly` or `@annually` | Run every year | `0 0 1 1 *` |

Example:

```bash
@daily /home/user/backup.sh
```

---

## Troubleshooting Cron Jobs

- **Cron logs**:

Check cron logs to debug:

```bash
sudo grep CRON /var/log/syslog
```
*(On CentOS/RHEL: `/var/log/cron`)*

- **Environment Variables**:

Cron jobs run with a minimal environment. Specify the full path:

```bash
/usr/bin/python3 /home/user/script.py
```

- **Permissions**:

Make sure the script has execution permission:

```bash
chmod +x /path/to/script.sh
```

- **Output Errors**:

Redirect output and errors to a log file:

```bash
* * * * * /path/to/script.sh >> /var/log/script.log 2>&1
```

---

## Bonus: Advanced Cron Tricks

### Running Multiple Commands

Separate with `&&` or `;`:

```bash
0 5 * * * cd /home/user/project && git pull
```

### Email Notifications

Add this line at the top of the crontab:

```bash
MAILTO="your-email@example.com"
```

Cron will email the output of the job.

---

## Conclusion

Cron jobs are powerful for automating repetitive tasks in Linux systems.

> **Pro Tip:** Always test your commands manually before adding them to crontab.

---

## Quick Quiz

1. What does `0 0 * * 0` mean in cron syntax?
2. How do you list the current user's cron jobs?
3. What is the difference between `@daily` and `0 0 * * *`?

---

## Interview Questions

- What are the components of a cron syntax line?
- How would you troubleshoot a failing cron job?
- What is the purpose of the `MAILTO` variable in a crontab?

