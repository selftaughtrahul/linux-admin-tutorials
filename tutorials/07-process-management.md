# Process Management in Linux

## Introduction
Process management in Linux is crucial for monitoring and controlling system performance. A process is an instance of a running program, and Linux provides several tools to manage them effectively.

## Viewing Processes
### List Running Processes
```bash
ps aux  # Show detailed information about all processes
ps -ef  # Alternative format for listing processes
```

### Real-Time Process Monitoring
```bash
top  # Display real-time process usage
htop  # Interactive process monitoring (if installed)
```

## Managing Processes
### Killing a Process
```bash
kill PID  # Terminate a process by PID
kill -9 PID  # Forcefully terminate a process
pkill process_name  # Kill processes by name
```

### Changing Process Priority
```bash
nice -n 10 command  # Start a process with a lower priority
renice 5 -p PID  # Change priority of an existing process
```

### Background and Foreground Processes
```bash
command &  # Run a process in the background
jobs  # List background jobs
fg %1  # Bring job 1 to the foreground
bg %1  # Resume job 1 in the background
```

## Process Signals
Signals allow communication with processes.
```bash
kill -SIGTERM PID  # Graceful termination
kill -SIGKILL PID  # Force termination
kill -SIGHUP PID  # Restart a process
```

## Checking Resource Usage
```bash
ps aux --sort=-%cpu  # Sort processes by CPU usage
ps aux --sort=-%mem  # Sort processes by memory usage
```

## Conclusion
Understanding process management in Linux helps optimize system performance and troubleshoot issues effectively. Mastering these commands allows better control over system resources.

