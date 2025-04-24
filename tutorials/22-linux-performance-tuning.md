# Linux Performance Tuning

## Introduction

Performance tuning is the process of optimizing system resources to maximize efficiency, stability, and speed.  
This guide covers:

- CPU Tuning
- Memory Tuning
- Disk I/O Tuning
- Network Tuning
- General Best Practices
- Interview Questions

---

## CPU Tuning

- **Monitor CPU Usage**:

```bash
top
htop
mpstat
```

- **Adjust Process Priority**:

```bash
# Lower priority (increase nice value)
nice -n 10 command

# Change priority of a running process
renice -n 5 -p PID
```

- **Limit CPU Affinity**:

```bash
taskset -c 0,1 command
```
(Run a process only on CPU 0 and 1.)

---

## Memory Tuning

- **Monitor Memory Usage**:

```bash
free -h
vmstat 2
```

- **Adjust Swappiness**:

```bash
# Check current swappiness value
cat /proc/sys/vm/swappiness

# Set swappiness to 10 temporarily
sudo sysctl vm.swappiness=10

# Permanent change in /etc/sysctl.conf
vm.swappiness=10
```
*(Lower swappiness makes Linux prefer RAM over swap.)*

- **Clear Cache**:

```bash
# Clear PageCache
sudo sync; echo 1 > /proc/sys/vm/drop_caches

# Clear dentries and inodes
sudo sync; echo 2 > /proc/sys/vm/drop_caches

# Clear PageCache, dentries and inodes
sudo sync; echo 3 > /proc/sys/vm/drop_caches
```

---

## Disk I/O Tuning

- **Monitor Disk I/O**:

```bash
iostat -xm 5
iotop
dstat
```

- **Change I/O Scheduler**:

```bash
# Check current scheduler
cat /sys/block/sda/queue/scheduler

# Temporarily change to 'deadline'
echo deadline | sudo tee /sys/block/sda/queue/scheduler
```

Schedulers:
- `noop`: Minimal overhead, used in SSDs.
- `deadline`: Good for database workloads.
- `cfq`: Balanced for desktop systems.

- **Filesystem Tuning**:

```bash
# Use noatime to reduce disk writes
# /etc/fstab entry
UUID=xyz / ext4 defaults,noatime 0 1
```

---

## Network Tuning

- **Monitor Network Usage**:

```bash
iftop
nload
vnstat
```

- **Tune TCP Settings**:

```bash
# Increase maximum number of open files
ulimit -n 65535

# Increase TCP buffer sizes
sudo sysctl -w net.core.rmem_max=16777216
sudo sysctl -w net.core.wmem_max=16777216
```

- **Enable TCP Fast Open**:

```bash
sudo sysctl -w net.ipv4.tcp_fastopen=3
```

- **Reduce Connection Timeouts**:

```bash
sudo sysctl -w net.ipv4.tcp_fin_timeout=15
```

---

## General Best Practices

| Area          | Best Practice |
|---------------|---------------|
| Updates       | Regularly patch and update |
| Kernel Tuning | Tune swappiness, cache behavior |
| CPU Usage     | Set proper priorities |
| Disk I/O      | Optimize with correct scheduler |
| Networking    | Adjust TCP settings |
| Monitoring    | Use tools like `top`, `iotop`, `iftop` regularly |

---

## Interview Questions

- How do you monitor system performance in Linux?
- What is `swappiness` and why is it important?
- How would you tune a server for high disk I/O?
- How do you manage CPU-intensive processes?
- What is the difference between `cfq`, `noop`, and `deadline` I/O schedulers?
- How do you tune TCP settings for high-performance networking?

