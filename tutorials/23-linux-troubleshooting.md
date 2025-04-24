# Linux Troubleshooting

## Introduction

Troubleshooting in Linux means diagnosing and fixing issues related to system performance, services, networking, boot problems, hardware, or user errors.  
This guide covers:

- Basic Troubleshooting Steps
- System Performance Issues
- Service Issues
- Network Issues
- Disk Issues
- Boot Issues
- Interview Questions

---

## Basic Troubleshooting Steps

1. **Identify the problem**  
   - Observe logs, system messages, and error outputs.

2. **Gather information**  
   - Use tools like `dmesg`, `journalctl`, `top`, `ss`, `df`, `uptime`.

3. **Analyze and isolate**  
   - Narrow down to hardware, OS, application, or network.

4. **Test hypotheses**  
   - Make small changes and observe results.

5. **Fix and document**  
   - Apply a fix and note it down for future reference.

---

## System Performance Issues

- **High CPU Usage**:

```bash
top
htop
ps aux --sort=-%cpu | head
```

- **High Memory Usage**:

```bash
free -h
top -o %MEM
```

- **Load Average**:

```bash
uptime
```
*(Load > CPU cores means high load.)*

---

## Service Issues

- **Check Service Status**:

```bash
systemctl status service-name
```

- **View Logs**:

```bash
journalctl -u service-name
```

- **Restart Service**:

```bash
sudo systemctl restart service-name
```

- **Enable Service on Boot**:

```bash
sudo systemctl enable service-name
```

---

## Network Issues

- **Check IP and Routes**:

```bash
ip a
ip route
```

- **Test Connectivity**:

```bash
ping 8.8.8.8
curl google.com
```

- **List Open Ports**:

```bash
ss -tuln
```

- **Traceroute Network Path**:

```bash
traceroute domain.com
```

- **Restart Networking**:

```bash
sudo systemctl restart NetworkManager
```

---

## Disk Issues

- **Check Disk Space**:

```bash
df -h
```

- **Check Inodes**:

```bash
df -i
```

- **Check Disk Health (SMART)**:

```bash
sudo smartctl -a /dev/sda
```

- **List Mounted Filesystems**:

```bash
mount
```

- **Repair Filesystem**:

```bash
sudo fsck /dev/sda1
```

---

## Boot Issues

- **View Boot Logs**:

```bash
journalctl -b
```

- **Check GRUB Bootloader**:
  - At boot, press `Shift` or `Esc` to view GRUB.
  - Edit boot entries if needed (`e` to edit).

- **Recovery Mode**:
  - Boot into recovery mode to repair filesystem or reset passwords.

- **Kernel Issues**:
  - Reboot and select an older working kernel.

---

## Interview Questions

- How do you troubleshoot a Linux system running slow?
- How do you find which process is consuming the most memory?
- What would you do if a service is not starting?
- How do you troubleshoot network connectivity issues?
- What steps would you take if a Linux server does not boot?

