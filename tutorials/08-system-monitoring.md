It looks like you're asking for an `08-system-monitoring.md` file, which seems to be part of a documentation or tutorial related to system monitoring. Here's an example structure of a markdown file that could fit that purpose:

---

# 08 - System Monitoring

This section covers system monitoring techniques and tools to ensure your Linux-based systems run smoothly and efficiently. Monitoring is essential for identifying potential issues, ensuring uptime, and optimizing performance.

## Overview

System monitoring helps administrators track the health of a system, spot performance bottlenecks, and get alerted on any issues such as high CPU usage, disk space running low, or network latency.

In this guide, we will cover the most popular monitoring tools for Linux systems, including:

- **CPU Usage Monitoring**
- **Memory Usage Monitoring**
- **Disk Space Monitoring**
- **Network Monitoring**
- **Process Monitoring**
- **Log Monitoring**

## Tools for System Monitoring

### 1. **Top**

`top` is one of the most widely used tools for real-time process monitoring on Linux. It displays CPU usage, memory usage, and running processes.

- **Usage**: Simply type `top` in the terminal.
  
#### Common Commands in `top`:
- `P`: Sort processes by CPU usage
- `M`: Sort processes by memory usage
- `q`: Quit the program

### 2. **htop**

`htop` is an enhanced version of `top` that provides a more user-friendly interface. It displays processes in a tree format and allows for interactive monitoring.

- **Install**: `sudo apt install htop`
- **Usage**: Run `htop` in the terminal.

### 3. **vmstat**

`vmstat` provides detailed statistics about system processes, memory, paging, block I/O, traps, and CPU activity.

- **Usage**: Run `vmstat 1` to get a report every second.

### 4. **iostat**

The `iostat` command provides statistics on CPU usage and input/output performance for devices and partitions.

- **Install**: `sudo apt install sysstat`
- **Usage**: Run `iostat` for basic stats or `iostat -x` for extended stats.

### 5. **df**

The `df` command shows disk space usage for all mounted filesystems.

- **Usage**: Run `df -h` to get the output in human-readable format.

### 6. **du**

`du` shows disk usage of directories and files.

- **Usage**: `du -sh /path/to/directory`

### 7. **nmap**

`nmap` is a network scanner that can be used to discover hosts and services on a network, along with details like open ports.

- **Install**: `sudo apt install nmap`
- **Usage**: Run `nmap [hostname]` to scan a specific host.

### 8. **netstat**

`netstat` provides information about network connections, routing tables, interface statistics, and more.

- **Usage**: Run `netstat -tuln` to see listening ports and services.

### 9. **syslog and journalctl**

Logs are essential for troubleshooting and keeping track of system activities. On most Linux distributions, logs are stored in `/var/log/`.

- **View logs**: 
  - `tail -f /var/log/syslog` to view syslog.
  - `journalctl -f` to view systemd logs.

### 10. **sar**

`sar` (System Activity Report) is a powerful tool to collect, report, or save system activity information.

- **Install**: `sudo apt install sysstat`
- **Usage**: Run `sar -u 1` to report CPU utilization every second.

---

## Setting Up Alerts

### 1. **Using `cron` to schedule reports**

Set up cron jobs to schedule regular system health checks and send email alerts if certain thresholds are crossed (e.g., disk space usage exceeds 90%).

### 2. **Using `Nagios` for Advanced Monitoring**

Nagios is an open-source monitoring system that can monitor servers, network devices, and applications.

- **Install**: Follow the installation instructions on the [Nagios website](https://www.nagios.org/).
- **Usage**: Set up Nagios to check system resources and alert you when issues are detected.

---

## Best Practices for System Monitoring

1. **Monitor in Real-Time**: Use tools like `top`, `htop`, and `vmstat` to observe system performance in real time.
2. **Automate Monitoring**: Set up cron jobs or use advanced monitoring systems like Nagios or Zabbix.
3. **Analyze Logs Regularly**: Check your system logs at regular intervals to track errors and performance issues.
4. **Set Up Alerts**: Always set thresholds for critical metrics like CPU, memory, disk space, and network activity to avoid issues before they become serious.
5. **Document Changes**: Maintain a record of system changes, upgrades, and adjustments made for easy troubleshooting.

---

This markdown guide should help you get started with system monitoring. Customize it based on your specific needs and tools available in your environment.

