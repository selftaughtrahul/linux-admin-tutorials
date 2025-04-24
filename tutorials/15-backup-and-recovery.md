# Backup and Recovery in Linux

## Introduction

Backup and recovery are crucial for system reliability and disaster recovery.  
This guide covers:

- Why Backups are Important
- Types of Backup
- Backup Tools in Linux
- How to Perform a Backup
- How to Perform a Recovery
- Automation of Backups
- Best Practices

---

## Why Backups are Important

- **Data Loss Protection:** Protects against accidental deletion, corruption, hardware failure.
- **Disaster Recovery:** Restore systems quickly after a crash.
- **Compliance:** Meet legal and business data retention requirements.
- **Business Continuity:** Minimize downtime and service disruption.

---

## Types of Backup

| Type | Description |
|------|-------------|
| Full Backup | Copies all files and directories. Slowest but safest. |
| Incremental Backup | Backs up only files that changed since the last backup. |
| Differential Backup | Backs up files changed since the last full backup. |
| Snapshot Backup | Captures the state of a system at a point in time. |

---

## Popular Backup Tools in Linux

| Tool | Description |
|------|-------------|
| `rsync` | Fast, incremental file copying |
| `tar` | Archiving and compressing files |
| `dd` | Low-level copying of entire disks/partitions |
| `rsnapshot` | Automated backups using `rsync` and hard links |
| `Bacula`, `Amanda` | Enterprise-grade backup solutions |
| `Timeshift` | System restore utility (great for desktop backups) |

---

## How to Perform a Backup

### 1. Using `rsync`

Backup a directory to another location:

```bash
rsync -avh /home/user/ /backup/user/
```

Backup over SSH:

```bash
rsync -avz /home/user/ username@remote_host:/backup/user/
```

### 2. Using `tar`

Create a compressed archive of a directory:

```bash
tar -czvf backup-home.tar.gz /home/user/
```

Extract it:

```bash
tar -xzvf backup-home.tar.gz
```

### 3. Using `dd`

Create a disk image:

```bash
dd if=/dev/sda of=/backup/sda.img bs=4M status=progress
```

Restore from a disk image:

```bash
dd if=/backup/sda.img of=/dev/sda bs=4M
```

⚠️ **Warning:** `dd` is very powerful — double-check source and destination!

---

## How to Perform a Recovery

- **File Recovery** (rsync or tar):

```bash
rsync -avh /backup/user/ /home/user/
```
or
```bash
tar -xzvf backup-home.tar.gz -C /
```

- **Full Disk Recovery** (`dd`):

```bash
dd if=/backup/sda.img of=/dev/sda bs=4M
```

- **System Restore** (Timeshift):

```bash
sudo timeshift --restore
```

---

## Automating Backups

You can schedule automatic backups using `cron`.

Example: Daily backup using `rsync` at 2 AM.

1. Create a backup script `/home/user/backup.sh`:

```bash
#!/bin/bash
rsync -avh /home/user/ /backup/user/
```

2. Make it executable:

```bash
chmod +x /home/user/backup.sh
```

3. Schedule it with cron:

```bash
crontab -e
```

Add:

```bash
0 2 * * * /home/user/backup.sh
```

---

## Best Practices for Backup and Recovery

- Test your backups regularly.
- Keep multiple backup copies.
- Store backups offsite or in the cloud.
- Encrypt sensitive backups.
- Automate your backups.
- Document your backup and recovery procedures.

---

## Bonus Tip: Backup Compression

You can compress backups to save space:

```bash
tar -czvf backup.tar.gz /important/data
```

Or use `rsync` with compression:

```bash
rsync -avz /source/ /destination/
```

---

## Quick Quiz

1. What is the difference between full and incremental backups?
2. How do you create a compressed archive using `tar`?
3. Which command helps create a full disk image in Linux?

---

## Interview Questions

- How would you recover a system from a corrupted `/etc/fstab`?
- Which tool would you use for efficient remote backups?
- How do incremental backups help save storage?

